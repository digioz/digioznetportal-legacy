using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Helpers;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class MailingListImageManagerController : Controller
    {
        // GET: Admin/MailingListImageManager
        public ActionResult Index()
        {
            List<MailingListImageViewModel> imageList = new List<MailingListImageViewModel>();
            String searchFolder = Server.MapPath("~/Content/Emails/uploads/Full");
            var filters = new String[] {"jpg", "jpeg", "png", "gif", "tiff", "bmp"};
            var files = Utility.GetFilesFrom(searchFolder, filters, false);

            foreach (var item in files)
            {
                MailingListImageViewModel file = new MailingListImageViewModel();
                file.Name = item;

                imageList.Add(file);
            }

            return View(imageList);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase file)
        {
            if (file == null)
            {
                return RedirectToAction("Create");
            }

            if (file.ContentLength > 0 && Utility.IsFileAnImage(file.FileName))
            {
                Guid guidName = Guid.NewGuid();
                var fileName = guidName.ToString() + Path.GetExtension(file.FileName);

                // Save Original Image
                var pathFull = Path.Combine(Server.MapPath("~/Content/Emails/uploads/Full"), fileName);
                Utility.SaveImageWithResize(Image.FromStream(file.InputStream), 600, 1000, pathFull);
                //file.SaveAs(pathFull);

                // Save Thumbnail Image
                var pathThumb = Path.Combine(Server.MapPath("~/Content/Emails/uploads/Thumb"), fileName);
                Utility.SaveImageWithCrop(Image.FromStream(file.InputStream), 120, 120, pathThumb);

                return RedirectToAction(("Index"));
            }

            return View();
        }

        public ActionResult Delete(string fileName)
        {
            if (fileName != null)
            {
                var pathFull = Path.Combine(Server.MapPath("~/Content/Emails/uploads/Full"), fileName);
                var pathThumb = Path.Combine(Server.MapPath("~/Content/Emails/uploads/Thumb"), fileName);

                try
                {
                    if (System.IO.File.Exists(pathFull))
                    {
                        System.IO.File.Delete(pathFull);
                    }
                    if (System.IO.File.Exists(pathThumb))
                    {
                        System.IO.File.Delete(pathThumb);
                    }
                }
                catch (Exception ex)
                {
                    string logEntry = "Error: " + ex.Message + Environment.NewLine + "Stack Trace: " + ex.StackTrace;
                    Utility.AddLogEntry(logEntry);
                }
            }

            return RedirectToAction(("Index"));
        }
    }
}