using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Helpers
{
	public static class ConfigHelper
	{
		public static string GetConnectionString()
		{
			return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		}

		public static string GetConnectionType()
		{
			return ConfigurationManager.AppSettings["DataType"];
		}
	}
}
