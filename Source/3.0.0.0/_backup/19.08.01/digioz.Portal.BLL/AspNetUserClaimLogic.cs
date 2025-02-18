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
	public class AspNetUserClaimLogic : BaseLogic
	{
		public AspNetUserClaimLogic()
		{
		}

		public void Add(AspNetUserClaim model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserClaim();
			repo.SetConnection(ConnectionString);
			repo.Add(model);
		}

		public void Edit(AspNetUserClaim model)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserClaim();
			repo.SetConnection(ConnectionString);
			repo.Edit(model);
		}

		public AspNetUserClaim Get(int id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserClaim();
			repo.SetConnection(ConnectionString);
			var model = repo.Get(id);

			return model;
		}

		public IList<AspNetUserClaim> GetAll()
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);

			var repo = dbContext.AspNetUserClaim();
			repo.SetConnection(ConnectionString);
			var model = repo.GetAll();

			return model;
		}

		public void Delete(int id)
		{
			var dbContext = DB.CreateConnection(ConnectionString, DatabaseType);
			var repo = dbContext.AspNetUserClaim();
			repo.SetConnection(ConnectionString);
			repo.Delete(id);
		}
	}
}
