using System;
using System.Data;
using System.Linq;
using digioz.Portal.Data.Context;
using System.Data.Entity;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces;
using digioz.Portal.Domain.Interfaces.Repositories;


namespace digioz.Portal.Data.Repositories
{
    public class SettingsRepository : ISettingsRepository
    {
        private readonly digiozPortalEntities _context;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"> </param>
        public SettingsRepository(IMVCForumContext context)
        {
            _context = context as digiozPortalEntities;
        }

        public Settings GetSettings()
        {
            var settings = _context.Setting.FirstOrDefault();
            return settings;
        }

        public Settings Add(Settings item)
        {
            return _context.Setting.Add(item);
        }

        public Settings Get(Guid id)
        {
            return _context.Setting.FirstOrDefault(x => x.Id == id);
        }

        public void Update(Settings item)
        {
            // Check there's not an object with same identifier already in context
            if (_context.Setting.Local.Select(x => x.Id == item.Id).Any())
            {
                throw new ApplicationException("Object already exists in context - you do not need to call Update. Save occurs on Commit");
            }
            _context.Entry(item).State = EntityState.Modified;  
        }
    }
}
