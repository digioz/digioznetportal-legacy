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
    public class PollRepository : IPollRepository
    {
        private readonly digiozPortalEntities _context;
        public PollRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public List<Poll> GetAllPolls()
        {
            return _context.Poll.ToList();
        }

        public Poll Add(Poll poll)
        {
            return _context.Poll.Add(poll);
        }

        public Poll Get(Guid id)
        {
            return _context.Poll.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(Poll item)
        {
            _context.Poll.Remove(item);
        }
    }
}
