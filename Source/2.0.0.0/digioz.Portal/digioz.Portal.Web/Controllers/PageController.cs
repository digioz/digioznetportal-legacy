using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;

namespace digioz.Portal.Web.Controllers
{
    public class PageController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        //
        // GET: /Page/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ByID(int? id)
        {
            Page loPage = PageLogic.GetAll().SingleOrDefault(x => x.ID == id);
            return View(loPage);
        }

        public ActionResult ByName(string name)
        {
            Page loPage = new Page();

            try
            {
                loPage = PageLogic.GetAll().SingleOrDefault(x => x.URL == name);
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }

            if (loPage == null)
            {
                return RedirectToAction("Index", "Home");
            }

            return View(loPage);
        }
	}
}