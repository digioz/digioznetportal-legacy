using System;
using System.Collections.Generic;
using System.Linq;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;

namespace digioz.Portal.Data.Repositories
{
    public class BannedWordRepository : IBannedWordRepository
    {
        private readonly digiozPortalEntities _context;
        public BannedWordRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public BannedWord Add(BannedWord bannedWord)
        {
            return _context.BannedWord.Add(bannedWord);
        }

        public void Delete(BannedWord bannedWord)
        {
            _context.BannedWord.Remove(bannedWord);
        }

        public IList<BannedWord> GetAll()
        {
            return _context.BannedWord.OrderByDescending(x => x.DateAdded).ToList();
        }

        public BannedWord Get(Guid id)
        {
            return _context.BannedWord.FirstOrDefault(x => x.Id == id);
        }

        public PagedList<BannedWord> GetAllPaged(int pageIndex, int pageSize)
        {
            var total = _context.BannedWord.Count();

            var results = _context.BannedWord
                                .OrderBy(x => x.Word)
                                .Skip((pageIndex - 1) * pageSize)
                                .Take(pageSize)
                                .ToList();

            return new PagedList<BannedWord>(results, pageIndex, pageSize, total);
        }

        public PagedList<BannedWord> GetAllPaged(string search, int pageIndex, int pageSize)
        {
            var total = _context.BannedWord.Count(x => x.Word.ToLower().Contains(search.ToLower()));

            var results = _context.BannedWord
                                .Where(x => x.Word.ToLower().Contains(search.ToLower()))
                                .OrderBy(x => x.Word)
                                .Skip((pageIndex - 1) * pageSize)
                                .Take(pageSize)
                                .ToList();

            return new PagedList<BannedWord>(results, pageIndex, pageSize, total);
        }
    }
}
