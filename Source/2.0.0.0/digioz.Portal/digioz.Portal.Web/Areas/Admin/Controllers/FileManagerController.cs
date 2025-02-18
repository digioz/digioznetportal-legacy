using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

using digioz.Portal.Web.Areas.Admin.Models.FileManager;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class FileManagerController : Controller
    {
        //
        // GET: /Admin/FileManager/
        public ActionResult Index()
        {
            Configuration.Init(HttpContext);

            return View();
        }


	}
}