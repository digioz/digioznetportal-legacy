using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace digioz.Portal.Web.Areas.Forum.ViewModels
{
    public class SubscribeEmailViewModel
    {
        public Guid Id { get; set; }
        public string SubscriptionType { get; set; }
    }

    public class UnSubscribeEmailViewModel
    {
        public Guid Id { get; set; }
        public string SubscriptionType { get; set; }
    }
}