using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;

namespace digioz.Portal.Services
{
    public class VoteService : IVoteService
    {
        private readonly IVoteRepository _voteRepository;

        public VoteService(IVoteRepository voteRepository)
        {
            _voteRepository = voteRepository;
        }

        public void Delete(Vote vote)
        {
            _voteRepository.Delete(vote);
        }

        public IList<Vote> GetAllVotesByUser(Guid membershipId)
        {
            return _voteRepository.GetAllVotesByUser(membershipId);
        }

        /// <summary>
        /// Add a new vote
        /// </summary>
        /// <param name="vote"></param>
        /// <returns></returns>
        public Vote Add(Vote vote)
        {

            _voteRepository.Add(vote); 
            return vote;
        }
    }
}
