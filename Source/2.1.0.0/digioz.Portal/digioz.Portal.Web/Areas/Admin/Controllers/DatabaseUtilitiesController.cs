using digioz.Portal.Web.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Web.Helpers;
using digioz.Portal.Web.Areas.Admin.ViewModels;
using System.Reflection;
using digioz.Portal.BLL;
using System.Collections;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class DatabaseUtilitiesController : Controller
    {
        //
        // GET: /Admin/DatabaseUtilities/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Backup()
        {
            // get database list
            List<string> databases = Helpers.Utility.GetDatabases();

            DatabaseBackupViewModel loDBVM = new DatabaseBackupViewModel();

            foreach (string item in databases)
            {
                loDBVM.Databases.Add(new SelectListItem { Text = item, Value = item });
            }

            return View(loDBVM);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Backup(DatabaseBackupViewModel databaseVM)
        {
            if (ModelState.IsValid)
            {
                List<string> databases = Helpers.Utility.GetDatabases();

                foreach (string item in databases)
                {
                    databaseVM.Databases.Add(new SelectListItem { Text = item, Value = item });
                }

                string path = HttpContext.Server.MapPath("~/Content");
                string sql = "BACKUP DATABASE " + databaseVM.DatabaseName + " TO DISK = '" + path + "\\Backup\\" + databaseVM.DatabaseName + Helpers.Utility.GetCurrentTimestamp() + ".bak" + "' WITH FORMAT, MEDIANAME = 'Z_SQLServerBackups', NAME = 'Full Backup of " + databaseVM.DatabaseName + "';";

                if (Helpers.Utility.ExecuteDBCommand(sql))
                {
                    TempData["Success"] = "Database backup was completed successfully.";
                }
                else
                {
                    TempData["Error"] = "Unable to backup the database selected. Please contact the Webmaster.";
                }
            }

            return View(databaseVM);
        }

        public ActionResult Restore()
        {
            return View();
        }

        public ActionResult Query()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Query(DatabaseQueryViewModel dbqvm)
        {
            if (dbqvm.QueryString.ToUpper().Contains("SELECT"))
            {
                MSSQL dbADONet = new MSSQL();

                dbADONet.openConnection();
                dbqvm.DataTable = dbADONet.QueryDBDataset(dbqvm.QueryString);
                dbADONet.closeConnection();
            }

            return View(dbqvm);
        }

        public ActionResult Execute()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Execute(DatabaseQueryViewModel dbqvm)
        {
            digiozPortalEntities db = new digiozPortalEntities();

            if (dbqvm.QueryString.ToUpper().Contains("INSERT") || dbqvm.QueryString.ToUpper().Contains("UPDATE") ||
                     dbqvm.QueryString.ToUpper().Contains("DELETE") || dbqvm.QueryString.ToUpper().Contains("EXEC"))
            {
                db.Database.ExecuteSqlCommand(dbqvm.QueryString);
            }

            ViewBag.Message = "Query Processed Successfully!";

            return View(dbqvm);
        }

        public ActionResult BackupToXML()
        {
            BackupToXMLViewModel classesVM = new BackupToXMLViewModel();
            classesVM.ListOfTables = DBLogic.GetTables();

            return View(classesVM);
        }

        [HttpPost]
        public ActionResult BackupToXML(BackupToXMLViewModel backup)
        {
            // Call backup function
            BackupHelper.BackupDatabaseToXml(backup);

            return RedirectToAction("Index");
        }

        public ActionResult RestoreFromXML()
        {
            var appDataFolderPath = AppDomain.CurrentDomain.GetData("DataDirectory").ToString();
            var restoreDirs = Utility.GetFoldersInDirectory(appDataFolderPath, "ExportData");

            var restore = new RestoreFromXMLViewModel() { RestoreFolders = restoreDirs };

            return View(restore);
        }

        [HttpPost]
        public ActionResult RestoreFromXML(RestoreFromXMLViewModel model)
        {
            var appDataFolderPath = AppDomain.CurrentDomain.GetData("DataDirectory").ToString();
            var restoreDirs = Utility.GetFoldersInDirectory(appDataFolderPath, "ExportData");

            if (model.RestoreFolders != null)
            {
                string selectedRestoreFolder = model.RestoreFolders.SingleOrDefault();

                return RedirectToAction("RestoreFromTables", new { selectedFolder = selectedRestoreFolder });
            }
            else
            {
                ModelState.AddModelError(string.Empty, "You did not select a Restore Data Folder. Please go back and select one.");
            }

            var restore = new RestoreFromXMLViewModel() { RestoreFolders = restoreDirs };

            return View(restore);
        }

        public ActionResult RestoreFromTables(string selectedFolder)
        {
            var filters = new String[] { "xml" };
            var appDataFolderPath = AppDomain.CurrentDomain.GetData("DataDirectory").ToString();
            var listOfTables = Utility.GetFilesFrom(appDataFolderPath + "\\" + selectedFolder, filters, false);

            RestoreFromXMLViewModel restore = new RestoreFromXMLViewModel
            {
                ListOfTables = listOfTables,
                SelectedFolder = selectedFolder
            };
         
            return View(restore);
        }

        [HttpPost]
        public ActionResult RestoreFromTables(RestoreFromXMLViewModel model)
        {
            BackupHelper.RestoreDatabaseFromXml(model);

            return RedirectToAction("Index");
        }
    }
}