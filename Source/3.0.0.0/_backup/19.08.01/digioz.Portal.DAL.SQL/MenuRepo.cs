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
	public class MenuRepo : IMenuRepo
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

		public Menu Get(int id)
		{
			using (var db = GetConnection())
			{
				return db.Query<Menu>("Select * From Menu WHERE Id = @Id", new { id }).SingleOrDefault();
			}
		}

		public IList<Menu> GetAll()
		{
			using (var db = GetConnection())
			{
				return db.Query<Menu>("Select * From Menu").ToList();
			}
		}

		public void Add(Menu menu)
		{
			using (var db = GetConnection())
			{
				string query = @"INSERT INTO Menu (UserID, Name, Location, Controller, Action, URL, Target, Visible, Timestamp, SortOrder) 
									VALUES (@UserID, @Name, @Location, @Controller, @Action, @URL, @Target, @Visible, @Timestamp, @SortOrder)";

				db.Execute(query, menu);
			}
		}

		public void Delete(int id)
		{
			using (var db = GetConnection())
			{
				db.Execute("DELETE FROM Menu WHERE ID = @ID", new { ID = id });
			}
		}

		public void Edit(Menu menu)
		{
			using (var db = GetConnection())
			{
				string query = @"UPDATE Menu SET UserID = @UserID, Name = @Name, Location = @Location, Controller = @Controller, Action = @Action, 
									URL = @URL, Target = @Target, Visible = @Visible, Timestamp = @Timestamp, SortOrder = @SortOrder WHERE Id = @Id";

				db.Execute(query, menu);
			}
		}

	}
}
