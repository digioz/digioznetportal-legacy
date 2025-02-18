using IoCTest1.BO;
using loCTest1.Interfaces;
using loCTest1.Services;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace loCTest1
{
	class Program
	{
		static void Main(string[] args)
		{
			var dbType = ConfigurationManager.AppSettings["DataType"];
			List<Menu> menus = new List<Menu>();

			if (dbType == "MSSQL")
			{
				var connectionString = ConfigurationManager.ConnectionStrings["MSSQLConnection"].ConnectionString;
				var menuService = new MenuService();
				menuService.ConnectionString = connectionString;
				menus = menuService.GetAll();
			}
			else if (dbType == "MySQL")
			{
				var connectionString = ConfigurationManager.ConnectionStrings["MySQLConnection"].ConnectionString;
				var menuService = new MenuService();
				menuService.ConnectionString = connectionString;
				menus = menuService.GetAllMySQL();
			}

			foreach (var menu in menus)
			{
				Console.WriteLine(menu.Name);
			}





		}
	}
}
