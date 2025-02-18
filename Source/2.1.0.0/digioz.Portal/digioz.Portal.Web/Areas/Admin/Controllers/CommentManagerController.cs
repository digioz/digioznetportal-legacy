using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class CommentManagerController : Controller
    {
        // GET: Admin/CommentManager
        public ActionResult Index()
        {
            return View();
        }
    }
}