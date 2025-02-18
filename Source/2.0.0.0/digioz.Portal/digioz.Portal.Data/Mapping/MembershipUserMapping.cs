using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class MembershipUserMapping : EntityTypeConfiguration<MembershipUser>
    {
        public MembershipUserMapping()
        {
            ToTable("AspNetUsers");
            HasKey(x => x.Id);
            Property(x => x.Id).HasColumnName("Id");
            Property(x => x.Discriminator).IsRequired().HasMaxLength(128);
            //mvc5 identity use string as the type of user id, ignore guid presentation of user id
           // Ignore(x => x.GId);
            Ignore(x => x.Password);
            
            HasMany(x => x.UserClaims).WithRequired(x => x.User)
            .WillCascadeOnDelete();

                HasMany(x => x.UserLogins).WithRequired(x => x.User)
                .WillCascadeOnDelete();


            HasMany(x => x.Topics).WithRequired(x => x.User)
                .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            // Has Many, as a user has many posts
            HasMany(x => x.Posts).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.Votes).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.TopicNotifications).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.Polls).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.PollVotes).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.CategoryNotifications).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.Points).WithRequired(x => x.User)
               .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            HasMany(x => x.PrivateMessagesReceived).WithRequired(x => x.UserFrom)
                .WillCascadeOnDelete();

            HasMany(x => x.PrivateMessagesSent)
                .WithRequired(x => x.UserTo)
                .WillCascadeOnDelete(false);

            HasMany(x => x.BadgeTypesTimeLastChecked).WithRequired(x => x.User)
                .Map(x => x.MapKey("MembershipUser_Id"))
                .WillCascadeOnDelete();

            // Many-to-many join table - a user may belong to many roles
            HasMany(u => u.Roles)
            .WithMany(r => r.Users)
            .Map(m =>
            {
                m.ToTable("AspNetUserRoles");
                m.MapLeftKey("UserId");
                m.MapRightKey("RoleId");
            });

           
            // Many-to-many join table - a badge may belong to many users
            HasMany(t => t.Badges)
           .WithMany(t => t.Users)
           .Map(m =>
           {
               m.ToTable("MembershipUser_Badge");
               m.MapLeftKey("MembershipUser_Id");
               m.MapRightKey("Badge_Id");
           });
        }
    }
}
