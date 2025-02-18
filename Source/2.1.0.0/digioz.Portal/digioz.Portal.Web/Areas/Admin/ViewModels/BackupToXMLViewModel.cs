using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    /// <summary>
    /// View Model Class for exporting the records
    /// in database tables to XML files
    /// </summary>
    public class BackupToXMLViewModel
    {
        public List<string> ListOfTables { get; set; }
        public bool ExportAllTables { get; set; }
    }
}