using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IAspNetUserClaimRepo
	{
		void SetConnection(string connection);

		AspNetUserClaim Get(int id);
		IList<AspNetUserClaim> GetAll();
		void Add(AspNetUserClaim claim);
		void Edit(AspNetUserClaim claim);
		void Delete(int id);
	}
}
