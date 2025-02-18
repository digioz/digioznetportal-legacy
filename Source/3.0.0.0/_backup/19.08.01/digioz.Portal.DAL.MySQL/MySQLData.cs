using digioz.Portal.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.DAL.MySQL
{
	public class MySQLData : IDataContext
	{
		private string connectionString;

		public MySQLData(string connectionString)
		{
			this.connectionString = connectionString;
		}

		IAspNetRoleRepo IDataContext.AspNetRole()
		{
			throw new NotImplementedException();
		}

		IAspNetUserRepo IDataContext.AspNetUser()
		{
			throw new NotImplementedException();
		}

		IAspNetUserClaimRepo IDataContext.AspNetUserClaim()
		{
			throw new NotImplementedException();
		}

		IAspNetUserLoginRepo IDataContext.AspNetUserLogin()
		{
			throw new NotImplementedException();
		}

		IAspNetUserRoleRepo IDataContext.AspNetUserRole()
		{
			throw new NotImplementedException();
		}

		IMenuRepo IDataContext.Menu()
		{
			var menuRepo = new MenuRepo();

			return menuRepo;
		}
	}
}
