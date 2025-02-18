using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Web.Helpers;
using digioz.Portal.Web.Models;

namespace digioz.Portal.Web.Controllers
{
    public class HomeController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        public ActionResult Index()
        {
            HomeIndexViewModel model = new HomeIndexViewModel();
            model.Page = PageLogic.GetAll().SingleOrDefault(x => x.URL == "/Home/Index" && x.Visible == true);
            int numberOfAnnouncements = 1;
            var configs = ConfigLogic.GetAll().Where(x => x.ConfigKey == "NumberOfAnnouncements");
            if (configs != null)
            {
                numberOfAnnouncements = int.Parse(configs.Take(1).SingleOrDefault().ConfigValue);
            }

            model.Announcements = AnnouncementLogic.GetAll().OrderByDescending(x => x.ID).Where(x => x.Visible == true).Take(numberOfAnnouncements).ToList();
            return View(model);
        }

        public ActionResult About()
        {
            Page page = PageLogic.GetAll().SingleOrDefault(x => x.URL == "/Home/About" && x.Visible == true);
            return View(page);
        }

        public ActionResult Contact()
        {
            ViewBag.ShowContactForm = false;

            var configs = ConfigLogic.GetAll().Where(x => x.ConfigKey == "ShowContactForm");

            if (configs.Any())
            {
                var singleOrDefault = configs.Take(1).SingleOrDefault();

                if (singleOrDefault != null)
                {
                    var showContactForm = singleOrDefault.ConfigValue;

                    if (showContactForm == "true")
                    {
                        ViewBag.ShowContactForm = true;
                    }
                }
            }

            Page page = PageLogic.GetAll().SingleOrDefault(x => x.URL == "/Home/Contact" && x.Visible == true);
            return View(page);
        }

        public ActionResult ContactUs()
        {
            return PartialView("ContactUs");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ContactUs(ContactUsViewModel contactVm)
        {
            var config = ConfigLogic.GetConfig();

            // Send the emails out
            EmailModel email = new EmailModel();
            email.FromEmail = contactVm.Email;
            email.ToEmail = config["WebmasterEmail"];
            email.Subject = contactVm.Subject;
            email.Message = contactVm.Message;
            email.SMTPServer = config["SMTPServer"];

            if (!string.IsNullOrEmpty(config["SMTPPort"]))
            {
                email.SMTPPort = Convert.ToInt32(config["SMTPPort"]);
            }

            email.SMTPUsername = config["SMTPUsername"];
            email.SMTPPassword = config["SMTPPassword"];

            // Log the message
            Utility.AddLogEntry("Message: " + contactVm.ToXml());
            Helpers.Utility.SubmitMail(email);

            return PartialView("ContactUsConfirmation");
        }

        public ActionResult Announcements()
        {
            var announcements = AnnouncementLogic.GetAll().OrderByDescending(x => x.ID).Where(x => x.Visible == true).ToList();
            return View(announcements);
        }

        public ActionResult ContactUsConfirmation()
        {
            throw new NotImplementedException();
        }
    }
}