using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class LanguageMapping : EntityTypeConfiguration<Language>
    {
        public LanguageMapping()
        {
            HasKey(x => x.Id);

            HasMany(x => x.LocaleStringResources).WithRequired(x => x.Language)
                .WillCascadeOnDelete();
        }
    }
}
