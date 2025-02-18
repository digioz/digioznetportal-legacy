using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Helpers;
using System.IO;
using System.Drawing;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class PictureManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/PictureManager/
        public ActionResult Index()
        {
            return View();
        }

        // GET: /Admin/PictureManager/PictureList/2

        public ActionResult PictureList(long? albumID)
        {
            var pictures = db.Pictures.Include(p => p.AspNetUser).Include(p => p.PictureAlbum);
            if (albumID != null)
            {
                pictures = pictures.Where(p => p.AlbumID == albumID);
            }
            List<SelectListItem> albums = new List<SelectListItem>();
            foreach (var album in db.PictureAlbums.ToList())
            {
                albums.Add(new SelectListItem { Text = album.Name, Value = album.ID.ToString() });
            }
            ViewBag.AlbumID = albums;
            return View(pictures.ToList());
        }

        // GET: /Admin/PictureManager/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Picture picture = db.Pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            return View(picture);
        }

        // GET: /Admin/PictureManager/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");
            ViewBag.AlbumID = new SelectList(db.PictureAlbums, "ID", "Name");
            return View();
        }

        // POST: /Admin/PictureManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,UserID,AlbumID,Filename,Description,Timestamp,Approved,Visible,files")] Picture picture, List<HttpPostedFileBase> files)
        {
            if (files == null || files.Count == 0)
            {
                return RedirectToAction("Create", picture);
            }

            if (ModelState.IsValid)
            {
                foreach (var file in files)
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

                        picture.Filename = fileName;
                    }

                    picture.Timestamp = DateTime.Now;
                    db.Pictures.Add(picture);
                    db.SaveChanges();
                }

                return RedirectToAction("PictureList");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", picture.UserID);
            ViewBag.AlbumID = new SelectList(db.PictureAlbums, "ID", "Name", picture.AlbumID);
            return View(picture);
        }

        // GET: /Admin/PictureManager/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Picture picture = db.Pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", picture.UserID);
            ViewBag.AlbumID = new SelectList(db.PictureAlbums, "ID", "Name", picture.AlbumID);
            return View(picture);
        }

        // POST: /Admin/PictureManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,UserID,AlbumID,Filename,Description,Timestamp,Approved,Visible, file")] Picture picture, HttpPostedFileBase file)
        {
            var pictureExisting = db.Pictures.SingleOrDefault(x => x.ID == picture.ID);
            var album = db.PictureAlbums.SingleOrDefault(x => x.ID == picture.AlbumID);
            pictureExisting.UserID = picture.UserID;
            pictureExisting.PictureAlbum = album;
            pictureExisting.Description = picture.Description;
            pictureExisting.Timestamp = DateTime.Now;
            pictureExisting.Approved = picture.Approved;
            pictureExisting.Visible = picture.Visible;

            if (ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
                {
                    Guid guidName = Guid.NewGuid();
                    var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                    // Save Original Image
                    var pathFull = Path.Combine(Server.MapPath("~/Content/Pictures/Full"), fileName);
                    file.SaveAs(pathFull);

                    // Save Thumbnail Image
                    var pathThumb = Path.Combine(Server.MapPath("~/Content/Pictures/Thumb"), fileName);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                    pictureExisting.Filename = fileName;
                }

                db.Entry(pictureExisting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("PictureList");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", pictureExisting.UserID);
            ViewBag.AlbumID = new SelectList(db.PictureAlbums, "ID", "Name", pictureExisting.AlbumID);
            return View(picture);
        }

        // GET: /Admin/PictureManager/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Picture picture = db.Pictures.Find(id);
            if (picture == null)
            {
                return HttpNotFound();
            }
            return View(picture);
        }

        // POST: /Admin/PictureManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Picture picture = db.Pictures.Find(id);
            db.Pictures.Remove(picture);
            db.SaveChanges();
            return RedirectToAction("PictureList");
        }

		public ActionResult Approve()
		{
			var pictures = db.Pictures.Where(x => x.Approved == false || x.Visible == false).Include(p => p.AspNetUser).Include(p => p.PictureAlbum);

			return View(pictures.ToList());
		}

		public ActionResult ApprovePictures(long id)
		{
			Picture picture = PictureLogic.Get(id);

			if (picture == null)
			{
				return HttpNotFound();
			}

			picture.Approved = true;
			picture.Visible = true;

			PictureLogic.Edit(picture);

			return RedirectToAction("Approve");
		}


		protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
