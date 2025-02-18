using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IAspNetUserLoginRepo
	{
		void SetConnection(string connection);

		AspNetUserLogin Get(string userId);
		IList<AspNetUserLogin> GetAll();
		void Add(AspNetUserLogin userLogin);
		void Edit(AspNetUserLogin userLogin);
		void Delete(string userId);
	}
}
