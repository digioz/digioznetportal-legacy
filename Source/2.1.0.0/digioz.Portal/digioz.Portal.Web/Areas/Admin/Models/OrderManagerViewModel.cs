using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Web.Areas.Admin.Models
{
    public class OrderManagerViewModel
    {
        public Order Order { get; set; }
        public List<OrderDetail> OrderDetails { get; set; } 
    }
}