using Dapper;
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
	public class AspNetUserRepo : IAspNetUserRepo
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

		public void Add(AspNetUser user)
		{
			throw new NotImplementedException();
		}

		public void Delete(string id)
		{
			throw new NotImplementedException();
		}

		public void Edit(AspNetUser user)
		{
			throw new NotImplementedException();
		}

		public AspNetUser Get(string id)
		{
			throw new NotImplementedException();
		}

		public IList<AspNetUser> GetAll()
		{
			throw new NotImplementedException();
		}

		public string GetUserName(string memberId)
		{
			using (var db = GetConnection())
			{
				return db.ExecuteScalar<string>("Select Name from AspNetUser where Id=@MemberId", new { MemberId = memberId });
			}
		}

		public string GetmemberId(string userName)
		{
			using (var db = GetConnection())
			{
				return db.ExecuteScalar<string>("Select Id from AspNetUser where UserName=@UserName", new { UserName = userName });
			}
		}

		public AspNetUser GetUserByName(string userName)
		{
			throw new NotImplementedException();
		}

		public AspNetUser GetUserByEmail(string email)
		{
			throw new NotImplementedException();
		}
	}
}
