using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    public class LinkCategoryManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/LinkCategoryManager
        public ActionResult Index()
        {
            return View(db.LinkCategories.ToList());
        }

        // GET: Admin/LinkCategoryManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LinkCategory linkCategory = db.LinkCategories.Find(id);
            if (linkCategory == null)
            {
                return HttpNotFound();
            }
            return View(linkCategory);
        }

        // GET: Admin/LinkCategoryManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LinkCategoryManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Visible,Timestamp")] LinkCategory linkCategory)
        {
            if (ModelState.IsValid)
            {
                linkCategory.Timestamp = DateTime.Now;
                db.LinkCategories.Add(linkCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(linkCategory);
        }

        // GET: Admin/LinkCategoryManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LinkCategory linkCategory = db.LinkCategories.Find(id);
            linkCategory.Timestamp = DateTime.Now;

            if (linkCategory == null)
            {
                return HttpNotFound();
            }
            return View(linkCategory);
        }

        // POST: Admin/LinkCategoryManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Visible,Timestamp")] LinkCategory linkCategory)
        {
            linkCategory.Timestamp = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.Entry(linkCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(linkCategory);
        }

        // GET: Admin/LinkCategoryManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LinkCategory linkCategory = db.LinkCategories.Find(id);
            if (linkCategory == null)
            {
                return HttpNotFound();
            }
            return View(linkCategory);
        }

        // POST: Admin/LinkCategoryManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LinkCategory linkCategory = db.LinkCategories.Find(id);
            db.LinkCategories.Remove(linkCategory);
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
