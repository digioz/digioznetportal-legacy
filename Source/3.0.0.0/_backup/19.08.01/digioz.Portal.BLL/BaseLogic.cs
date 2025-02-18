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
	public class BaseLogic
	{
		public string ConnectionString;
		public string DatabaseType;
		public DataFactory DB;

		public BaseLogic()
		{
			ConnectionString = ConfigHelper.GetConnectionString();
			DatabaseType = ConfigHelper.GetConnectionType();
			DB = new DataFactory();
		}
	}
}
