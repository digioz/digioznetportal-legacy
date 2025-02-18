using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;

namespace digioz.Portal.Web.Controllers
{
    public class TwitterController : Controller
    {
        // GET: Twitter
        public ActionResult Index()
        {
            digiozPortalEntities db = new digiozPortalEntities();

            //Check if Twitter plugin exists and is enabled
            var plugins = db.Plugins.Where(x => x.IsEnabled == true && x.Name == "Twitter");

            if (plugins.Count() > 0)
            {
                //Check config table for twitter handle
                var configs = ConfigLogic.GetAll().Where(x => x.ConfigKey == "TwitterHandle");
                var twitterHandleConfig = configs.Take(1).SingleOrDefault();
                configs = ConfigLogic.GetAll().Where(x => x.ConfigKey == "TwitterWidgetID");

                if (twitterHandleConfig != null)
                {
                    Twitter twitterFeed = new Twitter(twitterHandleConfig.ConfigValue, true);
                    ViewBag.TwitterHandle = twitterFeed.TwitterHandle;
                    ViewBag.TwitterUser = twitterFeed.TwitterUser;
                    ViewBag.Title = "Twitter Feed";

                    return View(twitterFeed);
                }
            }

            return RedirectToAction("Index", "Home");
        }
    }
}