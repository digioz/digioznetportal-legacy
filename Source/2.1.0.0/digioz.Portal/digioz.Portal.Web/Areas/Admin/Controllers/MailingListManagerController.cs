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
    [Authorize(Roles = "Administrator")]
    public class MailingListManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/MailingListManager
        public ActionResult Index()
        {
            return View(db.MailingLists.ToList());
        }

        public ActionResult List()
        {
            return View(db.MailingLists.ToList());
        }

        // GET: Admin/MailingListManager/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingList mailingList = db.MailingLists.Find(id);
            if (mailingList == null)
            {
                return HttpNotFound();
            }
            return View(mailingList);
        }

        // GET: Admin/MailingListManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/MailingListManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,DefaultEmailFrom,DefaultFromName,Description,Address")] MailingList mailingList)
        {
            if (ModelState.IsValid)
            {
                mailingList.ID = Guid.NewGuid();
                db.MailingLists.Add(mailingList);
                db.SaveChanges();
                return RedirectToAction("List");
            }

            return View(mailingList);
        }

        // GET: Admin/MailingListManager/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingList mailingList = db.MailingLists.Find(id);
            if (mailingList == null)
            {
                return HttpNotFound();
            }
            return View(mailingList);
        }

        // POST: Admin/MailingListManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,DefaultEmailFrom,DefaultFromName,Description,Address")] MailingList mailingList)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mailingList).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("List");
            }
            return View(mailingList);
        }

        // GET: Admin/MailingListManager/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingList mailingList = db.MailingLists.Find(id);
            if (mailingList == null)
            {
                return HttpNotFound();
            }
            return View(mailingList);
        }

        // POST: Admin/MailingListManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            MailingList mailingList = db.MailingLists.Find(id);
            db.MailingLists.Remove(mailingList);
            db.SaveChanges();
            return RedirectToAction("List");
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
