using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.Entity;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Utilities;

namespace digioz.Portal.Data.Repositories
{
    public class PollVoteRepository : IPollVoteRepository
    {
        private readonly digiozPortalEntities _context;
        public PollVoteRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }


        public List<PollVote> GetAllPollVotes()
        {
            return _context.PollVote.ToList();
        }

        public PollVote Add(PollVote pollVote)
        {
            return _context.PollVote.Add(pollVote);
        }

        public bool HasUserVotedAlready(Guid answerId, string userId)
        {

            var vote = _context.PollVote.FirstOrDefault(x => x.PollAnswer.Id == answerId && x.User.Id == userId);
            return (vote != null);
        }

        public PollVote Get(Guid id)
        {
            return _context.PollVote.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(PollVote pollVote)
        {
            _context.PollVote.Remove(pollVote);
        }
    }
}
