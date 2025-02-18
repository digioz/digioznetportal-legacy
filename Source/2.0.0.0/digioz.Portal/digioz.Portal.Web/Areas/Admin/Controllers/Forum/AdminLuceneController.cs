﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    public class AdminLuceneController : Controller
    {
        private readonly ILuceneService _luceneService;

        public AdminLuceneController(ILuceneService luceneService)
        {
            _luceneService = luceneService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Update()
        {
            // Set the timeout quite large just in case this takes a while
            Server.ScriptTimeout = 600;

            _luceneService.UpdateIndex();

            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
            {
                Message = "Index Updated",
                MessageType = GenericMessages.success
            };

            return View("Index");
        }

        public ActionResult Optimise()
        {
            // Set the timeout quite large just in case this takes a while
            Server.ScriptTimeout = 600;

            _luceneService.OptimiseIndex();

            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
            {
                Message = "Index Optimised",
                MessageType = GenericMessages.success
            };

            return View("Index");
        }

        public ActionResult Delete()
        {
            // Set the timeout quite large just in case this takes a while
            Server.ScriptTimeout = 600;

            _luceneService.DeleteEntireIndex();

            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
            {
                Message = "Index Deleted",
                MessageType = GenericMessages.success
            };

            return View("Index");
        }

    }
}
