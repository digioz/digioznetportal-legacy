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

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class VideoManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/VideoManager/
        public ActionResult Index()
        {
            return View();

        }

        public ActionResult VideoList(long? albumID)
        {
            var videos = db.Videos.Include(v => v.AspNetUser).Include(v => v.VideoAlbum);
            if (albumID != null)
            {
                videos = videos.Where(v => v.AlbumID == albumID);
            }
            List<SelectListItem> albums = new List<SelectListItem>();
            foreach (var album in db.VideoAlbums.ToList())
            {
                albums.Add(new SelectListItem { Text = album.Name, Value = album.ID.ToString() });
            }
            ViewBag.AlbumID = albums;
            return View(videos.ToList());
        }

        // GET: /Admin/VideoManager/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // GET: /Admin/VideoManager/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");
            ViewBag.AlbumID = new SelectList(db.VideoAlbums, "ID", "Name");
            return View();
        }

        // POST: /Admin/VideoManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,UserID,AlbumID,Filename,Description,Timestamp,Approved,Visible,file,fileVideo")] Video video, HttpPostedFileBase file, HttpPostedFileBase fileVideo)
        {
            if (file == null)
            {
                return RedirectToAction("Create", video);
            }

            if (ModelState.IsValid)
            {
                // Upload Thumbnail
                if (file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
                {
                    Guid guidName = Guid.NewGuid();
                    var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                    // Save Thumbnail Image
                    var pathThumb = Path.Combine(Server.MapPath("~/Content/Videos/Thumb"), fileName);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 240, 120, pathThumb);

                    video.Thumbnail = fileName;
                }

                if (fileVideo.ContentLength > 0 && Utility.IsFileAVideo(fileVideo.FileName))
                {
                    // Save Original Video
                    Guid guidName2 = Guid.NewGuid();
                    var fileName2 = guidName2.ToString() + Path.GetExtension(fileVideo.FileName);

                    var pathFull = Path.Combine(Server.MapPath("~/Content/Videos/Full"), fileName2);
                    fileVideo.SaveAs(pathFull);

                    video.Filename = fileName2;
                }

                video.Timestamp = DateTime.Now;
                db.Videos.Add(video);
                db.SaveChanges();
                return RedirectToAction("VideoList");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", video.UserID);
            ViewBag.AlbumID = new SelectList(db.VideoAlbums, "ID", "Name", video.AlbumID);
            return View(video);
        }

        // GET: /Admin/VideoManager/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", video.UserID);
            ViewBag.AlbumID = new SelectList(db.VideoAlbums, "ID", "Name", video.AlbumID);
            return View(video);
        }

        // POST: /Admin/VideoManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,UserID,AlbumID,Filename,Description,Timestamp,Approved,Visible,file,fileVideo")] Video video, HttpPostedFileBase file, HttpPostedFileBase fileVideo)
        {
            var videoExisting = db.Videos.SingleOrDefault(x => x.ID == video.ID);
            var album = db.VideoAlbums.SingleOrDefault(x => x.ID == video.AlbumID);
            videoExisting.UserID = video.UserID;
            videoExisting.VideoAlbum = album;
            videoExisting.Description = video.Description;
            videoExisting.Timestamp = DateTime.Now;
            videoExisting.Approved = video.Approved;
            videoExisting.Visible = video.Visible;

            if (ModelState.IsValid)
            {
                // Upload Thumbnail
                if (file != null && file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
                {
                    Guid guidName = Guid.NewGuid();
                    var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                    // Save Thumbnail Image
                    var pathThumb = Path.Combine(Server.MapPath("~/Content/Videos/Thumb"), fileName);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 240, 120, pathThumb);

                    videoExisting.Thumbnail = fileName;
                }

                if (fileVideo != null && fileVideo.ContentLength > 0 && Utility.IsFileAVideo(fileVideo.FileName))
                {
                    // Save Original Video
                    Guid guidName2 = Guid.NewGuid();
                    var fileName2 = guidName2.ToString() + Path.GetExtension(fileVideo.FileName);

                    var pathFull = Path.Combine(Server.MapPath("~/Content/Videos/Full"), fileName2);
                    fileVideo.SaveAs(pathFull);

                    videoExisting.Filename = fileName2;
                }
                else
                {
                    
                }

                videoExisting.Timestamp = DateTime.Now;
                db.Entry(videoExisting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("VideoList");
            }
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", videoExisting.UserID);
            ViewBag.AlbumID = new SelectList(db.VideoAlbums, "ID", "Name", videoExisting.AlbumID);
            return View(video);
        }

        // GET: /Admin/VideoManager/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: /Admin/VideoManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Video video = db.Videos.Find(id);
            db.Videos.Remove(video);
            db.SaveChanges();
            return RedirectToAction("VideoList");
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
