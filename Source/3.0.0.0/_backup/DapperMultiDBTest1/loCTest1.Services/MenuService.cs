using IocTest1.MySQL;
using IoCTest1.BO;
using loCTest1.SQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace loCTest1.Services
{
	public class MenuService
	{
		public string ConnectionString;

		public List<Menu> GetAll()
		{
			var menuLogic = new SQLMenu();
			var menus = menuLogic.GetAll();

			return menus;
		}

		public List<Menu> GetAllMySQL()
		{
			var menuLogic = new MySQLMenu();
			var menus = menuLogic.GetAll();

			return menus;
		}
	}
}
