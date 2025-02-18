using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;

namespace digioz.Portal.Web.Areas.Admin.Controllers
{
    [Authorize(Roles = AppConstants.AdminRoleName)]
    public class ForumManagerController : BaseAdminController
    {

        public ForumManagerController(ILoggingService loggingService, 
            IUnitOfWorkManager unitOfWorkManager, 
            IMembershipService membershipService, 
            ILocalizationService localizationService, 
            ISettingsService settingsService) 
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, settingsService)
        {
        }

        /// <summary>
        /// Default page for the admin area
        /// </summary>
        /// <returns></returns>
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

    }
}
