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
	public class AspNetRoleLogic : BaseLogic
	{
		public AspNetRoleLogic()
		{
		}

		public void Add(AspNetRole model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			repo.Add(model);
		}

		public void Edit(AspNetRole model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			repo.Edit(model);
		}

		public AspNetRole Get(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			var model = repo.Get(id);

			return model;
		}

		public IList<AspNetRole> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			var model = repo.GetAll();

			return model;
		}

		public string GetRoleId(string roleName)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			var model = repo.GetRoleId(roleName);

			return model;
		}

		public void Delete(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetRole();
			repo.SetConnection(ConnectionString);
			repo.Delete(id);
		}
	}
}
