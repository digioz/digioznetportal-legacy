using System;
using System.Collections.Generic;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class TopicNotification : Entity
    {
        public TopicNotification()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public virtual Topic Topic { get; set; }
        public virtual MembershipUser User { get; set; }
    }
}
