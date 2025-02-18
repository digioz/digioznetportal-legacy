﻿using System.Data.Entity.ModelConfiguration;
using digioz.Portal.Domain.DomainModel;

namespace digioz.Portal.Data.Mapping
{
    public class TopicNotificationMapping : EntityTypeConfiguration<TopicNotification>
    {
        public TopicNotificationMapping()
        {
            HasKey(x => x.Id);

            HasRequired(x => x.Topic).WithMany(x => x.TopicNotifications).Map(x => x.MapKey("Topic_Id"));
            HasRequired(x => x.User).WithMany(x => x.TopicNotifications).Map(x => x.MapKey("MembershipUser_Id"));
        }
    }
}
