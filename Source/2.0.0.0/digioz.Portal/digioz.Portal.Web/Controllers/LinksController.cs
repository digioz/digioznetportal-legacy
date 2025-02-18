using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Data.Context;

namespace digioz.Portal.Web.Controllers
{
    public class LinksController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        //
        // GET: /Links/
        public ActionResult Index()
        {
            var linkcategories = db.LinkCategories.ToList();

            return View(linkcategories);
        }

        public ActionResult LinkBox(int id)
        {
            var links = db.Links.Where(x => x.LinkCategoryID == id).ToList();

            return PartialView("LinkBox", links);
        }
	}
}