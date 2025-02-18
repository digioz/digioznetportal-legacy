using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Areas.Admin.ViewModels
{
    public class EnableCommentsViewModel
    {
        public string Id { get; set; }
        [Required]
        [DisplayName("Reference Type")]
        public string ReferenceTypes { get; set; }
        [Required]
        [DisplayName("Reference Id")]
        public string EnableReference { get; set; }

        public bool Visible { get; set; }
    }
}