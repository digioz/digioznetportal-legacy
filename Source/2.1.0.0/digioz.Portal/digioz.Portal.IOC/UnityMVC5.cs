using System.Web.Mvc;
using digioz.Portal.Data.Context;
using digioz.Portal.Data.Repositories;
using digioz.Portal.Data.UnitOfWork;
using digioz.Portal.Domain;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Domain.Interfaces.UnitOfWork;
using digioz.Portal.Services;
using Microsoft.Practices.Unity;
using Unity.Mvc5;

namespace digioz.Portal.IOC
{
    // http://weblogs.asp.net/shijuvarghese/archive/2010/05/07/dependency-injection-in-asp-net-mvc-nerddinner-app-using-unity-2-0.aspx


    /// <summary>
    /// Bind the given interface in request scope
    /// </summary>
    public static class IOCExtensions
    {
        public static void BindInRequestScope<T1, T2>(this IUnityContainer container) where T2 : T1
        {
            container.RegisterType<T1, T2>(new HierarchicalLifetimeManager());
        }

        public static void BindInSingletonScope<T1, T2>(this IUnityContainer container) where T2 : T1
        {
            container.RegisterType<T1, T2>(new ContainerControlledLifetimeManager());
        }
    }

    /// <summary>
    /// The injection for Unity
    /// </summary>
    public static class UnityMVC5
    {

        public static void RegisterComponents()
        {
            var container = BuildUnityContainer();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }

        /// <summary>
        /// Inject
        /// </summary>
        /// <returns></returns>
        private static IUnityContainer BuildUnityContainer()
        {
            var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // Database context, one per request, ensure it is disposed
            container.BindInRequestScope<IMVCForumContext, digiozPortalEntities>();
            container.BindInRequestScope<IUnitOfWorkManager, UnitOfWorkManager>();

            //Bind the various domain model services and repositories that e.g. our controllers require         
            container.BindInRequestScope<IUnitOfWorkManager, UnitOfWorkManager>();
            container.BindInRequestScope<IIntegrityServiceManager, IntegrityServiceManager>();
            container.BindInRequestScope<IRoleService, RoleService>();
            container.BindInRequestScope<ICategoryService, CategoryService>();
            container.BindInRequestScope<IMembershipService, MembershipService>();
            container.BindInRequestScope<IPermissionService, PermissionService>();
            container.BindInRequestScope<ISettingsService, SettingsService>();
            container.BindInRequestScope<ITopicService, TopicService>();
            container.BindInRequestScope<ITopicTagService, TopicTagService>();
            container.BindInRequestScope<IPostService, PostService>();
            container.BindInRequestScope<ILocalizationService, LocalizationService>();
            container.BindInRequestScope<IVoteService, VoteService>();
            container.BindInRequestScope<IBadgeService, BadgeService>();
            container.BindInRequestScope<IMembershipUserPointsService, MembershipUserPointsService>();
            container.BindInRequestScope<ICategoryPermissionForRoleService, CategoryPermissionForRoleService>();
            container.BindInRequestScope<ICategoryNotificationService, CategoryNotificationService>();
            container.BindInRequestScope<ITopicNotificationService, TopicNotificationService>();
            container.BindInRequestScope<IPrivateMessageService, PrivateMessageService>();
            container.BindInRequestScope<ILoggingService, LoggingService>();
            container.BindInRequestScope<IEmailService, EmailService>();
            container.BindInRequestScope<IReportService, ReportService>();
            container.BindInRequestScope<IActivityService, ActivityService>();
            container.BindInRequestScope<ILuceneService, LuceneService>();
            container.BindInRequestScope<IPollService, PollService>();
            container.BindInRequestScope<IPollVoteService, PollVoteService>();
            container.BindInRequestScope<IPollAnswerService, PollAnswerService>();
            container.BindInRequestScope<IBannedEmailService, BannedEmailService>();
            container.BindInRequestScope<IBannedWordService, BannedWordService>();
            container.BindInRequestScope<IUploadedFileService, UploadedFileService>();
            container.BindInRequestScope<IForumService, ForumService>();


            container.BindInRequestScope<IRoleRepository, RoleRepository>();
            container.BindInRequestScope<ICategoryRepository, CategoryRepository>();
            container.BindInRequestScope<IMembershipRepository, MembershipRepository>();
            container.BindInRequestScope<IPermissionRepository, PermissionRepository>();
            container.BindInRequestScope<ISettingsRepository, SettingsRepository>();
            container.BindInRequestScope<ITopicRepository, TopicRepository>();
            container.BindInRequestScope<ITopicTagRepository, TopicTagRepository>();
            container.BindInRequestScope<IPostRepository, PostRepository>();
            container.BindInRequestScope<ILocalizationRepository, LocalizationRepository>();
            container.BindInRequestScope<IVoteRepository, VoteRepository>();
            container.BindInRequestScope<IBadgeRepository, BadgeRepository>();
            container.BindInRequestScope<IMembershipUserPointsRepository, MembershipUserPointsRepository>();
            container.BindInRequestScope<ICategoryPermissionForRoleRepository, CategoryPermissionForRoleRepository>();
            container.BindInRequestScope<ICategoryNotificationRepository, CategoryNotificationRepository>();
            container.BindInRequestScope<ITopicNotificationRepository, TopicNotificationRepository>();
            container.BindInRequestScope<IPrivateMessageRepository, PrivateMessageRepository>();
            container.BindInRequestScope<IActivityRepository, ActivityRepository>();
            container.BindInRequestScope<IPollRepository, PollRepository>();
            container.BindInRequestScope<IPollVoteRepository, PollVoteRepository>();
            container.BindInRequestScope<IPollAnswerRepository, PollAnswerRepository>();
            //container.BindInRequestScope<IInstallerRepository, InstallerRepository>();
            container.BindInRequestScope<IBannedEmailRepository, BannedEmailRepository>();
            container.BindInRequestScope<IBannedWordRepository, BannedWordRepository>();
            container.BindInRequestScope<IUploadedFileRepository, UploadedFileRepository>();

            
            //container.BindInRequestScope<ISessionHelper, SessionHelper>();

            return container;
        }
    }
}