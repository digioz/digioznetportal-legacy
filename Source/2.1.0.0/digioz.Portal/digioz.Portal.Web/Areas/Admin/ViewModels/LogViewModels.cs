using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class ListLogViewModel
    {
        public IList<LogEntry> LogFiles { get; set; }
    }
}