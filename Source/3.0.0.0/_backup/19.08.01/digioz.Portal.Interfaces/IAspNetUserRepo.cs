using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IAspNetUserRepo
	{
		void SetConnection(string connection);

		AspNetUser Get(string id);
		IList<AspNetUser> GetAll();
		string GetUserName(string memberId);
		string GetmemberId(string userName);
		AspNetUser GetUserByName(string userName);
		AspNetUser GetUserByEmail(string email);
		void Add(AspNetUser user);
		void Edit(AspNetUser user);
		void Delete(string id);
	}
}
