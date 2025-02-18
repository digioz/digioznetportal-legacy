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
	public class AspNetUserClaimRepo : IAspNetUserClaimRepo
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

		public void Add(AspNetUserClaim claim)
		{
			throw new NotImplementedException();
		}

		public void Delete(int id)
		{
			throw new NotImplementedException();
		}

		public void Edit(AspNetUserClaim claim)
		{
			throw new NotImplementedException();
		}

		public AspNetUserClaim Get(int id)
		{
			throw new NotImplementedException();
		}

		public IList<AspNetUserClaim> GetAll()
		{
			throw new NotImplementedException();
		}
	}
}
