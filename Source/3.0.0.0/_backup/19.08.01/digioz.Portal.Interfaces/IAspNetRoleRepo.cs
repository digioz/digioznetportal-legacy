using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IAspNetRoleRepo
	{
		void SetConnection(string connection);

		AspNetRole Get(string id);
		IList<AspNetRole> GetAll();
		string GetRoleName(string roleId);
		string GetRoleId(string roleName);
		AspNetRole GetRoleByName(string roleName);
		void Add(AspNetRole role);
		void Edit(AspNetRole role);
		void Delete(string id);
	}
}
