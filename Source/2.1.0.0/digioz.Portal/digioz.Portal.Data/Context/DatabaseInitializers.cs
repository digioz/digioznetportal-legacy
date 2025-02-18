using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Data.Entity;
using System.Globalization;
using System.Text;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Domain.Constants;
using digioz.Portal.Utilities;
using digioz.Portal.Domain.Interfaces.Services;


namespace digioz.Portal.Data.Context
{
   // public class MemberInitializer : UpgradeDatabaseInitializer<MVCTestContext>
    public class DatabaseInitializer : DropCreateDatabaseIfModelChanges<digiozPortalEntities>
    {
        private digiozPortalEntities _context;
        private void Add(Language language)
        {

            // Make sure that the new language has a set of empty resources
            language.LocaleStringResources = new List<LocaleStringResource>();
            _context.Language.Add(language);
        }
        private Language Add(CultureInfo cultureInfo)
        {
            // Create a domain language object
            var language = new Language
            {
                Name = cultureInfo.EnglishName,
                LanguageCulture = cultureInfo.Name,
            };

            Add(language);

            return language;
        }
        private LocaleResourceKey Add(LocaleResourceKey newLocaleResourceKey)
        {

            // Trim name to stop any issues
            newLocaleResourceKey.Name = newLocaleResourceKey.Name.Trim();

            // Check to see if a respource key of this name already exists
            var existingResourceKey = _context.LocaleResourceKey.FirstOrDefault(x => x.Name.Trim() == newLocaleResourceKey.Name);

            if (existingResourceKey != null)
            {
                throw new ApplicationException(string.Format("The resource key with name '{0}' already exists.", newLocaleResourceKey.Name));
            }

            newLocaleResourceKey.DateAdded = DateTime.UtcNow;

            // Now add an empty value for each language
            newLocaleResourceKey.LocaleStringResources = new List<LocaleStringResource>();
            foreach (var language in _context.Language.ToList())
            {
                var resourceValue = new LocaleStringResource
                {
                    Language = language,
                    LocaleResourceKey = newLocaleResourceKey,
                    ResourceValue = string.Empty
                };

                language.LocaleStringResources.Add(resourceValue);
            }

            //Sanitze
            // newLocaleResourceKey = SanitizeLocaleResourceKey(newLocaleResourceKey);

            // Add the key
            return _context.LocaleResourceKey.Add(newLocaleResourceKey);
        }

        private Language FromCsv(string langKey, List<string> allLines)
        {
            var commaSeparator = new[] { ',' };
            var report = new CsvReport();

            if (allLines == null || allLines.Count == 0)
            {
                report.Errors.Add(new CsvErrorWarning
                {
                    ErrorWarningType = CsvErrorWarningType.BadDataFormat,
                    Message = "No language keys or values found."
                });
                return null;
            }

            // Look up the language and culture
            Language language;

            var cultureInfo = LanguageUtils.GetCulture(langKey);

            if (cultureInfo == null)
            {
                report.Errors.Add(new CsvErrorWarning
                {
                    ErrorWarningType = CsvErrorWarningType.DoesNotExist,
                    Message = string.Format("The language culture '{0}' does not exist.", langKey)
                });

                return null;
            }

            // See if this language exists already, and if not then create it
            language = Add(cultureInfo);


            var lineCounter = 0;
            foreach (var line in allLines)
            {
                lineCounter++;

                var keyValuePair = line.Split(commaSeparator);

                if (keyValuePair.Length < 2)
                {
                    report.Errors.Add(new CsvErrorWarning
                    {
                        ErrorWarningType = CsvErrorWarningType.MissingKeyOrValue,
                        Message = string.Format("Line {0}: a key and a value are required.", lineCounter)
                    });

                    continue;
                }

                var key = keyValuePair[0];

                if (string.IsNullOrEmpty(key))
                {
                    // Ignore empty keys
                    continue;
                }
                key = key.Trim();

                var value = keyValuePair[1];


                // If key does not exist, it is a new one to be created
                var resourceKey = new LocaleResourceKey
                                    {
                                        Name = key,
                                        DateAdded = DateTime.UtcNow,
                                    };

                Add(resourceKey);
                report.Warnings.Add(new CsvErrorWarning
                {
                    ErrorWarningType = CsvErrorWarningType.NewKeyCreated,
                    Message = string.Format("A new key named '{0}' has been created, and will require a value in all languages.", key)
                });

                // In the new language (only) set the value for the resource

                {
                    // No string resources have been created, so most probably
                    // this is the installer creating the keys so we need to create the 
                    // string resource to go with it and add it
                    var stringResource = new LocaleStringResource
                        {
                            Language = language,
                            LocaleResourceKey = resourceKey,
                            ResourceValue = value
                        };
                    _context.LocaleStringResource.Add(stringResource);
                }
            }

            return language;
        }

        private Language AddOrUpdateTheDefaultLanguageStrings()
        {
            // Read in CSV and import like it does normally in the admin section
            var report = new CsvReport();

            // Get the base language file
            var file = System.Web.HttpContext.Current.Server.MapPath(@"~/Installer/en-US.csv");

            // Verify that the user selected a file
            if (file != null)
            {
                // Unpack the data
                var allLines = new List<string>();
                using (var streamReader = new StreamReader(file, System.Text.Encoding.UTF8, true))
                {
                    while (streamReader.Peek() >= 0)
                    {
                        allLines.Add(streamReader.ReadLine());
                    }
                }

                // Read the CSV file and generate a language
                return FromCsv("en-US", allLines);
            }
            return null;
        }

        private void InitializePermission(Category startingCategory, MembershipRole startingRole)
        {
            var readOnly = new Permission { Name = "Read Only" };
            var deletePosts = new Permission { Name = "Delete Posts" };
            var editPosts = new Permission { Name = "Edit Posts" };
            var stickyTopics = new Permission { Name = "Sticky Topics" };
            var lockTopics = new Permission { Name = "Lock Topics" };
            var voteInPolls = new Permission { Name = "Vote In Polls" };
            var createPolls = new Permission { Name = "Create Polls" };
            var createTopics = new Permission { Name = "Create Topics" };
            var attachFiles = new Permission { Name = "Attach Files" };
            var denyAccess = new Permission { Name = "Deny Access" };

            readOnly = _context.Permission.Add(readOnly);
            deletePosts = _context.Permission.Add(deletePosts);
            editPosts = _context.Permission.Add(editPosts);
            stickyTopics = _context.Permission.Add(stickyTopics);
            lockTopics = _context.Permission.Add(lockTopics);
            voteInPolls = _context.Permission.Add(voteInPolls);
            createPolls = _context.Permission.Add(createPolls);
            createTopics = _context.Permission.Add(createTopics);
            attachFiles = _context.Permission.Add(attachFiles);
            denyAccess = _context.Permission.Add(denyAccess);

            var categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = deletePosts,
                IsTicked = true
            };

            _context.CategoryPermissionForRole.Add(categoryPermissionForRole);

            categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = editPosts,
                IsTicked = true
            };
            _context.CategoryPermissionForRole.Add(categoryPermissionForRole);
  
            categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = voteInPolls,
                IsTicked = true
            };
            _context.CategoryPermissionForRole.Add(categoryPermissionForRole);
  
            categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = createPolls,
                IsTicked = true
            };
            _context.CategoryPermissionForRole.Add(categoryPermissionForRole); 
  
            categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = createTopics,
                IsTicked = true
            };
            _context.CategoryPermissionForRole.Add(categoryPermissionForRole);

            categoryPermissionForRole = new CategoryPermissionForRole
            {
                Category = startingCategory,
                MembershipRole = startingRole,
                Permission = attachFiles,
                IsTicked = true
            };
            _context.CategoryPermissionForRole.Add(categoryPermissionForRole);


        }

        private MembershipUser InitializeAdminUser()
        {
            var admin = new ApplicationUser()
            {
                UserName = "admin",
                IsApproved = true,
                IsLockedOut = false,
                DisableEmailNotifications = false,
                DisablePosting = false,
                DisablePrivateMessages = false,
                CreateDate = DateTime.UtcNow,
                LastPasswordChangedDate = DateTime.UtcNow,
                LastLockoutDate = (DateTime)DateTime.UtcNow,
                LastLoginDate = DateTime.UtcNow
            };
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var result = userManager.Create(admin, "password");

            if (!result.Succeeded)
                return null;

            var adminMember = _context.MembershipUser.Find(admin.Id);
            adminMember.Slug = "admin";
            adminMember.Profiles.Add(
                    new Profile()
                    {
                        Email = "webmaster@domain.com",
                        Birthday = null,
                        BirthdayVisible = true,
                        Address = null,
                        Address2 = null,
                        City = null,
                        State = null,
                        Zip = null,
                        Country = null,
                        Signature = null,
                        Avatar = null,
                    }
                );

            return adminMember;
        }

        private MembershipUser InitializeStandardUser()
        {
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var user = new ApplicationUser()
            {
                UserName = "user1",
                IsApproved = true,
                IsLockedOut = false,
                DisableEmailNotifications = false,
                DisablePosting = false,
                DisablePrivateMessages = false,
                CreateDate = DateTime.UtcNow,
                LastPasswordChangedDate = DateTime.UtcNow,
                LastLockoutDate = (DateTime)DateTime.UtcNow,
                LastLoginDate = DateTime.UtcNow
            };
            var result = userManager.Create(user, "password");
            if (!result.Succeeded)
                return null;

            var member = _context.MembershipUser.Find(user.Id);
            member.Slug = "user1";
            member.Profiles.Add(
                    new Profile()
                    {
                        Email = "user1@mail.com",
                        Birthday = new DateTime(1975, 7, 24),
                        BirthdayVisible = true,
                        Address = "1 Main Street",
                        Address2 = "Ste 100",
                        City = "Chicago",
                        State = "IL",
                        Zip = "60601",
                        Country = "USA",
                        Signature = "User One Some Company, Inc.",
                        Avatar = null,
                    }
                );

            return member;
        }

        private MembershipRole InitializeRole(MembershipUser adminUser, MembershipUser standardUser)
        {
            var adminRole = new MembershipRole() {/* GId = Guid.NewGuid(), */RoleName = AppConstants.AdminRoleName };
            var standardRole = new MembershipRole {/* GId = Guid.NewGuid(), */RoleName = "Standard Members" };
            var guestRole = new MembershipRole {/* GId = Guid.NewGuid(), */RoleName = "Guest" };
            var moderatorRole = new MembershipRole {/* GId = Guid.NewGuid(),*/ RoleName = "Moderator" };
            var rs = _context.MembershipRole.Add(adminRole);
            rs = _context.MembershipRole.Add(standardRole);
            rs = _context.MembershipRole.Add(guestRole);
            rs = _context.MembershipRole.Add(moderatorRole);

            standardUser.Roles.Add(standardRole);
            _context.Entry(standardUser).State = EntityState.Modified;


            adminUser.Roles.Add(adminRole);
            _context.Entry(adminUser).State = EntityState.Modified;

            return standardRole;
        }

        private Category InitializeCategory()
        {
            const string exampleCatName = "Example Category";
            var exampleCat = new Category { Name = exampleCatName };
            exampleCat.DateCreated = DateTime.UtcNow;
            exampleCat.Slug = StringUtils.CreateUrl(exampleCat.Name, "-");
            _context.Category.Add(exampleCat);
            return exampleCat;
        }

        private void InitializeSettings(MembershipRole role, Language lang)
        {

            // create the settings
            var settings = new Settings
            {
                ForumName = "Digioz Forum",
                ForumUrl = "http://www.mydomain.com",
                IsClosed = false,
                EnableRSSFeeds = true,
                DisplayEditedBy = true,
                EnablePostFileAttachments = false,
                EnableMarkAsSolution = true,
                EnableSpamReporting = true,
                EnableMemberReporting = true,
                EnableEmailSubscriptions = true,
                ManuallyAuthoriseNewMembers = false,
                EmailAdminOnNewMemberSignUp = true,
                TopicsPerPage = 20,
                PostsPerPage = 20,
                EnablePrivateMessages = true,
                MaxPrivateMessagesPerMember = 50,
                PrivateMessageFloodControl = 1,
                EnableSignatures = false,
                EnablePoints = true,
                PointsAllowedToVoteAmount = 1,
                PointsAddedPerPost = 1,
                PointsAddedForSolution = 4,
                PointsDeductedNagativeVote = 2,
                AdminEmailAddress = "my@email.com",
                NotificationReplyEmail = "noreply@myemail.com",
                SMTPEnableSSL = false,
                NewMemberStartingRole = role,
                DefaultLanguage = lang,
                ActivitiesPerPage = 20,
                EnableAkisment = false,
                EnablePolls = true
            };
            _context.Setting.Add(settings);
        }

        private void InitializeAnnouncements(MembershipUser user)
        {
            var announce = new Announcement
            {
                Title = "Test Announcement 1",
                Body = "<p>This is a test Announcement.</p>",
                Visible = true,
                Timestamp = DateTime.UtcNow
            };
            user.Announcements.Add(announce);
            announce = new Announcement
            {
                Title = "Test Announcement 2",
                Body = "<p>Test Announcement 2 Body</p>",
                Visible = true,
                Timestamp = DateTime.UtcNow
            };
            user.Announcements.Add(announce);
            _context.Entry(user).State = EntityState.Modified;
        }

        private void InitializeConfigs()
        {
            string siteEncryptionKey = Utilities.StringUtils.GetUniqueKey(20);
            StringEncryption stringEncryption = new StringEncryption(siteEncryptionKey);

            // Email Settings
            var config = new Config
            {
                ConfigKey = "SMTPServer",
                ConfigValue = "mail.domain.com",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "SMTPPort",
                ConfigValue = "587",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "SMTPUsername",
                ConfigValue = "webmaster@domain.com",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "SMTPPassword",
                ConfigValue = stringEncryption.Encrypt("password"),
                IsEncrypted = true,
            };
            _context.Configs.Add(config);

            // Site Settings
            config = new Config
            {
                ConfigKey = "SiteURL",
                ConfigValue = "http://localhost:3588",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "SiteName",
                ConfigValue = "DigiOz .NET Portal",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "SiteEncryptionKey",
                ConfigValue = siteEncryptionKey,
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "WebmasterEmail",
                ConfigValue = "webmaster@domain.com",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            // Shopping Cart Payment API Keys
            config = new Config
            {
                ConfigKey = "PaymentLoginID",
                ConfigValue = "[PaymentLoginID]",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaymentTransactionKey",
                ConfigValue = "[PaymentTransactionKey]",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaymentTestMode",
                ConfigValue = "false",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "TwitterHandle",
                ConfigValue = "@digioz",   //set to digioz or blank
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaymentTransactionFee",
                ConfigValue = "0",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "NumberOfAnnouncements",
                ConfigValue = "2",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "ShowContactForm",
                ConfigValue = "false",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "VisitorSessionPurgePeriod",
                ConfigValue = "30",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaypalMode",
                ConfigValue = "sandbox",    //"live" for production
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaypalClientId",
                ConfigValue = "AfBQZ3rwN5BKZN6QOJL4zBa1-Uph0KpxxrpMz2ro9RQO_W_CT_1-31GaM-iNo5S0WxIO4Z-LJtW5RInf",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaypalClientSecret",
                ConfigValue = "EGpl6DrqoaOWVysXEatofIjglg1i1XwHwSIhcw7jZ8duvfgxZAI6SeE8TVmbgHOXxJB7pyKW2O5cOhqj",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "PaypalConnectionTimeout",
                ConfigValue = "360000",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "EnableCommentsOnAllPages",
                ConfigValue = "false",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);

            config = new Config
            {
                ConfigKey = "LatestPictures",
                ConfigValue = "false",
                IsEncrypted = false,
            };
            _context.Configs.Add(config);
        }

        private void InitializeMenus(MembershipUser user)
        {
            var menu = new Menu
            {
                Name = "Home",
                Location = "TopMenu",
                Controller = "Home",
                Action = "Index",
                URL = null,
                Target = null, 
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder=1
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "About",
                Location = "TopMenu",
                Controller = "Home",
                Action = "About",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 2
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Contact",
                Location = "TopMenu",
                Controller = "Home",
                Action = "Contact",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 3
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Forum",
                Location = "TopMenu",
                Controller = "Forum",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 4
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Links",
                Location = "TopMenu",
                Controller = "Links",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 5
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Chat",
                Location = "TopMenu",
                Controller = "Chat",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 6
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Store",
                Location = "TopMenu",
                Controller = "Store",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = false,
                Timestamp = DateTime.UtcNow,
                SortOrder = 7
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Twitter",
                Location = "TopMenu",
                Controller = "Twitter",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = false,
                Timestamp = DateTime.UtcNow,
                SortOrder = 8
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Home",
                Location = "LeftMenu",
                Controller = "Home",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 9
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Pictures",
                Location = "LeftMenu",
                Controller = "Pictures",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 10
            };
            user.Menus.Add(menu);

            menu = new Menu
            {
                Name = "Videos",
                Location = "LeftMenu",
                Controller = "Videos",
                Action = "Index",
                URL = null,
                Target = null,
                Visible = true,
                Timestamp = DateTime.UtcNow,
                SortOrder = 11
            };
            user.Menus.Add(menu);

            _context.Entry(user).State = EntityState.Modified;
        }

        private void InitializePages(MembershipUser user)
        {
            var page = new Page
            {
                Title = "Home",
                URL = "/Home/Index",
                Body = @"<p><span style='font-size: medium;'><strong>Welcome to DigiOz .NET Portal!</strong></span></p>
<p>DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and&nbsp;C#&nbsp;which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.</p>
<p>Some Features included in this Portal System include:</p>
<ul>
<li>An Administrative Dashboard, where the Webmaster can Manage the Site and related Features.</li>
<li>A Page Manager, to allow Admins to Create new Pages, Edit existing Pages or Delete Them.</li>
<li>A Database Driven Configuration System to fine tune the Portal System</li>
<li>Some Database Utilities to help Manage the Site Database</li>
<li>File Manager, which allows you to add or remove files to your site.</li>
<li>Module Manager, allow you to install new Plugins to the Portal.</li>
<li>Forum Manager allows you to Manage Forum Posts, Threads, and Users.</li>
<li>Poll Manager lets you create new polls to display on the site.</li>
<li>The Statistics section lets you see site related statistics such as the number of visitors, number of page Views, etc.</li>
<li>Menu Manager lets you add new Menu links both to internal pages and external sites.</li>
<li>User Manager lets you manage the registered users of the site.</li>
<li>Announcements section let''s you add, edit or remove site wide announcements to the users, which show up on the Home Index Page.</li>
<li>Picture Manager lets you create Picture Galleries, and add or remove pictures from the site.</li>
<li>Video Manager allows you to upload and display Videos to your site and manage them.</li>
<li>Link Manager allows you to create a links page to do link exchagne with other sites similar to yours.</li>
<li>Chat Manager lets you manage the Chat Database Table.</li>
</ul>
<p><strong><span style='font-size: medium;'>About DigiOz Multimedia, Inc</span></strong></p>
<p><strong><span style='font-size: medium;'></span></strong>DigiOz Multimedia, Inc is a Chicago, Illinois USA based Software Development Company which provides web design for personal and business use, CRM, custom programming for web and PC, design database driven systems for clients, as well as business process modeling and consulting. We also have an active Open Source Community that provides many IT Systems and Web Portals as Open Source Products for Everyone to share and enjoy.</p>
<p>Visit us at <a href='http://www.digioz.com'>www.digioz.com</a> for more information, or email us at <a href='mailto:support@digioz.com'>support@digioz.com</a>. </p>",

                Keywords = @"DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC",
                Description = @"DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.",
                Visible = true,
                Timestamp = DateTime.UtcNow
            };
            user.Pages.Add(page);

            page = new Page
            {
                Title = "Contact",
                URL = "/Home/Contact",
                Body = @"<h2>Contact</h2>
<h3>Below is our Contact Information:</h3>
<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title='Phone'>P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href='mailto:Support@example.com'>Support@example.com</a><br /> <strong>Marketing:</strong> <a href='mailto:Marketing@example.com'>Marketing@example.com</a></address>",

                Keywords = null,
                Description = null,
                Visible = true,
                Timestamp = DateTime.UtcNow
            };
            user.Pages.Add(page);

            page = new Page
            {
                Title = "About",
                URL = "/Home/About",
                Body = @"<h2>About</h2>
<h3>Some information about us:</h3>
<p>Use this area to provide additional information.</p>",

                Keywords = null,
                Description = null,
                Visible = true,
                Timestamp = DateTime.UtcNow
            };
            user.Pages.Add(page);

            _context.Entry(user).State = EntityState.Modified;
        }

        private void InitializePlugins()
        {
            var plugin = new Plugin
            {
                Name = "Chat",
                IsEnabled = true
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "Store",
                IsEnabled = false
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "Twitter",
                IsEnabled = false
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "WhoIsOnline",
                IsEnabled = true
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "SlideShow",
                IsEnabled = false
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "Comments",
                IsEnabled = false
            };
            _context.Plugins.Add(plugin);

            plugin = new Plugin
            {
                Name = "RSSFeed",
                IsEnabled = false
            };
            _context.Plugins.Add(plugin);
        }

        private void InitializeZones()
        {
            var zone = new Zone
            {
                ID = 1,
                Name = "Top",
                ZoneType = "Module"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 2,
                Name = "TopMenu",
                ZoneType = "Menu"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 3,
                Name = "Left",
                ZoneType = "Module"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 4,
                Name = "LeftMenu",
                ZoneType = "Menu"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 5,
                Name = "BodyTop",
                ZoneType = "Module"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 6,
                Name = "BodyBottom",
                ZoneType = "Module"
            };
            _context.Zones.Add(zone);

            zone = new Zone
            {
                ID = 7,
                Name = "Bottom",
                ZoneType = "Module"
            };
            _context.Zones.Add(zone);
        }

        //public override void Seed(List<DatabaseChange> sqlChanges, MVCTestContext _context)
        protected override void Seed(digiozPortalEntities context)
        {
            _context = context;
            var startingUser = InitializeAdminUser();
            var standardUser = InitializeStandardUser();
            var startingRole = InitializeRole(startingUser, standardUser);
            var startingCategory = InitializeCategory();

            InitializePermission(startingCategory, startingRole);

            var startingLanguage = AddOrUpdateTheDefaultLanguageStrings();
            InitializeSettings(startingRole, startingLanguage);
            InitializeConfigs();
            InitializeAnnouncements(startingUser);
            InitializeMenus(startingUser);
            InitializePages(startingUser);
            InitializePlugins();
            InitializeZones();
            // InitializeProfiles(startingUser);

        }
    }
}