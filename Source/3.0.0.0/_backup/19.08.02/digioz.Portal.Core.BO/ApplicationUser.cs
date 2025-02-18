using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace digioz.Portal.Core.BO
{
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

		public virtual ICollection<IdentityUserClaim<string>> Claims { get; set; }
		public virtual ICollection<IdentityUserLogin<string>> Logins { get; set; }
		public virtual ICollection<IdentityUserToken<string>> Tokens { get; set; }
		public virtual ICollection<ApplicationUserRole> UserRoles { get; set; }
	}

	public class ApplicationRole : IdentityRole
	{
		public virtual ICollection<ApplicationUserRole> UserRoles { get; set; }
	}

	public class ApplicationUserRole : IdentityUserRole<string>
	{
		public virtual ApplicationUser User { get; set; }
		public virtual ApplicationRole Role { get; set; }
	}


}
