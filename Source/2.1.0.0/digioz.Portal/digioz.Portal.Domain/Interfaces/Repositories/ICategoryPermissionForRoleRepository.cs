using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface ICategoryPermissionForRoleRepository
    {
        CategoryPermissionForRole Add(CategoryPermissionForRole categoryPermissionForRole);
        CategoryPermissionForRole GetByPermissionRoleCategoryId(Guid permId, string roleId, Guid catId);
        IList<CategoryPermissionForRole> GetCategoryRow(MembershipRole role, Category cat);
        IEnumerable<CategoryPermissionForRole> GetByCategory(Guid catgoryId);
        IEnumerable<CategoryPermissionForRole> GetByRole(string roleId);
        IEnumerable<CategoryPermissionForRole> GetByPermission(Guid permId);
        CategoryPermissionForRole Get(Guid id);
        void Delete(CategoryPermissionForRole entity);
        void Update(CategoryPermissionForRole item);
    }
}
