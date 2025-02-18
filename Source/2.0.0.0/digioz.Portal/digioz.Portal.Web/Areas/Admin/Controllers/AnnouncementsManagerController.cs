using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity;
using digioz.Portal.Data.Context;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class AnnouncementsManagerController : Controller
    {
        // GET: /Admin/AnnouncementsManager/
        public ActionResult Index()
        {
            var announcements = AnnouncementLogic.GetAll();
            return View(announcements);
        }

        // GET: /Admin/AnnouncementsManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Announcement announcement = AnnouncementLogic.Get(id.GetValueOrDefault());
            if (announcement == null)
            {
                return HttpNotFound();
            }
            return View(announcement);
        }

        // GET: /Admin/AnnouncementsManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/AnnouncementsManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,UserID,Title,Body,Visible,Timestamp")] Announcement announcement)
        {
            if (ModelState.IsValid)
            {
                announcement.UserID = HttpContext.User.Identity.GetUserId();
                announcement.Timestamp = DateTime.Now;

                AnnouncementLogic.Add(announcement);

                return RedirectToAction("Index");
            }

            return View(announcement);
        }

        // GET: /Admin/AnnouncementsManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Announcement announcement = AnnouncementLogic.Get(id.GetValueOrDefault());
            if (announcement == null)
            {
                return HttpNotFound();
            }

            return View(announcement);
        }

        // POST: /Admin/AnnouncementsManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,UserID,Title,Body,Visible,Timestamp")] Announcement announcement)
        {
            if (ModelState.IsValid)
            {
                var announcementDb = AnnouncementLogic.Get(announcement.ID);
                
                announcementDb.UserID = HttpContext.User.Identity.GetUserId();
                announcementDb.Timestamp = DateTime.Now;

                announcementDb.Title = announcement.Title;
                announcementDb.Body = announcement.Body;
                announcementDb.Visible = announcement.Visible;

                AnnouncementLogic.Edit(announcementDb);

                return RedirectToAction("Index");
            }

            return View(announcement);
        }

        // GET: /Admin/AnnouncementsManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Announcement announcement = AnnouncementLogic.Get(id.GetValueOrDefault());
            if (announcement == null)
            {
                return HttpNotFound();
            }
            return View(announcement);
        }

        // POST: /Admin/AnnouncementsManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AnnouncementLogic.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
