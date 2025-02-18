﻿using System;
using System.Collections.Generic;
using System.Linq;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;

namespace digioz.Portal.Data.Repositories
{
    public class BannedEmailRepository : IBannedEmailRepository
    {
        private readonly digiozPortalEntities _context;
        public BannedEmailRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public BannedEmail Add(BannedEmail bannedEmail)
        {
            return _context.BannedEmail.Add(bannedEmail);
        }

        public void Delete(BannedEmail bannedEmail)
        {
            _context.BannedEmail.Remove(bannedEmail);
        }

        public IList<BannedEmail> GetAll()
        {
            return _context.BannedEmail.ToList();
        }

        public BannedEmail Get(Guid id)
        {
            return _context.BannedEmail.FirstOrDefault(x => x.Id == id);
        }

        public PagedList<BannedEmail> GetAllPaged(int pageIndex, int pageSize)
        {
            var total = _context.BannedEmail.Count();

            var results = _context.BannedEmail
                                .OrderByDescending(x => x.Email)
                                .Skip((pageIndex - 1) * pageSize)
                                .Take(pageSize)
                                .ToList();

            return new PagedList<BannedEmail>(results, pageIndex, pageSize, total);
        }

        public PagedList<BannedEmail> GetAllPaged(string search, int pageIndex, int pageSize)
        {
            var total = _context.BannedEmail.Count(x => x.Email.ToLower().Contains(search.ToLower()));

            var results = _context.BannedEmail
                                .Where(x => x.Email.ToLower().Contains(search.ToLower()))
                                .OrderByDescending(x => x.Email)
                                .Skip((pageIndex - 1) * pageSize)
                                .Take(pageSize)
                                .ToList();

            return new PagedList<BannedEmail>(results, pageIndex, pageSize, total);
        }

        public IList<BannedEmail> GetAllWildCards()
        {
            return _context.BannedEmail.Where(x => x.Email.StartsWith("*@")).ToList();
        }

        public IList<BannedEmail> GetAllNonWildCards()
        {
            return _context.BannedEmail.Where(x => !x.Email.StartsWith("*@")).ToList();
        }
    }
}
