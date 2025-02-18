using digioz.Portal.Data.Context;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI.WebControls;
using digioz.Portal.BLL;
using digioz.Portal.Data.Repositories;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Services;
using digioz.Portal.Web.Areas.Forum.ViewModels;
using MembershipUser = digioz.Portal.Domain.DomainModel.MembershipUser;
using ModelState = System.Web.WebPages.Html.ModelState;

namespace digioz.Portal.Web.Controllers
{
    [Authorize]
    public class PrivateMessagesController : BaseController
    {
        private digiozPortalEntities db = new digiozPortalEntities();
        private readonly IPrivateMessageService _privateMessageService;
        private MembershipUser LoggedOnUser;

        public PrivateMessagesController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService,
            ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService, IPrivateMessageService privateMessageService,
            IEmailService emailService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _privateMessageService = privateMessageService;

            LoggedOnUser = UserIsAuthenticated ? MembershipService.GetUser(Username) : null;
        }

        // GET: PrivateMessages
        public ActionResult Index()
        {
            string userId = User.Identity.GetUserId();
            var privateMessages = PrivateMessageLogic.GetByUserId(userId);

            return View(privateMessages);
        }

        public ActionResult Create()
        {
            ViewBag.UserTo = new SelectList(AccountLogic.GetMembershipUsers(), "UserName", "UserName");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            [Bind(Include = "Id,DateSent,Subject,Message,IsRead,UserFrom,UserTo,UserID")] FormCollection form)  // PrivateMessage privateMessage
        {
            string userFrom = User.Identity.GetUserName();
            string userToName = form["UserTo"];

            PrivateMessage privateMessage = new PrivateMessage();
            
            privateMessage.Id = Guid.NewGuid();
            privateMessage.DateSent = DateTime.Now;
            privateMessage.Subject = form["Subject"];
            privateMessage.Message = form["Message"];
            privateMessage.IsRead = false;

            privateMessage.UserFrom = MembershipService.GetUser(userFrom);
            privateMessage.UserTo = MembershipService.GetUser(userToName);

            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                if (ModelState.IsValid &&  !string.IsNullOrEmpty(privateMessage.Subject) 
                                        && !string.IsNullOrEmpty(privateMessage.Message)
                                        && !string.IsNullOrEmpty(privateMessage.UserTo.UserName))
                {
                    try
                    {
                        _privateMessageService.Add(privateMessage);
                        unitOfWork.Commit();

                        return RedirectToAction("Index");
                    }
                    catch (Exception ex)
                    {
                        unitOfWork.Rollback();
                        LoggingService.Error(ex);
                        ModelState.AddModelError(string.Empty, LocalizationService.GetResourceString("Errors.GenericMessage"));
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Please fill out all the required fields: User To, Subject and Message");
                }
            }

            ViewBag.UserTo = new SelectList(AccountLogic.GetMembershipUsers(), "UserName", "UserName");
            return View();
        }

        public ActionResult  Details(Guid id)
        {
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                var message = _privateMessageService.Get(id);

                if (message.UserTo == LoggedOnUser | message.UserFrom == LoggedOnUser)
                {
                    //Mark as read if this is the receiver of the message
                    if (message.UserTo == LoggedOnUser)
                    {
                        // Update message as read
                        message.IsRead = true;

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

                    return View(new ViewPrivateMessageViewModel { Message = message });
                }

                return ErrorToHomePage(LocalizationService.GetResourceString("Errors.NoPermission"));
            }
        }
    }
}