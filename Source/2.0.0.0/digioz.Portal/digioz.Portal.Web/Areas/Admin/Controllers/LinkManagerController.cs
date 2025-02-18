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
    public class LinkManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/LinkManager/
        public ActionResult Index()
        {
            return View(db.Links.ToList());
        }

        public ActionResult List()
        {
            return View(db.Links.ToList());
        }

        // GET: /Admin/LinkManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = db.Links.Find(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // GET: /Admin/LinkManager/Create
        public ActionResult Create()
        {
            ViewBag.LinkCategoryID = new SelectList(db.LinkCategories, "Id", "Name");

            return View();
        }

        // POST: /Admin/LinkManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,Name,URL,Description,Category,Visible,Timestamp,LinkCategoryID")] Link link)
        {
            if (ModelState.IsValid)
            {
                link.Timestamp = DateTime.Now;
                db.Links.Add(link);
                db.SaveChanges();
                return RedirectToAction("List");
            }

            ViewBag.LinkCategoryID = new SelectList(db.LinkCategories, "Id", "Name", link.LinkCategoryID);

            return View(link);
        }

        // GET: /Admin/LinkManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = db.Links.Find(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            ViewBag.LinkCategoryID = new SelectList(db.LinkCategories, "Id", "Name", link.LinkCategoryID);

            return View(link);
        }

        // POST: /Admin/LinkManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,Name,URL,Description,Category,Visible,Timestamp,LinkCategoryID")] Link link)
        {
            if (ModelState.IsValid)
            {
                link.Timestamp = DateTime.Now;
                db.Entry(link).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LinkCategoryID = new SelectList(db.LinkCategories, "Id", "Name", link.LinkCategoryID);

            return View(link);
        }

        // GET: /Admin/LinkManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = db.Links.Find(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // POST: /Admin/LinkManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Link link = db.Links.Find(id);
            db.Links.Remove(link);
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
