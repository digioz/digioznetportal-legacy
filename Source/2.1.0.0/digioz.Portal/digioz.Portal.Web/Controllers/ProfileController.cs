using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using digioz.Portal.Web.Models.ViewModels;
using System.IO;
using System.Drawing;
using System.Data.Entity;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Utilities;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Controllers
{
    public class ProfileController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();
        //
        // GET: /Profile/
        [Authorize]
        public ActionResult Index()
        {
            string userID = User.Identity.GetUserId();
            Profile profile = ProfileLogic.GetProfileByUserId(userID); 

            if (profile == null)
            {
                return HttpNotFound();
            }

            ProfileViewModel loPVM = new ProfileViewModel();
            loPVM.UserID = userID;
            loPVM.InjectFrom(profile);

            return View(loPVM);
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(ProfileViewModel profileViewModel)
        {
            string userID = User.Identity.GetUserId();
            string profileAvatarExisting = string.Empty;
            string profileAvatarNew = string.Empty;

            if (userID == profileViewModel.UserID)
            {
                Profile profile = ProfileLogic.Get(profileViewModel.ID);
                profileAvatarExisting = profile.Avatar;

                if (ModelState.IsValid && profile != null)
                {
                    // Avatar Image Upload
                    if (profileViewModel.AvatarImage != null && profileViewModel.AvatarImage.ContentLength > 0 && Helpers.Utility.IsImage(profileViewModel.AvatarImage))
                    {
                        var lsFileName = Guid.NewGuid() + Path.GetExtension(profileViewModel.AvatarImage.FileName);
                        var lsPathFull = Path.Combine(Server.MapPath("~/Content/Avatar/Full"), lsFileName);
                        var lsPathThumb = Path.Combine(Server.MapPath("~/Content/Avatar/Thumb"), lsFileName);

                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(profileViewModel.AvatarImage.InputStream), 200, 200, lsPathFull);
                        Helpers.ImageHelper.SaveImageWithCrop(Image.FromStream(profileViewModel.AvatarImage.InputStream), 100, 100, lsPathThumb);
                        profileAvatarNew = lsFileName;
                    }

                    // Gravatar Image Upload
                    if (profileViewModel.UseGravatar)
                    {
                        if (profileViewModel.Email != null)
                        {
                            // Fetch Gravatar and upload it to folder
                            string gravatarHash = Helpers.Utility.HashEmailForGravatar(profileViewModel.Email);
                            string gravatar = $"http://www.gravatar.com/avatar/{gravatarHash}";
                            string ext = Helpers.Utility.GetRemoteImageExtension(gravatar);

                            var lsFileName = gravatarHash + "." + ext;
                            var lsPathFull = Path.Combine(Server.MapPath("~/Content/Avatar/Full"), lsFileName);
                            var lsPathThumb = Path.Combine(Server.MapPath("~/Content/Avatar/Thumb"), lsFileName);

                            Helpers.Utility.SaveFileFromUrl(lsPathFull, gravatar + "?size=200");
                            Helpers.Utility.SaveFileFromUrl(lsPathThumb, gravatar + "?size=100");
                            profileAvatarNew = lsFileName;
                        }
                    }

                    profile.InjectFrom(profileViewModel);
                    profile.Avatar = profileAvatarExisting;

                    if (!string.IsNullOrEmpty(profileAvatarNew))
                    {
                        profile.Avatar = profileAvatarNew;
                    }
                    
                    ProfileLogic.Edit(profile);

                    TempData["Saved"] = true;
                    return RedirectToAction("Index", new { id = profile.ID });
                }

                return View(profile);
            }

            return View("Index");
        }

        public ActionResult ShowDetails(string userId, string userName)
        {
            MembershipUser user = null;

            if (userId != null)
            {
                user = AccountLogic.GetMembershipUser(userId);
                
            }
            else if (userName != null)
            {
                user = AccountLogic.GetMembershipUserByUsername(userName);
                userId = user.Id;
            }

            var profile = ProfileLogic.GetProfileByUserId(userId);

            if (profile == null || user == null)
            {
                return HttpNotFound();
            }

            ProfileViewModel pvm = new ProfileViewModel();
            pvm.UserID = userId;
            pvm.InjectFrom(profile);
            pvm.Username = user.UserName;

            return View(pvm);
        }

        public FileResult ShowAvatar(string userId)
        {
            var profile = ProfileLogic.GetProfileByUserId(userId);
            string avatarRelativePath = "Content\\Avatar\\Full\\";
            string avatarUrl = avatarRelativePath + "Default.png";
            string filePath = string.Empty;
            string mimeType = "image/png";

            if (profile != null && profile.Avatar != null)
            {
                mimeType = Helpers.Utility.GetMimeType(profile.Avatar);
                avatarUrl = avatarRelativePath + profile.Avatar;
                filePath = AppDomain.CurrentDomain.BaseDirectory + avatarUrl;
            }

            filePath = AppDomain.CurrentDomain.BaseDirectory + avatarUrl;

            var image = new FileStreamResult(new FileStream(filePath, FileMode.Open), mimeType);

            return image;
        }

		public ActionResult Pictures(string userId, string userName)
		{
			MembershipUser user = null;
			List<Picture> pictures = null;

			if (userId != null)
			{
				user = AccountLogic.GetMembershipUser(userId);

			}
			else if (userName != null)
			{
				user = AccountLogic.GetMembershipUserByUsername(userName);
				userId = user.Id;
			}
			else
			{
				var username = User.Identity.GetUserName();
				user = AccountLogic.GetMembershipUserByUsername(username);
			}

			if (user != null)
			{
				pictures = PictureLogic.GetAll().Where(x => x.UserID == user.Id).OrderByDescending(x => x.ID).ToList();
				ViewBag.Username = user.UserName;
			}			

			return View(pictures);
		}

		public ActionResult PictureDelete(long id)
		{
			if (User.Identity.IsAuthenticated)
			{
				// Check to make sure user owns picture
				var picture = PictureLogic.Get(id);
				var username = User.Identity.GetUserName();
				var user = AccountLogic.GetMembershipUserByUsername(username);

				if (user != null && picture != null && user.Id == picture.UserID)
				{
					// Delete Picture
					PictureLogic.Delete(picture.ID);
				}
			}

			// Redirect back to Pictures
			return RedirectToAction("Pictures");
		}
	}
}