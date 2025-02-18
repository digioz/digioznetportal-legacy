using System;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.UnitOfWork
{
    public interface IUnitOfWorkManager : IDisposable
    {
        IUnitOfWork NewUnitOfWork();        
    }
}
