using System.Linq;
using System.Web.Mvc;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Web.Controllers;
using digioz.Portal.Web.Areas.Forum.ViewModels;

namespace digioz.Portal.Web.Areas.Forum.Controllers
{
    public class StatsController : BaseController
    {
        private readonly ITopicService _topicService;
        private readonly IPostService _postService;

        public StatsController(ILoggingService loggingService, IUnitOfWorkManager unitOfWorkManager, IMembershipService membershipService, 
            ILocalizationService localizationService, IRoleService roleService, ISettingsService settingsService, ITopicService topicService, IPostService postService) : 
            base(loggingService, unitOfWorkManager, membershipService, localizationService, roleService, settingsService)
        {
            _topicService = topicService;
            _postService = postService;
        }

        [ChildActionOnly]
        [OutputCache(Duration = AppConstants.DefaultCacheLengthInSeconds)]
        public PartialViewResult GetMainStats()
        {
            var viewModel = new MainStatsViewModel
                                {
                                    LatestMembers = MembershipService.GetLatestUsers(10).ToDictionary(o => o.UserName,
                                                                                                      o => o.NiceUrl),
                                    MemberCount = MembershipService.MemberCount(),
                                    TopicCount = _topicService.TopicCount(),
                                    PostCount = _postService.PostCount()
                                };
            return PartialView(viewModel);
        }

    }
}
