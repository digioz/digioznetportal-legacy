using System;
using System.Collections.Generic;
using System.Text;
using digioz.Portal.Core.BO;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace digioz.Portal.Core.DAL
{
	public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
	{
		static ApplicationDbContext()
		{
			//Database.SetInitializer(new ApplicationInitializer());
		}

		public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
			: base(options)
		{

		}


		//	public ApplicationDbContext()
		//		: base("DefaultConnection")
		//	{
		//		this.Configuration.LazyLoadingEnabled = true;

		//		// Automatic monitoring of changes, the default value is true
		//		this.Configuration.AutoDetectChangesEnabled = true;
		//	}



	}
}
