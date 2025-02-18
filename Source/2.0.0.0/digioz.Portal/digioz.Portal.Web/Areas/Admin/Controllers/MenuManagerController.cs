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

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class MenuManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: /Admin/MenuManager/
        public ActionResult Index()
        {
            var menus = db.Menus.Include(m => m.AspNetUser).OrderBy(m=>m.SortOrder);

            return View(menus.ToList());
        }

        // GET: /Admin/MenuManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // GET: /Admin/MenuManager/Create
        public ActionResult Create()
        {
            // Get list of Users
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");

            // Get Menu Locations
            var locations = db.Zones.Where(x => x.ZoneType == "Menu").ToList();
            List<SelectListItem> locationListItems = new List<SelectListItem>();
            foreach (var location in locations)
            {
                locationListItems.Add(new SelectListItem() { Text = location.Name, Value = location.Name });
            }
            ViewBag.Location = locationListItems;
            
            return View();
        }

        // POST: /Admin/MenuManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,UserID,Name,Location,Controller,Action,URL,Target,Visible,Timestamp")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                if (menu.UserID == null)
                {
                    menu.UserID = HttpContext.User.Identity.GetUserId();
                }
                menu.Timestamp = DateTime.Now;
                int maxSortOrder = db.Menus.Where(m=>m.Location==menu.Location).Max(m => m.SortOrder); //max sort order for this location
                menu.SortOrder = maxSortOrder + 1;
                //bump all menus above
                var menusHigherSort=db.Menus.Where(m => m.SortOrder >= menu.SortOrder);
                foreach (Menu menuHigherSort in menusHigherSort)
                {
                    menuHigherSort.SortOrder++;
                }
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // Get list of users
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", menu.UserID);

            // Get Menu Locations
            var locations = db.Zones.Where(x => x.ZoneType == "Menu").ToList();
            List<SelectListItem> locationListItems = new List<SelectListItem>();
            foreach (var location in locations)
            {
                locationListItems.Add(new SelectListItem() { Text = location.Name, Value = location.Name });
            }
            ViewBag.Location = locationListItems;

            return View(menu);
        }

        // GET: /Admin/MenuManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Menu menu = db.Menus.Find(id);

            if (menu == null)
            {
                return HttpNotFound();
            }

            // Get list of users
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", menu.UserID);

            // Get Menu Locations
            var locations = db.Zones.Where(x => x.ZoneType == "Menu").ToList();
            List<SelectListItem> locationListItems = new List<SelectListItem>();
            foreach (var location in locations)
            {
                locationListItems.Add(new SelectListItem() { Text = location.Name, Value = location.Name });
            }
            ViewBag.Location = locationListItems;

            return View(menu);
        }

        // POST: /Admin/MenuManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,UserID,Name,Location,Controller,Action,URL,Target,Visible,Timestamp,SortOrder")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                menu.UserID = HttpContext.User.Identity.GetUserId();
                menu.Timestamp = DateTime.Now;
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            // Get list of users
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", menu.UserID);

            // Get Menu Locations
            var locations = db.Zones.Where(x => x.ZoneType == "Menu").ToList();
            List<SelectListItem> locationListItems = new List<SelectListItem>();
            foreach (var location in locations)
            {
                locationListItems.Add(new SelectListItem() { Text = location.Name, Value = location.Name });
            }
            ViewBag.Location = locationListItems;

            return View(menu);
        }

        public ActionResult MoveUp(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu1 = db.Menus.Find(id);
            if (menu1 == null)
            {
                return HttpNotFound();
            }
            menu1.Timestamp = DateTime.Now;            
            menu1.SortOrder--;
            int newSortOrder = menu1.SortOrder;
            db.Entry(menu1).State = EntityState.Modified;
            Menu menu2 = db.Menus.SingleOrDefault(item => item.SortOrder == newSortOrder);
            if (menu2 != null)
            {
                if (menu2.Location == menu1.Location)
                {
                    menu2.Timestamp = DateTime.Now;
                    menu2.SortOrder++;
                    db.Entry(menu2).State = EntityState.Modified;
                }else
                {
                    //no need to move or change sort order. this menu is already the first sort order for it's location (Top/Left)
                    menu1.SortOrder++; //revert to same before save changes
                }
            }
            db.SaveChanges();
            //return RedirectToAction("ClearCache", "ConfigurationManagerController");
            new ConfigurationManagerController().ClearCache();
            return RedirectToAction("Index");
        }
        public ActionResult MoveDown(int? id)
        {
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu1 = db.Menus.Find(id);
            if (menu1 == null)
            {
                return HttpNotFound();
            }
            menu1.Timestamp = DateTime.Now;            
            menu1.SortOrder++;
            int newSortOrder = menu1.SortOrder;
            db.Entry(menu1).State = EntityState.Modified;
            Menu menu2 = db.Menus.SingleOrDefault(item => item.SortOrder == newSortOrder);
            if (menu2 != null)
            {
                if (menu2.Location == menu1.Location)
                {
                    menu2.Timestamp = DateTime.Now;
                    menu2.SortOrder--;
                    db.Entry(menu2).State = EntityState.Modified;
                }else
                {
                    //no need to move or change sort order. this menu is already the first sort order for it's location (Top/Left)
                    menu1.SortOrder--; //revert to same before save changes
                }
            }
            db.SaveChanges();
            //return RedirectToAction("ClearCache", "ConfigurationManagerController");
            new ConfigurationManagerController().ClearCache();
            return RedirectToAction("Index");
        }

        // GET: /Admin/MenuManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // POST: /Admin/MenuManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Menu menu = db.Menus.Find(id);
            int deletedSortOrder = menu.SortOrder;
            var menus= db.Menus.Where(s => s.SortOrder > deletedSortOrder);
            foreach (Menu otherMenu in menus)
            {
                otherMenu.SortOrder--;
                db.Entry(otherMenu).State = EntityState.Modified;
            }
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
