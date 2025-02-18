using digioz.Portal.BO;
using digioz.Portal.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.DAL.SQL
{
	public class AspNetUserLoginRepo : IAspNetUserLoginRepo
	{
		private string ConnectionString;

		private IDbConnection GetConnection()
		{
			return new SqlConnection(ConnectionString);
		}

		public void SetConnection(string connection)
		{
			this.ConnectionString = connection;
		}

		public void Add(AspNetUserLogin userLogin)
		{
			throw new NotImplementedException();
		}

		public void Delete(string userId)
		{
			throw new NotImplementedException();
		}

		public void Edit(AspNetUserLogin userLogin)
		{
			throw new NotImplementedException();
		}

		public AspNetUserLogin Get(string userId)
		{
			throw new NotImplementedException();
		}

		public IList<AspNetUserLogin> GetAll()
		{
			throw new NotImplementedException();
		}
	}
}
