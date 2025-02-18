using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class DashboardController : Controller
    {
        //
        // GET: /Admin/Dashboard/
        public ActionResult Index()
        {
            return View();
        }
	}
}