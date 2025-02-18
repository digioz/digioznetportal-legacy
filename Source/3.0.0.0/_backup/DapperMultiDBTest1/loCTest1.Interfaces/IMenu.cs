using IoCTest1.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace loCTest1.Interfaces
{
	public interface IMenu
	{
		Menu Get(int id);
		List<Menu> GetAll();
		void Add(Menu menu);
		void Edit(Menu menu);
		void Delete(int id);
	}
}
