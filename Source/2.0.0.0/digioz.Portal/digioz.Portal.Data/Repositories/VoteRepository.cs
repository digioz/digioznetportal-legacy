using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using digioz.Portal.Data.Context;
using System.Data.Entity;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Utilities;

namespace digioz.Portal.Data.Repositories
{
    public class VoteRepository : IVoteRepository
    {
        private readonly digiozPortalEntities _context;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"> </param>
        public VoteRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public Vote Add(Vote item)
        {
            _context.Vote.Add(item);
            return item;
        }

        public Vote Get(Guid id)
        {
            return _context.Vote.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(Vote item)
        {
            _context.Vote.Remove(item);
        }

        public void Update(Vote item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.Vote.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;    
        }

        public IList<Vote> GetAllVotesByUser(Guid membershipId)
        {
            string usrId = membershipId.ToString();
            return _context.Vote.Where(x => x.VotedByMembershipUser.Id == usrId).ToList();
        }
    }
}
