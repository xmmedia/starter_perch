-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 11, 2020 at 09:44 PM
-- Server version: 5.7.29
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `protectivesleeve_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `perch_categories`
--

CREATE TABLE `perch_categories` (
  `catID` int(10) NOT NULL,
  `setID` int(10) UNSIGNED NOT NULL,
  `catParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catTitle` char(64) NOT NULL DEFAULT '',
  `catSlug` char(64) NOT NULL DEFAULT '',
  `catPath` char(255) NOT NULL DEFAULT '',
  `catDisplayPath` char(255) NOT NULL DEFAULT '',
  `catOrder` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catTreePosition` char(255) NOT NULL DEFAULT '000',
  `catDynamicFields` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_category_counts`
--

CREATE TABLE `perch_category_counts` (
  `countID` int(10) UNSIGNED NOT NULL,
  `catID` int(10) UNSIGNED NOT NULL,
  `countType` char(64) NOT NULL DEFAULT '',
  `countValue` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_category_sets`
--

CREATE TABLE `perch_category_sets` (
  `setID` int(10) NOT NULL,
  `setTitle` char(64) NOT NULL DEFAULT '',
  `setSlug` char(64) NOT NULL DEFAULT '',
  `setTemplate` char(255) NOT NULL DEFAULT 'set.html',
  `setCatTemplate` char(255) NOT NULL DEFAULT 'category.html',
  `setDynamicFields` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_content_index`
--

CREATE TABLE `perch_content_index` (
  `indexID` int(10) NOT NULL,
  `itemID` int(10) NOT NULL DEFAULT '0',
  `regionID` int(10) NOT NULL DEFAULT '0',
  `pageID` int(10) NOT NULL DEFAULT '0',
  `itemRev` int(10) NOT NULL DEFAULT '0',
  `indexKey` char(64) NOT NULL DEFAULT '-',
  `indexValue` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_content_items`
--

CREATE TABLE `perch_content_items` (
  `itemRowID` int(10) UNSIGNED NOT NULL,
  `itemID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `regionID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pageID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemRev` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemOrder` int(10) UNSIGNED NOT NULL DEFAULT '1000',
  `itemJSON` mediumtext NOT NULL,
  `itemSearch` mediumtext NOT NULL,
  `itemUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `itemUpdatedBy` char(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_content_regions`
--

CREATE TABLE `perch_content_regions` (
  `regionID` int(10) NOT NULL,
  `pageID` int(10) UNSIGNED NOT NULL,
  `regionKey` varchar(255) NOT NULL DEFAULT '',
  `regionPage` varchar(255) NOT NULL DEFAULT '',
  `regionHTML` longtext NOT NULL,
  `regionNew` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `regionOrder` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `regionTemplate` varchar(255) NOT NULL DEFAULT '',
  `regionMultiple` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `regionOptions` text NOT NULL,
  `regionSearchable` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `regionRev` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `regionLatestRev` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `regionEditRoles` varchar(255) NOT NULL DEFAULT '*',
  `regionPublishRoles` varchar(255) NOT NULL DEFAULT '*',
  `regionUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_menu_items`
--

CREATE TABLE `perch_menu_items` (
  `itemID` int(10) UNSIGNED NOT NULL,
  `parentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemType` enum('menu','app','link') NOT NULL DEFAULT 'app',
  `itemOrder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `itemTitle` char(64) NOT NULL DEFAULT 'Unnamed item',
  `itemValue` char(255) DEFAULT NULL,
  `itemPersists` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `itemActive` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `privID` int(10) DEFAULT NULL,
  `userID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemInternal` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_menu_items`
--

INSERT INTO `perch_menu_items` (`itemID`, `parentID`, `itemType`, `itemOrder`, `itemTitle`, `itemValue`, `itemPersists`, `itemActive`, `privID`, `userID`, `itemInternal`) VALUES
(1, 0, 'menu', 1, 'My Site', NULL, 1, 1, NULL, 0, 0),
(2, 0, 'menu', 2, 'Organise', NULL, 1, 1, NULL, 0, 0),
(3, 1, 'app', 1, 'Pages', 'content', 0, 1, NULL, 0, 0),
(4, 2, 'app', 1, 'Categories', 'categories', 0, 1, 22, 0, 0),
(5, 2, 'app', 2, 'Assets', 'assets', 0, 1, NULL, 0, 0),
(7, 0, 'app', 1, 'Settings', 'settings', 1, 0, NULL, 0, 1),
(8, 0, 'app', 1, 'Users', 'users', 1, 0, NULL, 0, 1),
(9, 0, 'app', 1, 'Help', 'help', 1, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `perch_navigation`
--

CREATE TABLE `perch_navigation` (
  `groupID` int(10) NOT NULL,
  `groupTitle` varchar(255) NOT NULL DEFAULT '',
  `groupSlug` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_navigation_pages`
--

CREATE TABLE `perch_navigation_pages` (
  `navpageID` int(10) UNSIGNED NOT NULL,
  `pageID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `groupID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pageParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pageOrder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) UNSIGNED NOT NULL,
  `pageTreePosition` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `perch_pages`
--

CREATE TABLE `perch_pages` (
  `pageID` int(10) UNSIGNED NOT NULL,
  `pageParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pagePath` varchar(255) NOT NULL DEFAULT '',
  `pageTitle` varchar(255) NOT NULL DEFAULT '',
  `pageNavText` varchar(255) NOT NULL DEFAULT '',
  `pageNew` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `pageOrder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `pageDepth` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `pageSortPath` varchar(255) NOT NULL DEFAULT '',
  `pageTreePosition` varchar(64) NOT NULL DEFAULT '',
  `pageSubpageRoles` varchar(255) NOT NULL DEFAULT '',
  `pageSubpagePath` varchar(255) NOT NULL DEFAULT '',
  `pageHidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pageNavOnly` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pageAccessTags` varchar(255) NOT NULL DEFAULT '',
  `pageCreatorID` char(255) NOT NULL DEFAULT '0',
  `pageModified` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  `pageAttributes` text NOT NULL,
  `pageAttributeTemplate` varchar(255) NOT NULL DEFAULT 'default.html',
  `pageTemplate` char(255) NOT NULL DEFAULT '',
  `templateID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pageSubpageTemplates` varchar(255) NOT NULL DEFAULT '',
  `pageCollections` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_page_templates`
--

CREATE TABLE `perch_page_templates` (
  `templateID` int(10) UNSIGNED NOT NULL,
  `templateTitle` varchar(255) NOT NULL DEFAULT '',
  `templatePath` varchar(255) NOT NULL DEFAULT '',
  `optionsPageID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `templateReference` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `templateNavGroups` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_resources`
--

CREATE TABLE `perch_resources` (
  `resourceID` int(10) UNSIGNED NOT NULL,
  `resourceApp` char(32) NOT NULL DEFAULT 'content',
  `resourceBucket` char(16) NOT NULL DEFAULT 'default',
  `resourceFile` char(255) NOT NULL DEFAULT '',
  `resourceKey` enum('orig','thumb') DEFAULT NULL,
  `resourceParentID` int(10) NOT NULL DEFAULT '0',
  `resourceType` char(4) NOT NULL DEFAULT '',
  `resourceCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `resourceUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `resourceAWOL` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `resourceTitle` char(255) DEFAULT NULL,
  `resourceFileSize` int(10) UNSIGNED DEFAULT NULL,
  `resourceWidth` int(10) UNSIGNED DEFAULT NULL,
  `resourceHeight` int(10) UNSIGNED DEFAULT NULL,
  `resourceCrop` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `resourceDensity` float NOT NULL DEFAULT '1',
  `resourceTargetWidth` int(10) UNSIGNED DEFAULT NULL,
  `resourceTargetHeight` int(10) UNSIGNED DEFAULT NULL,
  `resourceMimeType` char(64) DEFAULT NULL,
  `resourceInLibrary` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_resources_to_tags`
--

CREATE TABLE `perch_resources_to_tags` (
  `resourceID` int(10) NOT NULL DEFAULT '0',
  `tagID` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `perch_resource_log`
--

CREATE TABLE `perch_resource_log` (
  `logID` int(10) UNSIGNED NOT NULL,
  `appID` char(32) NOT NULL DEFAULT 'content',
  `itemFK` char(32) NOT NULL DEFAULT 'itemRowID',
  `itemRowID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `resourceID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_resource_tags`
--

CREATE TABLE `perch_resource_tags` (
  `tagID` int(10) NOT NULL,
  `tagTitle` varchar(255) NOT NULL DEFAULT '',
  `tagSlug` varchar(255) NOT NULL DEFAULT '',
  `tagCount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `perch_settings`
--

CREATE TABLE `perch_settings` (
  `settingID` varchar(60) NOT NULL DEFAULT '',
  `userID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `settingValue` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_settings`
--

INSERT INTO `perch_settings` (`settingID`, `userID`, `settingValue`) VALUES
('headerColour', 0, '#ffffff'),
('content_singlePageEdit', 0, '1'),
('helpURL', 0, ''),
('siteURL', 0, '/'),
('hideBranding', 0, '0'),
('content_collapseList', 0, '1'),
('lang', 0, 'en-gb'),
('installedAt', 0, '3.1.5'),
('update_3.1.5', 0, 'done'),
('latest_version', 0, ''),
('on_sale_version', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `perch_users`
--

CREATE TABLE `perch_users` (
  `userID` int(10) UNSIGNED NOT NULL,
  `userUsername` varchar(255) NOT NULL DEFAULT '',
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `userCreated` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userLastLogin` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `userGivenName` varchar(255) NOT NULL DEFAULT '',
  `userFamilyName` varchar(255) NOT NULL DEFAULT '',
  `userEmail` varchar(255) NOT NULL DEFAULT '',
  `userEnabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `userHash` char(32) NOT NULL DEFAULT '',
  `roleID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `userMasterAdmin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `userPasswordToken` char(255) NOT NULL DEFAULT 'expired',
  `userPasswordTokenExpires` datetime NOT NULL DEFAULT '2015-01-01 00:00:00',
  `userLastFailedLogin` datetime DEFAULT NULL,
  `userFailedLoginAttempts` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_users`
--

INSERT INTO `perch_users` (`userID`, `userUsername`, `userPassword`, `userCreated`, `userUpdated`, `userLastLogin`, `userGivenName`, `userFamilyName`, `userEmail`, `userEnabled`, `userHash`, `roleID`, `userMasterAdmin`, `userPasswordToken`, `userPasswordTokenExpires`, `userLastFailedLogin`, `userFailedLoginAttempts`) VALUES
(1, 'xmmedia', '$P$Bl6o6xQKarf.MU4prLzDjsPRaMXfG50', '2020-02-11 21:38:24', '2020-02-11 21:38:34', '2020-02-11 21:38:34', 'XM', 'Media', 'admin@xmmedia.com', 1, 'adebcf903193886f18900e6d1d4a70ae', 2, 1, 'expired', '2015-01-01 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `perch_user_passwords`
--

CREATE TABLE `perch_user_passwords` (
  `passwordID` int(10) UNSIGNED NOT NULL,
  `userID` int(10) UNSIGNED NOT NULL,
  `userPassword` varchar(255) NOT NULL DEFAULT '',
  `passwordLastUsed` datetime NOT NULL DEFAULT '2000-01-01 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perch_user_privileges`
--

CREATE TABLE `perch_user_privileges` (
  `privID` int(10) UNSIGNED NOT NULL,
  `privKey` varchar(255) NOT NULL DEFAULT '',
  `privTitle` varchar(255) NOT NULL DEFAULT '',
  `privOrder` int(10) UNSIGNED NOT NULL DEFAULT '99'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_user_privileges`
--

INSERT INTO `perch_user_privileges` (`privID`, `privKey`, `privTitle`, `privOrder`) VALUES
(1, 'perch.login', 'Log in', 1),
(2, 'perch.settings', 'Change settings', 2),
(3, 'perch.users.manage', 'Manage users', 3),
(4, 'perch.updatenotices', 'View update notices', 4),
(5, 'content.regions.delete', 'Delete regions', 1),
(6, 'content.regions.options', 'Edit region options', 2),
(7, 'content.pages.edit', 'Edit page details', 1),
(8, 'content.pages.reorder', 'Reorder pages', 2),
(9, 'content.pages.create', 'Add new pages', 3),
(10, 'content.pages.configure', 'Configure page settings', 5),
(11, 'content.pages.delete', 'Delete pages', 4),
(12, 'content.templates.delete', 'Delete master pages', 6),
(13, 'content.navgroups.configure', 'Configure navigation groups', 7),
(14, 'content.navgroups.create', 'Create navigation groups', 8),
(15, 'content.navgroups.delete', 'Delete navigation groups', 9),
(16, 'content.pages.create.toplevel', 'Add new top-level pages', 3),
(17, 'content.pages.delete.own', 'Delete pages they created themselves', 4),
(18, 'content.templates.configure', 'Configure master pages', 6),
(19, 'content.pages.attributes', 'Edit page titles and attributes', 6),
(20, 'categories.create', 'Create new categories', 1),
(21, 'categories.delete', 'Delete categories', 2),
(22, 'categories.manage', 'Manage categories', 3),
(23, 'categories.sets.create', 'Create category sets', 4),
(24, 'categories.sets.delete', 'Delete category sets', 5),
(25, 'assets.create', 'Upload assets', 1),
(26, 'assets.manage', 'Manage assets', 2),
(27, 'assets.delete', 'Delete assets', 3),
(28, 'content.pages.manage_urls', 'Edit page locations', 10);

-- --------------------------------------------------------

--
-- Table structure for table `perch_user_roles`
--

CREATE TABLE `perch_user_roles` (
  `roleID` int(10) UNSIGNED NOT NULL,
  `roleTitle` varchar(255) NOT NULL DEFAULT '',
  `roleSlug` varchar(255) NOT NULL DEFAULT '',
  `roleMasterAdmin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_user_roles`
--

INSERT INTO `perch_user_roles` (`roleID`, `roleTitle`, `roleSlug`, `roleMasterAdmin`) VALUES
(1, 'Editor', 'editor', 0),
(2, 'Admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `perch_user_role_privileges`
--

CREATE TABLE `perch_user_role_privileges` (
  `roleID` int(10) UNSIGNED NOT NULL,
  `privID` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perch_user_role_privileges`
--

INSERT INTO `perch_user_role_privileges` (`roleID`, `privID`) VALUES
(1, 1),
(2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perch_categories`
--
ALTER TABLE `perch_categories`
  ADD PRIMARY KEY (`catID`),
  ADD KEY `idx_set` (`setID`);

--
-- Indexes for table `perch_category_counts`
--
ALTER TABLE `perch_category_counts`
  ADD PRIMARY KEY (`countID`),
  ADD KEY `idx_cat` (`catID`),
  ADD KEY `idx_cat_type` (`countType`,`catID`);

--
-- Indexes for table `perch_category_sets`
--
ALTER TABLE `perch_category_sets`
  ADD PRIMARY KEY (`setID`);

--
-- Indexes for table `perch_content_index`
--
ALTER TABLE `perch_content_index`
  ADD PRIMARY KEY (`indexID`),
  ADD KEY `idx_key` (`indexKey`),
  ADD KEY `idx_val` (`indexValue`),
  ADD KEY `idx_rev` (`itemRev`),
  ADD KEY `idx_item` (`itemID`),
  ADD KEY `idx_keyval` (`indexKey`,`indexValue`),
  ADD KEY `idx_regrev` (`regionID`,`itemRev`);

--
-- Indexes for table `perch_content_items`
--
ALTER TABLE `perch_content_items`
  ADD PRIMARY KEY (`itemRowID`),
  ADD KEY `idx_item` (`itemID`),
  ADD KEY `idx_rev` (`itemRev`),
  ADD KEY `idx_region` (`regionID`),
  ADD KEY `idx_regrev` (`itemID`,`regionID`,`itemRev`),
  ADD KEY `idx_order` (`itemOrder`);
ALTER TABLE `perch_content_items` ADD FULLTEXT KEY `idx_search` (`itemSearch`);

--
-- Indexes for table `perch_content_regions`
--
ALTER TABLE `perch_content_regions`
  ADD PRIMARY KEY (`regionID`),
  ADD KEY `idx_key` (`regionKey`),
  ADD KEY `idx_path` (`regionPage`);

--
-- Indexes for table `perch_menu_items`
--
ALTER TABLE `perch_menu_items`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `perch_navigation`
--
ALTER TABLE `perch_navigation`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `perch_navigation_pages`
--
ALTER TABLE `perch_navigation_pages`
  ADD PRIMARY KEY (`navpageID`),
  ADD KEY `idx_group` (`groupID`),
  ADD KEY `idx_page_group` (`pageID`,`groupID`);

--
-- Indexes for table `perch_pages`
--
ALTER TABLE `perch_pages`
  ADD PRIMARY KEY (`pageID`),
  ADD KEY `idx_parent` (`pageParentID`);

--
-- Indexes for table `perch_page_templates`
--
ALTER TABLE `perch_page_templates`
  ADD PRIMARY KEY (`templateID`);

--
-- Indexes for table `perch_resources`
--
ALTER TABLE `perch_resources`
  ADD PRIMARY KEY (`resourceID`),
  ADD UNIQUE KEY `idx_file` (`resourceBucket`,`resourceFile`),
  ADD KEY `idx_app` (`resourceApp`),
  ADD KEY `idx_key` (`resourceKey`),
  ADD KEY `idx_type` (`resourceType`),
  ADD KEY `idx_awol` (`resourceAWOL`),
  ADD KEY `idx_library` (`resourceInLibrary`),
  ADD KEY `idx_list` (`resourceParentID`,`resourceKey`,`resourceAWOL`);
ALTER TABLE `perch_resources` ADD FULLTEXT KEY `idx_search` (`resourceTitle`);

--
-- Indexes for table `perch_resources_to_tags`
--
ALTER TABLE `perch_resources_to_tags`
  ADD PRIMARY KEY (`resourceID`,`tagID`);

--
-- Indexes for table `perch_resource_log`
--
ALTER TABLE `perch_resource_log`
  ADD PRIMARY KEY (`logID`),
  ADD UNIQUE KEY `idx_uni` (`appID`,`itemFK`,`itemRowID`,`resourceID`),
  ADD KEY `idx_resource` (`resourceID`),
  ADD KEY `idx_fk` (`itemFK`,`itemRowID`);

--
-- Indexes for table `perch_resource_tags`
--
ALTER TABLE `perch_resource_tags`
  ADD PRIMARY KEY (`tagID`);

--
-- Indexes for table `perch_settings`
--
ALTER TABLE `perch_settings`
  ADD PRIMARY KEY (`settingID`,`userID`);

--
-- Indexes for table `perch_users`
--
ALTER TABLE `perch_users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `idx_enabled` (`userEnabled`);

--
-- Indexes for table `perch_user_passwords`
--
ALTER TABLE `perch_user_passwords`
  ADD PRIMARY KEY (`passwordID`),
  ADD KEY `idx_user` (`userID`);

--
-- Indexes for table `perch_user_privileges`
--
ALTER TABLE `perch_user_privileges`
  ADD PRIMARY KEY (`privID`),
  ADD UNIQUE KEY `idx_key` (`privKey`);

--
-- Indexes for table `perch_user_roles`
--
ALTER TABLE `perch_user_roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `perch_user_role_privileges`
--
ALTER TABLE `perch_user_role_privileges`
  ADD PRIMARY KEY (`roleID`,`privID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `perch_categories`
--
ALTER TABLE `perch_categories`
  MODIFY `catID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_category_counts`
--
ALTER TABLE `perch_category_counts`
  MODIFY `countID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_category_sets`
--
ALTER TABLE `perch_category_sets`
  MODIFY `setID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_content_index`
--
ALTER TABLE `perch_content_index`
  MODIFY `indexID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_content_items`
--
ALTER TABLE `perch_content_items`
  MODIFY `itemRowID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_content_regions`
--
ALTER TABLE `perch_content_regions`
  MODIFY `regionID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_menu_items`
--
ALTER TABLE `perch_menu_items`
  MODIFY `itemID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `perch_navigation`
--
ALTER TABLE `perch_navigation`
  MODIFY `groupID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_navigation_pages`
--
ALTER TABLE `perch_navigation_pages`
  MODIFY `navpageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_pages`
--
ALTER TABLE `perch_pages`
  MODIFY `pageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_page_templates`
--
ALTER TABLE `perch_page_templates`
  MODIFY `templateID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_resources`
--
ALTER TABLE `perch_resources`
  MODIFY `resourceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_resource_log`
--
ALTER TABLE `perch_resource_log`
  MODIFY `logID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_resource_tags`
--
ALTER TABLE `perch_resource_tags`
  MODIFY `tagID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_users`
--
ALTER TABLE `perch_users`
  MODIFY `userID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `perch_user_passwords`
--
ALTER TABLE `perch_user_passwords`
  MODIFY `passwordID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perch_user_privileges`
--
ALTER TABLE `perch_user_privileges`
  MODIFY `privID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `perch_user_roles`
--
ALTER TABLE `perch_user_roles`
  MODIFY `roleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
