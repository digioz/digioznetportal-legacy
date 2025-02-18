using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Helpers;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class SlideShowManagerController : Controller
    {
        // GET: Admin/SlideShowManager
        public ActionResult Index()
        {
            var slides = SlideShowLogic.GetAll();
            return View(slides);
        }

        // GET: Admin/SlideShowManager/Details/5
        public ActionResult Details(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var slideShow = SlideShowLogic.Get(id);

            if (slideShow == null)
            {
                return HttpNotFound();
            }

            return View(slideShow);
        }

        // GET: Admin/SlideShowManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/SlideShowManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Image,Description")] SlideShow slideShow, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                // Upload Image
                if (file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
                {
                    Guid guidName = Guid.NewGuid();
                    var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                    var pathFull = Path.Combine(Server.MapPath("~/Content/Slides/Full"), fileName);
                    //file.SaveAs(pathFull);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 850, 450, pathFull);

                    // Save Thumbnail Image
                    var pathThumb = Path.Combine(Server.MapPath("~/Content/Slides/Thumb"), fileName);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                    slideShow.Image = fileName;
                }

                // Save Record
                SlideShowLogic.Add(slideShow);

                return RedirectToAction("Index");
            }

            return View(slideShow);
        }

        // GET: Admin/SlideShowManager/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            SlideShow slideShow = SlideShowLogic.Get(id);

            if (slideShow == null)
            {
                return HttpNotFound();
            }

            return View(slideShow);
        }

        // POST: Admin/SlideShowManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Image,Description")] SlideShow slideShow, HttpPostedFileBase file)
        {
            var slideExisting = SlideShowLogic.Get(slideShow.Id);

            if (ModelState.IsValid)
            {
                // Upload Picture
                if (file != null && file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
                {
                    Guid guidName = Guid.NewGuid();
                    var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                    // Save Original Image
                    var pathFull = Path.Combine(Server.MapPath("~/Content/Slides/Full"), fileName);
                    //file.SaveAs(pathFull);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 850, 450, pathFull);

                    // Save Thumbnail Image
                    var pathThumb = Path.Combine(Server.MapPath("~/Content/Slides/Thumb"), fileName);
                    Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                    slideShow.Image = fileName;
                }

                // Save Record
                slideExisting.Image = slideShow.Image;
                slideExisting.Description = slideShow.Description;

                SlideShowLogic.Edit(slideExisting);

                return RedirectToAction("Index");
            }
            return View(slideShow);
        }

        // GET: Admin/SlideShowManager/Delete/5
        public ActionResult Delete(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            SlideShow slideShow = SlideShowLogic.Get(id);

            if (slideShow == null)
            {
                return HttpNotFound();
            }

            return View(slideShow);
        }

        // POST: Admin/SlideShowManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SlideShowLogic.Delete(id);

            return RedirectToAction("Index");
        }
    }
}
