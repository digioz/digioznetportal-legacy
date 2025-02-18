using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.Models;
using digioz.Portal.Web.Helpers;
using Microsoft.AspNet.Identity;

namespace digioz.Portal.Web.Controllers
{
    public class PollChartsController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        // GET: Poll
        public ActionResult Index(string id)
        {
            Guid idGuid;
            bool isIdAGUID = Guid.TryParse(id, out idGuid);

            if (string.IsNullOrEmpty(id) || isIdAGUID == false)
            {
                return RedirectToAction("Index", "Home");
            }

            try
            {
                string sql = "select pa.Answer, count(pv.Id) CountOf from PollVote pv, PollAnswer pa where pa.Id = pv.PollAnswer_Id and pa.Poll_Id = @id group by pa.Answer;";

                var poll = db.Poll.SingleOrDefault(x => x.Id.ToString() == id);
                var pollResults = db.Database.SqlQuery<PollDisplayChart>(sql, new SqlParameter("@id", id)).ToList();

                if (poll == null || pollResults.Count == 0)
                {
                    return RedirectToAction("ChartNotAvailable");
                }

                ViewBag.PollTitle = poll.Slug;
                ViewBag.PollColumn = "Answer";

                return View(pollResults);
            }
            catch (Exception)
            {
               return RedirectToAction("ChartNotAvailable");
            }
        }

        public FileResult ChartNotAvailable()
        {
            var path = Server.MapPath("~/Content/images/Chart_Results_Not_Availabe.jpg");

            return new FileStreamResult(new FileStream(path, FileMode.Open), "image/jpg");
        }

    }
}