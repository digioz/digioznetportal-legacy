using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using DevTrends.MvcDonutCaching;
using digioz.Portal.Web.Models.ViewModels;
using digioz.Portal.Utilities;

namespace digioz.Portal.Web.Controllers
{
    public class MenuController : Controller
    {
        //
        // GET: /Menu/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TopMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            List<Menu> topMenus = db.Menus.Where(x => x.Location == "TopMenu" && x.Visible == true).OrderBy(x => x.SortOrder).ToList();

            return PartialView("TopMenu", topMenus);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 60)]
        public ActionResult PluginMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            var plugins = db.Plugins.Where(x => x.IsEnabled == true);

            return PartialView("PluginMenu", plugins);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult LeftMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            List<Menu> leftMenus = db.Menus.Where(x => x.Location == "LeftMenu" && x.Visible == true).OrderBy(x => x.SortOrder).ToList();

            return PartialView("LeftMenu", leftMenus);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult StoreMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            var plugins = db.Plugins.Where(x => x.Name == "Store" && x.IsEnabled == true).ToList();
            ViewBag.ShowStore = false;

            if (plugins.Count > 0)
            {
                ViewBag.ShowStore = true;
            }
            
            var productCategories = db.ProductCategories.ToList();

            return PartialView("StoreMenu", productCategories);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult PollMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();

            var polls = PollLogic.GetAll().Where(x => x.Featured == true);
            polls = polls.OrderByDescending(x => x.DateCreated).ToList();
            var poll = polls.Take(1).SingleOrDefault();

            Response.ContentType = "text/html";

            return PartialView("PollMenu", poll);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult TwitterMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            //Check if Twitter plugin exists and is enabled
            var plugins = db.Plugins.Where(x => x.IsEnabled == true && x.Name == "Twitter");

            if (plugins.Any())
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
                    return PartialView("TwitterMenu", twitterFeed);
                }
            }
            return null;
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 60)]
        public ActionResult WhoIsOnlineMenu()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            var configWhoIsOnline = db.Plugins.SingleOrDefault(x => x.Name == "WhoIsOnline");

            var latestVisitors = db.VisitorSessions.Where(x => x.DateModified >= DbFunctions.AddMinutes(DateTime.Now, -10)).ToList();
            var visitorRegistered = latestVisitors.Where(x => x.UserName != null).DistinctBy(x => x.UserName).ToList();

            ViewBag.VisitorCount = latestVisitors.Count();
            ViewBag.RegisteredVisitors = visitorRegistered;

            if (configWhoIsOnline == null || configWhoIsOnline.IsEnabled == false)
            {
                ViewBag.WhoIsOnlineEnabled = false;
            }
            else
            {
                ViewBag.WhoIsOnlineEnabled = true;
            }
            

            return PartialView("WhoIsOnlineMenu");
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult ZoneMenu(string zoneType)
        {
            digiozPortalEntities db = new digiozPortalEntities();
            var modules = db.Modules.Where(x => x.Location == zoneType).ToList();
            ViewBag.SelectedZone = zoneType;

            return PartialView("ZoneMenu", modules);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult SlideShow()
        {
            var slides = new List<SlideShow>();
            digiozPortalEntities db = new digiozPortalEntities();
            var plugins = db.Plugins.SingleOrDefault(x => x.IsEnabled == true &&  x.Name == "SlideShow");

            if (plugins != null)
            {
                slides = SlideShowLogic.GetAll();
            }

            return PartialView("SlideShow", slides);
        }

        public ActionResult CommentsMenu(string referenceType, string referenceId)
        {
            CommentsMenuViewModel commentVM = new CommentsMenuViewModel();
            commentVM.ReferenceId = referenceId;
            commentVM.ReferenceType = referenceType;
            commentVM.Count = 0;
            commentVM.Likes = 0;
            commentVM.CommentsEnabled = false;

            digiozPortalEntities db = new digiozPortalEntities();
            var plugins = db.Plugins.SingleOrDefault(x => x.IsEnabled == true && x.Name == "Comments");
            var configs = ConfigLogic.GetAll().Where(x => x.ConfigKey == "EnableCommentsOnAllPages");
            var enableCommentsOnAllPages = configs.Take(1).SingleOrDefault();

            if (enableCommentsOnAllPages != null && enableCommentsOnAllPages.ConfigValue == "true")
            {
                commentVM.CommentsEnabled = true;
            }
            else
            {
                var commentConfigs = CommentLogic.GetCommentConfigs().Where(x => x.ReferenceId == referenceId && x.ReferenceType == referenceType).ToList();
                if (commentConfigs.Count > 0)
                {
                    commentVM.CommentsEnabled = true;
                }
            }

            return PartialView("CommentsMenu", commentVM);
        }

        [DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 60)]
        public ActionResult RSSFeed()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            //Check if Twitter plugin exists and is enabled
            var plugins = db.Plugins.Where(x => x.IsEnabled == true && x.Name == "RSSFeed");
            var feedContent = new List<RSSViewModel>();

            if (plugins.Any())
            {
                feedContent = Helpers.Utility.GetRSSFeeds();
            }

            return PartialView("RSSFeed", feedContent);
        }

        //[DonutOutputCache(Location = System.Web.UI.OutputCacheLocation.Server, Duration = 300)]
        public ActionResult LatestPictures()
        {
            digiozPortalEntities db = new digiozPortalEntities();
            var plugins = db.Plugins.Where(x => x.IsEnabled == true && x.Name == "LatestPictures");
            var latestPictures = new List<Picture>();
            ViewBag.ShowLatestPictures = false;

            if (plugins.Any())
            {
                latestPictures = db.Pictures.Take(9).ToList();
                ViewBag.ShowLatestPictures = true;
            }

            return PartialView("LatestPictures", latestPictures);
        }
    }
}