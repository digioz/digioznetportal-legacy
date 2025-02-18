using System;

namespace digioz.Portal.Domain.Interfaces.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        void Commit();
        void Rollback();
        void SaveChanges();
    }
}
