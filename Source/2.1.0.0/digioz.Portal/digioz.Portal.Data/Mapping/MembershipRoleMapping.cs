using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class MembershipRoleMapping : EntityTypeConfiguration<MembershipRole>
    {
        public MembershipRoleMapping()
        {
            ToTable("AspNetRoles");
            HasKey(x => x.Id);
            Property(x => x.Id).HasColumnName("Id");
            Property(x => x.RoleName).IsRequired().HasColumnName("Name");
            //Ignore(x => x.GId);

            HasMany(x => x.CategoryPermissionForRole)
                .WithRequired(x => x.MembershipRole)
                .Map(x => x.MapKey("MembershipRole_Id"))
                .WillCascadeOnDelete();           
        }
    }
}
