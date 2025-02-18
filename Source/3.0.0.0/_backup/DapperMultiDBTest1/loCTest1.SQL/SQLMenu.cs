using Dapper;
using IoCTest1.BO;
using loCTest1.Interfaces;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace loCTest1.SQL
{
	public class SQLMenu : IMenu
	{
		private IDbConnection GetConnection()
		{
			return new SqlConnection(ConfigurationManager.ConnectionStrings["MSSQLConnection"].ConnectionString);
		}

		public void Add(Menu menu)
		{
			throw new NotImplementedException();
		}

		public void Delete(int id)
		{
			throw new NotImplementedException();
		}

		public void Edit(Menu menu)
		{
			throw new NotImplementedException();
		}

		public Menu Get(int id)
		{
			throw new NotImplementedException();
		}

		public List<Menu> GetAll()
		{
			using (var db = GetConnection())
			{
				return db.Query<Menu>("Select * From Menu").ToList();
			}
		}
	}
}
