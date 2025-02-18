using digioz.Portal.BO;
using digioz.Portal.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace digioz.Portal.DAL.SQL
{
	public class AspNetRoleRepo : IAspNetRoleRepo
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

		public void Add(AspNetRole role)
		{
			using (var db = GetConnection())
			{
				string query = @"Insert into AspNetRoles (Name) values (@name)";

				db.Execute(query, new { name = role.Name });
			}
		}

		public void Delete(string id)
		{
			using (var db = GetConnection())
			{
				db.Execute(@"Delete from AspNetRoles where Id = @id", new { id = id });
			}
		}

		public void Edit(AspNetRole role)
		{
			using (var db = GetConnection())
			{
				string query = @"UPDATE AspNetRole SET Name = @name WHERE Id = @id";

				db.Execute(query, new { name = role.Name, id = role.Id });
			}
		}

		public AspNetRole Get(string id)
		{
			using (var db = GetConnection())
			{
				return db.Query<AspNetRole>("Select * From AspNetRoles WHERE Id = @Id", new { id }).SingleOrDefault();
			}
		}

		public IList<AspNetRole> GetAll()
		{
			using (var db = GetConnection())
			{
				return db.Query<AspNetRole>("Select * From AspNetRoles").ToList();
			}
		}

		public string GetRoleName(string roleId)
		{
			using (var db = GetConnection())
			{
				return db.ExecuteScalar<string>("Select Name from AspNetRoles where Id=@id", new { id = roleId });
			}
		}

		public string GetRoleId(string roleName)
		{
			using (var db = GetConnection())
			{
				var model = db.Query<AspNetRole>("SELECT * From AspNetRoles WHERE Name = @name", new { name = roleName }).SingleOrDefault();

				return model.Id;
			}
		}

		public AspNetRole GetRoleByName(string roleName)
		{
			var roleId = GetRoleId(roleName);

			using (var db = GetConnection())
			{
				return Get(roleId);
			}
		}
	}
}
