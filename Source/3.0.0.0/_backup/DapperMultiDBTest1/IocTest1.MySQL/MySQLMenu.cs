using Dapper;
using IoCTest1.BO;
using loCTest1.Interfaces;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IocTest1.MySQL
{
	public class MySQLMenu : IMenu
	{
		private IDbConnection GetConnection()
		{
			return new MySqlConnection(ConfigurationManager.ConnectionStrings["MySQLConnection"].ConnectionString);
		}

		public void Add(Menu menu)
		{
			throw new NotImplementedException();
		}

		public void Delete(int id)
		{
			throw new NotImplementedException();
		}

		public void Edit(global::IoCTest1.BO.Menu menu)
		{
			throw new NotImplementedException();
		}

		public global::IoCTest1.BO.Menu Get(int id)
		{
			throw new NotImplementedException();
		}

		public List<global::IoCTest1.BO.Menu> GetAll()
		{
			using (var db = GetConnection())
			{
				return db.Query<Menu>("Select * From menu").ToList();
			}
		}
	}
}
