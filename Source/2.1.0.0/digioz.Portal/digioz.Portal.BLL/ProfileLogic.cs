using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to perform user profile operations
    /// </summary>
    public class ProfileLogic : BaseLogic
    {
        /// <summary>
        /// Gets the profile by specified profile id
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static Profile Get(int id)
        {
            var profile = Db.Profiles.Find(id);

            return profile;
        }

        /// <summary>
        /// Gets the profile record by user id 
        /// passed in
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        /// <returns></returns>
        public static Profile GetProfileByUserId(string userId)
        {
            var profile = Db.Profiles.SingleOrDefault(x => x.UserID == userId);

            return profile;
        }

        /// <summary>
        /// Gets the profile by email address
        /// </summary>
        /// <param name="email">The email.</param>
        /// <returns></returns>
        public static Profile GetProfileByEmail(string email)
        {
            var profile = Db.Profiles.SingleOrDefault(x => x.Email == email);

            return profile;
        }

        /// <summary>
        /// Adds the specified user profile
        /// to the database
        /// </summary>
        /// <param name="profile">The profile.</param>
        public static void Add(Profile profile)
        {
            Db.Profiles.Add(profile);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified user profile
        /// </summary>
        /// <param name="profile">The profile.</param>
        public static void Edit(Profile profile)
        {
            Db.Entry(profile).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the user profile based on thye
        /// user id passed in
        /// </summary>
        /// <param name="userId">The user identifier.</param>
        public static void DeleteByUserId(string userId)
        {
            Profile profile = Db.Profiles.SingleOrDefault(x => x.UserID == userId);
            Db.Profiles.Remove(profile);
            Db.SaveChanges();
        }

        /// <summary>
        /// Searches the Profiles by email
        /// </summary>
        /// <param name="searchString">The search string.</param>
        /// <returns></returns>
        public static List<Profile> SearchByEmail(string searchString)
        {
            var profiles = Db.Profiles.Where(x => x.Email.Contains(searchString)).ToList();

            return profiles;
        }
    }
}
