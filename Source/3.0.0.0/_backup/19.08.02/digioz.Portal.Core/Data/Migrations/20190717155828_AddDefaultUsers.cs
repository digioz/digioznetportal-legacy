using System;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore.Migrations;
using digioz.Portal.Core.BO;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace digioz.Portal.Core.Data.Migrations
{
    public partial class AddDefaultUsers : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
			var admin = new ApplicationUser()
			{
				UserName = "admin@domain.com",
				IsApproved = true,
				IsLockedOut = false,
				DisableEmailNotifications = false,
				DisablePosting = false,
				DisablePrivateMessages = false,
				CreateDate = DateTime.UtcNow,
				LastPasswordChangedDate = DateTime.UtcNow,
				LastLockoutDate = (DateTime)DateTime.UtcNow,
				LastLoginDate = DateTime.UtcNow
			};

			//var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext(ApplicationUser)));
			//var result = userManager.Create(admin, "Pass@word1");

			//if (!result.Succeeded)
			//{
			//	throw new Exception();
			//}

		}

        protected override void Down(MigrationBuilder migrationBuilder)
        {

        }

		#region Helper Functions
		//private static async Task EnsureTestAdminAsync(	UserManager<ApplicationUser> userManager)
		//{
		//	var testAdmin = await userManager.Users
		//		.Where(x => x.UserName == "admin@domain.com")
		//		.SingleOrDefaultAsync();

		//	if (testAdmin != null) return;

		//	testAdmin = new ApplicationUser
		//	{
		//		UserName = "admin@todo.local",
		//		Email = "admin@todo.local"
		//	};
		//	await userManager.CreateAsync(
		//		testAdmin, "NotSecure123!!");
		//	await userManager.AddToRoleAsync(
		//		testAdmin, "Administrator");
		//}
		#endregion
	}
}
