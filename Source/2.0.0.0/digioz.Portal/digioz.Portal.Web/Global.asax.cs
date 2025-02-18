using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Globalization;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Data.Context;

using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Application;
using digioz.Portal.Web.Helpers;
namespace digioz.Portal.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        public IUnitOfWorkManager UnitOfWorkManager
        {
            get { return DependencyResolver.Current.GetService<IUnitOfWorkManager>(); }
        }

        public IBadgeService BadgeService
        {
            get { return DependencyResolver.Current.GetService<IBadgeService>(); }
        }

        public ISettingsService SettingsService
        {
            get { return DependencyResolver.Current.GetService<ISettingsService>(); }
        }

        public ILoggingService LoggingService
        {
            get { return DependencyResolver.Current.GetService<ILoggingService>(); }
        }

        protected void Application_Start()
        {
            using (digiozPortalEntities TestContext = new digiozPortalEntities())
            {
                TestContext.MembershipUser.Count();
            }
            IocConfig.RegisterComponents();
            AreaRegistration.RegisterAllAreas();

            // Web API Registration
            GlobalConfiguration.Configure(WebApiConfig.Register);

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            // If the same carry on as normal
            LoggingService.Initialise(ConfigUtils.GetAppSettingInt32("LogFileMaxSizeBytes", 10000));
            LoggingService.Error("START APP");

            // Set the view engine
            ViewEngines.Engines.Clear();
            ViewEngines.Engines.Add(new ForumViewEngine());

            // Do the badge processing
            using (var unitOfWork = UnitOfWorkManager.NewUnitOfWork())
            {
                try
                {
                    BadgeService.SyncBadges();
                    unitOfWork.Commit();
                }
                catch (Exception ex)
                {
                    LoggingService.Error(string.Format("Error processing badge classes: {0}", ex.Message));
                }
            }
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            //It's important to check whether session object is ready
            if (HttpContext.Current.Session != null)
            {
                var ci = (CultureInfo)Session["Culture"];
                //Checking first if there is no value in session 
                //and set default language 
                //this can happen for first user's request
                if (ci == null)
                {
                    using (UnitOfWorkManager.NewUnitOfWork())
                    {
                        ci = new CultureInfo(SettingsService.GetSettings().DefaultLanguage.LanguageCulture);
                        Session["Culture"] = ci;
                    }
                }
                //Finally setting culture for each request
                Thread.CurrentThread.CurrentUICulture = ci;
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(ci.Name);
            }

            // Log Session Table
            try
            {
                if (!string.IsNullOrEmpty(Request.UserHostAddress.ToString()) && HttpContext.Current.Session != null)
                {
                    string ipAddress = Request.UserHostAddress.ToString();
                    string pageUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                    string sessionId = HttpContext.Current.Session.SessionID; ;
                    string userName = HttpContext.Current.User.Identity.Name;

                    Helpers.Utility.WriteVisitorSession(sessionId, pageUrl, userName, ipAddress);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Set Site Title
            try
            {
                if (HttpContext.Current.Session["SiteConfigKeys"] == null)
                {
                    var siteConfigKeys = ConfigLogic.GetConfig();
                    HttpContext.Current.Session["SiteName"] = siteConfigKeys["SiteName"];

                    // Purge expired sessions if needed
                    VisitorSessionLogic.PurgeVisitorSessions();
                }
            }
            catch
            {
                HttpContext.Current.Session["SiteName"] = "DigiOz .NET Portal";
            }

            // Write Visitor Log
            try
            {
                if (Request.UserHostAddress != null)
                {
                        GetVisitorInformation(Request.UserHostAddress.ToString(), 
                        Request.Browser, 
                        Request.ServerVariables["HTTP_USER_AGENT"], 
                        Request.ServerVariables["HTTP_REFERER"], 
                        Request.Headers["Accept-Language"], 
                        HttpContext.Current.Request.UserLanguages, 
                        HttpContext.Current.Request.Url.AbsolutePath);
                }
            }
            catch
            {
                // Ignore
            }
            
        }

        private void GetVisitorInformation(string ip, HttpBrowserCapabilities browser, string browserUserAgent, string referringUrl, string language, string[] languages, string pageUrl)
        {
            Task.Run(() =>
            {
                Utility.GetVisitorInfo(ip, browser, browserUserAgent, referringUrl, language, languages, pageUrl);
            });
        }
    }
}
