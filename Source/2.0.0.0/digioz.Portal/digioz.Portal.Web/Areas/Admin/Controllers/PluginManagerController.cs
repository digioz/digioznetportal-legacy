using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    public class PluginManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/PluginManager
        public ActionResult Index()
        {
            return View(db.Plugins.ToList());
        }

        // GET: Admin/PluginManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plugin plugin = db.Plugins.Find(id);
            if (plugin == null)
            {
                return HttpNotFound();
            }
            return View(plugin);
        }

        // GET: Admin/PluginManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/PluginManager/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,DLL,IsEnabled")] Plugin plugin)
        {
            if (ModelState.IsValid)
            {
                db.Plugins.Add(plugin);
                db.SaveChanges();
                Menu menu = new Menu();
                menu.Name = plugin.Name;
                menu.Location = "Top";
                menu.Visible = plugin.IsEnabled;
                menu.UserID = HttpContext.User.Identity.GetUserId();
                new MenuManagerController().Create(menu);
                return RedirectToAction("Index");
            }

            return View(plugin);
        }

        // GET: Admin/PluginManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plugin plugin = db.Plugins.Find(id);
            if (plugin == null)
            {
                return HttpNotFound();
            }
            return View(plugin);
        }

        // POST: Admin/PluginManager/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,DLL,IsEnabled")] Plugin plugin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(plugin).State = EntityState.Modified;

                Menu menu = db.Menus.Find(plugin.Id); 

                if (menu != null)
                {
                    menu.Visible = plugin.IsEnabled;
                }
                
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(plugin);
        }

        // GET: Admin/PluginManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Plugin plugin = db.Plugins.Find(id);
            if (plugin == null)
            {
                return HttpNotFound();
            }
            return View(plugin);
        }

        // POST: Admin/PluginManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Plugin plugin = db.Plugins.Find(id);
            db.Plugins.Remove(plugin);
            Menu menu = db.Menus.Find(plugin.Id);
            db.Menus.Remove(menu);
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
