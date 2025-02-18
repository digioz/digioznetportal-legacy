SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `digiozportal3`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `Id` char(36) NOT NULL,
  `Type` longtext,
  `Data` longtext,
  `Timestamp` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Title` longtext,
  `Body` longtext,
  `Visible` tinyint(4) NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` VALUES(1, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Test Announcement 1', '<p>This is a test Announcement.</p>', 1, '2018-04-30 20:20:24.643');
INSERT INTO `announcement` VALUES(2, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Test Announcement 2', '<p>Test Announcement 2 Body</p>', 1, '2018-04-30 20:20:24.673');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(128) NOT NULL,
  `Name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aspnetroles`
--

INSERT INTO `aspnetroles` VALUES('4c2014a4-35fc-4505-935c-0b912eef0e92', 'Guest');
INSERT INTO `aspnetroles` VALUES('550b4e01-248e-44b5-9e7c-e1313436dce2', 'Administrator');
INSERT INTO `aspnetroles` VALUES('8e50a892-0f7d-40df-b8c3-7b746ccc4679', 'Moderator');
INSERT INTO `aspnetroles` VALUES('ff65b1a0-8020-4962-9ed4-6264f9b8eea5', 'Standard Members');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  `User_Id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `UserId` varchar(128) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` VALUES('0e5f401f-3431-475e-925e-2dc9e74280c5', 'ff65b1a0-8020-4962-9ed4-6264f9b8eea5');
INSERT INTO `aspnetuserroles` VALUES('d1c447c1-b022-4c92-93e8-ab9aaea65224', '550b4e01-248e-44b5-9e7c-e1313436dce2');

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(128) NOT NULL,
  `UserName` longtext,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `Discriminator` varchar(128) NOT NULL,
  `PasswordQuestion` longtext,
  `PasswordAnswer` longtext,
  `IsApproved` tinyint(4) NOT NULL,
  `IsLockedOut` tinyint(4) NOT NULL,
  `CreateDate` datetime(3) NOT NULL,
  `LastLoginDate` datetime(3) NOT NULL,
  `LastPasswordChangedDate` datetime(3) NOT NULL,
  `LastLockoutDate` datetime(3) NOT NULL,
  `LastActivityDate` datetime(3) DEFAULT NULL,
  `FailedPasswordAttemptCount` int(11) NOT NULL,
  `FailedPasswordAnswerAttempt` int(11) NOT NULL,
  `Comment` longtext,
  `Slug` longtext,
  `DisableEmailNotifications` tinyint(4) DEFAULT NULL,
  `DisablePosting` tinyint(4) DEFAULT NULL,
  `DisablePrivateMessages` tinyint(4) DEFAULT NULL,
  `DisableFileUploads` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aspnetusers`
--

INSERT INTO `aspnetusers` VALUES('0e5f401f-3431-475e-925e-2dc9e74280c5', 'user1', 'ALl0vPEEa6SCXfvRbHFEzGKZ65CVGIGb/tD07SBq8YECl94fhbrzZm2LJ4pL6ukIYA==', '26b497f2-995f-436c-a6fd-1f4416c8fc41', 'ApplicationUser', NULL, NULL, 1, 0, '2018-04-30 20:20:16.803', '2018-04-30 20:20:16.803', '2018-04-30 20:20:16.803', '2018-04-30 20:20:16.803', NULL, 0, 0, NULL, 'user1', 0, 0, 0, NULL);
INSERT INTO `aspnetusers` VALUES('d1c447c1-b022-4c92-93e8-ab9aaea65224', 'admi', 'ALCyUIBtQHBa8gR1zBdXmWxsLZ8rq+vU09oOg6eW1tL/KIHmJHac8M+wVVQy2bEdlg==', 'd4789b45-cf9a-44bb-811f-fbd9cfc995d2', 'ApplicationUser', NULL, NULL, 1, 0, '2018-04-30 20:20:15.663', '2018-04-30 20:20:15.663', '2018-04-30 20:20:15.663', '2018-04-30 20:20:15.663', '2018-12-02 20:29:27.637', 0, 0, NULL, 'admi', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Message` longtext,
  `Timestamp` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `Id` varchar(128) NOT NULL,
  `ParentId` longtext,
  `UserId` longtext,
  `Username` longtext,
  `ReferenceId` longtext,
  `ReferenceType` longtext,
  `Body` longtext,
  `CreatedDate` datetime(3) NOT NULL,
  `ModifiedDate` datetime(3) NOT NULL,
  `Likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commentconfig`
--

CREATE TABLE `commentconfig` (
  `Id` varchar(128) NOT NULL,
  `ReferenceId` longtext,
  `ReferenceType` longtext,
  `ReferenceTitle` longtext,
  `Visible` tinyint(4) NOT NULL,
  `Timestamp` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commentlike`
--

CREATE TABLE `commentlike` (
  `Id` varchar(128) NOT NULL,
  `UserId` longtext,
  `CommentId` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `ID` int(11) NOT NULL,
  `ConfigKey` longtext NOT NULL,
  `ConfigValue` longtext NOT NULL,
  `IsEncrypted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` VALUES(1, 'SMTPServer', 'mail.domain.com', 0);
INSERT INTO `config` VALUES(2, 'SMTPPort', '587', 0);
INSERT INTO `config` VALUES(3, 'SMTPUsername', 'webmaster@domain.com', 0);
INSERT INTO `config` VALUES(4, 'SMTPPassword', 'ohuiChQV5zxEwpmisiiWcIvlEVBH/zaroX1Rd9SD6zU=', 1);
INSERT INTO `config` VALUES(5, 'SiteURL', 'http://localhost:6969', 0);
INSERT INTO `config` VALUES(6, 'SiteName', 'DigiOz .NET Portal', 0);
INSERT INTO `config` VALUES(7, 'SiteEncryptionKey', 'BlAMwXxp7oMxGtWzIZYe', 0);
INSERT INTO `config` VALUES(8, 'WebmasterEmail', 'webmaster@domain.com', 0);
INSERT INTO `config` VALUES(9, 'PaymentLoginID', '6b74ZBkn5u3', 0);
INSERT INTO `config` VALUES(10, 'PaymentTransactionKey', '9M4Tc3s89w3C39cq', 0);
INSERT INTO `config` VALUES(11, 'PaymentTestMode', 'true', 0);
INSERT INTO `config` VALUES(12, 'TwitterHandle', '@digioz', 0);
INSERT INTO `config` VALUES(13, 'PaymentTransactionFee', '0', 0);
INSERT INTO `config` VALUES(14, 'NumberOfAnnouncements', '2', 0);
INSERT INTO `config` VALUES(15, 'ShowContactForm', 'false', 0);
INSERT INTO `config` VALUES(16, 'VisitorSessionPurgePeriod', '30', 0);
INSERT INTO `config` VALUES(17, 'PaypalMode', 'sandbox', 0);
INSERT INTO `config` VALUES(18, 'PaypalClientId', 'AfBQZ3rwN5BKZN6QOJL4zBa1-Uph0KpxxrpMz2ro9RQO_W_CT_1-31GaM-iNo5S0WxIO4Z-LJtW5RInf', 0);
INSERT INTO `config` VALUES(19, 'PaypalClientSecret', 'EGpl6DrqoaOWVysXEatofIjglg1i1XwHwSIhcw7jZ8duvfgxZAI6SeE8TVmbgHOXxJB7pyKW2O5cOhqj', 0);
INSERT INTO `config` VALUES(20, 'PaypalConnectionTimeout', '360000', 0);
INSERT INTO `config` VALUES(21, 'EnableCommentsOnAllPages', 'true', 0);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `Id` char(36) NOT NULL,
  `Name` longtext,
  `LanguageCulture` longtext,
  `FlagImageFileName` longtext,
  `RightToLeft` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` VALUES('c4b2685b-eb6c-4c11-971c-a8d2014f2942', 'English (United States)', 'en-US', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `ID` int(11) NOT NULL,
  `Name` longtext,
  `URL` longtext,
  `Description` longtext,
  `LinkCateryID` int(11) NOT NULL,
  `Visible` tinyint(4) DEFAULT NULL,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linkcatery`
--

CREATE TABLE `linkcatery` (
  `ID` int(11) NOT NULL,
  `Name` longtext,
  `Visible` tinyint(4) DEFAULT NULL,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `ID` bigint(20) NOT NULL,
  `Message` longtext,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logvisitor`
--

CREATE TABLE `logvisitor` (
  `ID` bigint(20) NOT NULL,
  `IPAddress` longtext,
  `BrowserType` longtext,
  `Language` longtext,
  `IsBot` tinyint(4) DEFAULT NULL,
  `Country` longtext,
  `ReferringURL` longtext,
  `SearchString` longtext,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailinglist`
--

CREATE TABLE `mailinglist` (
  `ID` char(36) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DefaultEmailFrom` varchar(50) NOT NULL,
  `DefaultFromName` varchar(50) NOT NULL,
  `Description` longtext NOT NULL,
  `Address` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailinglistcampaign`
--

CREATE TABLE `mailinglistcampaign` (
  `ID` char(36) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `FromName` varchar(50) NOT NULL,
  `FromEmail` varchar(50) NOT NULL,
  `Summary` varchar(255) NOT NULL,
  `Banner` varchar(255) DEFAULT NULL,
  `Body` longtext NOT NULL,
  `VisitorCount` int(11) NOT NULL,
  `DateCreated` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailinglistcampaignrelation`
--

CREATE TABLE `mailinglistcampaignrelation` (
  `ID` char(36) NOT NULL,
  `MailingListID` char(36) NOT NULL,
  `MailingListCampaignID` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailinglistsubscriber`
--

CREATE TABLE `mailinglistsubscriber` (
  `ID` char(36) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `DateCreated` datetime(3) NOT NULL,
  `DateModified` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mailinglistsubscriberrelation`
--

CREATE TABLE `mailinglistsubscriberrelation` (
  `ID` char(36) NOT NULL,
  `MailingListID` char(36) NOT NULL,
  `MailingListSubscriberID` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Name` longtext NOT NULL,
  `Location` longtext NOT NULL,
  `Controller` longtext,
  `Action` longtext,
  `URL` longtext,
  `Target` longtext,
  `Visible` tinyint(4) NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL,
  `SortOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` VALUES(1, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Home', 'TopMenu', 'Home', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.673', 1);
INSERT INTO `menu` VALUES(2, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'About', 'TopMenu', 'Home', 'About', NULL, NULL, 1, '2018-04-30 20:20:24.720', 2);
INSERT INTO `menu` VALUES(3, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Contact', 'TopMenu', 'Home', 'Contact', NULL, NULL, 0, '2018-04-30 20:20:24.720', 3);
INSERT INTO `menu` VALUES(4, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Forum', 'TopMenu', 'Forum', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 4);
INSERT INTO `menu` VALUES(5, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Links', 'TopMenu', 'Links', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 5);
INSERT INTO `menu` VALUES(6, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Chat', 'TopMenu', 'Chat', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 6);
INSERT INTO `menu` VALUES(7, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Store', 'TopMenu', 'Store', 'Index', NULL, NULL, 0, '2018-04-30 20:20:24.720', 7);
INSERT INTO `menu` VALUES(8, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Twitter', 'TopMenu', 'Twitter', 'Index', NULL, NULL, 0, '2018-04-30 20:20:24.720', 8);
INSERT INTO `menu` VALUES(9, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Home', 'LeftMenu', 'Home', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 9);
INSERT INTO `menu` VALUES(10, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Pictures', 'LeftMenu', 'Pictures', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 10);
INSERT INTO `menu` VALUES(11, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Videos', 'LeftMenu', 'Videos', 'Index', NULL, NULL, 1, '2018-04-30 20:20:24.720', 11);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Location` longtext,
  `Title` longtext,
  `Body` longtext,
  `Visible` tinyint(4) NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL,
  `DisplayInBox` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ID` varchar(128) NOT NULL,
  `UserID` varchar(128) NOT NULL,
  `InvoiceNumber` varchar(20) DEFAULT NULL,
  `OrderDate` datetime(3) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `ShippingAddress` varchar(70) NOT NULL,
  `ShippingAddress2` varchar(70) DEFAULT NULL,
  `ShippingCity` varchar(40) NOT NULL,
  `ShippingState` varchar(40) DEFAULT NULL,
  `ShippingZip` varchar(30) NOT NULL,
  `ShippingCountry` varchar(50) NOT NULL,
  `BillingAddress` varchar(70) NOT NULL,
  `BillingAddress2` varchar(70) DEFAULT NULL,
  `BillingCity` varchar(40) NOT NULL,
  `BillingState` varchar(40) NOT NULL,
  `BillingZip` varchar(30) NOT NULL,
  `BillingCountry` varchar(50) NOT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  `CCNumber` varchar(100) DEFAULT NULL,
  `CCExp` varchar(10) DEFAULT NULL,
  `CCCardCode` varchar(10) DEFAULT NULL,
  `CCAmount` decimal(18,2) DEFAULT NULL,
  `TrxDescription` longtext,
  `TrxApproved` tinyint(4) NOT NULL,
  `TrxAuthorizationCode` varchar(100) DEFAULT NULL,
  `TrxMessage` longtext,
  `TrxResponseCode` varchar(10) DEFAULT NULL,
  `TrxID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ID` varchar(128) NOT NULL,
  `OrderID` varchar(128) NOT NULL,
  `ProductID` varchar(128) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` decimal(18,2) NOT NULL,
  `Description` longtext,
  `Size` varchar(50) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `MaterialType` varchar(50) DEFAULT NULL,
  `Notes` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Title` longtext,
  `URL` longtext,
  `Body` longtext,
  `Keywords` longtext,
  `Description` longtext,
  `Visible` tinyint(4) NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` VALUES(1, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Home', '/Home/Index', '<p><span style=\'font-size: medium;\'><strong>Welcome to DigiOz .NET Portal!</strong></span></p>\n<p>DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and&nbsp;C#&nbsp;which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.</p>\n<p>Some Features included in this Portal System include:</p>\n<ul>\n<li>An Administrative Dashboard, where the Webmaster can Manage the Site and related Features.</li>\n<li>A Page Manager, to allow Admins to Create new Pages, Edit existing Pages or Delete Them.</li>\n<li>A Database Driven Configuration System to fine tune the Portal System</li>\n<li>Some Database Utilities to help Manage the Site Database</li>\n<li>File Manager, which allows you to add or remove files to your site.</li>\n<li>Module Manager, allow you to install new Plugins to the Portal.</li>\n<li>Forum Manager allows you to Manage Forum Posts, Threads, and Users.</li>\n<li>Poll Manager lets you create new polls to display on the site.</li>\n<li>The Statistics section lets you see site related statistics such as the number of visitors, number of page Views, etc.</li>\n<li>Menu Manager lets you add new Menu links both to internal pages and external sites.</li>\n<li>User Manager lets you manage the registered users of the site.</li>\n<li>Announcements section let\'\'s you add, edit or remove site wide announcements to the users, which show up on the Home Index Page.</li>\n<li>Picture Manager lets you create Picture Galleries, and add or remove pictures from the site.</li>\n<li>Video Manager allows you to upload and display Videos to your site and manage them.</li>\n<li>Link Manager allows you to create a links page to do link exchagne with other sites similar to yours.</li>\n<li>Chat Manager lets you manage the Chat Database Table.</li>\n</ul>\n<p><strong><span style=\'font-size: medium;\'>About DigiOz Multimedia, Inc</span></strong></p>\n<p><strong><span style=\'font-size: medium;\'></span></strong>DigiOz Multimedia, Inc is a Chica, Illinois USA based Software Development Company which provides web design for personal and business use, CRM, custom programming for web and PC, design database driven systems for clients, as well as business process modeling and consulting. We also have an active Open Source Community that provides many IT Systems and Web Portals as Open Source Products for Everyone to share and enjoy.</p>\n<p>Visit us at <a href=\'http://www.digioz.com\'>www.digioz.com</a> for more information, or email us at <a href=\'mailto:support@digioz.com\'>support@digioz.com</a>. </p>', 'DigiOz .NET Portal, CMS, Portal, Web Portal, ASP.NET MVC', 'DigiOz .NET Portal is a web based portal system written in ASP.NET MVC 5 and C# which uses a Microsoft SQL Database to allows webmasters to setup and customize an instant website for either business or personal use.', 1, '2018-04-30 20:20:24.720');
INSERT INTO `page` VALUES(2, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'Contact', '/Home/Contact', '<h2>Contact</h2>\n<h3>Below is our Contact Information:</h3>\n<address>One Microsoft Way<br /> Redmond, WA 98052-6399<br /> <abbr title=\'Phone\'>P:</abbr> 425.555.0100</address><address><strong>Support:</strong> <a href=\'mailto:Support@example.com\'>Support@example.com</a><br /> <strong>Marketing:</strong> <a href=\'mailto:Marketing@example.com\'>Marketing@example.com</a></address>', NULL, NULL, 1, '2018-04-30 20:20:24.767');
INSERT INTO `page` VALUES(3, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'About', '/Home/About', '<h2>About</h2>\n<h3>Some information about us:</h3>\n<p>Use this area to provide additional information.</p>', NULL, NULL, 1, '2018-04-30 20:20:24.767');

-- --------------------------------------------------------

--
-- Table structure for table `picture`
--

CREATE TABLE `picture` (
  `ID` bigint(20) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `AlbumID` bigint(20) DEFAULT NULL,
  `Filename` longtext,
  `Description` longtext,
  `Timestamp` datetime(3) DEFAULT NULL,
  `Approved` tinyint(4) DEFAULT NULL,
  `Visible` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `picturealbum`
--

CREATE TABLE `picturealbum` (
  `ID` bigint(20) NOT NULL,
  `Name` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL,
  `Visible` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugin`
--

CREATE TABLE `plugin` (
  `Id` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `DLL` longtext,
  `IsEnabled` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugin`
--

INSERT INTO `plugin` VALUES(1, 'Chat', NULL, 1);
INSERT INTO `plugin` VALUES(2, 'Store', NULL, 1);
INSERT INTO `plugin` VALUES(3, 'Twitter', NULL, 0);
INSERT INTO `plugin` VALUES(4, 'WhoIsOnline', NULL, 1);
INSERT INTO `plugin` VALUES(5, 'SlideShow', NULL, 0);
INSERT INTO `plugin` VALUES(6, 'Comments', NULL, 0);
INSERT INTO `plugin` VALUES(7, 'RSSFeed', NULL, 0);
INSERT INTO `plugin` VALUES(1002, 'LatestPictures', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `Id` char(36) NOT NULL,
  `Slug` longtext,
  `IsClosed` tinyint(4) NOT NULL,
  `DateCreated` datetime(3) NOT NULL,
  `Featured` tinyint(4) NOT NULL,
  `AllowMultipleOptionsVote` tinyint(4) NOT NULL,
  `MembershipUser_Id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pollanswer`
--

CREATE TABLE `pollanswer` (
  `Id` char(36) NOT NULL,
  `Answer` longtext,
  `Poll_Id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pollusersvote`
--

CREATE TABLE `pollusersvote` (
  `Id` int(11) NOT NULL,
  `UserId` longtext,
  `PollId` longtext,
  `DateVoted` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pollvote`
--

CREATE TABLE `pollvote` (
  `Id` char(36) NOT NULL,
  `PollAnswer_Id` char(36) NOT NULL,
  `MembershipUser_Id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` varchar(128) NOT NULL,
  `ProductCateryID` varchar(128) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Make` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `Image` varchar(50) DEFAULT NULL,
  `Price` decimal(18,2) NOT NULL,
  `Cost` decimal(18,2) DEFAULT NULL,
  `QuantityPerUnit` int(11) DEFAULT NULL,
  `Weight` varchar(20) DEFAULT NULL,
  `Dimensions` varchar(50) DEFAULT NULL,
  `Sizes` varchar(50) DEFAULT NULL,
  `Colors` varchar(50) DEFAULT NULL,
  `MaterialType` varchar(50) DEFAULT NULL,
  `PartNumber` varchar(50) DEFAULT NULL,
  `ShortDescription` varchar(255) NOT NULL,
  `Description` longtext NOT NULL,
  `ManufacturerURL` longtext,
  `UnitsInStock` int(11) NOT NULL,
  `OutOfStock` tinyint(4) NOT NULL,
  `Notes` longtext,
  `Visible` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productcatery`
--

CREATE TABLE `productcatery` (
  `ID` varchar(128) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Visible` tinyint(4) NOT NULL,
  `Description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productoption`
--

CREATE TABLE `productoption` (
  `ID` varchar(128) NOT NULL,
  `ProductID` varchar(128) NOT NULL,
  `OptionType` varchar(50) NOT NULL,
  `OptionValue` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `ID` int(11) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `Email` longtext,
  `Birthday` datetime(3) DEFAULT NULL,
  `BirthdayVisible` tinyint(4) DEFAULT NULL,
  `Address` longtext,
  `Address2` longtext,
  `City` longtext,
  `State` longtext,
  `Zip` longtext,
  `Country` longtext,
  `Signature` longtext,
  `Avatar` longtext,
  `FirstName` longtext,
  `LastName` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` VALUES(1, 'd1c447c1-b022-4c92-93e8-ab9aaea65224', 'webmaster@domain.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES(2, '0e5f401f-3431-475e-925e-2dc9e74280c5', 'user1@mail.com', '1975-07-24 00:00:00.000', 1, '1 Main Street', 'Ste 100', 'Chica', 'IL', '60601', 'USA', 'User One Some Company, Inc.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rss`
--

CREATE TABLE `rss` (
  `ID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Url` longtext NOT NULL,
  `MaxCount` int(11) NOT NULL,
  `Timestamp` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `ID` varchar(128) NOT NULL,
  `UserID` varchar(128) NOT NULL,
  `ProductID` varchar(128) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DateCreated` datetime(3) NOT NULL,
  `Size` varchar(50) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `MaterialType` varchar(50) DEFAULT NULL,
  `Notes` longtext,
  `AspNetUser_Id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slideshow`
--

CREATE TABLE `slideshow` (
  `Id` int(11) NOT NULL,
  `Image` longtext,
  `Description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `ID` bigint(20) NOT NULL,
  `UserID` varchar(128) DEFAULT NULL,
  `AlbumID` bigint(20) DEFAULT NULL,
  `Filename` longtext,
  `Description` longtext,
  `Timestamp` datetime(3) DEFAULT NULL,
  `Approved` tinyint(4) DEFAULT NULL,
  `Visible` tinyint(4) DEFAULT NULL,
  `Thumbnail` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `videoalbum`
--

CREATE TABLE `videoalbum` (
  `ID` bigint(20) NOT NULL,
  `Name` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `Timestamp` datetime(3) DEFAULT NULL,
  `Visible` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitorinfo`
--

CREATE TABLE `visitorinfo` (
  `ID` int(11) NOT NULL,
  `IPAddress` varchar(25) NOT NULL,
  `PageURL` longtext,
  `ReferringURL` longtext,
  `BrowserName` varchar(100) DEFAULT NULL,
  `BrowserType` varchar(100) DEFAULT NULL,
  `BrowserUserAgent` longtext,
  `BrowserVersion` varchar(20) DEFAULT NULL,
  `IsCrawler` tinyint(4) NOT NULL,
  `JSVersion` longtext,
  `OperatingSystem` varchar(20) DEFAULT NULL,
  `Keywords` longtext,
  `SearchEngine` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Language` varchar(100) DEFAULT NULL,
  `Timestamp` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visitorsession`
--

CREATE TABLE `visitorsession` (
  `Id` int(11) NOT NULL,
  `IpAddress` varchar(25) NOT NULL,
  `PageUrl` longtext,
  `SessionId` longtext,
  `UserName` longtext,
  `DateCreated` datetime(3) NOT NULL,
  `DateModified` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `Id` char(36) NOT NULL,
  `Amount` int(11) NOT NULL,
  `DateVoted` datetime(3) DEFAULT NULL,
  `VotedByMembershipUser_Id` varchar(128) DEFAULT NULL,
  `Post_Id` char(36) NOT NULL,
  `MembershipUser_Id` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `ID` int(11) NOT NULL,
  `Name` longtext NOT NULL,
  `ZoneType` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` VALUES(1, 'Top', 'Module');
INSERT INTO `zone` VALUES(2, 'TopMenu', 'Menu');
INSERT INTO `zone` VALUES(3, 'Left', 'Module');
INSERT INTO `zone` VALUES(4, 'LeftMenu', 'Menu');
INSERT INTO `zone` VALUES(5, 'BodyTop', 'Module');
INSERT INTO `zone` VALUES(6, 'BodyBottom', 'Module');
INSERT INTO `zone` VALUES(7, 'Bottom', 'Module');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`ProviderKey`);

--
-- Indexes for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`);

--
-- Indexes for table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `commentconfig`
--
ALTER TABLE `commentconfig`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `commentlike`
--
ALTER TABLE `commentlike`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `linkcatery`
--
ALTER TABLE `linkcatery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `logvisitor`
--
ALTER TABLE `logvisitor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailinglist`
--
ALTER TABLE `mailinglist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailinglistcampaign`
--
ALTER TABLE `mailinglistcampaign`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailinglistcampaignrelation`
--
ALTER TABLE `mailinglistcampaignrelation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailinglistsubscriber`
--
ALTER TABLE `mailinglistsubscriber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mailinglistsubscriberrelation`
--
ALTER TABLE `mailinglistsubscriberrelation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `picturealbum`
--
ALTER TABLE `picturealbum`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `plugin`
--
ALTER TABLE `plugin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pollanswer`
--
ALTER TABLE `pollanswer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pollusersvote`
--
ALTER TABLE `pollusersvote`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pollvote`
--
ALTER TABLE `pollvote`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `productcatery`
--
ALTER TABLE `productcatery`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `productoption`
--
ALTER TABLE `productoption`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rss`
--
ALTER TABLE `rss`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `videoalbum`
--
ALTER TABLE `videoalbum`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `visitorinfo`
--
ALTER TABLE `visitorinfo`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `visitorsession`
--
ALTER TABLE `visitorsession`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `linkcatery`
--
ALTER TABLE `linkcatery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logvisitor`
--
ALTER TABLE `logvisitor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `picture`
--
ALTER TABLE `picture`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `picturealbum`
--
ALTER TABLE `picturealbum`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plugin`
--
ALTER TABLE `plugin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;
--
-- AUTO_INCREMENT for table `pollusersvote`
--
ALTER TABLE `pollusersvote`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rss`
--
ALTER TABLE `rss`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videoalbum`
--
ALTER TABLE `videoalbum`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitorinfo`
--
ALTER TABLE `visitorinfo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `visitorsession`
--
ALTER TABLE `visitorsession`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;