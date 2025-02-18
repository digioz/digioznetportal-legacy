using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.BO;
using digioz.Portal.DAL;
using digioz.Portal.Helpers;

namespace digioz.Portal.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
			// Get All Menu Records
			var menuLogic = new MenuLogic();
			var menus = menuLogic.GetAll();

			// Get specific Menu Record
			//var menu = menuLogic.Get(23);

			// Add New Menu
			//  var menuNew = new Menu()
			//  {
			//   UserID = "d1c447c1-b022-4c92-93e8-ab9aaea65224",
			//   Name = "Test 2",
			//   Location = "LeftMenu",
			//   URL = "https://www.digioz.com",
			//   Target = "_blank",
			//   Visible = true,
			//   Timestamp = DateTime.Now,
			//   SortOrder = 12
			//  };
			//menuLogic.Add(menuNew);

			// Edit Menu record
			//menu.Name = "Videos";
			//menuLogic.Edit(menu);

			// Delete Menu record
			//menuLogic.Delete(26);



			return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}