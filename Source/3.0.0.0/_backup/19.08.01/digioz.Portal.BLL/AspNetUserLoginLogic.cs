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
	public class AspNetUserLoginLogic : BaseLogic
	{
		public AspNetUserLoginLogic()
		{
		}

		public void Add(AspNetUserLogin model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserLogin();
			repo.SetConnection(ConnectionString);
			repo.Add(model);
		}

		public void Edit(AspNetUserLogin model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserLogin();
			repo.SetConnection(ConnectionString);
			repo.Edit(model);
		}

		public AspNetUserLogin Get(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserLogin();
			repo.SetConnection(ConnectionString);
			var model = repo.Get(id);

			return model;
		}

		public IList<AspNetUserLogin> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var repo = dbContext.AspNetUserLogin();
			repo.SetConnection(ConnectionString);
			var model = repo.GetAll();

			return model;
		}

		public void Delete(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserLogin();
			repo.SetConnection(ConnectionString);
			repo.Delete(id);
		}
	}
}
