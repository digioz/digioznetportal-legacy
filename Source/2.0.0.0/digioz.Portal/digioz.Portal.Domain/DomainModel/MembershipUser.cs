using System;
using System.Linq;
using System.Collections.Generic;
using digioz.Portal.Utilities;
using System.Data.SqlTypes;

namespace digioz.Portal.Domain.DomainModel
{
    /// <summary>
    /// Status values returned when creating a user
    /// </summary>
    public enum MembershipCreateStatus
    {
        Success,
        DuplicateUserName,
        DuplicateEmail,
        InvalidPassword,
        InvalidEmail,
        InvalidAnswer,
        InvalidQuestion,
        InvalidUserName,
        ProviderError,
        UserRejected
    }

    /// <summary>
    /// A membership user 
    /// </summary>
    public class MembershipUser : Entity
    {
        public MembershipUser()
        {
            this.Id = Guid.NewGuid().ToString();
            this.UserClaims = new HashSet<UserClaim>();
            this.UserLogins = new HashSet<UserLogin>();
            this.Roles = new HashSet<MembershipRole>();
            this.Profiles = new HashSet<Profile>();
            this.CreateDate = DateTime.UtcNow;
            this.LastPasswordChangedDate = DateTime.UtcNow;
            this.LastLockoutDate = (DateTime)SqlDateTime.MinValue;
            this.LastLoginDate = DateTime.UtcNow;
            this.IsApproved = true;
            this.IsLockedOut = false;
            this.FailedPasswordAnswerAttempt = 0;
            this.FailedPasswordAttemptCount = 0;
      }
        public string Id { get; set; }
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
        public string SecurityStamp { get; set; }
        public string Discriminator { get; set; }
/*
        public Guid GId
        {
            get { return Guid.Parse(Id); }
            set { Id = value.ToString(); }
        }
 */
        public string Password { get; set; }
        public string PasswordQuestion { get; set; }
        public string PasswordAnswer { get; set; }
        public bool IsApproved { get; set; }
        public bool IsLockedOut { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastLoginDate { get; set; }
        public DateTime LastPasswordChangedDate { get; set; }
        public DateTime LastLockoutDate { get; set; }
        public DateTime? LastActivityDate { get; set; }
        public int FailedPasswordAttemptCount { get; set; }
        public int FailedPasswordAnswerAttempt { get; set; }
        public string Comment { get; set; }
        public string Slug { get; set; }

        public bool? DisableEmailNotifications { get; set; }
        public bool? DisablePosting { get; set; }
        public bool? DisablePrivateMessages { get; set; }
        public bool? DisableFileUploads { get; set; }

        public virtual ICollection<UserClaim> UserClaims { get; set; }
        public virtual ICollection<UserLogin> UserLogins { get; set; }
        public virtual ICollection<MembershipRole> Roles { get; set; }

     //   public virtual IList<MembershipRole> Roles { get; set; }
        public virtual IList<Post> Posts { get; set; }
        public virtual IList<Topic> Topics { get; set; }
        public virtual IList<Vote> Votes { get; set; }
        public virtual IList<Badge> Badges { get; set; }
        public virtual IList<BadgeTypeTimeLastChecked> BadgeTypesTimeLastChecked { get; set; }

        public virtual IList<CategoryNotification> CategoryNotifications { get; set; }
        public virtual IList<TopicNotification> TopicNotifications { get; set; }
        public virtual IList<MembershipUserPoints> Points { get; set; }

        public virtual IList<PrivateMessage> PrivateMessagesReceived { get; set; }
        public virtual IList<PrivateMessage> PrivateMessagesSent { get; set; }

        public virtual IList<Poll> Polls { get; set; }
        public virtual IList<PollVote> PollVotes { get; set; }



        public virtual ICollection<Announcement> Announcements { get; set; }
        public virtual ICollection<Menu> Menus { get; set; }
        public virtual ICollection<Page> Pages { get; set; }
        public virtual ICollection<Profile> Profiles { get; set; }
        public virtual ICollection<Picture> Pictures { get; set; }
        public virtual ICollection<Video> Videos { get; set; }
        public int TotalPoints 
        { 
            get {
                return Points != null ? Points.Select(x => x.Points).Sum() : 0;
            }
        }

        public string NiceUrl
        {

            get
            {
                return UrlTypes.GenerateUrl(UrlType.Member, Slug); 
            }
        }
    }
}
