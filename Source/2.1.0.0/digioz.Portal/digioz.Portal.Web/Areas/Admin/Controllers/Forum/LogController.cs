﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = AppConstants.AdminRoleName)]
    public class LogController : BaseAdminController
    {
        public LogController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService, ISettingsService settingsService) :
            base(loggingService, unitOfWorkManager, membershipService, localizationService, settingsService)
        {

        }

        public ActionResult Index()
        {
            IList<LogEntry> logs = new List<LogEntry>();

            try
            {
                logs = LoggingService.ListLogFile(); 
            }
            catch (Exception ex)
            {
                var err = string.Format("Unable to access logs: {0}", ex.Message);
                TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
                {
                    Message = err,
                    MessageType = GenericMessages.error
                };

                LoggingService.Error(err);
            }
                       
            return View(new ListLogViewModel{LogFiles = logs});
        }

        public ActionResult ClearLog()
        {
            LoggingService.ClearLogFiles();

            TempData[AppConstants.MessageViewBagName] = new GenericMessageViewModel
            {
                Message = "Log File Cleared",
                MessageType = GenericMessages.success
            };
            return RedirectToAction("Index");
        }

    }
}
