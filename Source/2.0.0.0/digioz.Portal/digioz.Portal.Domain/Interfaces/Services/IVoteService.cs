using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IVoteService
    {
        Vote Add(Vote vote);
        void Delete(Vote vote);
        IList<Vote> GetAllVotesByUser(Guid membershipId);
    }
}
