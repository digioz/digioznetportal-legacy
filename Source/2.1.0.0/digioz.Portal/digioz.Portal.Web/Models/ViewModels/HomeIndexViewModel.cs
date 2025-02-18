using digioz.Portal.Domain.DomainModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Models.ViewModels
{
    public class HomeIndexViewModel
    {
        public List<Announcement> Announcements { get; set; }
        public Page Page { get; set; }
    }
}