using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IoCTest1.BO
{
	public class Menu
	{
		public int ID { get; set; }
		public string UserID { get; set; }
		public string Name { get; set; }
		public string Location { get; set; }
		public string Controller { get; set; }
		public string Action { get; set; }
		public string URL { get; set; }
		public string Target { get; set; }
		public bool Visible { get; set; }
		public Nullable<System.DateTime> Timestamp { get; set; }
		public int SortOrder { get; set; }
	}
}
