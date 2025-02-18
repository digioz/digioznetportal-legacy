using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.DAL.SQL;
using digioz.Portal.DAL.MySQL;
using digioz.Portal.Interfaces;
using digioz.Portal.DAL.Oracle;

namespace digioz.Portal.DAL
{
	public class DataFactory
	{
		public IDataContext CreateConnection(string ConnectionString, string dbtype)
		{
			IDataContext dbContext;

			switch (dbtype)
			{
				case "MSSQL":
					dbContext = new MSSQLData(ConnectionString);
					break;
				case "MySQL":
					dbContext = new MySQLData(ConnectionString);
					break;
				case "Oracle":
					dbContext = new OracleData(ConnectionString);
					break;
				default:
					dbContext = new MSSQLData(ConnectionString);
					break;
			}

			return dbContext;
		}
	}
}
