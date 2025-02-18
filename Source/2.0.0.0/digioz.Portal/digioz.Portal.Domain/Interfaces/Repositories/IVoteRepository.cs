using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IVoteRepository
    {
        Vote Add(Vote item);
        Vote Get(Guid id);
        void Delete(Vote item);
        void Update(Vote item);
        IList<Vote> GetAllVotesByUser(Guid membershipId);
    }
}
