using digioz.Portal.Data.Context;
using digioz.Portal.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.BLL;
using digioz.Portal.Web.Helpers;
using System.IO;
using System.Drawing;

namespace digioz.Portal.Web.Controllers
{
    public class PicturesController : Controller
    {
        //
        // GET: /Pictures/
        public ActionResult Index()
        {
            digiozPortalEntities db = new digiozPortalEntities();

            List<PicturesViewModel> pictureAlbumList = new List<PicturesViewModel>();
            PicturesViewModel pictureAlbum;

            var pictureAlbums = db.PictureAlbums.Where(x => x.Visible == true).ToList();

            foreach (var item in pictureAlbums)
            {
                pictureAlbum = new PicturesViewModel();
                pictureAlbum.ID = item.ID;
                pictureAlbum.Name = item.Name;
                pictureAlbum.Description = item.Description;
                pictureAlbum.Timestamp = item.Timestamp;
                pictureAlbum.Visible = item.Visible;
                pictureAlbum.Thumbnail = db.Pictures.OrderByDescending(x => x.ID).Where(x => x.AlbumID == item.ID).Select(x => x.Filename).FirstOrDefault();

                if (pictureAlbum.Thumbnail == null || pictureAlbum.Thumbnail == string.Empty)
                {
                    pictureAlbum.Thumbnail = "PictureAlbumIcon.png";
                }

                pictureAlbumList.Add(pictureAlbum);
            }

            return View(pictureAlbumList);
        }

        public ActionResult List(int id, int? page)
        {
            digiozPortalEntities db = new digiozPortalEntities();

            var pictures = db.Pictures.Where(x => x.AlbumID == id && x.Visible == true && x.Approved == true).ToList();

            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(pictures.ToPagedList(pageNumber, pageSize));
        }

		[Authorize]
		public ActionResult Add()
		{
			ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");
			ViewBag.AlbumID = new SelectList(PictureAlbumLogic.GetAll(), "ID", "Name");

			return View();
		}

		[Authorize]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Add(Picture model, HttpPostedFileBase file)
		{
			if (file == null)
			{
				return RedirectToAction("Create", model);
			}

			if (ModelState.IsValid)
			{
				if (file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
				{
					Guid guidName = Guid.NewGuid();
					var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

					// Save Original Image
					var pathFull = Path.Combine(Server.MapPath("~/Content/Pictures/Full"), fileName);
					file.SaveAs(pathFull);

					// Save Thumbnail Image
					var pathThumb = Path.Combine(Server.MapPath("~/Content/Pictures/Thumb"), fileName);
					Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

					model.Filename = fileName;
				}

				model.Timestamp = DateTime.Now;

				var username = User.Identity.Name; 
				var user = AccountLogic.GetMembershipUserByUsername(username);

				model.UserID = user.Id;
				model.Approved = false;
				model.Visible = false;

				PictureLogic.Add(model); 
			}

			ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", model.UserID);
			ViewBag.AlbumID = new SelectList(PictureAlbumLogic.GetAll(), "ID", "Name", model.AlbumID);

			return RedirectToAction("Pictures", "Profile");
		}
    }
}