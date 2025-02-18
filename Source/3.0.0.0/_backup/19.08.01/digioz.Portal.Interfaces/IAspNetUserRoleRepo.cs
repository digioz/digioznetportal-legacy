using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IAspNetUserRoleRepo
	{
		void SetConnection(string connection);

		AspNetUserRole Get(string userId);
		IList<AspNetUserRole> GetAll();
		IList<AspNetUserRole> GetAllByUserId(string userId);
		void Add(AspNetUserRole userRole);
		void Edit(AspNetUserRole userRole);
		void Delete(string userId, string roleId);
	}
}
