using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.Interfaces.Services;
using Microsoft.AspNet.Identity;
using digioz.Portal.Domain.DomainModel;
using Microsoft.AspNet.Identity.EntityFramework;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to perform account operations 
    /// through the web api 
    /// </summary>
    public class AccountLogic : BaseLogic
    {
        public UserManager<ApplicationUser> UserManager { get; private set; }

        public AccountLogic()
        {
            UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
        }

        /// <summary>
        /// Logs in the user through the API 
        /// and returns a security token to 
        /// them to perform further Web API 
        /// Service Operations
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <returns></returns>
        public string LoginApi(string username, string password)
        {
            string token = string.Empty;
            token = GetTokenApi(username, password, token);

            return token;
        }

        /// <summary>
        /// Registers the user through the API
        /// and returns a security token to them
        /// to perform further Web API Service 
        /// Operations
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="email">The email.</param>
        /// <returns></returns>
        public string RegisterApi(string username, string password, string email)
        {
            string token = string.Empty;

            // register
            if (DoesUserExist(username) == false)
            {
                Profile profile = new Profile();

                // Create User
                var user = new ApplicationUser() { UserName = username };
                var accountController = new AccountLogic();
                var result = accountController.UserManager.CreateAsync(user, password);
                accountController.UserManager.AddToRoleAsync(user.Id, "Standard Members");

                profile.UserID = user.Id;
                profile.Email = email;

                Db.Profiles.Add(profile);
                Db.SaveChanges();

                token = GetTokenApi(username, password, token);
            }

            return token;
        }

        /// <summary>
        /// Determines whether the passed in Token is valid
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="token">The token.</param>
        /// <returns>
        ///   <c>true</c> if [is token valid API] [the specified username]; otherwise, <c>false</c>.
        /// </returns>
        public bool IsTokenValidApi(string username, string token)
        {
            bool result = false;

            MembershipUser userRecord = Db.MembershipUser.SingleOrDefault(x => x.UserName == username && x.SecurityStamp == token);

            if (userRecord != null)
            {
                result = true;
            }

            return result;
        }

        /// <summary>
        /// Checks if a username currently exists 
        /// in the database
        /// </summary>
        /// <param name="username">The username.</param>
        /// <returns></returns>
        private bool DoesUserExist(string username)
        {
            bool result = false;

            var count = Db.MembershipUser.Count(x => x.UserName == username);

            if (count > 0)
            {
                result = true;
            }

            return result;
        }

        /// <summary>
        /// Method to retrieve the Token for a 
        /// specific user once the information 
        /// is passed in by the public method
        /// </summary>
        /// <param name="username">The username.</param>
        /// <param name="password">The password.</param>
        /// <param name="token">The token.</param>
        /// <returns></returns>
        private string GetTokenApi(string username, string password, string token)
        {
            var accountController = new AccountLogic();
            var user = UserManager.FindAsync(username, password);

            if (user != null)
            {
                MembershipUser userRecord = Db.MembershipUser.SingleOrDefault(x => x.UserName == username);

                if (userRecord != null)
                {
                    token = userRecord.SecurityStamp;
                }
            }
            return token;
        }

        /// <summary>
        /// Gets the membership users list
        /// to populate the Users Drop Downs
        /// </summary>
        /// <returns></returns>
        public static DbSet<MembershipUser> GetMembershipUsers()
        {
            var users = Db.MembershipUser;

            return users;
        }

        /// <summary>
        /// Gets a specific membership user by 
        /// ID value passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static MembershipUser GetMembershipUser(string id)
        {
            var user = Db.MembershipUser.Find(id);

            return user;
        }

        /// <summary>
        /// Gets the membership user by username
        /// </summary>
        /// <param name="username">The username.</param>
        /// <returns></returns>
        public static MembershipUser GetMembershipUserByUsername(string username)
        {
            var user = Db.MembershipUser.SingleOrDefault(x => x.UserName == username);

            return user;
        }

        /// <summary>
        /// Deletes the specified user and their profile
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(string id)
        {
            ProfileLogic.DeleteByUserId(id);

            MembershipUser user = Db.MembershipUser.Find(id);

            Db.MembershipUser.Remove(user);
            Db.SaveChanges();
        }

        /// <summary>
        /// Searches the specified User record's Username
        /// and Email for the search string
        /// </summary>
        /// <param name="searchString">The search string.</param>
        /// <returns></returns>
        public static List<MembershipUser> Search(string searchString)
        {
            var users = Db.MembershipUser.Where(x => x.UserName.Contains(searchString)).ToList();
            var profiles = ProfileLogic.SearchByEmail(searchString);

            var results = new List<MembershipUser>();

            results.AddRange(users);

            foreach (var profile in profiles)
            {
                var match = results.FirstOrDefault(x => x.Id == profile.UserID);

                if (match == null)
                {
                   MembershipUser user = GetMembershipUser(profile.UserID);
                    results.Add(user); 
                }
            }

            return results;
        }
    }
}
