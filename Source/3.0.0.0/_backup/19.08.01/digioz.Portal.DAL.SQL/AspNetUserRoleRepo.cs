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
	public class AspNetUserRoleRepo : IAspNetUserRoleRepo
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

		public void Add(AspNetUserRole userRole)
		{
			throw new NotImplementedException();
		}

		public void Delete(string userId, string roleId)
		{
			throw new NotImplementedException();
		}

		public void Edit(AspNetUserRole userRole)
		{
			throw new NotImplementedException();
		}

		public AspNetUserRole Get(string userId)
		{
			throw new NotImplementedException();
		}

		public IList<AspNetUserRole> GetAll()
		{
			throw new NotImplementedException();
		}

		public IList<AspNetUserRole> GetAllByUserId(string userId)
		{
			throw new NotImplementedException();
		}
	}
}
