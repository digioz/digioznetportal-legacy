using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to manage Announcement 
    /// Business Logic
    /// </summary>
    public class AnnouncementLogic : BaseLogic
    {
        /// <summary>
        /// Get specific Announcement based on 
        /// the id passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static Announcement Get(int id)
        {
            var announcement = Db.Announcements.Find(id);

            return announcement;
        }

        /// <summary>
        /// Gets all Announcements from the database
        /// </summary>
        /// <returns></returns>
        public static List<Announcement> GetAll()
        {
            var announcements = Db.Announcements.Include(a => a.AspNetUser).ToList();

            return announcements;
        }

        /// <summary>
        /// Adds the specified announcement
        /// </summary>
        /// <param name="announcement">The announcement.</param>
        public static void Add(Announcement announcement)
        {
            Db.Announcements.Add(announcement);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified announcement
        /// </summary>
        /// <param name="announcement">The announcement.</param>
        public static void Edit(Announcement announcement)
        {
            Db.Entry(announcement).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the specified Announcement 
        /// based on the ID passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(int id)
        {
            Announcement announcement = Db.Announcements.Find(id);
            Db.Announcements.Remove(announcement);
            Db.SaveChanges();
        }
    }
}
