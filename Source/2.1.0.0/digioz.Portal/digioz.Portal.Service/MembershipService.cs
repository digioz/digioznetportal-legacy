using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.Security;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Interfaces.Repositories;
using digioz.Portal.Domain.Interfaces.Services;
using digioz.Portal.Utilities;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace digioz.Portal.Services
{
    public class MembershipService : IMembershipService
    {
        private const int SaltSize = 24;
        private readonly IEmailService _emailService;
        private readonly IMembershipRepository _membershipRepository;
        private readonly ISettingsRepository _settingsRepository;
        private readonly IActivityService _activityService;
        private readonly ILocalizationService _localizationService;
        private readonly IPrivateMessageService _privateMessageService;
        private readonly IMembershipUserPointsService _membershipUserPointsService;
        private readonly ITopicNotificationService _topicNotificationService;
        private readonly IVoteService _voteService;
        private readonly IBadgeService _badgeService;
        private readonly ICategoryNotificationService _categoryNotificationService;
        private readonly ILoggingService _loggingService;

        private LoginAttemptStatus _lastLoginStatus = LoginAttemptStatus.LoginSuccessful;
        private readonly UserManager<ApplicationUser> _userManager;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="membershipRepository"> </param>
        /// <param name="settingsRepository"> </param>
        /// <param name="emailService"> </param>
        /// <param name="localizationService"> </param>
        /// <param name="activityService"> </param>
        /// <param name="privateMessageService"> </param>
        /// <param name="membershipUserPointsService"> </param>
        /// <param name="topicNotificationService"> </param>
        /// <param name="voteService"> </param>
        /// <param name="badgeService"> </param>
        /// <param name="categoryNotificationService"> </param>
        /// <param name="api"> </param>
        /// <param name="loggingService"></param>
        public MembershipService(IMembershipRepository membershipRepository, ISettingsRepository settingsRepository,
            IEmailService emailService, ILocalizationService localizationService, IActivityService activityService, 
            IPrivateMessageService privateMessageService, IMembershipUserPointsService membershipUserPointsService, 
            ITopicNotificationService topicNotificationService, IVoteService voteService, IBadgeService badgeService,
            ICategoryNotificationService categoryNotificationService, ILoggingService loggingService)
        {
            _membershipRepository = membershipRepository;
            _settingsRepository = settingsRepository;
            _emailService = emailService;
            _localizationService = localizationService;
            _activityService = activityService;
            _privateMessageService = privateMessageService;
            _membershipUserPointsService = membershipUserPointsService;
            _topicNotificationService = topicNotificationService;
            _voteService = voteService;
            _badgeService = badgeService;
            _categoryNotificationService = categoryNotificationService;
            _loggingService = loggingService;
            _userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
        }


        public MembershipUser SanitizeUser(MembershipUser membershipUser)
        {
            membershipUser.Profiles.First().Email = StringUtils.SafePlainText(membershipUser.Profiles.First().Email);
            membershipUser.Profiles.First().Address = StringUtils.SafePlainText(membershipUser.Profiles.First().Address);
            membershipUser.Profiles.First().Address2 = StringUtils.SafePlainText(membershipUser.Profiles.First().Address2);
            membershipUser.Profiles.First().City = StringUtils.SafePlainText(membershipUser.Profiles.First().City);
            membershipUser.Profiles.First().State = StringUtils.SafePlainText(membershipUser.Profiles.First().State);
            membershipUser.Profiles.First().Zip = StringUtils.SafePlainText(membershipUser.Profiles.First().Zip);
            membershipUser.Profiles.First().Country = StringUtils.SafePlainText(membershipUser.Profiles.First().Country);
            membershipUser.Profiles.First().Signature = StringUtils.SafePlainText(membershipUser.Profiles.First().Signature);
            membershipUser.Profiles.First().Avatar = StringUtils.SafePlainText(membershipUser.Profiles.First().Avatar);
            membershipUser.Comment = StringUtils.SafePlainText(membershipUser.Comment);
            membershipUser.PasswordHash = StringUtils.SafePlainText(membershipUser.PasswordHash);
            membershipUser.PasswordAnswer = StringUtils.SafePlainText(membershipUser.PasswordAnswer);
            membershipUser.PasswordQuestion = StringUtils.SafePlainText(membershipUser.PasswordQuestion);
            //membershipUser.Signature = StringUtils.GetSafeHtml(membershipUser.Signature);
            membershipUser.UserName = StringUtils.SafePlainText(membershipUser.UserName);
            return membershipUser;
        }


        /// <summary>
        /// Create a salt for the password hash (just makes it a bit more complex)
        /// </summary>
        /// <param name="size"></param>
        /// <returns></returns>
        private static string CreateSalt(int size)
        {
            // Generate a cryptographic random number.
            var rng = new RNGCryptoServiceProvider();
            var buff = new byte[size];
            rng.GetBytes(buff);

            // Return a Base64 string representation of the random number.
            return Convert.ToBase64String(buff);
        }

        /// <summary>
        /// Generate a hash for a password, adding a salt value
        /// </summary>
        /// <param name="plainText"></param>
        /// <param name="salt"></param>
        /// <returns></returns>
        private static string GenerateSaltedHash(string plainText, string salt)
        {
            // http://stackoverflow.com/questions/2138429/hash-and-salt-passwords-in-c-sharp

            var plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            var saltBytes = Encoding.UTF8.GetBytes(salt);

            // Combine the two lists
            var plainTextWithSaltBytes = new List<byte>(plainTextBytes.Length + saltBytes.Length);
            plainTextWithSaltBytes.AddRange(plainTextBytes);
            plainTextWithSaltBytes.AddRange(saltBytes);

            // Produce 256-bit hashed value i.e. 32 bytes
            HashAlgorithm algorithm = new SHA256Managed();
            var byteHash = algorithm.ComputeHash(plainTextWithSaltBytes.ToArray());
            return Convert.ToBase64String(byteHash);
        }

        

        #region Status Codes
        public string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return _localizationService.GetResourceString("Members.Errors.DuplicateUserName");

                case MembershipCreateStatus.DuplicateEmail:
                    return _localizationService.GetResourceString("Members.Errors.DuplicateEmail");

                case MembershipCreateStatus.InvalidPassword:
                    return _localizationService.GetResourceString("Members.Errors.InvalidPassword");

                case MembershipCreateStatus.InvalidEmail:
                    return _localizationService.GetResourceString("Members.Errors.InvalidEmail");

                case MembershipCreateStatus.InvalidAnswer:
                    return _localizationService.GetResourceString("Members.Errors.InvalidAnswer");

                case MembershipCreateStatus.InvalidQuestion:
                    return _localizationService.GetResourceString("Members.Errors.InvalidQuestion");

                case MembershipCreateStatus.InvalidUserName:
                    return _localizationService.GetResourceString("Members.Errors.InvalidUserName");

                case MembershipCreateStatus.ProviderError:
                    return _localizationService.GetResourceString("Members.Errors.ProviderError");

                case MembershipCreateStatus.UserRejected:
                    return _localizationService.GetResourceString("Members.Errors.UserRejected");

                default:
                    return _localizationService.GetResourceString("Members.Errors.Unknown");
            }
        }
        #endregion

        /// <summary>
        /// Return last login status
        /// </summary>
        public LoginAttemptStatus LastLoginStatus
        {
            get { return _lastLoginStatus; }
        }

        /// <summary>
        /// Validate a user by password
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="maxInvalidPasswordAttempts"> </param>
        /// <returns></returns>
        public bool ValidateUser(string userName, string password, int maxInvalidPasswordAttempts)
        {
            userName = StringUtils.SafePlainText(userName);
            password = StringUtils.SafePlainText(password);

            _lastLoginStatus = LoginAttemptStatus.LoginSuccessful;

            var user = _membershipRepository.GetUser(userName);

            if (user == null)
            {
                _lastLoginStatus = LoginAttemptStatus.UserNotFound;
                return false;
            }

            if (user.IsLockedOut)
            {
                _lastLoginStatus = LoginAttemptStatus.UserLockedOut;
                return false;
            }

            if (!user.IsApproved)
            {
                _lastLoginStatus = LoginAttemptStatus.UserNotApproved;
                return false;
            }

            var allowedPasswordAttempts = maxInvalidPasswordAttempts;
            if (user.FailedPasswordAttemptCount >= allowedPasswordAttempts)
            {
                _lastLoginStatus = LoginAttemptStatus.PasswordAttemptsExceeded;
                return false;
            }

            var passwordMatches = _userManager.Find(userName, password) != null;

            user.FailedPasswordAttemptCount = passwordMatches ? 0 : user.FailedPasswordAttemptCount + 1;

            if (user.FailedPasswordAttemptCount >= allowedPasswordAttempts)
            {
                user.IsLockedOut = true;
                user.LastLockoutDate = DateTime.UtcNow;
            }

            if (!passwordMatches)
            {
                _lastLoginStatus = LoginAttemptStatus.PasswordIncorrect;
                return false;
            }

            return _lastLoginStatus == LoginAttemptStatus.LoginSuccessful;
        }

        /// <summary>
        /// Creates a new, unsaved user, with default (empty) values
        /// </summary>
        /// <returns></returns>
        public MembershipUser CreateEmptyUser()
        {
            var now = DateTime.UtcNow;

            var newMemberUser = new MembershipUser
                       {
                           UserName = string.Empty,
                           PasswordHash = string.Empty,
                           Password = string.Empty,
                           PasswordQuestion = string.Empty,
                           PasswordAnswer = string.Empty,
                           CreateDate = now,
                           FailedPasswordAnswerAttempt = 0,
                           FailedPasswordAttemptCount = 0,
                           LastLockoutDate = (DateTime)SqlDateTime.MinValue,
                           LastPasswordChangedDate = now,
                           IsApproved = false,
                           IsLockedOut = false,
                           LastLoginDate = (DateTime)SqlDateTime.MinValue,
                       };
            newMemberUser.Profiles.Add(
                   new Profile 
                   {
                       Email = string.Empty,
                       Birthday = null,
                       BirthdayVisible = true,
                       Address = string.Empty,
                       Address2 = string.Empty,
                       City = string.Empty,
                       State = string.Empty,
                       Zip = string.Empty,
                       Country = string.Empty,
                       Signature = string.Empty,
                       Avatar = string.Empty,
                   }
                );

            return newMemberUser;
        }

        /// <summary>
        /// Create new user
        /// </summary>
        /// <param name="newUser"></param>
        /// <returns></returns>
/*
        public MembershipCreateStatus CreateUser(MembershipUser newUser)
        {
            newUser = SanitizeUser(newUser);

            var status = MembershipCreateStatus.Success;

            if (string.IsNullOrEmpty(newUser.UserName))
            {
                status = MembershipCreateStatus.InvalidUserName;
            }

            // get by username
            if (_membershipRepository.GetUser(newUser.UserName) != null)
            {
                status = MembershipCreateStatus.DuplicateUserName;
            }

            // Add get by email address
            if (_membershipRepository.GetUserByEmail(newUser.Profiles.First().Email) != null)
            {
                status = MembershipCreateStatus.DuplicateEmail;
            }

            if (string.IsNullOrEmpty(newUser.Password))
            {
                status = MembershipCreateStatus.InvalidPassword;
            }

            if (status == MembershipCreateStatus.Success)
            {

                // Set dates
                newUser.CreateDate = newUser.LastPasswordChangedDate = DateTime.UtcNow;
                newUser.LastLockoutDate = (DateTime)SqlDateTime.MinValue;
                newUser.LastLoginDate = DateTime.UtcNow;

                newUser.IsApproved = !_settingsRepository.GetSettings().ManuallyAuthoriseNewMembers;
                newUser.IsLockedOut = false;

                // url generator
                newUser.Slug = ServiceHelpers.GenerateSlug(newUser.UserName, x => _membershipRepository.GetUserBySlugLike(ServiceHelpers.CreateUrl(newUser.UserName)));            

                try
                {
                    var user = new ApplicationUser()
                    {
                        UserName = newUser.UserName,
                        PasswordQuestion = newUser.PasswordQuestion,
                        PasswordAnswer = newUser.PasswordAnswer,
                        IsApproved = newUser.IsApproved,
                        IsLockedOut = newUser.IsLockedOut,
                        CreateDate = newUser.CreateDate,
                        LastLoginDate = newUser.LastLoginDate,
                        LastPasswordChangedDate = newUser.LastPasswordChangedDate,
                        LastLockoutDate = newUser.LastLockoutDate,
                        LastActivityDate = newUser.LastActivityDate,
                        FailedPasswordAttemptCount = newUser.FailedPasswordAttemptCount,
                        FailedPasswordAnswerAttempt = newUser.FailedPasswordAnswerAttempt,
                        Comment = newUser.Comment,
                        Slug = newUser.Slug,
                        DisableEmailNotifications = newUser.DisableEmailNotifications,
                        DisablePosting = newUser.DisablePosting,
                        DisablePrivateMessages = newUser.DisablePrivateMessages,
                        DisableFileUploads = newUser.DisableFileUploads,

                    };

                    var password = newUser.Password;
                    var userEmail = newUser.Profiles.First().Email;

                    var result = _userManager.Create(user, password);
                    newUser = _membershipRepository.Get(user.Id);
                    newUser.Profiles.Add (new Profile{Email = userEmail});

                    newUser.Roles = new List<MembershipRole> { _settingsRepository.GetSettings().NewMemberStartingRole };
                    _membershipRepository.Update(newUser);

                    if (_settingsRepository.GetSettings().EmailAdminOnNewMemberSignUp)
                    {
                        var sb = new StringBuilder();
                        sb.AppendFormat("<p>{0}</p>", string.Format(_localizationService.GetResourceString("Members.NewMemberRegistered"), _settingsRepository.GetSettings().ForumName, _settingsRepository.GetSettings().ForumUrl));
                        sb.AppendFormat("<p>{0} - {1}</p>", newUser.UserName, newUser.Profiles.First().Email);
                        var email = new Email
                                        {
                                            EmailTo = _settingsRepository.GetSettings().AdminEmailAddress,
                                            EmailFrom = _settingsRepository.GetSettings().NotificationReplyEmail,
                                            NameTo = _localizationService.GetResourceString("Members.Admin"),
                                            Subject = _localizationService.GetResourceString("Members.NewMemberSubject")
                                        };
                            email.Body = _emailService.EmailTemplate(email.NameTo, sb.ToString());
                        _emailService.SendMail(email);
                    }

                    _activityService.MemberJoined(newUser);
                }
                catch (Exception)
                {
                    status = MembershipCreateStatus.UserRejected;
                }
            }

            return status;
        }
*/
        public string GenerateSlug(string userName)
        {
            return ServiceHelpers.GenerateSlug(userName, x => _membershipRepository.GetUserBySlugLike(ServiceHelpers.CreateUrl(userName)));            
        }

        /// <summary>
        /// Get a user by username
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public MembershipUser GetUser(string username)
        {            
            var member = _membershipRepository.GetUser(username);

            // Do a check to log out the user if they are logged in and have been deleted
            if (member == null && HttpContext.Current.User.Identity.Name == username)
            {
                // Member is null so doesn't exist, yet they are logged in with that username - Log them out
                FormsAuthentication.SignOut();
            }

            return member;
        }

        /// <summary>
        /// Get a user by email address
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public MembershipUser GetUserByEmail(string email)
        {
            email = StringUtils.SafePlainText(email);
            return _membershipRepository.GetUserByEmail(email);
        }

        /// <summary>
        /// Get a user by slug
        /// </summary>
        /// <param name="slug"></param>
        /// <returns></returns>
        public MembershipUser GetUserBySlug(string slug)
        {
            slug = StringUtils.GetSafeHtml(slug);
            return _membershipRepository.GetUserBySlug(slug);
        }


        /// <summary>
        /// Get users from a list of Id's
        /// </summary>
        /// <param name="guids"></param>
        /// <returns></returns>
        public IList<MembershipUser> GetUsersById(List<string> guids)
        {
            return _membershipRepository.GetUsersById(guids);
        }

        /// <summary>
        /// Get by posts and date
        /// </summary>
        /// <param name="amoutOfDaysSinceRegistered"></param>
        /// <param name="amoutOfPosts"></param>
        /// <returns></returns>
        public IList<MembershipUser> GetUsersByDaysPostsPoints(int amoutOfDaysSinceRegistered, int amoutOfPosts)
        {
            return _membershipRepository.GetUsersByDaysPostsPoints(amoutOfDaysSinceRegistered, amoutOfPosts);
        }


        /// <summary>
        /// Return the roles found for this username
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public string[] GetRolesForUser(string username)
        {
            username = StringUtils.SafePlainText(username);
            var roles = new List<string>();
            var user = _membershipRepository.GetUser(username);

            if (user != null)
            {
                roles.AddRange(user.Roles.Select(role => role.RoleName));
            }

            return roles.ToArray();
        }

        /// <summary>
        /// Change the user's password
        /// </summary>
        /// <param name="user"> </param>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        public bool ChangePassword(MembershipUser user, string oldPassword, string newPassword)
        {
            var result = _userManager.ChangePassword(user.Id, oldPassword, newPassword);
            if (!result.Succeeded)
            {
                return false;
            }
            //n3oCacheHelper.Clear(user.UserName);
            var existingUser = _membershipRepository.Get(user.Id);

            user.Password = newPassword;
            user.PasswordHash = existingUser.PasswordHash;
            user.LastPasswordChangedDate = existingUser.LastPasswordChangedDate = DateTime.UtcNow;

            return true;
        }

        /// <summary>
        /// Reset a users password
        /// </summary>
        /// <param name="user"></param>
        /// <param name="newPassword"> </param>
        /// <returns></returns>
        public bool ResetPassword(MembershipUser user, string newPassword)
        {
            if (!_userManager.RemovePassword(user.Id).Succeeded)
                return false;
            if (!_userManager.AddPassword(user.Id, newPassword).Succeeded)
                return false;

            var existingUser = _membershipRepository.Get(user.Id);

            user.Password = newPassword;
            user.PasswordHash = existingUser.PasswordHash;
            user.LastPasswordChangedDate = existingUser.LastPasswordChangedDate = DateTime.UtcNow;
            return true;
        }

        /// <summary>
        /// Get all members
        /// </summary>
        /// <returns></returns>
        public IList<MembershipUser> GetAll()
        {
            return _membershipRepository.GetAll();
        }

        public PagedList<MembershipUser> GetAll(int pageIndex, int pageSize)
        {
            return _membershipRepository.GetAll(pageIndex, pageSize);
        }

        public PagedList<MembershipUser> SearchMembers(string search, int pageIndex, int pageSize)
        {
            return _membershipRepository.SearchMembers(StringUtils.SafePlainText(search), pageIndex, pageSize);
        }

        public IList<MembershipUser> SearchMembers(string username, int amount)
        {
            return _membershipRepository.SearchMembers(StringUtils.SafePlainText(username), amount);
        }

        public IList<MembershipUser> GetActiveMembers()
        {
            return _membershipRepository.GetActiveMembers();
        }

        /// <summary>
        /// Get user by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public MembershipUser GetUserById(string id)
        {
            return _membershipRepository.Get(id);
        }

        /// <summary>
        /// Delete a member
        /// </summary>
        /// <param name="user"></param>
        public bool Delete(MembershipUser user)
        {
            try
            {
                // Delete all private messages from this user
                var msgsToDelete = new List<PrivateMessage>();
                msgsToDelete.AddRange(user.PrivateMessagesSent);
                foreach (var msgToDelete in msgsToDelete)
                {
                    _privateMessageService.DeleteMessage(msgToDelete);
                }

                msgsToDelete.Clear();
                msgsToDelete.AddRange(user.PrivateMessagesReceived);
                foreach (var msgToDelete in msgsToDelete)
                {
                    _privateMessageService.DeleteMessage(msgToDelete);
                }

                // Delete all badge times last checked
                var badgeTypesTimeLastCheckedToDelete = new List<BadgeTypeTimeLastChecked>();
                badgeTypesTimeLastCheckedToDelete.AddRange(user.BadgeTypesTimeLastChecked);
                foreach (var badgeTypeTimeLastCheckedToDelete in badgeTypesTimeLastCheckedToDelete)
                {
                    _badgeService.DeleteTimeLastChecked(badgeTypeTimeLastCheckedToDelete);
                }

                // Delete all points from this user
                var pointsToDelete = new List<MembershipUserPoints>();
                pointsToDelete.AddRange(user.Points);
                foreach (var pointToDelete in pointsToDelete)
                {
                    _membershipUserPointsService.Delete(pointToDelete);
                }

                // Delete all topic notifications
                var topicNotificationsToDelete = new List<TopicNotification>();
                topicNotificationsToDelete.AddRange(user.TopicNotifications);
                foreach (var topicNotificationToDelete in topicNotificationsToDelete)
                {
                    _topicNotificationService.Delete(topicNotificationToDelete);
                }

                // Delete all user's votes
                var votesToDelete = new List<Vote>();
                votesToDelete.AddRange(user.Votes);
                foreach (var voteToDelete in votesToDelete)
                {
                    _voteService.Delete(voteToDelete);
                }

                // Delete all user's badges
                var badgesToDelete = new List<Badge>();
                badgesToDelete.AddRange(user.Badges);
                foreach (var badgeToDelete in badgesToDelete)
                {
                    _badgeService.Delete(badgeToDelete);
                }

                // Delete all user's category notifications
                var categoryNotificationsToDelete = new List<CategoryNotification>();
                categoryNotificationsToDelete.AddRange(user.CategoryNotifications);
                foreach (var categoryNotificationToDelete in categoryNotificationsToDelete)
                {
                    _categoryNotificationService.Delete(categoryNotificationToDelete);
                }

                // Just clear the roles, don't delete them
                user.Roles.Clear();

                _membershipRepository.Delete(user);

                return true;
            }
            catch (Exception ex)
            {
                _loggingService.Error(ex);
            }
            return false;
        }

        public IList<MembershipUser> GetLatestUsers(int amountToTake)
        {
            return _membershipRepository.GetLatestUsers(amountToTake);
        }

        public IList<MembershipUser> GetLowestPointUsers(int amountToTake)
        {
            return _membershipRepository.GetLowestPointUsers(amountToTake);
        }

        public int MemberCount()
        {
            return _membershipRepository.MemberCount();
        }

        /// <summary>
        /// Save user (does NOT update password data)
        /// </summary>
        /// <param name="user"></param>
        public void Save(MembershipUser user)
        {

            user = SanitizeUser(user);

            _membershipRepository.Update(user);
        }

        /// <summary>
        /// Save user (does NOT update password data)
        /// </summary>
        /// <param name="user"></param>
        public void ProfileUpdated(MembershipUser user)
        {
            _activityService.ProfileUpdated(user);
        }

        /// <summary>
        /// Unlock a user
        /// </summary>
        /// <param name="username"></param>
        /// <param name="resetPasswordAttempts">If true, also reset password attempts to zero</param>
        public void UnlockUser(string username, bool resetPasswordAttempts)
        {
            {
                var user = GetUser(username);

                if (user == null)
                {
                    throw new ApplicationException(_localizationService.GetResourceString("Members.CantUnlock"));
                }

                var existingUser = _membershipRepository.Get(user.Id);

                user.IsLockedOut = false;
                user.Roles = existingUser.Roles;
                user.Votes = existingUser.Votes;
                user.Password = existingUser.Password;
                user.PasswordHash = existingUser.PasswordHash;

                if (resetPasswordAttempts)
                {
                    user.FailedPasswordAnswerAttempt = 0;
                }

                _membershipRepository.Update(user);
            }
        }

        /// <summary>
        /// Convert all users into CSV format (e.g. for export)
        /// </summary>
        /// <returns></returns>
        public string ToCsv()
        {
            var csv = new StringBuilder();

            foreach (var user in _membershipRepository.GetAll())
            {
                csv.AppendFormat("{0},{1},{2},{3},{4}", user.UserName, user.Profiles.First().Email, user.CreateDate,
                    user.Profiles.First().Birthday, user.Profiles.First().Signature);
                csv.AppendLine();
            }

            return csv.ToString();
        }

        /// <summary>
        /// Extract users from CSV format and import them
        /// </summary>
        /// <returns></returns>
        public CsvReport FromCsv(List<string> allLines)
        {
            var usersProcessed = new List<string>();
            var commaSeparator = new[] { ',' };
            var report = new CsvReport();

            if (allLines == null || allLines.Count == 0)
            {
                report.Errors.Add(new CsvErrorWarning
                {
                    ErrorWarningType = CsvErrorWarningType.BadDataFormat,
                    Message = "No users found."
                });
                return report;
            }

            var lineCounter = 0;
            foreach (var line in allLines)
            {
                try
                {
                    lineCounter++;

                    // Each line is made up of n items in a predefined order

                    var values = line.Split(commaSeparator);

                    if (values.Length < 2)
                    {
                        report.Errors.Add(new CsvErrorWarning
                        {
                            ErrorWarningType = CsvErrorWarningType.MissingKeyOrValue,
                            Message = string.Format("Line {0}: insufficient values supplied.", lineCounter)
                        });

                        continue;
                    }

                    var userName = values[0];

                    if (userName.IsNullEmpty())
                    {
                        report.Errors.Add(new CsvErrorWarning
                        {
                            ErrorWarningType = CsvErrorWarningType.MissingKeyOrValue,
                            Message = string.Format("Line {0}: no username supplied.", lineCounter)
                        });

                        continue;
                    }

                    var email = values[1];
                    if (email.IsNullEmpty())
                    {
                        report.Errors.Add(new CsvErrorWarning
                        {
                            ErrorWarningType = CsvErrorWarningType.MissingKeyOrValue,
                            Message = string.Format("Line {0}: no email supplied.", lineCounter)
                        });

                        continue;
                    }

                    // get the user
                    var userToImport = _membershipRepository.GetUser(userName);

                    if (userToImport != null)
                    {
                        report.Errors.Add(new CsvErrorWarning
                        {
                            ErrorWarningType = CsvErrorWarningType.AlreadyExists,
                            Message = string.Format("Line {0}: user already exists in forum.", lineCounter)
                        });

                        continue;
                    }

                    if (usersProcessed.Contains(userName))
                    {
                        report.Errors.Add(new CsvErrorWarning
                        {
                            ErrorWarningType = CsvErrorWarningType.AlreadyExists,
                            Message = string.Format("Line {0}: user already exists in import file.", lineCounter)
                        });

                        continue;
                    }

                    usersProcessed.Add(userName);

                    userToImport = CreateEmptyUser();
                    userToImport.UserName = userName;
                    userToImport.Slug = ServiceHelpers.GenerateSlug(userToImport.UserName, x => _membershipRepository.GetUserBySlugLike(ServiceHelpers.CreateUrl(userToImport.UserName)));
                    userToImport.Profiles.First().Email = email;
                    userToImport.IsApproved = true;

                    string createDateStr = null;
                    if (values.Length >= 3)
                    {
                        createDateStr = values[2];
                    }
                    userToImport.CreateDate = createDateStr.IsNullEmpty() ? DateTime.UtcNow : DateTime.Parse(createDateStr);

                    if (values.Length >= 4)
                    {
                        createDateStr = values[3];
                    }
                    userToImport.Profiles.First().Birthday = createDateStr.IsNullEmpty() ? DateTime.UtcNow : DateTime.Parse(createDateStr); ;

                    if (values.Length >= 5)
                    {
                        userToImport.Profiles.First().Signature = values[4];
                    }

                    _membershipRepository.Add(userToImport);
                }
                catch (Exception ex)
                {
                    report.Errors.Add(new CsvErrorWarning { ErrorWarningType = CsvErrorWarningType.GeneralError, Message = ex.Message });
                }
            }

            return report;
        }

    }
}
