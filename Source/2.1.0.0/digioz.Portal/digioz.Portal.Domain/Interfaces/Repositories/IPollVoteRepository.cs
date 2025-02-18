using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Domain.Interfaces.Repositories
{
    public interface IPollVoteRepository
    {
        List<PollVote> GetAllPollVotes();
        PollVote Add(PollVote pollVote);
        bool HasUserVotedAlready(Guid answerId, string userId);
        PollVote Get(Guid id);
        void Delete(PollVote pollVote);
    }
}
