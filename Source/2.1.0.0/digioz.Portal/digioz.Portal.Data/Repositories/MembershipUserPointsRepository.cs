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
    public class MembershipUserPointsRepository : IMembershipUserPointsRepository
    {
        private readonly digiozPortalEntities _context;

        public MembershipUserPointsRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public IList<MembershipUserPoints> GetByUser(MembershipUser user)
        {
            return _context.MembershipUserPoints
                    .Where(x => x.User.Id == user.Id)
                    .ToList();
        }

        public MembershipUserPoints Add(MembershipUserPoints points)
        {
            _context.MembershipUserPoints.Add(points);
            return points;
        }

        public MembershipUserPoints Get(Guid id)
        {
            return _context.MembershipUserPoints.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(MembershipUserPoints item)
        {
            _context.MembershipUserPoints.Remove(item);
        }

        public void Update(MembershipUserPoints item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.MembershipUserPoints.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;
        }

        public Dictionary<MembershipUser, int> GetCurrentWeeksPoints(int? amountToTake)
        {
            amountToTake = amountToTake ?? int.MaxValue;
            var date = DateTime.UtcNow;
            var start = date.Date.AddDays(-(int) date.DayOfWeek);
            var end = start.AddDays(7);

            var results = _context.MembershipUserPoints
                .Include(x => x.User)
                .Where(x => x.DateAdded >= start && x.DateAdded < end)
                .ToList();

            return results.GroupBy(x => x.User)
                        .ToDictionary(x => x.Key, x => x.Select(p => p.Points).Sum())
                        .OrderByDescending(x => x.Value)
                        .Take((int)amountToTake)
                        .ToDictionary(x => x.Key, x => x.Value);
        }

        public Dictionary<MembershipUser, int> GetThisYearsPoints(int? amountToTake)
        {
            amountToTake = amountToTake ?? int.MaxValue;
            var thisYear = DateTime.UtcNow.Year;

            var results = _context.MembershipUserPoints
                .Include(x => x.User)
                .Where(x => x.DateAdded.Year == thisYear)                
                .ToList();

            return results.GroupBy(x => x.User)
                        .ToDictionary(x => x.Key, x => x.Select(p => p.Points).Sum())
                        .OrderByDescending(x => x.Value)
                        .Take((int)amountToTake)
                        .ToDictionary(x => x.Key, x => x.Value);
        }

        public Dictionary<MembershipUser, int> GetAllTimePoints(int? amountToTake)
        {
            amountToTake = amountToTake ?? int.MaxValue;

            var results = _context.MembershipUserPoints
                .Include(x => x.User)
                .ToList();

            return results.GroupBy(x => x.User)
                        .ToDictionary(x => x.Key, x => x.Select(p => p.Points).Sum())
                        .OrderByDescending(x => x.Value)
                        .Take((int)amountToTake)
                        .ToDictionary(x => x.Key, x => x.Value);
        }

        public Dictionary<MembershipUser, int> GetAllTimePointsNegative(int? amountToTake)
        {
            amountToTake = amountToTake ?? int.MaxValue;

            var results = _context.MembershipUserPoints
                        .Include(x => x.User)
                        .ToList();

            return results.GroupBy(x => x.User)
                        .ToDictionary(x => x.Key, x => x.Select(p => p.Points).Sum())
                        .OrderBy(x => x.Value)
                        .Take((int)amountToTake)
                        .ToDictionary(x => x.Key, x => x.Value);
        }

    }
}
