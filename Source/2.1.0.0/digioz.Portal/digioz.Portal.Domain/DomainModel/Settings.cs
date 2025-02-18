﻿using System;
using digioz.Portal.Utilities;

namespace digioz.Portal.Domain.DomainModel
{
    public class Settings : Entity
    {
        public Settings()
        {
            Id = GuidComb.GenerateComb();
        }
        public Guid Id { get; set; }
        public string ForumName { get; set; }
        public string ForumUrl { get; set; }
        public bool IsClosed { get; set; }
        public bool EnableRSSFeeds { get; set; }
        public bool DisplayEditedBy { get; set; }
        public bool EnablePostFileAttachments { get; set; }
        public bool EnableMarkAsSolution { get; set; }
        public bool EnableSpamReporting { get; set; }
        public bool EnableMemberReporting { get; set; }
        public bool EnableEmailSubscriptions { get; set; }
        public bool ManuallyAuthoriseNewMembers { get; set; }
        public bool? NewMemberEmailConfirmation { get; set; }
        public bool EmailAdminOnNewMemberSignUp { get; set; }
        public int TopicsPerPage { get; set; }
        public int PostsPerPage { get; set; }
        public int ActivitiesPerPage { get; set; }
        public bool EnablePrivateMessages { get; set; }
        public int MaxPrivateMessagesPerMember { get; set; }
        public int PrivateMessageFloodControl { get; set; }
        public bool EnableSignatures { get; set; }

        public bool EnablePoints { get; set; }
        public int PointsAllowedToVoteAmount { get; set; }
        public int PointsAddedPerPost { get; set; }
        public int PointsAddedPostiveVote { get; set; }
        public int PointsDeductedNagativeVote { get; set; }
        public int PointsAddedForSolution { get; set; }

        public string AdminEmailAddress { get; set; }
        public string NotificationReplyEmail { get; set; }
        public string SMTP { get; set; }
        public string SMTPUsername { get; set; }
        public string SMTPPassword { get; set; }
        public string SMTPPort { get; set; }
        public bool? SMTPEnableSSL { get; set; }

        public string SpamQuestion { get; set; }
        public string SpamAnswer { get; set; }
        public bool? EnableAkisment { get; set; }
        public string AkismentKey { get; set; }
        public string CurrentDatabaseVersion { get; set; }

        public bool? EnablePolls { get; set; }

        public bool? SuspendRegistration { get; set; }

        public virtual MembershipRole NewMemberStartingRole { get; set; }
        public virtual Language DefaultLanguage { get; set; }
    }
}
