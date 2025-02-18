using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Models.V1
{
    public class MenuResult
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
        public DateTime? Timestamp { get; set; }
        public int SortOrder { get; set; }
    }
}