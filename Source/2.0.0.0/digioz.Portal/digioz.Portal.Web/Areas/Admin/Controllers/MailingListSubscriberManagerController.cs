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
    public class MailingListSubscriberManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/MailingListSubscriberManager
        public ActionResult Index()
        {
            return View(db.MailingListSubscribers.ToList());
        }

        // GET: Admin/MailingListSubscriberManager/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            MailingListSubscriber mailingListSubscriber = db.MailingListSubscribers.Find(id);

            // Get list of Mailing Lists Subscriber belongs to
            var mailingListSubscriberRelations = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();
            var mailingListSubscribedTo = new List<MailingList>();

            foreach (var item in mailingListSubscriberRelations)
            {
                mailingListSubscribedTo.Add(db.MailingLists.SingleOrDefault(x => x.ID == item.MailingListID));
            }

            ViewBag.MailingListSubscribedTo = mailingListSubscribedTo.OrderBy(x => x.Name);

            if (mailingListSubscriber == null)
            {
                return HttpNotFound();
            }
            return View(mailingListSubscriber);
        }

        // GET: Admin/MailingListSubscriberManager/Create
        public ActionResult Create()
        {
            var mailingList = db.MailingLists.ToList();
            ViewBag.MailingLists = mailingList.OrderBy(x => x.Name);

            return View();
        }

        // POST: Admin/MailingListSubscriberManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Email,FirstName,LastName,Status,DateCreated,DateModified")] MailingListSubscriber mailingListSubscriber, FormCollection form)
        {
            // set dates for the record
            mailingListSubscriber.DateCreated = DateTime.Now;
            mailingListSubscriber.DateModified = DateTime.Now;

            if (ModelState.IsValid)
            {
                mailingListSubscriber.ID = Guid.NewGuid();
                db.MailingListSubscribers.Add(mailingListSubscriber);
                db.SaveChanges();

                // Now save mailing list record(s)
                var mailingLists = form.GetValues("mailinglist");
                List<MailingListSubscriberRelation> mailingSubscriberRelations = new List<MailingListSubscriberRelation>();

                if (mailingLists != null)
                {
                    foreach (var item in mailingLists)
                    {
                        MailingListSubscriberRelation mailingListSubscriberRelation = new MailingListSubscriberRelation();
                        mailingListSubscriberRelation.ID = Guid.NewGuid();
                        mailingListSubscriberRelation.MailingListID = new Guid(item);
                        mailingListSubscriberRelation.MailingListSubscriberID = mailingListSubscriber.ID;

                        mailingSubscriberRelations.Add(mailingListSubscriberRelation);
                    }

                    db.MailingListSubscriberRelations.AddRange(mailingSubscriberRelations);
                    db.SaveChanges();
                }

                return RedirectToAction("Index");
            }

            var mailingList = db.MailingLists.OrderBy(x => x.Name).ToList();
            ViewBag.MailingLists = mailingList;

            return View(mailingListSubscriber);
        }

        // GET: Admin/MailingListSubscriberManager/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            // Get total list of mailing lists
            var mailingLists = db.MailingLists.OrderBy(x => x.Name).ToList();
            ViewBag.MailingLists = mailingLists;

            MailingListSubscriber mailingListSubscriber = db.MailingListSubscribers.Find(id);

            // Get a list of mailing lists user is subscribed to
            var mailingListsSubscribed = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();
            List<string> subscribed = new List<string>();

            foreach (var item in mailingListsSubscribed)
            {
                subscribed.Add(item.MailingListID.ToString());
            }

            ViewBag.MailingListsSubscribed = subscribed;

            if (mailingListSubscriber == null)
            {
                return HttpNotFound();
            }
            return View(mailingListSubscriber);
        }

        // POST: Admin/MailingListSubscriberManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Email,FirstName,LastName,Status,DateCreated,DateModified")] MailingListSubscriber mailingListSubscriber, FormCollection form)
        {
            // Get total list of mailing lists
            var mailingLists = db.MailingLists.OrderBy(x => x.Name).ToList();
            ViewBag.MailingLists = mailingLists;

            mailingListSubscriber.DateModified = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.Entry(mailingListSubscriber).State = EntityState.Modified;
                db.SaveChanges();

                // Wipe out previous mailing lists subscribed to first
                var subscriberRelations = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();

                if (subscriberRelations.Count > 0)
                {
                    db.MailingListSubscriberRelations.RemoveRange(subscriberRelations);
                    db.SaveChanges();
                }

                // Now save the new mailing list record(s)
                var mailingListSelected = form.GetValues("mailinglist");
                List<MailingListSubscriberRelation> mailingSubscriberRelations = new List<MailingListSubscriberRelation>();

                if (mailingListSelected != null)
                {
                    foreach (var item in mailingListSelected)
                    {
                        MailingListSubscriberRelation mailingListSubscriberRelation = new MailingListSubscriberRelation();
                        mailingListSubscriberRelation.ID = Guid.NewGuid();
                        mailingListSubscriberRelation.MailingListID = new Guid(item);
                        mailingListSubscriberRelation.MailingListSubscriberID = mailingListSubscriber.ID;

                        mailingSubscriberRelations.Add(mailingListSubscriberRelation);
                    }

                    db.MailingListSubscriberRelations.AddRange(mailingSubscriberRelations);
                    db.SaveChanges();
                }


                return RedirectToAction("Index");
            }

            // ----------------- If there is a validation error - Start ----------------
            
            // Get a list of mailing lists user is subscribed to
            var mailingListsSubscribed = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();
            List<string> subscribed = new List<string>();

            foreach (var item in mailingListsSubscribed)
            {
                subscribed.Add(item.MailingListID.ToString());
            }

            ViewBag.MailingListsSubscribed = subscribed;

            // ----------------- If there is a validation error - End ----------------

            return View(mailingListSubscriber);
        }

        // GET: Admin/MailingListSubscriberManager/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            MailingListSubscriber mailingListSubscriber = db.MailingListSubscribers.Find(id);

            // Get list of Mailing Lists Subscriber belongs to
            var mailingListSubscriberRelations = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();
            var mailingListSubscribedTo = new List<MailingList>();

            foreach (var item in mailingListSubscriberRelations)
            {
                mailingListSubscribedTo.Add(db.MailingLists.SingleOrDefault(x => x.ID == item.MailingListID));
            }

            ViewBag.MailingListSubscribedTo = mailingListSubscribedTo.OrderBy(x => x.Name);


            if (mailingListSubscriber == null)
            {
                return HttpNotFound();
            }
            return View(mailingListSubscriber);
        }

        // POST: Admin/MailingListSubscriberManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            MailingListSubscriber mailingListSubscriber = db.MailingListSubscribers.Find(id);

            // Remove Mailing List Records first
            var subscriberRelations = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == mailingListSubscriber.ID).ToList();

            if (subscriberRelations.Count > 0)
            {
                db.MailingListSubscriberRelations.RemoveRange(subscriberRelations);
                db.SaveChanges();
            }

            db.MailingListSubscribers.Remove(mailingListSubscriber);
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
