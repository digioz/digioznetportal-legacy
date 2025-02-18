using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using digioz.Portal.Data.Mapping;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.DomainModel.Activity;
using digioz.Portal.Domain.Interfaces;

namespace digioz.Portal.Data.Context
{
    public class digiozPortalEntities : DbContext, IMVCForumContext
    {
        public const string DatabaseConnectionName = @"digiozPortalEntities";

        // http://blogs.msdn.com/b/adonet/archive/2010/12/06/ef-feature-ctp5-fluent-api-samples.aspx
        public DbSet<Activity> Activity { get; set; }
        public DbSet<Badge> Badge { get; set; }
        public DbSet<BadgeTypeTimeLastChecked> BadgeTypeTimeLastChecked { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<CategoryNotification> CategoryNotification { get; set; }
        public DbSet<CategoryPermissionForRole> CategoryPermissionForRole { get; set; }
        public DbSet<Language> Language { get; set; }
        public DbSet<LocaleResourceKey> LocaleResourceKey { get; set; }
        public DbSet<LocaleStringResource> LocaleStringResource { get; set; }
        public DbSet<MembershipRole> MembershipRole { get; set; }
        public DbSet<MembershipUser> MembershipUser { get; set; }
        public DbSet<MembershipUserPoints> MembershipUserPoints { get; set; }
        public DbSet<Permission> Permission { get; set; }
        public DbSet<Poll> Poll { get; set; }
        public DbSet<PollAnswer> PollAnswer { get; set; }
        public DbSet<PollVote> PollVote { get; set; }
        public DbSet<PollUsersVote> PollUsersVotes { get; set; }
        public DbSet<Post> Post { get; set; }
        public DbSet<PrivateMessage> PrivateMessage { get; set; }
        public DbSet<Settings> Setting { get; set; }
        public DbSet<Topic> Topic { get; set; } 
        public DbSet<TopicNotification> TopicNotification { get; set; }
        public DbSet<Vote> Vote { get; set; }
        public DbSet<TopicTag> TopicTag { get; set; }
        public DbSet<BannedEmail> BannedEmail { get; set; }
        public DbSet<BannedWord> BannedWord { get; set; }
        public DbSet<UploadedFile> UploadedFile { get; set; }
        public virtual DbSet<UserClaim> UserClaims { get; set; }
        public virtual DbSet<UserLogin> UserLogins { get; set; }

        public virtual DbSet<Announcement> Announcements { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<Link> Links { get; set; }
        public virtual DbSet<LinkCategory> LinkCategories { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
        public virtual DbSet<LogVisitor> LogVisitors { get; set; }
        public virtual DbSet<Config> Configs { get; set; }
        public virtual DbSet<Picture> Pictures { get; set; }
        public virtual DbSet<PictureAlbum> PictureAlbums { get; set; }
        public virtual DbSet<Video> Videos { get; set; }
        public virtual DbSet<VideoAlbum> VideoAlbums { get; set; }

        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }

        public virtual DbSet<Chat> Chats { get; set; }
        public virtual DbSet<VisitorInfo> VisitorInfos { get; set; }
        public virtual DbSet<Plugin> Plugins { get; set; }

        public virtual DbSet<VisitorSession> VisitorSessions { get; set; }

        public virtual DbSet<MailingList> MailingLists { get; set; }
        public virtual DbSet<MailingListCampaign> MailingListCampaigns { get; set; }
        public virtual DbSet<MailingListCampaignRelation> MailingListCampaignRelations { get; set; }
        public virtual DbSet<MailingListSubscriber> MailingListSubscribers { get; set; }
        public virtual DbSet<MailingListSubscriberRelation> MailingListSubscriberRelations { get; set; }
        public virtual DbSet<ProductOption> ProductOptions { get; set; }

        public virtual DbSet<Zone> Zones { get; set; }
        public virtual DbSet<Module> Modules { get; set; }

        public DbSet<SlideShow> SlideShows { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<CommentLike> CommentLikes { get; set; }
        public DbSet<CommentConfig> CommentConfigs { get; set; }
        public DbSet<RSS> RSSs { get; set; }

        static digiozPortalEntities()
        {
            Database.SetInitializer(new DatabaseInitializer());
        }  
        /// <summary>
        /// Constructor
        /// </summary>
        public digiozPortalEntities()
            : base(DatabaseConnectionName/*CreateCachingConnection(DatabaseConnectionName), true*/)      
        {
            Configuration.LazyLoadingEnabled = true;
        }

        /// <summary>
        /// Creates tracing connection which is a wrapper around native store connection.
        /// </summary>
        /// <returns>Instance of <see cref="EFCachingConnection"/> with enabled caching.</returns>
/*
        private static EFCachingConnection CreateCachingConnection(string connectionName)
        {
            // Based on the tracing example at: http://jkowalski.com/2010/04/23/logging-sql-statements-in-entity-frameworkcode-first/
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings[connectionName];

            var efCachingconnection = new EFCachingConnection
            {
                ConnectionString = @"wrappedProvider=" + connection.ProviderName + ";" + connection.ConnectionString
            };

            return efCachingconnection;
        }
    */
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // http://stackoverflow.com/questions/7924758/entity-framework-creates-a-plural-table-name-but-the-view-expects-a-singular-ta
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            // Mappings
            modelBuilder.Configurations.Add(new BadgeMapping());
            modelBuilder.Configurations.Add(new BadgeTypeTimeLastCheckedMapping());
            modelBuilder.Configurations.Add(new CategoryMapping());
            modelBuilder.Configurations.Add(new CategoryNotificationMapping());
            modelBuilder.Configurations.Add(new CategoryPermissionForRoleMapping());
            modelBuilder.Configurations.Add(new LanguageMapping());
            modelBuilder.Configurations.Add(new LocaleResourceKeyMapping());
            modelBuilder.Configurations.Add(new LocaleStringResourceMapping());
            modelBuilder.Configurations.Add(new MembershipRoleMapping());
            modelBuilder.Configurations.Add(new MembershipUserMapping());
            modelBuilder.Configurations.Add(new MembershipUserPointsMapping());
            modelBuilder.Configurations.Add(new PermissionMapping());
            modelBuilder.Configurations.Add(new PollAnswerMapping());
            modelBuilder.Configurations.Add(new PollMapping());
            modelBuilder.Configurations.Add(new PollVoteMapping());
            modelBuilder.Configurations.Add(new PostMapping());         
            modelBuilder.Configurations.Add(new PrivateMessageMapping());         
            modelBuilder.Configurations.Add(new SettingsMapping());         
            modelBuilder.Configurations.Add(new TopicMapping());         
            modelBuilder.Configurations.Add(new TopicNotificationMapping());         
            modelBuilder.Configurations.Add(new TopicTagMapping());
            modelBuilder.Configurations.Add(new VoteMapping());
            modelBuilder.Configurations.Add(new BannedEmailMapping());
            modelBuilder.Configurations.Add(new BannedWordMapping());
            modelBuilder.Configurations.Add(new UploadedFileMapping());

            // Ignore properties on domain models
            //modelBuilder.Entity<Category>().Ignore(cat => cat.SubCategories);

            modelBuilder.Entity<MailingList>()
                .HasMany(e => e.MailingListCampaignRelations)
                .WithRequired(e => e.MailingList)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MailingList>()
                .HasMany(e => e.MailingListSubscriberRelations)
                .WithRequired(e => e.MailingList)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MailingListCampaign>()
                .HasMany(e => e.MailingListCampaignRelations)
                .WithRequired(e => e.MailingListCampaign)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MailingListSubscriber>()
                .HasMany(e => e.MailingListSubscriberRelations)
                .WithRequired(e => e.MailingListSubscriber)
                .WillCascadeOnDelete(false);

            base.OnModelCreating(modelBuilder);
        }
        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                // Join the list to a single string.
                var fullErrorMessage = string.Join("; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
        }

        public new void Dispose()
        {
            
        }
    }
}
