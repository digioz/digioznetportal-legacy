using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using System.Web.Razor;
using digioz.Portal.BLL;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Helpers;
using digioz.Portal.Web.Models;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class MailingListCampaignManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Admin/MailingListCampaignManager
        public ActionResult Index()
        {
            return View(db.MailingListCampaigns.ToList());
        }

        // GET: Admin/MailingListCampaignManager/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingListCampaign mailingListCampaign = db.MailingListCampaigns.Find(id);
            if (mailingListCampaign == null)
            {
                return HttpNotFound();
            }
            return View(mailingListCampaign);
        }

        // GET: Admin/MailingListCampaignManager/Create
        public ActionResult Create()
        {
            var mailingList = db.MailingLists.ToList();
            ViewBag.MailingLists = mailingList.OrderBy(x => x.Name);

            // Get list of banners
            List<MailingListImageViewModel> imageList = new List<MailingListImageViewModel>();
            String searchFolder = Server.MapPath("~/Content/Emails/uploads/Full");
            var filters = new String[] { "jpg", "jpeg", "png", "gif", "tiff", "bmp" };
            var files = Utility.GetFilesFrom(searchFolder, filters, false);

            foreach (var item in files)
            {
                MailingListImageViewModel file = new MailingListImageViewModel();
                file.Name = item;

                imageList.Add(file);
            }

            ViewBag.Banner = imageList;

            return View();
        }

        // POST: Admin/MailingListCampaignManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "ID,Name,Subject,FromName,FromEmail,Summary,Banner,Body,VisitorCount")] MailingListCampaign mailingListCampaign, FormCollection form)
        {
            var config = ConfigLogic.GetConfig();
            var mailingLists = form.GetValues("mailinglist");

            if (ModelState.IsValid && mailingLists != null)
            {
                // Save the record
                mailingListCampaign.ID = Guid.NewGuid();
                mailingListCampaign.DateCreated = DateTime.Now;

                db.MailingListCampaigns.Add(mailingListCampaign);
                db.SaveChanges();

                // Generate Email HTML based on Template
                Uri url = System.Web.HttpContext.Current.Request.Url;
                string urlLink = url.OriginalString.Replace(url.PathAndQuery, "");
                string baseUrl = String.Concat(urlLink, "/");

                string templateParsed = Helpers.Utility.GetWebContent(baseUrl + "MailingList/EmailDisplay/" + mailingListCampaign.ID);
                templateParsed = templateParsed.Trim();
                string[] stringSeparators = new string[] {"<!--"};
                var stringSeparatorsResult = templateParsed.Split(stringSeparators, StringSplitOptions.None);
                templateParsed = stringSeparatorsResult[0] + "</body></html>";
                
                // Fetch list of emails to send out
                List<string> subscriberIdListToEmail = new List<string>();

                foreach (var item in mailingLists)
                {
                    var mailingListObject = db.MailingLists.SingleOrDefault(x => x.ID.ToString() == item);

                    if (mailingListObject != null)
                    {
                        var subscribers = db.MailingListSubscriberRelations.Where(x => x.MailingListID.ToString() == mailingListObject.ID.ToString()).ToList();

                        foreach (var subscriber in subscribers)
                        {
                            if (!subscriberIdListToEmail.Contains(subscriber.MailingListSubscriberID.ToString()))
                            {
                               subscriberIdListToEmail.Add(subscriber.MailingListSubscriberID.ToString()); 
                            }
                        }
                    }

                }

                // Send the emails out
                EmailModel email = new EmailModel();
                email.FromEmail = mailingListCampaign.FromEmail;
                email.Subject = mailingListCampaign.Subject;
                email.Message = templateParsed;
                email.SMTPServer = config["SMTPServer"];

                if (!string.IsNullOrEmpty(config["SMTPPort"]))
                {
                    email.SMTPPort = Convert.ToInt32(config["SMTPPort"]);
                }

                email.SMTPUsername = config["SMTPUsername"];
                email.SMTPPassword = config["SMTPPassword"];

                foreach (var subsciber in subscriberIdListToEmail)
                {
                    var subscriberDetail = db.MailingListSubscribers.SingleOrDefault(x => x.ID.ToString() == subsciber);
                    //var mailingListDetail = db.MailingLists.SingleOrDefault(x => x.ID.ToString() == subscriberDetail.Email);

                    if (subscriberDetail != null) // && mailingListDetail != null)
                    {
                        //email.FromEmail = mailingListDetail.DefaultEmailFrom;
                        email.ToEmail = subscriberDetail.Email;

                        try
                        {
                            Helpers.Utility.SubmitMail(email);
                        }
                        catch (Exception ex)
                        {
                            Utility.AddLogEntry(ex.Message);
                        }
                    }
                }

                //string smtpType = System.Configuration.ConfigurationManager.AppSettings["SMTPType"];

                //if (smtpType == "MailGun")
                //{
                //    Helpers.Utility.SubmitMailGun(email);
                //}
                //else
                //{
                //    Helpers.Utility.SubmitMail(email);
                //}

                

                return RedirectToAction("Index");
            }

            // If it fails, populate the mailing list again
            var mailingList = db.MailingLists.ToList();
            ViewBag.MailingLists = mailingList.OrderBy(x => x.Name);

            return View(mailingListCampaign);
        }

        // GET: Admin/MailingListCampaignManager/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingListCampaign mailingListCampaign = db.MailingListCampaigns.Find(id);
            if (mailingListCampaign == null)
            {
                return HttpNotFound();
            }
            return View(mailingListCampaign);
        }

        // POST: Admin/MailingListCampaignManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Subject,FromName,FromEmail,Summary,Banner,Body,VisitorCount,DateCreated")] MailingListCampaign mailingListCampaign)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mailingListCampaign).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mailingListCampaign);
        }

        // GET: Admin/MailingListCampaignManager/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MailingListCampaign mailingListCampaign = db.MailingListCampaigns.Find(id);
            if (mailingListCampaign == null)
            {
                return HttpNotFound();
            }
            return View(mailingListCampaign);
        }

        // POST: Admin/MailingListCampaignManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            MailingListCampaign mailingListCampaign = db.MailingListCampaigns.Find(id);
            db.MailingListCampaigns.Remove(mailingListCampaign);
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
