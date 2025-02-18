using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class ModuleManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/ModuleManager/
        public ActionResult Index()
        {
            var modules = db.Modules.Include(p => p.AspNetUser);
            return View(modules.ToList());
        }

        // GET: /Admin/ModuleManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Modules.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }
            return View(module);
        }

        // GET: /Admin/ModuleManager/Create
        public ActionResult Create()
        {
            // Get user list
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");

            // Get Menu Locations
            ViewBag.Location = new SelectList(db.Zones.Where(x => x.ZoneType == "Module"), "Name", "Name");

            return View();
        }

        // POST: /Admin/ModuleManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,UserID,Title,Body,Visible,Timestamp,Location,DisplayInBox")] Module module)
        {
            if (ModelState.IsValid)
            {
                module.UserID = HttpContext.User.Identity.GetUserId();
                module.Timestamp = DateTime.Now;
                db.Modules.Add(module);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // Get user list
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", module.UserID);

            // Get Menu Locations
            ViewBag.Location = new SelectList(db.Zones.Where(x => x.ZoneType == "Module"), "Name", "Name", module.Location);

            return View(module);
        }

        // GET: /Admin/ModuleManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Modules.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }

            // Get user list
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", module.UserID);

            // Get Menu Locations
            ViewBag.Location = new SelectList(db.Zones.Where(x => x.ZoneType == "Module"), "Name", "Name", module.Location);

            return View(module);
        }

        // POST: /Admin/ModuleManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserID,Title,Body,Visible,Timestamp,Location,DisplayInBox")] Module module)
        {
            if (ModelState.IsValid)
            {
                module.UserID = HttpContext.User.Identity.GetUserId();
                module.Timestamp = DateTime.Now;
                db.Entry(module).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // Get user list
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", module.UserID);

            // Get Menu Locations
            ViewBag.Location = new SelectList(db.Zones.Where(x => x.ZoneType == "Module"), "Name", "Name", module.Location);

            return View(module);
        }

        // GET: /Admin/ModuleManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Module module = db.Modules.Find(id);
            if (module == null)
            {
                return HttpNotFound();
            }
            return View(module);
        }

        // POST: /Admin/ModuleManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Module module = db.Modules.Find(id);
            db.Modules.Remove(module);
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