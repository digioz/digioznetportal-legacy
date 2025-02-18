using digioz.Portal.BO;
using digioz.Portal.DAL;
using digioz.Portal.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.BLL
{
	public class MenuLogic : BaseLogic
	{
		public MenuLogic()
		{
		}

		public void Add(Menu menu)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var menuRepo = dbContext.Menu();
			menuRepo.SetConnection(ConnectionString);
			menuRepo.Add(menu);
		}

		public void Edit(Menu menu)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var menuRepo = dbContext.Menu();
			menuRepo.SetConnection(ConnectionString);
			menuRepo.Edit(menu);
		}

		public Menu Get(int id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var menuRepo = dbContext.Menu();
			menuRepo.SetConnection(ConnectionString);
			var menu = menuRepo.Get(id);

			return menu;
		}

		public IList<Menu> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var menuRepo = dbContext.Menu();
			menuRepo.SetConnection(ConnectionString);
			var menus = menuRepo.GetAll();

			return menus;
		}

		public void Delete(int id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var menuRepo = dbContext.Menu();
			menuRepo.SetConnection(ConnectionString);
			menuRepo.Delete(id);
		}
	}
}
