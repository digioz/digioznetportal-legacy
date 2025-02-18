using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IRoleService
    {
        IList<MembershipRole> AllRoles();
        void Save(MembershipRole user);
        void Delete(MembershipRole role);
        MembershipRole GetRole(string rolename);
        MembershipRole GetRoleById(string Id);
        IList<MembershipUser> GetUsersForRole(string roleName);
        void CreateRole(MembershipRole role);
        PermissionSet GetPermissions(Category category, MembershipRole role);
    }
}
