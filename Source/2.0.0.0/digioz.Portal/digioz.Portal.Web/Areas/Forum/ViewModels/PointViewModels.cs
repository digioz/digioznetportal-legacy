using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class HighEarnersPointViewModel
    {
        public Dictionary<MembershipUser, int> HighEarners { get; set; }
    }
}