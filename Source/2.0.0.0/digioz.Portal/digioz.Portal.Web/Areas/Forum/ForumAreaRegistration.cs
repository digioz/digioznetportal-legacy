using System.Web.Mvc;

using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Application;

namespace digioz.Portal.Web.Areas.Forum
{
    public class ForumAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Forum";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
              "Forum_categoryUrls", // Route name
               string.Concat(AppConstants.CategoryUrlIdentifier, "/{slug}"), // URL with parameters
             new { controller = "Category", action = "Show", slug = UrlParameter.Optional } // Parameter defaults
         );

            context.MapRoute(
               "Forum_categoryRssUrls", // Route name
                string.Concat(AppConstants.CategoryUrlIdentifier, "/rss/{slug}"), // URL with parameters
                new { controller = "Category", action = "CategoryRss", slug = UrlParameter.Optional } // Parameter defaults
            );

            context.MapRoute(
               "Forum_topicUrls", // Route name
                string.Concat(AppConstants.TopicUrlIdentifier, "/{slug}"), // URL with parameters
                new { controller = "Topic", action = "Show", slug = UrlParameter.Optional } // Parameter defaults
            );

            context.MapRoute(
               "Forum_memberUrls", // Route name
                string.Concat(AppConstants.MemberUrlIdentifier, "/{slug}"), // URL with parameters
                new { controller = "Members", action = "GetByName", slug = UrlParameter.Optional } // Parameter defaults
            );

            context.MapRoute(
              "Forum_tagUrls", // Route name
               string.Concat(AppConstants.TagsUrlIdentifier, "/{tag}"), // URL with parameters
               new { controller = "Topic", action = "TopicsByTag", tag = UrlParameter.Optional } // Parameter defaults
            );

            context.MapRoute(
                "Forum_default",
                "Forum/{controller}/{action}/{id}",
                new { controller = "ForumHome", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
