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
using digioz.Portal.BLL;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class RSSManagerController : Controller
    {
        //private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/RSSManager
        public ActionResult Index()
        {
            var rssList = RSSLogic.GetAll();

            return View(rssList);
        }

        // GET: Admin/RSSManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            RSS rSS = RSSLogic.Get(Convert.ToInt32(id));

            if (rSS == null)
            {
                return HttpNotFound();
            }

            return View(rSS);
        }

        // GET: Admin/RSSManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/RSSManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Url,MaxCount,Timestamp")] RSS rss)
        {
            rss.Timestamp = DateTime.Now;

            if (ModelState.IsValid)
            {
                RSSLogic.Add(rss);
                return RedirectToAction("Index");
            }

            return View(rss);
        }

        // GET: Admin/RSSManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            RSS rSS = RSSLogic.Get(Convert.ToInt32(id));

            if (rSS == null)
            {
                return HttpNotFound();
            }

            return View(rSS);
        }

        // POST: Admin/RSSManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Url,MaxCount,Timestamp")] RSS rss)
        {
            var rssDb = RSSLogic.Get(rss.ID);
            
            rssDb.Name = rss.Name;
            rssDb.Url = rss.Url;
            rssDb.MaxCount = rss.MaxCount;
            rssDb.Timestamp = DateTime.Now;

            if (ModelState.IsValid)
            {
                RSSLogic.Edit(rssDb);
                return RedirectToAction("Index");
            }

            return View(rss);
        }

        // GET: Admin/RSSManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            RSS rSS = RSSLogic.Get(Convert.ToInt32(id));

            if (rSS == null)
            {
                return HttpNotFound();
            }

            return View(rSS);
        }

        // POST: Admin/RSSManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RSSLogic.Delete(Convert.ToInt32(id));
            return RedirectToAction("Index");
        }
    }
}
