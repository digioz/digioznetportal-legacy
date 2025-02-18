using System;
using System.Collections.Generic;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class CategoryNotification : Entity
    {
        public CategoryNotification()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public virtual Category Category { get; set; }
        public virtual MembershipUser User { get; set; }
    }
}
