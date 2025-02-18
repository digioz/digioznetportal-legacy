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
    public class PictureAlbumManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/PictureAlbumManager/
        public ActionResult Index()
        {
            return View(db.PictureAlbums.ToList());
        }

        // GET: /Admin/PictureAlbumManager/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PictureAlbum picturealbum = db.PictureAlbums.Find(id);
            if (picturealbum == null)
            {
                return HttpNotFound();
            }
            return View(picturealbum);
        }

        // GET: /Admin/PictureAlbumManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/PictureAlbumManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,Description,Timestamp,Visible")] PictureAlbum picturealbum)
        {
            if (ModelState.IsValid)
            {
                picturealbum.Timestamp = DateTime.Now;
                db.PictureAlbums.Add(picturealbum);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(picturealbum);
        }

        // GET: /Admin/PictureAlbumManager/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PictureAlbum picturealbum = db.PictureAlbums.Find(id);
            if (picturealbum == null)
            {
                return HttpNotFound();
            }
            return View(picturealbum);
        }

        // POST: /Admin/PictureAlbumManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Name,Description,Timestamp,Visible")] PictureAlbum picturealbum)
        {
            if (ModelState.IsValid)
            {
                picturealbum.Timestamp = DateTime.Now;
                db.Entry(picturealbum).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(picturealbum);
        }

        // GET: /Admin/PictureAlbumManager/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PictureAlbum picturealbum = db.PictureAlbums.Find(id);
            if (picturealbum == null)
            {
                return HttpNotFound();
            }
            return View(picturealbum);
        }

        // POST: /Admin/PictureAlbumManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            PictureAlbum picturealbum = db.PictureAlbums.Find(id);
            db.PictureAlbums.Remove(picturealbum);
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
