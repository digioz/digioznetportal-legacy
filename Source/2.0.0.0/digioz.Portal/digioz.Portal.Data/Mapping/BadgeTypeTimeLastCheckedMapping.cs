using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class BadgeTypeTimeLastCheckedMapping : EntityTypeConfiguration<BadgeTypeTimeLastChecked>
    {
        public BadgeTypeTimeLastCheckedMapping()
        {
            HasKey(x => x.Id);
            HasRequired(t => t.User)
                .WithMany(t => t.BadgeTypesTimeLastChecked)
                .Map(m => m.MapKey("MembershipUser_Id"));
        }
    }
}
