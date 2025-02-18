// Credit where credit is due, most of this is lifted from Funnel Web MVC
// http://www.funnelweblog.com/

using System;
using System.Linq;
using System.Web.Mvc;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Web.Application
{
    public class ForumViewEngine : IViewEngine
    {
        private RazorViewEngine _forumViewEngine;
        private readonly object _lock = new object();

        public ForumViewEngine()
        {
            _forumViewEngine = new RazorViewEngine();

            _forumViewEngine.PartialViewLocationFormats =
                new[]
                    {
                        "~/Areas/Admin/Views/Forum/{1}/{0}.cshtml",
                        "~/Areas/Admin/Views/Forum/Shared/{0}.cshtml",
                        "~/Areas/Forum/Views/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Shared/{0}.cshtml",
                        "~/Areas/Forum/Views/Shared/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Extensions/{1}/{0}.cshtml",
                        "~/Views/Extensions/{1}/{0}.cshtml"
                    }.Union(_forumViewEngine.PartialViewLocationFormats).ToArray();

            _forumViewEngine.ViewLocationFormats =
                new[]
                    {
                        "~/Areas/Admin/Views/Forum/{1}/{0}.cshtml",
                        "~/Areas/Admin/Views/Forum/Shared/{0}.cshtml",
                        "~/Areas/Forum/Views/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Extensions/{1}/{0}.cshtml",
                        "~/Views/Extensions/{1}/{0}.cshtml"
                    }.Union(_forumViewEngine.ViewLocationFormats).ToArray();

            _forumViewEngine.MasterLocationFormats =
                new[]
                    {
                        "~/Areas/Admin/Views/Forum/{1}/{0}.cshtml",
                        "~/Areas/Admin/Views/Forum/Shared/{0}.cshtml",
                        "~/Areas/Forum/Views/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Extensions/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Shared/{1}/{0}.cshtml",
                        "~/Areas/Forum/Views/Shared/{0}.cshtml",
                        "~/Views/Extensions/{1}/{0}.cshtml"
                    }.Union(_forumViewEngine.MasterLocationFormats).ToArray();

        }

        private RazorViewEngine CreateRealViewEngine()
        {
            lock (_lock)
            {
                return _forumViewEngine;
            } 
        }

        public ViewEngineResult FindPartialView(ControllerContext controllerContext, string partialViewName, bool useCache)
        {
            return CreateRealViewEngine().FindPartialView(controllerContext, partialViewName, useCache);
        }

        public ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            return CreateRealViewEngine().FindView(controllerContext, viewName, masterName, useCache);
        }

        public void ReleaseView(ControllerContext controllerContext, IView view)
        {
            CreateRealViewEngine().ReleaseView(controllerContext, view);
        }
    }
}