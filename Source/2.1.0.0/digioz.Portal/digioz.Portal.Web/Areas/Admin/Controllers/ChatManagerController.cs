using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web.Mvc;
using CsvHelper;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using digioz.Portal.Web.Models.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class ChatManagerController : Controller
    {
        private digiozPortalEntities db = new digiozPortalEntities();

        public ActionResult Index()
        {
            var chats = db.Chats.OrderByDescending(x => x.ID).ToList();
            
            return View(chats);
        }

        public ActionResult Delete(int id)
        {
            var chat = db.Chats.Find(id);

            db.Chats.Remove(chat);
            db.SaveChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Purge()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Purge(ChatExportPurgeViewModel purgeRange)
        {
            List<Chat> chats = null;

            if (purgeRange.ProcessAll)
            {
                chats = db.Chats.ToList();
            }
            else
            {
                if (!String.IsNullOrEmpty(purgeRange.StartDate) && !String.IsNullOrEmpty(purgeRange.EndDate))
                {
                    DateTime startDate = DateTime.ParseExact(purgeRange.StartDate, "MM/dd/yyyy", null);
                    DateTime endDate = DateTime.ParseExact(purgeRange.EndDate, "MM/dd/yyyy", null);

                    chats = db.Chats.Where(x => x.Timestamp <= endDate && x.Timestamp >= startDate).ToList();
                }
            }

            if (chats != null && chats.Count > 0)
            {
                db.Chats.RemoveRange(chats);
                db.SaveChanges();

                ViewBag.Status = "Success";
                ViewBag.Message = "<strong>Success!</strong> You successfully purged the chat messages.";
            }
            else
            {
                ViewBag.Status = "Failed";
                ViewBag.Message = "<strong>Oh snap!</strong> We were not able to purge the chat messages. Please make sure to either select a date range or check the \"Export All\" checkbox.";
            }

            return View();
        }

        public ActionResult Export()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Export(ChatExportPurgeViewModel exportRange)
        {
            List<Chat> chats = null;
            ChatExportViewModel chatVM = null;
            string fileName = "chats_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + "_" + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + ".csv";
            string path = AppDomain.CurrentDomain.GetData("DataDirectory").ToString() + "\\" + fileName;

            if (exportRange.ProcessAll)
            {
                chats = db.Chats.ToList();
            }
            else
            {
                if (!String.IsNullOrEmpty(exportRange.StartDate) && !String.IsNullOrEmpty(exportRange.EndDate))
                {
                    DateTime startDate = DateTime.ParseExact(exportRange.StartDate, "MM/dd/yyyy", null);
                    DateTime endDate = DateTime.ParseExact(exportRange.EndDate, "MM/dd/yyyy", null);

                    chats = db.Chats.Where(x => x.Timestamp <= endDate && x.Timestamp >= startDate).ToList();
                }
            }

            if (chats != null && chats.Count > 0)
            {
                using (TextWriter writer = System.IO.File.CreateText(path))
                {
                    using (var csv = new CsvWriter(writer))
                    {
                        csv.WriteHeader<ChatExportViewModel>();

                        foreach (var chat in chats)
                        {
                            chatVM = new ChatExportViewModel
                            {
                                ID = chat.ID,
                                Username = chat.User.UserName,
                                Timestamp = chat.Timestamp,
                                Message = chat.Message
                            };

                            csv.WriteRecord(chatVM);

                            ViewBag.Status = "Success";
                            ViewBag.Message = "<strong>Success!</strong> You successfully exported the chat messages.";
                        }
                    }
                }                
            }
            else
            {
                ViewBag.Status = "Failed";
                ViewBag.Message = "<strong>Oh snap!</strong> We were not able to export the chat messages. Please make sure to either select a date range or check the \"Export All\" checkbox.";
            }

            return View();
        }


    }
}