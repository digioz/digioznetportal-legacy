using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Extensions
{
    public static class HtmlHelperExtensions
    {
        public static MvcHtmlString ActionImage(this HtmlHelper html, string actionName, object routeValues, string imagePath, object imageAttributes = null, object linkAttributes = null)
        {
            var url = new UrlHelper(html.ViewContext.RequestContext);

            // build the <img> tag
            var imgBuilder = new TagBuilder("img");
            imgBuilder.MergeAttribute("src", url.Content(imagePath));
            imgBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(imageAttributes));
            string imgHtml = imgBuilder.ToString(TagRenderMode.SelfClosing);

            // build the <a> tag
            var anchorBuilder = new TagBuilder("a");
            anchorBuilder.MergeAttribute("href", url.Action(actionName, routeValues));
            anchorBuilder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(linkAttributes));
            anchorBuilder.InnerHtml = imgHtml; // include the <img> tag inside
            string anchorHtml = anchorBuilder.ToString(TagRenderMode.Normal);

            return MvcHtmlString.Create(anchorHtml);
        }

    }
}