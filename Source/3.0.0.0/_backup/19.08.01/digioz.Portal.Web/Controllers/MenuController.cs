using digioz.Portal.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        public ActionResult Index()
        {
            return View();
        }

		public ActionResult TopMenu()
		{
			var menuLogic = new MenuLogic();
			var menus = menuLogic.GetAll().Where(x => x.Location == "TopMenu" && x.Visible == true).OrderBy(x => x.SortOrder).ToList();

			return PartialView("TopMenu", menus);
		}

	}
}