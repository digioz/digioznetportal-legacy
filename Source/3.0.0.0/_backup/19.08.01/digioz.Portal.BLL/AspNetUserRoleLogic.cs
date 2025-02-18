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
	public class AspNetUserRoleLogic : BaseLogic
	{
		public AspNetUserRoleLogic()
		{
		}

		public void Add(AspNetUserRole model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserRole();
			repo.SetConnection(ConnectionString);
			repo.Add(model);
		}

		public void Edit(AspNetUserRole model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserRole();
			repo.SetConnection(ConnectionString);
			repo.Edit(model);
		}

		public AspNetUserRole Get(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserRole();
			repo.SetConnection(ConnectionString);
			var model = repo.Get(id);

			return model;
		}

		public IList<AspNetUserRole> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var repo = dbContext.AspNetUserRole();
			repo.SetConnection(ConnectionString);
			var model = repo.GetAll();

			return model;
		}

		public void Delete(string userId, string roleId)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserRole();
			repo.SetConnection(ConnectionString);
			repo.Delete(userId, roleId);
		}
	}
}
