using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.Web.Areas.Admin.Models
{
    public class VisitorCountryChart
    {
        public string Country { get; set; }
        public double CountOf { get; set; }
    }

    public class PollDisplayChart
    {
        public string Answer { get; set; }
        public int CountOf { get; set; }
    }

}
