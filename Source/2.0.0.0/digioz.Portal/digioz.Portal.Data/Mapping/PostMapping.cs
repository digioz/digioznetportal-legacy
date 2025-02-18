using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class PostMapping : EntityTypeConfiguration<Post>
    {
        public PostMapping()
        {
            HasKey(x => x.Id);

            HasMany(x => x.Votes).WithRequired(x => x.Post)
                .Map(x => x.MapKey("Post_Id"))
                .WillCascadeOnDelete(false);

        }
    }
}
