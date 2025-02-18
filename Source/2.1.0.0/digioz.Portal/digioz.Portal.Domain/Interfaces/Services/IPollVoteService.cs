using System;
using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.DomainModel.Activity;

namespace digioz.Portal.Domain.Interfaces.Services
{
    public interface IPollVoteService
    {
        List<PollVote> GetAllPollVotes();
        PollVote Add(PollVote pollVote);
        bool HasUserVotedAlready(Guid answerId, string userId);
        PollVote Get(Guid id);
        void Delete(PollVote pollVote);
    }
}
