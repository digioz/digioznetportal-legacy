﻿using System;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{

    public class BadgeTypeTimeLastChecked : Entity
    {
        public BadgeTypeTimeLastChecked()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string BadgeType { get; set; }
        public DateTime TimeLastChecked { get; set; }

        public virtual MembershipUser User { get; set; }
    }
}
