using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Models.ViewModels;
using System.Data.Entity;

namespace digioz.Portal.Web.Controllers
{
    public class MailingListController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: MailingList
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult EmailDisplay(Guid id)
        {
            var model = db.MailingListCampaigns.SingleOrDefault(x => x.ID == id);

            if (model == null)
            {
                model = new MailingListCampaign();
                model.Subject = string.Empty;
                model.Banner = string.Empty;
                model.Body = string.Empty;
            }

            var campaign = db.MailingListCampaigns.SingleOrDefault(x => x.ID == id);

            if (campaign != null)
            {
                campaign.VisitorCount += 1;
                db.SaveChanges();
            }

            return View(model);
        }

        public ActionResult Unsubscribe()
        {
            var subscriptionVM = new UnsubscribeViewModel();
            subscriptionVM.Unsubscribe = true;

            return View(subscriptionVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Unsubscribe([Bind(Include = "Email,Unsubscribe")]UnsubscribeViewModel model)
        {
            if (ModelState.IsValid)
            {
                // find subscription first if any
                var subscriber = db.MailingListSubscribers.SingleOrDefault(x => x.Email == model.Email);

                if (subscriber != null && model.Unsubscribe == true)
                {
                    // remove all subscriptions 
                    var subscriberRelations = db.MailingListSubscriberRelations.Where(x => x.MailingListSubscriberID == subscriber.ID).ToList();
                    db.MailingListSubscriberRelations.RemoveRange(subscriberRelations);
                    db.SaveChanges();

                    db.MailingListSubscribers.Remove(subscriber);
                    db.SaveChanges();
                }
            }

            return RedirectToAction("UnsubscribeConfirmaiton");
        }

        public ActionResult UnsubscribeConfirmaiton()
        {
            return View();
        }
    }
}