using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CommentConfigManagerController : Controller
    {
        private List<SelectListItem> GetReferenceTypeList()
        {
            List<SelectListItem> referenceTypeList = new List<SelectListItem>();
            referenceTypeList.Add(new SelectListItem() { Text = "Page", Value = "Page" });
            referenceTypeList.Add(new SelectListItem() { Text = "Announcement", Value = "Announcement" });

            return referenceTypeList;
        }

        // GET: Admin/CommentConfigManager
        public ActionResult Index()
        {
            var commentConfigs = CommentLogic.GetCommentConfigs();

            return View(commentConfigs);
        }

        public ActionResult Create()
        {
            ViewBag.ReferenceTypes = GetReferenceTypeList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EnableCommentsViewModel model)
        {
            if (string.IsNullOrEmpty(model.EnableReference) || string.IsNullOrEmpty(model.ReferenceTypes))
            {
                ModelState.AddModelError("Error", "Please select a Reference Type and Value");
            }

            if (ModelState.IsValid)
            {
                // Populate Object from View Model
                CommentConfig commentConfig = new CommentConfig();
                commentConfig.Id = Guid.NewGuid().ToString();
                commentConfig.ReferenceId = model.EnableReference;
                commentConfig.ReferenceType = model.ReferenceTypes;
                commentConfig.Visible = model.Visible;
                commentConfig.Timestamp = DateTime.Now;

                if (model.ReferenceTypes == "Page")
                {
                    commentConfig.ReferenceTitle = PageLogic.Get(Convert.ToInt32(model.EnableReference)).Title;
                }
                else if (model.ReferenceTypes == "Announcement")
                {
                    commentConfig.ReferenceTitle = AnnouncementLogic.Get(Convert.ToInt32(model.EnableReference)).Title;
                }

                CommentLogic.CommentConfigAdd(commentConfig);

                return RedirectToAction("Index");
            }

            ViewBag.ReferenceTypes = GetReferenceTypeList();

            return View();
        }

        public ActionResult Edit(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return RedirectToAction("Index");
            }

            var commentConfig = CommentLogic.GetCommentConfig(id);
            var commentConfigVM = new EnableCommentsViewModel
            {
                Id = commentConfig.Id,
                EnableReference = commentConfig.ReferenceId,
                ReferenceTypes = commentConfig.ReferenceType,
                Visible = commentConfig.Visible
            };

            ViewBag.ReferenceTypes = GetReferenceTypeList();

            return View(commentConfigVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(EnableCommentsViewModel model)
        {
            if (string.IsNullOrEmpty(model.EnableReference) || string.IsNullOrEmpty(model.ReferenceTypes))
            {
                ModelState.AddModelError("Error", "Please select a Reference Type and Value");
            }

            if (ModelState.IsValid)
            {
                // Populate Object from View Model
                var commentConfig = CommentLogic.GetCommentConfig(model.Id);
                commentConfig.ReferenceId = model.EnableReference;
                commentConfig.ReferenceType = model.ReferenceTypes;
                commentConfig.Visible = model.Visible;
                commentConfig.Timestamp = DateTime.Now;

                if (model.ReferenceTypes == "Page")
                {
                    commentConfig.ReferenceTitle = PageLogic.Get(Convert.ToInt32(model.EnableReference)).Title;
                }
                else if (model.ReferenceTypes == "Announcement")
                {
                    commentConfig.ReferenceTitle = AnnouncementLogic.Get(Convert.ToInt32(model.EnableReference)).Title;
                }

                CommentLogic.CommentConfigEdit(commentConfig);

                return RedirectToAction("Index");
            }

            ViewBag.ReferenceTypes = GetReferenceTypeList();

            return View(model);
        }

        public ActionResult GetEnableReferences(string referenceType)
        {
            List<SelectListItem> referenceTypeListItems = new List<SelectListItem>();

            if (referenceType == "Page")
            {
                var pages = PageLogic.GetAll();

                foreach (var item in pages)
                {
                    referenceTypeListItems.Add(new SelectListItem() { Text = item.Title, Value = item.ID.ToString() });
                }

                ViewBag.EnableReference = referenceTypeListItems;
            }
            else if (referenceType == "Announcement")
            {
                var announcements = AnnouncementLogic.GetAll();

                foreach (var item in announcements)
                {
                    referenceTypeListItems.Add(new SelectListItem() { Text = item.Title, Value = item.ID.ToString() });
                }

                ViewBag.EnableReference = referenceTypeListItems;
            }

            return Json(referenceTypeListItems, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            // Fetch Info
            var commentConfig = CommentLogic.GetCommentConfig(id);
            var commentConfigVM = new EnableCommentsViewModel
            {
                Id = commentConfig.Id,
                EnableReference = commentConfig.ReferenceId,
                ReferenceTypes = commentConfig.ReferenceType,
                Visible = commentConfig.Visible
            };

            if (commentConfig == null)
            {
                return RedirectToAction("Index");
            }

            return View(commentConfigVM);
        }

        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            // Fetch Record
            var commentConfig = CommentLogic.GetCommentConfig(id);
            var commentConfigVM = new EnableCommentsViewModel
            {
                Id = commentConfig.Id,
                EnableReference = commentConfig.ReferenceId,
                ReferenceTypes = commentConfig.ReferenceType,
                Visible = commentConfig.Visible
            };

            if (commentConfig == null)
            {
                return RedirectToAction("Index");
            }

            return View(commentConfigVM);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            CommentLogic.Delete(id);

            return RedirectToAction("Index");
        }
    }
}