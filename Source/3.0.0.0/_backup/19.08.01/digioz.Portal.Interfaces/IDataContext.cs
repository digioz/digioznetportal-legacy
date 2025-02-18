using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IDataContext
	{
		IAspNetRoleRepo AspNetRole();
		IAspNetUserClaimRepo AspNetUserClaim();
		IAspNetUserLoginRepo AspNetUserLogin();
		IAspNetUserRoleRepo AspNetUserRole();
		IAspNetUserRepo AspNetUser();
		IMenuRepo Menu();

	}
}
