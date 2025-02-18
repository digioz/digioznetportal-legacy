using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.BLL;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Data.Context;
using digioz.Portal.Utilities;
using digioz.Portal.Web.Helpers;
using DevTrends.MvcDonutCaching;
using Omu.ValueInjecter;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = "Administrator")] 
    public class ConfigurationManagerController : Controller
    {
        // GET: /Admin/ConfigurationManager/
        public ActionResult Index()
        {
            return View(ConfigLogic.GetAll());
        }

        // GET: /Admin/ConfigurationManager/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = ConfigLogic.Get(id.GetValueOrDefault());
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // GET: /Admin/ConfigurationManager/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/ConfigurationManager/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,ConfigKey,ConfigValue,IsEncrypted")] Config config)
        {
            if (ModelState.IsValid)
            {
                ConfigLogic.Add(config);

                return RedirectToAction("Index");
            }

            return View(config);
        }

        // GET: /Admin/ConfigurationManager/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = ConfigLogic.Get(id.GetValueOrDefault());
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // POST: /Admin/ConfigurationManager/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,ConfigKey,ConfigValue,IsEncrypted")] Config config)
        {
            if (ModelState.IsValid)
            {
                var configDb = ConfigLogic.Get(config.ID);
                configDb.InjectFrom(config);

                ConfigLogic.Edit(configDb);

                return RedirectToAction("Index");
            }
            return View(config);
        }

        // GET: /Admin/ConfigurationManager/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = ConfigLogic.Get(id.GetValueOrDefault());
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // POST: /Admin/ConfigurationManager/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ConfigLogic.Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult ClearCache()
        {
            TempData["Results"] = "The Portal Cache has been cleared.";

            // Clear Menu Cache
            var cacheManager = new OutputCacheManager();
            cacheManager.RemoveItem("Menu", "TopMenu");
            cacheManager.RemoveItem("Menu", "PluginMenu");
            cacheManager.RemoveItem("Menu", "LeftMenu");
            cacheManager.RemoveItem("Menu", "StoreMenu");
            cacheManager.RemoveItem("Menu", "PollMenu");

            return RedirectToAction("Index");
        }
    }
}
