using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IRoleRepository
    {
        IList<MembershipRole> AllRoles();
        MembershipRole GetRole(string rolename);

        MembershipRole Add(MembershipRole item);
        MembershipRole Get(string id);
        void Delete(MembershipRole item);
        void Update(MembershipRole item);
    }
}
