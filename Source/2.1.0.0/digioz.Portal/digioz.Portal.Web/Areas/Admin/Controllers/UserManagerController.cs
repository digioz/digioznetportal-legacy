using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using System.IO;
using System.Drawing;
using digioz.Portal.Web.Models;
using digioz.Portal.Web.Controllers;
using System.Threading.Tasks;
using System.Data.Entity;
using digioz.Portal.BLL;
using Microsoft.AspNet.Identity.EntityFramework;
using digioz.Portal.Data.Context;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class UserManagerController : Controller
    {
        // GET: /Admin/UserManager/
        public ActionResult Index()
        {
            List<UserManagerViewModel> usersViewModel = new List<UserManagerViewModel>();

            var users = AccountLogic.GetMembershipUsers().ToList();
            
            foreach (var item in users)
            {
                var profile = ProfileLogic.GetProfileByUserId(item.Id);
                var user = new UserManagerViewModel
                {
                    Id = item.Id,
                    UserName = item.UserName,
                    Email = profile.Email
                };

                usersViewModel.Add(user);
            }

            return View(usersViewModel);
        }

        // GET: /Admin/UserManager/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            UserManagerViewModel userVM = new UserManagerViewModel();
            MembershipUser user = AccountLogic.GetMembershipUser(id);
            Profile profile = ProfileLogic.GetProfileByUserId(id);

            if (user == null || profile == null)
            {
                return HttpNotFound();
            }

            userVM.Id = user.Id;
            userVM.UserName = user.UserName;
            userVM.InjectFrom(profile);

            return View(userVM);
        }

        // GET: /Admin/UserManager/Create
        public ActionResult Create()
        {
            return View();
        }

        private bool DoesUserExist(string userName)
        {
            bool result = false;

            digiozPortalEntities db2 = new digiozPortalEntities();
            var user = AccountLogic.GetMembershipUserByUsername(userName); // db2.MembershipUser.Where(x => x.UserName == userName).Count();

            if (user != null)
            {
                result = true;
                TempData["Error"] = "The Username you are trying to register already exists.";
            }

            return result;
        }

        //POST: /Admin/UserManager/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserName,Password,PasswordConfirm,Email,Birthday,BirthdayVisible,Address,Address2,City,State,Zip,Country,Signature,Avatar,AvatarImage,FirstName,LastName")] UserManagerViewModel userVM)
        {
            string profileAvatarNew = string.Empty;

            if (ModelState.IsValid && DoesUserExist(userVM.UserName) == false)
            {
                Profile profile = new Profile();

                if (ModelState.IsValid)
                {
                    // Create User
                    var user = new ApplicationUser() { UserName = userVM.UserName };
                    var accountController = new AccountController();
                    var result = accountController.UserManager.CreateAsync(user, userVM.Password);
                    accountController.UserManager.AddToRoleAsync(user.Id, "Standard Members");

                    // Avatar Image Upload
                    if (userVM.AvatarImage != null && userVM.AvatarImage.ContentLength > 0 && Helpers.Utility.IsImage(userVM.AvatarImage))
                    {
                        var lsFileName = Guid.NewGuid() + Path.GetExtension(userVM.AvatarImage.FileName); 
                        var lsPathFull = Path.Combine(Server.MapPath("~/Content/Avatar/Full"), lsFileName);
                        var lsPathThumb = Path.Combine(Server.MapPath("~/Content/Avatar/Thumb"), lsFileName);

                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(userVM.AvatarImage.InputStream), 200, 200, lsPathFull);
                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(userVM.AvatarImage.InputStream), 100, 100, lsPathThumb);
                        profileAvatarNew = lsFileName;
                    }

                    profile.UserID = user.Id;
                    profile.InjectFrom(userVM);

                    if (!string.IsNullOrEmpty(profileAvatarNew))
                    {
                        profile.Avatar = profileAvatarNew;
                    }

                    ProfileLogic.Add(profile);
                }

                return RedirectToAction("Index");
            }

            return View();
        }

        // GET: /Admin/UserManager/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            UserManagerEditViewModel userVM = new UserManagerEditViewModel();
            MembershipUser user = AccountLogic.GetMembershipUser(id);
            Profile profile = ProfileLogic.GetProfileByUserId(id);

            if (user == null || profile == null)
            {
                return HttpNotFound();
            }

            userVM.Id = user.Id;
            userVM.UserName = user.UserName;
            userVM.ProfileID = profile.ID;
            userVM.InjectFrom(profile);

            return View(userVM);
        }

        //POST: /Admin/UserManager/Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,UserName,Password,PasswordConfirm,Email,Birthday,BirthdayVisible,Address,Address2,City,State,Zip,Country,Signature,Avatar,AvatarImage,ProfileID,FirstName,LastName")] UserManagerEditViewModel userVM)
        {
            string profileAvatarExisting = string.Empty;
            string profileAvatarNew = string.Empty;

            if (ModelState.IsValid)
            {
                Profile profile = ProfileLogic.Get(userVM.ProfileID);
                profileAvatarExisting = profile.Avatar;

                if (ModelState.IsValid)
                {
                    // Update User
                    if (userVM.Password != null && userVM.PasswordConfirm != null && userVM.Password.Trim() == userVM.PasswordConfirm.Trim())
                    {
                        // Update Password
                        ApplicationDbContext context = new ApplicationDbContext();
                        UserStore<ApplicationUser> store = new UserStore<ApplicationUser>(context);
                        UserManager<ApplicationUser> UserManager = new UserManager<ApplicationUser>(store);
                        String userId = userVM.Id; 
                        String newPassword = userVM.Password; 
                        String hashedNewPassword = UserManager.PasswordHasher.HashPassword(userVM.Password);
                        ApplicationUser cUser = await store.FindByIdAsync(userId);
                        await store.SetPasswordHashAsync(cUser, hashedNewPassword);
                        await store.UpdateAsync(cUser);
                    }

                    // Avatar Image Upload
                    if (userVM.AvatarImage != null && userVM.AvatarImage.ContentLength > 0 && Helpers.Utility.IsImage(userVM.AvatarImage))
                    {
                        var lsFileName = Guid.NewGuid() + Path.GetExtension(userVM.AvatarImage.FileName);
                        var lsPathFull = Path.Combine(Server.MapPath("~/Content/Avatar/Full"), lsFileName);
                        var lsPathThumb = Path.Combine(Server.MapPath("~/Content/Avatar/Thumb"), lsFileName);

                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(userVM.AvatarImage.InputStream), 200, 200, lsPathFull);
                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(userVM.AvatarImage.InputStream), 100, 100, lsPathThumb);
                        profileAvatarNew = lsFileName;
                    }

                    profile.InjectFrom(userVM);
                    profile.Avatar = profileAvatarExisting;

                    if (!string.IsNullOrEmpty(profileAvatarNew))
                    {
                        profile.Avatar = profileAvatarNew;
                    }

                    ProfileLogic.Edit(profile);
                }

                return RedirectToAction("Index");
            }

            return View();
        }

        // GET: /Admin/UserManager/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            UserManagerViewModel userVM = new UserManagerViewModel();
            MembershipUser user = AccountLogic.GetMembershipUser(id);
            Profile profile = ProfileLogic.GetProfileByUserId(id);

            if (user == null || profile == null)
            {
                return HttpNotFound();
            }

            userVM.Id = user.Id;
            userVM.UserName = user.UserName;
            userVM.InjectFrom(profile);

            return View(userVM);
        }

        // POST: /Admin/UserManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AccountLogic.Delete(id);

            return RedirectToAction("Index");
        }

        public ActionResult Search(string searchString = "")
        {
            List<UserManagerViewModel> usersViewModel = new List<UserManagerViewModel>();

            if (searchString == "")
            {
                RedirectToAction("Index", "Home");
            }

            // Search Records
            var users = AccountLogic.Search(searchString.Trim());

            foreach (var item in users)
            {
                var profile = ProfileLogic.GetProfileByUserId(item.Id);
                var user = new UserManagerViewModel
                {
                    Id = item.Id,
                    UserName = item.UserName,
                    Email = profile.Email
                };

                usersViewModel.Add(user);
            }

            return View(usersViewModel);
        }
    }
}