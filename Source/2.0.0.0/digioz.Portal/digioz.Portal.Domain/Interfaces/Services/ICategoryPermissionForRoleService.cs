﻿using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface ICategoryPermissionForRoleService
    {
        void Add(CategoryPermissionForRole categoryPermissionForRole);
        CategoryPermissionForRole CheckExists(CategoryPermissionForRole categoryPermissionForRole);
        void UpdateOrCreateNew(CategoryPermissionForRole categoryPermissionForRole);
        void Save(CategoryPermissionForRole categoryPermissionForRole);
        Dictionary<Permission, CategoryPermissionForRole> GetCategoryRow(MembershipRole role, Category cat);
        IEnumerable<CategoryPermissionForRole> GetByCategory(Guid categoryId);
    }
}
