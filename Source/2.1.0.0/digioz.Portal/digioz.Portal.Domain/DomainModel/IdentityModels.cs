using System;
using System.Collections.Generic;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace digioz.Portal.Domain.DomainModel
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public ApplicationUser()
        {
            this.CreateDate = DateTime.UtcNow;
            this.LastPasswordChangedDate = DateTime.UtcNow;
            this.LastLockoutDate = DateTime.UtcNow;
            this.LastLoginDate = DateTime.UtcNow;
        }
        public string PasswordQuestion { get; set; }
        public string PasswordAnswer { get; set; }
        public bool IsApproved { get; set; }
        public bool IsLockedOut { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime LastPasswordChangedDate { get; set; }
        public DateTime LastLockoutDate { get; set; }
        public DateTime? LastActivityDate { get; set; }
        public int FailedPasswordAttemptCount { get; set; }
        public int FailedPasswordAnswerAttempt { get; set; }
        public string Comment { get; set; }
        public string Slug { get; set; }
        //public string Signature { get; set; }
        public bool? DisableEmailNotifications { get; set; }
        public bool? DisablePosting { get; set; }
        public bool? DisablePrivateMessages { get; set; }
        public bool? DisableFileUploads { get; set; }

    }


    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        static ApplicationDbContext()
        {
            //Database.SetInitializer(new ApplicationInitializer());
        }  
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
            this.Configuration.LazyLoadingEnabled = true;

            // Automatic monitoring of changes, the default value is true
            this.Configuration.AutoDetectChangesEnabled = true;  
        }
    }
}