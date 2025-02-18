using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class RestoreFromXMLViewModel
    {
        public List<string> ListOfTables { get; set; }
        public List<string> RestoreFolders { get; set; }
        public string SelectedFolder { get; set; }
        public bool ImportAllTables { get; set; }
    }
}