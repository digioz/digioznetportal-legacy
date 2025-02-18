using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class TopicTagMapping : EntityTypeConfiguration<TopicTag>
    {
        public TopicTagMapping()
        {
            HasKey(x => x.Id);
        }
    }
}
