using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IPermissionRepository
    {
        IEnumerable<Permission> GetAll();

        Permission Add(Permission item);
        Permission Get(Guid id);
        void Delete(Permission item);
        void Update(Permission item);
    }
}
