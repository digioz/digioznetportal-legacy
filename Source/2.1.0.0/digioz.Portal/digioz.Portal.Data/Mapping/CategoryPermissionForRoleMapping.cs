using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class CategoryPermissionForRoleMapping : EntityTypeConfiguration<CategoryPermissionForRole>
    {
        public CategoryPermissionForRoleMapping()
        {
            HasKey(x => x.Id);

            HasRequired(x => x.Category);
            HasRequired(x => x.Permission);
            HasRequired(x => x.MembershipRole);
        }
    }
}
