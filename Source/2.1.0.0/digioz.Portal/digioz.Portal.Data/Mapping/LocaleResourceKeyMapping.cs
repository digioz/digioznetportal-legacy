using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class LocaleResourceKeyMapping : EntityTypeConfiguration<LocaleResourceKey>
    {
        public LocaleResourceKeyMapping()
        {
            HasKey(x => x.Id);

            HasMany(x => x.LocaleStringResources).WithRequired(x => x.LocaleResourceKey)                
                .WillCascadeOnDelete();
        }
    }
}
