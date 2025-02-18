using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Data.Context;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class VideoAlbumManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/VideoAlbumManager/
        public ActionResult Index()
        {
            return View(db.VideoAlbums.ToList());
        }

        // GET: /Admin/VideoAlbumManager/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VideoAlbum videoalbum = db.VideoAlbums.Find(id);
            if (videoalbum == null)
            {
                return HttpNotFound();
            }
            return View(videoalbum);
        }

        // GET: /Admin/VideoAlbumManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/VideoAlbumManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,Description,Timestamp,Visible")] VideoAlbum videoalbum)
        {
            if (ModelState.IsValid)
            {
                videoalbum.Timestamp = DateTime.Now;
                db.VideoAlbums.Add(videoalbum);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(videoalbum);
        }

        // GET: /Admin/VideoAlbumManager/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VideoAlbum videoalbum = db.VideoAlbums.Find(id);
            if (videoalbum == null)
            {
                return HttpNotFound();
            }
            return View(videoalbum);
        }

        // POST: /Admin/VideoAlbumManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Name,Description,Timestamp,Visible")] VideoAlbum videoalbum)
        {
            if (ModelState.IsValid)
            {
                videoalbum.Timestamp = DateTime.Now;
                db.Entry(videoalbum).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(videoalbum);
        }

        // GET: /Admin/VideoAlbumManager/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VideoAlbum videoalbum = db.VideoAlbums.Find(id);
            if (videoalbum == null)
            {
                return HttpNotFound();
            }
            return View(videoalbum);
        }

        // POST: /Admin/VideoAlbumManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            VideoAlbum videoalbum = db.VideoAlbums.Find(id);
            db.VideoAlbums.Remove(videoalbum);
            db.SaveChanges();
            return RedirectToAction("Index");
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
