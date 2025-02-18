using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IPermissionService
    {
        IEnumerable<Permission> GetAll();
        void Add(Permission permission);
        void Delete(Permission permission);
        Permission Get(Guid id);
    }
}
