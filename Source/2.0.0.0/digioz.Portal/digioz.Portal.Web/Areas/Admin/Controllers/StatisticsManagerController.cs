using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Web.Mvc;
using CsvHelper;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.Models;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Models.ViewModels;
using Microsoft.Ajax.Utilities;
using Chart.Mvc.ComplexChart;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class StatisticsManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        public ActionResult Index()
        {
            var visitorInfos = db.VisitorInfos.OrderByDescending(x => x.ID).ToList();
            //Generate ViewBag which will be used in partial for bar chart
            var visitorInfo = db.Database.SqlQuery<VisitorCountryChart>("select distinct country, cast(count(country) as float) as CountOf from VisitorInfo group by country").ToList();
            ViewBag.CountryList = visitorInfo.Select(x => x.Country).ToArray();
            ViewBag.CountOfList = visitorInfo.Select(x => x.CountOf).ToList<double>();            
            return View(visitorInfos);
        }

        public ActionResult Details(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            VisitorInfo visitorInfo = db.VisitorInfos.Find(id);

            if (visitorInfo == null)
            {
                return HttpNotFound();
            }

            return View(visitorInfo);
        }

        public ActionResult Delete(int id)
        {
            var visitorInfo = db.VisitorInfos.Find(id);

            db.VisitorInfos.Remove(visitorInfo);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult VisitorCountryChart()
        {
            var visitorInfo = db.Database.SqlQuery<VisitorCountryChart>("select distinct country, count(country) as CountOf from VisitorInfo group by country").ToList();
            return View(visitorInfo);
        }

        public ActionResult Purge()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Purge(VisitorInfoExportPurgeViewModel purgeRange)
        {
            List<VisitorInfo> visitorInfos = null;

            if (purgeRange.ProcessAll)
            {
                visitorInfos = db.VisitorInfos.ToList();
            }
            else
            {
                if (!String.IsNullOrEmpty(purgeRange.StartDate) && !String.IsNullOrEmpty(purgeRange.EndDate))
                {
                    DateTime startDate = DateTime.ParseExact(purgeRange.StartDate, "MM/dd/yyyy", null);
                    DateTime endDate = DateTime.ParseExact(purgeRange.EndDate, "MM/dd/yyyy", null);

                    visitorInfos = db.VisitorInfos.Where(x => x.Timestamp <= endDate && x.Timestamp >= startDate).ToList();
                }
            }

            if (visitorInfos != null && visitorInfos.Count > 0)
            {
                db.VisitorInfos.RemoveRange(visitorInfos);
                db.SaveChanges();

                ViewBag.Status = "Success";
                ViewBag.Message = "<strong>Success!</strong> You successfully purged the Visitor Info Log Entries.";
            }
            else
            {
                ViewBag.Status = "Failed";
                ViewBag.Message = "<strong>Oh snap!</strong> We were not able to purge the Visitor Info Log Entries. Please make sure to either select a date range or check the \"Export All\" checkbox.";
            }

            return View();
        }

        public ActionResult Export()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Export(VisitorInfoExportPurgeViewModel exportRange)
        {
            List<VisitorInfo> visitorInfos = null;
            string fileName = "visitorinfo_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + "_" + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + ".csv";
            string path = AppDomain.CurrentDomain.GetData("DataDirectory").ToString() + "\\" + fileName;

            if (exportRange.ProcessAll)
            {
                visitorInfos = db.VisitorInfos.ToList();
            }
            else
            {
                if (!String.IsNullOrEmpty(exportRange.StartDate) && !String.IsNullOrEmpty(exportRange.EndDate))
                {
                    DateTime startDate = DateTime.ParseExact(exportRange.StartDate, "MM/dd/yyyy", null);
                    DateTime endDate = DateTime.ParseExact(exportRange.EndDate, "MM/dd/yyyy", null);

                    visitorInfos = db.VisitorInfos.Where(x => x.Timestamp <= endDate && x.Timestamp >= startDate).ToList();
                }
            }

            if (visitorInfos != null && visitorInfos.Count > 0)
            {
                using (TextWriter writer = System.IO.File.CreateText(path))
                {
                    using (var csv = new CsvWriter(writer))
                    {
                        csv.WriteHeader<VisitorInfo>();

                        foreach (var item in visitorInfos)
                        {
                            csv.WriteRecord(item);

                            ViewBag.Status = "Success";
                            ViewBag.Message = "<strong>Success!</strong> You successfully exported the Visitor Info Log.";
                        }
                    }
                }
            }
            else
            {
                ViewBag.Status = "Failed";
                ViewBag.Message = "<strong>Oh snap!</strong> We were not able to export the Visitor Info Log. Please make sure to either select a date range or check the \"Export All\" checkbox.";
            }

            return View();
        }
    }
}

