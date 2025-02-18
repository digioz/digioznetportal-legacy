using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace digioz.Portal.Web.Areas.Admin.Models
{
    public class DatabaseBackupViewModel
    {
        [Required]
        public string DatabaseName { get; set; }
        public List<SelectListItem> Databases { get; set; }

        public DatabaseBackupViewModel()
        {
            Databases = new List<SelectListItem>();
        }
    }

    public class DatabaseQueryViewModel
    {
        [Required]
        public string QueryString { get; set; }
        public DataTable DataTable { get; set; }
    }
}