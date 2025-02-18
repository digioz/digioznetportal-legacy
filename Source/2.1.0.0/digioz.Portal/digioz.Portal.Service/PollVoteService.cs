using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;

namespace digioz.Portal.Services
{
    public class PollVoteService : IPollVoteService
    {
        private readonly IPollVoteRepository _pollVoteRepository;

        public PollVoteService(IPollVoteRepository pollVoteRepository)
        {
            _pollVoteRepository = pollVoteRepository;
        }

        public List<PollVote> GetAllPollVotes()
        {
            return _pollVoteRepository.GetAllPollVotes();
        }

        public PollVote Add(PollVote pollVote)
        {
            return _pollVoteRepository.Add(pollVote);
        }

        public bool HasUserVotedAlready(Guid answerId, string userId)
        {
            return _pollVoteRepository.HasUserVotedAlready(answerId, userId);
        }

        public PollVote Get(Guid id)
        {
            return _pollVoteRepository.Get(id);
        }

        public void Delete(PollVote pollVote)
        {
            _pollVoteRepository.Delete(pollVote);
        }

    }
}
