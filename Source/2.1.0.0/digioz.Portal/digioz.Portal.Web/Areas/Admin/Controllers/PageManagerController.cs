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
    public class PageManagerController : Controller
    {
        // GET: /Admin/PageManager/
        public ActionResult Index()
        {
            var pages = PageLogic.GetAll();
            return View(pages);
        }

        // GET: /Admin/PageManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = PageLogic.Get(id.GetValueOrDefault());
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // GET: /Admin/PageManager/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName");
            return View();
        }

        // POST: /Admin/PageManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,UserID,Title,URL,Body,Keywords,Description,Visible,Timestamp")] Page page)
        {
            if (ModelState.IsValid)
            {
                page.UserID = HttpContext.User.Identity.GetUserId();
                page.Timestamp = DateTime.Now;

                PageLogic.Add(page);

                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", page.UserID);
            return View(page);
        }

        // GET: /Admin/PageManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = PageLogic.Get(id.GetValueOrDefault());
            if (page == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", page.UserID);
            return View(page);
        }

        // POST: /Admin/PageManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,UserID,Title,URL,Body,Keywords,Description,Visible,Timestamp")] Page page)
        {
            if (ModelState.IsValid)
            {
                var pageDb = PageLogic.Get(page.ID);
                
                pageDb.UserID = HttpContext.User.Identity.GetUserId();
                pageDb.Timestamp = DateTime.Now;

                pageDb.Title = page.Title;
                pageDb.URL = page.URL;
                pageDb.Body = page.Body;
                pageDb.Keywords = page.Keywords;
                pageDb.Description = page.Description;
                pageDb.Visible = page.Visible;
                
                PageLogic.Edit(pageDb);
                
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(AccountLogic.GetMembershipUsers(), "Id", "UserName", page.UserID);
            return View(page);
        }

        // GET: /Admin/PageManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Page page = PageLogic.Get(id.GetValueOrDefault());
            if (page == null)
            {
                return HttpNotFound();
            }
            return View(page);
        }

        // POST: /Admin/PageManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PageLogic.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
