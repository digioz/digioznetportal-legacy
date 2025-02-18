using System.Collections.Generic;

namespace digioz.Portal.Domain.DomainModel
{
    public class PermissionSet : Dictionary<string, CategoryPermissionForRole>
    {
        public PermissionSet(IEnumerable<CategoryPermissionForRole> permissionsList)
        {
               foreach(var categoryPermissionForRole in permissionsList)
               {
                   this.Add(categoryPermissionForRole.Permission.Name, categoryPermissionForRole);
               }
        }
    }
}
