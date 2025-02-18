using System.Web;
using System.Web.Optimization;

namespace digioz.Portal.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery-migrate-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            // Chart.js from Chart.Mvc Nuget
            bundles.Add(new ScriptBundle("~/bundles/chart").Include(
                        "~/Scripts/Chart.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));


            bundles.Add(new StyleBundle("~/Content/forum").Include(
                    "~/Content/bootstrap.css",
                    "~/Content/Styles/theme.css",
                    "~/Content/site.css"));

            bundles.Add(new ScriptBundle("~/bundles/forum").Include(
                    "~/Scripts/jquery.placeholder.min.js",
                    "~/Scripts/jquery.unobtrusive-ajax.js",
                    "~/Scripts/general.js"));

            bundles.Add(new ScriptBundle("~/bundles/admin").Include(
                      "~/Scripts/fancybox/jquery.fancybox.js",
                      "~/Scripts/admin/admin.js"));

            bundles.Add(new ScriptBundle("~/bundles/topic").Include(
                       "~/Scripts/fancybox/jquery.fancybox.js",
                       "~/Scripts/topic.js"));

            bundles.Add(new ScriptBundle("~/bundles/tag").Include(
                       "~/Scripts/jquery.tagsinput.min.js",
                       "~/Scripts/tags.js"));

            bundles.Add(new ScriptBundle("~/bundles/leaderboard").Include(
                       "~/Scripts/leaderboard.js"));

            bundles.Add(new StyleBundle("~/Content/admin").Include(
                       "~/Content/admin/Admin.css",
                       "~/Scripts/fancybox/jquery.fancybox.css"));

            bundles.Add(new StyleBundle("~/Content/topic").Include(
                       "~/Scripts/fancybox/jquery.fancybox.css"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new StyleBundle("~/Content/jqueryuicss").Include(
                      "~/Content/themes/base/jquery-ui.css",
                      "~/Content/themes/base/jquery-ui.structure.css",
                      "~/Content/themes/base/jquery-ui.theme.css"));

        }
    }
}
