using System.Collections.Generic;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.DomainModel.Activity;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class ListCategoriesViewModels
    {
        public MembershipUser MembershipUser { get; set; }
        public MembershipRole MembershipRole { get; set; }
    }

    public class AllRecentActivitiesViewModel
    {
        public PagedList<ActivityBase> Activities { get; set; }

        public int? PageIndex { get; set; }
        public int? TotalCount { get; set; }
    }
}