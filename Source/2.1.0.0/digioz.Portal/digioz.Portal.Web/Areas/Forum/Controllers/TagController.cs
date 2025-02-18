using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Controllers;
using digioz.Portal.Web.Areas.Forum.ViewModels;

namespace digioz.Portal.Web.Areas.Forum.Controllers
{
    public class TagController : BaseController
    {
        private readonly ITopicTagService _topicTagService;

        public TagController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService, ITopicTagService topicTagService)
            : base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _topicTagService = topicTagService;
        }

        [ChildActionOnly]
        [OutputCache(Duration = AppConstants.DefaultCacheLengthInSeconds)]
        public PartialViewResult PopularTags()
        {
            using (UnitOfWorkManager.NewUnitOfWork())
            {
                var popularTags = _topicTagService.GetPopularTags(20);
                var viewModel = new PopularTagViewModel { PopularTags = popularTags };
                return PartialView(viewModel);
            }
        }

    }
}
