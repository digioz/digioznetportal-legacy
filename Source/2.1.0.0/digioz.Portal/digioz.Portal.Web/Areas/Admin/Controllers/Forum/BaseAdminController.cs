﻿using System.Web.Mvc;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    /// <summary>
    /// A base class for the white site controllers
    /// </summary>
    public class BaseAdminController : Controller
    {
        protected readonly IMembershipService MembershipService;
        protected readonly ILocalizationService LocalizationService;
        protected readonly ISettingsService SettingsService;
        protected readonly IUnitOfWorkManager UnitOfWorkManager;
        protected readonly ILoggingService LoggingService;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="loggingService"> </param>
        /// <param name="unitOfWorkManager"> </param>
        /// <param name="membershipService"></param>
        /// <param name="localizationService"> </param>
        /// <param name="settingsService"> </param>
        public BaseAdminController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService, ISettingsService settingsService)
        {
            UnitOfWorkManager = unitOfWorkManager;
            MembershipService = membershipService;
            LocalizationService = localizationService;
            LocalizationService.CurrentLanguage = LocalizationService.DefaultLanguage;
            SettingsService = settingsService;
            LoggingService = loggingService;
        }

        /// <summary>
        /// Return the currently logged on user
        /// </summary>
        protected MembershipUser LoggedOnUser
        {
            get
            {
                if (User == null)
                {
                    throw new UserNotLoggedOnException();
                }

                var currentUser = MembershipService.GetUser(User.Identity.Name);
                return currentUser;
            }
        }
    }

    public class UserNotLoggedOnException : System.Exception
    {
    }
}