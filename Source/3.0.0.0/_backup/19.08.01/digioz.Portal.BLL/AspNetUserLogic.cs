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
	public class AspNetUserLogic : BaseLogic
	{
		public AspNetUserLogic()
		{
		}

		public void Add(AspNetUser model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			repo.Add(model);
		}

		public void Edit(AspNetUser model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			repo.Edit(model);
		}

		public AspNetUser Get(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var model = repo.Get(id);

			return model;
		}

		public IList<AspNetUser> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var model = repo.GetAll();

			return model;
		}

		public void Delete(string id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			repo.Delete(id);
		}

		public string GetUserName(string memberId)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var username = repo.GetUserName(memberId);

			return username;
		}

		public string GetmemberId(string userName)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var memberId = repo.GetmemberId(userName);

			return memberId;
		}

		public AspNetUser GetUserByName(string userName)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var user = repo.GetUserByName(userName);

			return user;
		}

		public AspNetUser GetUserByEmail(string email)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUser();
			repo.SetConnection(ConnectionString);
			var user = repo.GetUserByEmail(email);

			return user;
		}
	}
}
