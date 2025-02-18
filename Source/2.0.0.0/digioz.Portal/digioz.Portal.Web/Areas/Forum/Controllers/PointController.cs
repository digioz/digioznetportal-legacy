using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Controllers;
using digioz.Portal.Web.Areas.Forum.ViewModels;

namespace digioz.Portal.Web.Areas.Forum.Controllers
{
    public class PointController : BaseController
    {
        private readonly IMembershipUserPointsService _membershipUserPointsService;

        public PointController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, 
            ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService,
            IMembershipUserPointsService membershipUserPointsService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _membershipUserPointsService = membershipUserPointsService;
        }

        [ChildActionOnly]
        [OutputCache(Duration = AppConstants.DefaultCacheLengthInSeconds)]
        public PartialViewResult CurrentWeekHighPointUsers()
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var highEarners = _membershipUserPointsService.GetCurrentWeeksPoints(20);
                var viewModel = new HighEarnersPointViewModel { HighEarners = highEarners };
                return PartialView(viewModel);
            }
        }
    }
}
