using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Models.V1
{
    public class PageResult
    {
        public int ID { get; set; }
        public string UserID { get; set; }
        public string Title { get; set; }
        public string URL { get; set; }
        public string Body { get; set; }
        public string Keywords { get; set; }
        public string Description { get; set; }
        public bool Visible { get; set; }
        public DateTime? Timestamp { get; set; }
    }
}