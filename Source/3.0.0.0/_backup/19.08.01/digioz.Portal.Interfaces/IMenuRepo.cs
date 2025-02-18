using digioz.Portal.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Interfaces
{
	public interface IMenuRepo
	{
		void SetConnection(string connection);

		Menu Get(int id);
		IList<Menu> GetAll();
		void Add(Menu menu);
		void Edit(Menu menu);
		void Delete(int id);
	}
}
