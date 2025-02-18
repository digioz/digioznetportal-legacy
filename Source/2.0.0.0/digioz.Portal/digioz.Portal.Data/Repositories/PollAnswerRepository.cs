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
    public class PollAnswerRepository : IPollAnswerRepository
    {
        private readonly digiozPortalEntities _context;
        public PollAnswerRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public List<PollAnswer> GetAllPollAnswers()
        {
            return _context.PollAnswer.ToList();
        }

        public List<PollAnswer> GetAllPollAnswersByPoll(Poll poll)
        {
            return _context.PollAnswer.Where(x => x.Poll.Id == poll.Id).ToList();
        }

        public PollAnswer Add(PollAnswer pollAnswer)
        {
            return _context.PollAnswer.Add(pollAnswer);
        }

        public PollAnswer Get(Guid id)
        {
            return _context.PollAnswer.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(PollAnswer pollAnswer)
        {
            _context.PollAnswer.Remove(pollAnswer);
        }

    }
}
