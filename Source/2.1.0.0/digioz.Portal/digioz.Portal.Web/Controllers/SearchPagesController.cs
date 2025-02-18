using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Forum.ViewModels;
using digioz.Portal.Web.Helpers;
using digioz.Portal.Web.Models.ViewModels;

namespace digioz.Portal.Web.Controllers
{
    public class SearchPagesController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Search
        public ActionResult Index(string searchString = "")
        {
            if (searchString == "")
            {
                RedirectToAction("Index", "Home");
            }

            List<Page> searchResults = PageLogic.Search(searchString);
            List<SearchPagesViewModel> searchResultsVm = new List<SearchPagesViewModel>();

            foreach (var item in searchResults)
            {
                var searchResult = new SearchPagesViewModel
                {
                    ID = item.ID,
                    Title = item.Title
                };

                if (item.URL.Contains("/"))
                {
                    searchResult.URL = item.URL;
                }
                else
                {
                    searchResult.URL = "/page/" + item.URL;
                }

                searchResult.Body = HtmlRemoval.StripTagsRegex(item.Body).TruncateDotDotDot(200);
                searchResult.Keywords = item.Keywords;
                searchResult.Description = item.Description;

                searchResultsVm.Add(searchResult);
            }

            return View(searchResultsVm);
        }
    }
}