using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IBannedWordRepository
    {
        BannedWord Add(BannedWord bannedWord);
        void Delete(BannedWord bannedWord);
        IList<BannedWord> GetAll();
        BannedWord Get(Guid id);
        PagedList<BannedWord> GetAllPaged(int pageIndex, int pageSize);
        PagedList<BannedWord> GetAllPaged(string search, int pageIndex, int pageSize);
    }
}
