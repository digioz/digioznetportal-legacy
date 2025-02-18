﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Data.Entity;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.DomainModel.Activity;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Utilities;

namespace digioz.Portal.Data.Repositories
{
    public class ActivityRepository : IActivityRepository
    {
        private readonly digiozPortalEntities _context;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"></param>
        public ActivityRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        /// <summary>
        /// Get activities
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Activity> GetAll()
        {
            return _context.Activity;
        }

        /// <summary>
        /// Gets all activities by search data field for a Guid
        /// </summary>
        /// <param name="guid"></param>
        /// <returns></returns>
        public IEnumerable<Activity> GetDataFieldByGuid(string guid)
        {
            //var stringGuid = guid.ToString();
            return _context.Activity.Where(x => x.Data.Contains(guid));
        }

        /// <summary>
        /// Add a new activity (expected id already assigned)
        /// </summary>
        /// <param name="newActivity"></param>
        public Activity Add(Activity newActivity)
        {
            return _context.Activity.Add(newActivity);
        }

        /// <summary>
        /// Paged list of activities
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public PagedList<Activity> GetPagedGroupedActivities(int pageIndex, int pageSize)
        {
            var totalCount = _context.Activity.Count();
            var results = _context.Activity
                  .OrderByDescending(x => x.Timestamp)
                  .Skip((pageIndex - 1) * pageSize)
                  .Take(pageSize)
                  .ToList();

            // Return a paged list
            return new PagedList<Activity>(results, pageIndex, pageSize, totalCount);
        }

        public PagedList<Activity> SearchPagedGroupedActivities(string search, int pageIndex, int pageSize)
        {
            var totalCount = _context.Activity.Count(x => x.Type.ToUpper().Contains(search.ToUpper()));
            // Get the topics using an efficient
            var results = _context.Activity
                  .Where(x => x.Type.ToUpper().Contains(search.ToUpper()))
                  .OrderByDescending(x => x.Timestamp)
                  .Skip((pageIndex - 1) * pageSize)
                  .Take(pageSize)
                  .ToList();


            // Return a paged list
            return new PagedList<Activity>(results, pageIndex, pageSize, totalCount);
        }

        public Activity Get(Guid id)
        {
            return _context.Activity.FirstOrDefault(x => x.Id == id);
        }

        public void Delete(Activity item)
        {
            _context.Activity.Remove(item);
        }

        public void Update(Activity item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.Activity.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;  
        }
    }
}
