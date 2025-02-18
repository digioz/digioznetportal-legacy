using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class BadgeMapping : EntityTypeConfiguration<Badge>
    {
        public BadgeMapping()
        {
            HasKey(x => x.Id);
            Ignore(x => x.Milestone);
        }
    }
}
