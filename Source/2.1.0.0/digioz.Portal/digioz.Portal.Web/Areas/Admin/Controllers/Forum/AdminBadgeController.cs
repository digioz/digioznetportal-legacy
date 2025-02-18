﻿using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Areas.Admin.ViewModels;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = AppConstants.AdminRoleName)]
    public class AdminBadgeController : BaseAdminController
    {
        private readonly IBadgeService _badgeService;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="unitOfWorkManager"> </param>
        /// <param name="membershipService"> </param>
        /// <param name="localizationService"></param>
        /// <param name="settingsService"> </param>
        /// <param name="badgeService"> </param>
        /// <param name="loggingService"> </param>
        public AdminBadgeController(IBadgeService badgeService, ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, 
            IMembershipService membershipService, ILocalizationService localizationService, ISettingsService settingsService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, settingsService)
        {
            _badgeService = badgeService;
        }

        /// <summary>
        /// We get here via the admin default layout (_AdminLayout). The returned view is displayed by
        /// the @RenderBody in that layout
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(int? p, string search)
        {
            var pageIndex = p ?? 1;

            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var allBadges = string.IsNullOrEmpty(search) ? _badgeService.GetPagedGroupedBadges(pageIndex, AppConstants.AdminListPageSize) :
                            _badgeService.SearchPagedGroupedTags(search, pageIndex, AppConstants.AdminListPageSize);

                var badgesListModel = new ListBadgesViewModel
                {
                    Badges = allBadges,
                    PageIndex = pageIndex,
                    TotalCount = allBadges.TotalCount,
                    Search = search
                };

                return View(badgesListModel);
            }

        }

        public ActionResult Manage(int? p, string search)
        {
            return RedirectToAction("Index", new { p, search });
        }
    }
}
