using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class SearchViewModel
    {
        public PagedList<Topic> Topics { get; set; }
        public Dictionary<Category, PermissionSet> AllPermissionSets { get; set; }
        public string Term { get; set; }

        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
    }
}