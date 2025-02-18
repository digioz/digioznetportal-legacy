using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IBannedEmailRepository
    {
        BannedEmail Add(BannedEmail bannedEmail);
        void Delete(BannedEmail bannedEmail);
        IList<BannedEmail> GetAll();
        BannedEmail Get(Guid id);
        PagedList<BannedEmail> GetAllPaged(int pageIndex, int pageSize);
        PagedList<BannedEmail> GetAllPaged(string search, int pageIndex, int pageSize);
        IList<BannedEmail> GetAllWildCards();
        IList<BannedEmail> GetAllNonWildCards();
    }
}
