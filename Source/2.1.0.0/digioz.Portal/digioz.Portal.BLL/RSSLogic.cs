using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to perform RSS operations
    /// </summary>
    public class RSSLogic : BaseLogic
    {
        /// <summary>
        /// Get contents of a specific RSS
        /// based on the ID passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static RSS Get(int id)
        {
            var RSS = Db.RSSs.SingleOrDefault(x => x.ID == id);

            return RSS;
        }

        /// <summary>
        /// Gets the contents of all the
        /// RSSs in the database as a list
        /// </summary>
        /// <returns></returns>
        public static List<RSS> GetAll()
        {
            var RSSs = Db.RSSs.ToList();

            return RSSs;
        }

        /// <summary>
        /// Adds the specified RSS
        /// </summary>
        /// <param name="RSS">The RSS.</param>
        public static void Add(RSS RSS)
        {
            Db.RSSs.Add(RSS);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified RSS
        /// </summary>
        /// <param name="RSS">The RSS.</param>
        public static void Edit(RSS RSS)
        {
            Db.Entry(RSS).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the specified RSS 
        /// based on the id passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(int id)
        {
            RSS RSS = Db.RSSs.Find(id);
            Db.RSSs.Remove(RSS);
            Db.SaveChanges();
        }
    }
}
