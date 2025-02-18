using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
/*
using DotNetOpenAuth.Messaging;
using DotNetOpenAuth.OAuth2;
using DotNetOpenAuth.OpenId.Extensions.AttributeExchange;
using DotNetOpenAuth.OpenId.RelyingParty;
*/
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
/*
using digioz.Portal.OpenAuth;
using digioz.Portal.OpenAuth.Facebook;
*/
using digioz.Portal.Utilities;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Controllers;
using digioz.Portal.Web.Areas.Forum.ViewModels;
using MembershipCreateStatus = digioz.Portal.Domain.DomainModel.MembershipCreateStatus;
using MembershipUser = digioz.Portal.Domain.DomainModel.MembershipUser;

namespace digioz.Portal.Web.Areas.Forum.Controllers
{
    public class MembersController : BaseController
    {
        private readonly IPostService _postService;
        private readonly IReportService _reportService;
        private readonly IEmailService _emailService;
        private readonly IPrivateMessageService _privateMessageService;
        private readonly IBannedEmailService _bannedEmailService;
        private readonly IBannedWordService _bannedWordService;

        private MembershipUser LoggedOnUser;
        private MembershipRole UsersRole;

       // private InMemoryTokenManager _tokenManager;

        public MembersController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService,
            IRoleService roleService, ISettingsService settingsService, IPostService postService, IReportService reportService, IEmailService emailService, IPrivateMessageService privateMessageService, IBannedEmailService bannedEmailService, IBannedWordService bannedWordService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _postService = postService;
            _reportService = reportService;
            _emailService = emailService;
            _privateMessageService = privateMessageService;
            _bannedEmailService = bannedEmailService;
            _bannedWordService = bannedWordService;

            LoggedOnUser = UserIsAuthenticated ? MembershipService.GetUser(Username) : null;
            UsersRole = LoggedOnUser == null ? RoleService.GetRole(AppConstants.GuestRoleName) : LoggedOnUser.Roles.FirstOrDefault();
        }

        #region Common Methods

        #endregion

   

        [ChildActionOnly]
        public PartialViewResult GetCurrentActiveMembers()
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var viewModel = new ActiveMembersViewModel
                {
                    ActiveMembers = MembershipService.GetActiveMembers()
                };
                return PartialView(viewModel);
            }
        }

        public JsonResult LastActiveCheck()
        {
            if (UserIsAuthenticated)
            {
                var rightNow = DateTime.UtcNow;
                var usersDate = LoggedOnUser.LastActivityDate ?? DateTime.Now.AddDays(-1);

                var span = rightNow.Subtract(usersDate);
                var totalMins = span.TotalMinutes;

                if (totalMins > AppConstants.TimeSpanInMinutesToDoCheck)
                {
                    using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
                    {
                        // Update users last activity date so we can show the latest users online
                        LoggedOnUser.LastActivityDate = DateTime.UtcNow;

                        // Update
                        try
                        {
                            unitOfWork.Commit();
                        }
                        catch (Exception ex)
                        {
                            unitOfWork.Rollback();
                            LoggingService.Error(ex);
                        }
                    }
                }
            }

            // You can return anything to reset the timer.
            return Json(new { Timer = "reset" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetByName(string slug)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var member = MembershipService.GetUserBySlug(slug);
                var loggedonId = UserIsAuthenticated ? LoggedOnUser.Id : "";
                return View(new ViewMemberViewModel { User = member, LoggedOnUserId = loggedonId });
            }
        }

        /// <summary>
        /// Add a new user
        /// </summary>
        /// <returns></returns>
        /*      public ActionResult Register()
              {
                  if (SettingsService.GetSettings().SuspendRegistration != true)
                  {
                      using (UnitOfWorkManager.NewUnitOfWork())
                      {
                          var user = MembershipService.CreateEmptyUser();

                          // Populate empty viewmodel
                          var viewModel = new MemberAddViewModel
                          {
                              UserName = user.UserName,
                              Email = user.Email,
                              Password = user.Password,
                              IsApproved = user.IsApproved,
                              Comment = user.Comment,
                              AllRoles = RoleService.AllRoles()
                          };

                          // See if a return url is present or not and add it
                          var returnUrl = Request["ReturnUrl"];
                          if (!string.IsNullOrEmpty(returnUrl))
                          {
                              viewModel.ReturnUrl = returnUrl;
                          }

                          return View(viewModel);
                      }
                  }
                  return RedirectToAction("Index", "ForumHome");
              }
      */

        [HttpPost]
        public PartialViewResult GetMemberDiscussions(string Id)
        {
            if (Request.IsAjaxRequest())
            {
                using (UnitOfWorkManager.NewUnitOfWork())
                {
                    // Get the user discussions, only grab 100 posts
                    var posts = _postService.GetByMember(Id, 100);

                    // Get the distinct topics
                    var topics = posts.Select(x => x.Topic).Distinct().Take(6).OrderByDescending(x => x.LastPost.DateCreated).ToList();

                    // Get all the categories for this topic collection
                    var categories = topics.Select(x => x.Category).Distinct();

                    // create the view model
                    var viewModel = new ViewMemberDiscussionsViewModel
                    {
                        Topics = topics,
                        AllPermissionSets = new Dictionary<Category, PermissionSet>(),
                        CurrentUser = LoggedOnUser
                    };

                    // loop through the categories and get the permissions
                    foreach (var category in categories)
                    {
                        var permissionSet = RoleService.GetPermissions(category, UsersRole);
                        viewModel.AllPermissionSets.Add(category, permissionSet);
                    }

                    return PartialView(viewModel);
                }
            }
            return null;
        }
        /*
                [Authorize]
                public ActionResult Edit(string id)
                {
                    using (UnitOfWorkManager.NewUnitOfWork())
                    {

                        var user = MembershipService.GetUserById(id);
                        var viewModel = new MemberFrontEndEditViewModel
                                            {
                                                Id = user.Id,
                                                UserName = user.UserName,
                                                Email = user.Email,
                                                Signature = user.Signature,
                                                Location = user.Location,
                                                Website = user.Website,
                                            };

                        return View(viewModel);
                    }
                }


                [HttpPost]
                [Authorize]
                public ActionResult Edit(MemberFrontEndEditViewModel userModel)
                {
                    using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
                    {
                        var user = MembershipService.GetUser(userModel.Id);

                        user.Age = userModel.Age;
                        user.Location = _bannedWordService.SanitiseBannedWords(userModel.Location);
                        user.Signature = _bannedWordService.SanitiseBannedWords(userModel.Signature);
                        user.Website = _bannedWordService.SanitiseBannedWords(userModel.Website);

                        // If there is a location try and save the longitude and latitude
                        if (!string.IsNullOrEmpty(user.Location))
                        {
                            try
                            {
                                var longLat = LocalisationUtils.GeocodeGoogle(user.Location);
                                if (longLat != null && longLat[0] != "0")
                                {
                                    // Got the long lat and save them to the user
                                    user.Latitude = longLat[0];
                                    user.Longitude = longLat[1];
                                }
                            }
                            catch
                            {
                                LoggingService.Error("Error getting longitude and latitude from location");
                            }
                        }

                        // User is trying to change username, need to check if a user already exists
                        // with the username they are trying to change to
                        var changedUsername = false;
                        var sanitisedUsername = _bannedWordService.SanitiseBannedWords(userModel.UserName);
                        if (sanitisedUsername != user.UserName)
                        {
                            if (MembershipService.GetUser(sanitisedUsername) != null)
                            {
                                unitOfWork.Rollback();
                                ModelState.AddModelError(string.Empty, LocalizationService.GetResourceString("Members.Errors.DuplicateUserName"));
                                return View(userModel);
                            }

                            user.UserName = sanitisedUsername;
                            changedUsername = true;
                        }

                        // User is trying to update their email address, need to 
                        // check the email is not already in use
                        if (userModel.Email != user.Email)
                        {
                            // Add get by email address
                            if (MembershipService.GetUserByEmail(userModel.Email) != null)
                            {
                                unitOfWork.Rollback();
                                ModelState.AddModelError(string.Empty, LocalizationService.GetResourceString("Members.Errors.DuplicateEmail"));
                                return View(userModel);
                            }
                            user.Email = userModel.Email;
                        }

                        MembershipService.ProfileUpdated(user);

                        ViewBag.Message = new GenericMessageViewModel
                        {
                            Message = LocalizationService.GetResourceString("Member.ProfileUpdated"),
                            MessageType = GenericMessages.success
                        };

                        var viewModel = new MemberFrontEndEditViewModel
                        {
                            Id = user.Id,
                            UserName = user.UserName,
                            Email = user.Email,
                            Signature = user.Signature,
                            Age = user.Age,
                            Location = user.Location,
                            Website = user.Website,
                        };

                        try
                        {
                            unitOfWork.Commit();

                            if (changedUsername)
                            {
                                // User has changed their username so need to log them in
                                // as there new username of 
                                var authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                                if (authCookie != null)
                                {
                                    var authTicket = FormsAuthentication.Decrypt(authCookie.Value);
                                    if (authTicket != null)
                                    {
                                        var newFormsIdentity = new FormsIdentity(new FormsAuthenticationTicket(authTicket.Version,
                                                                                                               user.UserName,
                                                                                                               authTicket.IssueDate,
                                                                                                               authTicket.Expiration,
                                                                                                               authTicket.IsPersistent,
                                                                                                               authTicket.UserData));
                                        var roles = authTicket.UserData.Split("|".ToCharArray());
                                        var newGenericPrincipal = new GenericPrincipal(newFormsIdentity, roles);
                                        System.Web.HttpContext.Current.User = newGenericPrincipal;
                                    }
                                }

                                // sign out current user
                                FormsAuthentication.SignOut();

                                // Abandon the session
                                Session.Abandon();

                                // Sign in new user
                                FormsAuthentication.SetAuthCookie(user.UserName, false);
                            }
                        }
                        catch (Exception ex)
                        {
                            unitOfWork.Rollback();
                            LoggingService.Error(ex);
                        }

                        return View(viewModel);
                    }
                }
        */

        [Authorize]
        public PartialViewResult SideAdminPanel()
        {
            var count = _privateMessageService.NewPrivateMessageCount(LoggedOnUser.Id);
            return PartialView(new ViewAdminSidePanelViewModel { CurrentUser = LoggedOnUser, NewPrivateMessageCount = count });
        }

        public PartialViewResult AdminMemberProfileTools()
        {
            return PartialView();
        }

        [Authorize]
        public string AutoComplete(string term)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                if (!string.IsNullOrEmpty(term))
                {
                    var members = MembershipService.SearchMembers(term, 12);
                    var sb = new StringBuilder();
                    sb.Append("[").Append(Environment.NewLine);
                    for (var i = 0; i < members.Count; i++)
                    {
                        sb.AppendFormat("\"{0}\"", members[i].UserName);
                        if (i < members.Count - 1)
                        {
                            sb.Append(",");
                        }
                        sb.Append(Environment.NewLine);
                    }
                    sb.Append("]");
                    return sb.ToString();
                }
                return null;
            }
        }

        [Authorize]
        public ActionResult Report(string id)
        {
            if (SettingsService.GetSettings().EnableMemberReporting)
            {
                using (UnitOfWorkManager.NewUnitOfWork())
                {
                    var user = MembershipService.GetUserById(id);
                    return View(new ReportMemberViewModel { Id = user.Id, Username = user.UserName });
                }
            }
            return ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
        }

        [HttpPost]
        [Authorize]
        public ActionResult Report(ReportMemberViewModel viewModel)
        {
            if (SettingsService.GetSettings().EnableMemberReporting)
            {
                using (UnitOfWorkManager.NewUnitOfWork())
                {
                    var user = MembershipService.GetUserById(viewModel.Id);
                    var report = new Report
                                     {
                                         Reason = viewModel.Reason,
                                         ReportedMember = user,
                                         Reporter = LoggedOnUser
                                     };
                    _reportService.MemberReport(report);
                    TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = LocalizationService.GetResourceString("Report.ReportSent"),
                        MessageType = GenericMessages.success
                    };
                    return View(new ReportMemberViewModel { Id = user.Id, Username = user.UserName });
                }
            }
            return ErrorToHomePage(LocalizationService.GetResourceString("Errors.GenericMessage"));
        }

        public ActionResult Search(int? p, string search)
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var pageIndex = p ?? 1;
                var allUsers = string.IsNullOrEmpty(search) ? MembershipService.GetAll(pageIndex, AppConstants.AdminListPageSize) :
                                    MembershipService.SearchMembers(search, pageIndex, AppConstants.AdminListPageSize);

                // Redisplay list of users
                var allViewModelUsers = allUsers.Select(user => new PublicSingleMemberListViewModel
                                                                    {
                                                                        UserName = user.UserName,
                                                                        NiceUrl = user.NiceUrl,
                                                                        CreateDate = user.CreateDate,
                                                                        TotalPoints = user.TotalPoints,
                                                                    }).ToList();

                var memberListModel = new PublicMemberListViewModel
                {
                    Users = allViewModelUsers,
                    PageIndex = pageIndex,
                    TotalCount = allUsers.TotalCount,
                    Search = search
                };

                return View(memberListModel);
            }
        }

        [ChildActionOnly]
        public PartialViewResult LatestMembersJoined()
        {
            var viewModel = new ListLatestMembersViewModel();
            var users = MembershipService.GetLatestUsers(10).ToDictionary(o => o.UserName, o => o.NiceUrl);
            viewModel.Users = users;
            return PartialView(viewModel);
        }

    }
}
