-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 22, 2022 at 02:20 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onbet`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_level`
--

DROP TABLE IF EXISTS `access_level`;
CREATE TABLE IF NOT EXISTS `access_level` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `create` tinyint(1) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `update` tinyint(1) NOT NULL DEFAULT '0',
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  `module_id` bigint UNSIGNED DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_level_module_id_foreign` (`module_id`),
  KEY `access_level_role_id_foreign` (`role_id`),
  KEY `access_level_created_by_foreign` (`created_by`),
  KEY `access_level_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminlogindetails`
--

DROP TABLE IF EXISTS `adminlogindetails`;
CREATE TABLE IF NOT EXISTS `adminlogindetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `loginInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adminlogindetails_admin_id_foreign` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_username_unique` (`username`),
  KEY `admins_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `username`, `email`, `phone`, `image`, `type`, `pcMac`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'VK', 'vk', 'g8vk@onbet365.com', '01341526242', NULL, 0, NULL, NULL, '$2y$10$z8krZ.3yFvqvG5J2ftCPm.8aEPfrl2TC080IiL/WznN5b747bGPWC', 1, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `betdetails`
--

DROP TABLE IF EXISTS `betdetails`;
CREATE TABLE IF NOT EXISTS `betdetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_id` bigint UNSIGNED NOT NULL,
  `betoption_id` bigint UNSIGNED DEFAULT NULL,
  `betName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `betRate` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `betdetails_match_id_foreign` (`match_id`),
  KEY `betdetails_betoption_id_foreign` (`betoption_id`),
  KEY `betdetails_created_by_foreign` (`created_by`),
  KEY `betdetails_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `betoptions`
--

DROP TABLE IF EXISTS `betoptions`;
CREATE TABLE IF NOT EXISTS `betoptions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sport_id` bigint UNSIGNED DEFAULT NULL,
  `betOptionName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `betoptions_sport_id_foreign` (`sport_id`),
  KEY `betoptions_created_by_foreign` (`created_by`),
  KEY `betoptions_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `betoptions`
--

INSERT INTO `betoptions` (`id`, `sport_id`, `betOptionName`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 1, NULL, '2022-06-18 03:09:54', '2022-06-18 03:09:54');

-- --------------------------------------------------------

--
-- Table structure for table `betplaces`
--

DROP TABLE IF EXISTS `betplaces`;
CREATE TABLE IF NOT EXISTS `betplaces` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `betdetail_id` bigint UNSIGNED DEFAULT NULL,
  `winner_id` bigint UNSIGNED DEFAULT NULL,
  `match_id` bigint UNSIGNED DEFAULT NULL,
  `betoption_id` bigint UNSIGNED DEFAULT NULL,
  `club_id` bigint UNSIGNED DEFAULT NULL,
  `clubRate` decimal(8,2) DEFAULT NULL,
  `clubGet` decimal(8,2) DEFAULT NULL,
  `sponsorName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sponsorRate` decimal(8,2) DEFAULT NULL,
  `sponsorGet` decimal(8,2) DEFAULT NULL,
  `betAmount` decimal(8,2) DEFAULT NULL,
  `betRate` decimal(8,2) DEFAULT NULL,
  `betProfit` decimal(8,2) NOT NULL DEFAULT '0.00',
  `betLost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `partialLost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `partialRate` decimal(8,2) NOT NULL DEFAULT '0.00',
  `winLost` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `betplaces_user_id_foreign` (`user_id`),
  KEY `betplaces_club_id_foreign` (`club_id`),
  KEY `betplaces_match_id_foreign` (`match_id`),
  KEY `betplaces_betdetail_id_foreign` (`betdetail_id`),
  KEY `betplaces_winner_id_foreign` (`winner_id`),
  KEY `betplaces_betoption_id_foreign` (`betoption_id`),
  KEY `betplaces_accepted_id_foreign` (`accepted_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bkashes`
--

DROP TABLE IF EXISTS `bkashes`;
CREATE TABLE IF NOT EXISTS `bkashes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `bkashNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentMethodType` varchar(27) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bkashes_created_by_foreign` (`created_by`),
  KEY `bkashes_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bkashes`
--

INSERT INTO `bkashes` (`id`, `bkashNumber`, `pcMac`, `paymentMethodType`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, '01715426458', NULL, '1', 1, NULL, 0, '2022-06-22 08:18:37', '2022-06-22 08:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `clublogindetails`
--

DROP TABLE IF EXISTS `clublogindetails`;
CREATE TABLE IF NOT EXISTS `clublogindetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `club_id` bigint UNSIGNED DEFAULT NULL,
  `loginInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clublogindetails_club_id_foreign` (`club_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
CREATE TABLE IF NOT EXISTS `clubs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `clubName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalBalance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalProfit` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalWithdrawAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clubs_username_unique` (`username`),
  UNIQUE KEY `clubs_email_unique` (`email`),
  KEY `clubs_created_by_foreign` (`created_by`),
  KEY `clubs_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clubwithdraws`
--

DROP TABLE IF EXISTS `clubwithdraws`;
CREATE TABLE IF NOT EXISTS `clubwithdraws` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `club_id` bigint UNSIGNED DEFAULT NULL,
  `withdrawAmount` decimal(8,2) DEFAULT NULL,
  `withdrawUserPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawReturnDateTime` timestamp NULL DEFAULT NULL,
  `withdrawType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawAcceptedBy` bigint UNSIGNED DEFAULT NULL,
  `withdrawAcceptedPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clubwithdraws_club_id_foreign` (`club_id`),
  KEY `clubwithdraws_withdrawacceptedby_foreign` (`withdrawAcceptedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cointransfers`
--

DROP TABLE IF EXISTS `cointransfers`;
CREATE TABLE IF NOT EXISTS `cointransfers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fromuserid` bigint UNSIGNED DEFAULT NULL,
  `touserid` bigint UNSIGNED DEFAULT NULL,
  `transferAmount` decimal(8,2) DEFAULT NULL,
  `transferUserPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cointransfers_fromuserid_foreign` (`fromuserid`),
  KEY `cointransfers_touserid_foreign` (`touserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
CREATE TABLE IF NOT EXISTS `configs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `siteNotice` text COLLATE utf8mb4_unicode_ci,
  `depositMsg` text COLLATE utf8mb4_unicode_ci,
  `betMinimum` int DEFAULT NULL,
  `betMaximum` int DEFAULT NULL,
  `betOnOff` tinyint(1) NOT NULL DEFAULT '0',
  `depositMinimum` int DEFAULT NULL,
  `depositMaximum` int DEFAULT NULL,
  `coinTransferMinimum` int DEFAULT NULL,
  `coinTransferMaximum` int DEFAULT NULL,
  `userWithdrawMinimum` int DEFAULT NULL,
  `userWithdrawMaximum` int DEFAULT NULL,
  `clubRate` decimal(8,2) DEFAULT NULL,
  `sponsorRate` decimal(8,2) DEFAULT NULL,
  `partialOne` decimal(8,2) DEFAULT NULL,
  `partialTwo` decimal(8,2) DEFAULT NULL,
  `coinTransferStatus` tinyint(1) NOT NULL DEFAULT '0',
  `userWithdrawStatus` tinyint(1) NOT NULL DEFAULT '0',
  `clubWithdrawStatus` tinyint(1) NOT NULL DEFAULT '0',
  `over` varchar(27) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `under` varchar(27) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bascketVolleyLimit` varchar(27) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `siteNotice`, `depositMsg`, `betMinimum`, `betMaximum`, `betOnOff`, `depositMinimum`, `depositMaximum`, `coinTransferMinimum`, `coinTransferMaximum`, `userWithdrawMinimum`, `userWithdrawMaximum`, `clubRate`, `sponsorRate`, `partialOne`, `partialTwo`, `coinTransferStatus`, `userWithdrawStatus`, `clubWithdrawStatus`, `over`, `under`, `bascketVolleyLimit`, `created_at`, `updated_at`) VALUES
(1, 'Dear users minimum deposit 200, maximum 25000 & Minimum withdraw 300 maximum 25000.Bet cash limit 20 to 6000 .Happy Betting.', 'User deposit Time at 9:00 AM To 8:00 PM', 20, 6000, 0, 200, 25000, 20, 4000, 300, 2500, '3.00', '1.50', '5.00', '3.00', 0, 0, 0, '1', '1', '1', '2022-06-14 12:59:56', '2022-06-22 08:17:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masterdepositdetails`
--

DROP TABLE IF EXISTS `masterdepositdetails`;
CREATE TABLE IF NOT EXISTS `masterdepositdetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `depositAmount` decimal(8,2) DEFAULT NULL,
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterdepositdetails_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `masterdepositdetails`
--

INSERT INTO `masterdepositdetails` (`id`, `depositAmount`, `pcMac`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, '100000.00', '00-FF-70-AC-D1-0C', 1, NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `masterdeposits`
--

DROP TABLE IF EXISTS `masterdeposits`;
CREATE TABLE IF NOT EXISTS `masterdeposits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `totalBalance` decimal(8,2) DEFAULT NULL,
  `totalSiteDeposit` decimal(8,2) DEFAULT NULL,
  `totalUserRegularDeposit` decimal(8,2) DEFAULT NULL,
  `totalUserSpecialDeposit` decimal(8,2) DEFAULT NULL,
  `totalLossToClub` decimal(8,2) DEFAULT NULL,
  `totalLossToSponsor` decimal(8,2) DEFAULT NULL,
  `totalLossToUser` decimal(8,2) DEFAULT NULL,
  `totalProfitFromUser` decimal(8,2) DEFAULT NULL,
  `totalPartialFromUser` decimal(8,2) DEFAULT NULL,
  `totalWithdrawFromUser` decimal(8,2) DEFAULT NULL,
  `totalWithdrawFromClub` decimal(8,2) DEFAULT NULL,
  `totalWithdrawFromSite` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `masterdeposits`
--

INSERT INTO `masterdeposits` (`id`, `totalBalance`, `totalSiteDeposit`, `totalUserRegularDeposit`, `totalUserSpecialDeposit`, `totalLossToClub`, `totalLossToSponsor`, `totalLossToUser`, `totalProfitFromUser`, `totalPartialFromUser`, `totalWithdrawFromUser`, `totalWithdrawFromClub`, `totalWithdrawFromSite`, `created_at`, `updated_at`) VALUES
(1, '0.00', '100000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `masterwithdraws`
--

DROP TABLE IF EXISTS `masterwithdraws`;
CREATE TABLE IF NOT EXISTS `masterwithdraws` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `withdrawAmount` decimal(8,2) DEFAULT NULL,
  `withdrawUserPcMac` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `masterwithdraws_created_by_foreign` (`created_by`),
  KEY `masterwithdraws_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
CREATE TABLE IF NOT EXISTS `matches` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `score_id` bigint UNSIGNED DEFAULT NULL,
  `sport_id` bigint UNSIGNED DEFAULT NULL,
  `tournament_id` bigint UNSIGNED DEFAULT NULL,
  `teamOne_id` bigint UNSIGNED DEFAULT NULL,
  `teamTwo_id` bigint UNSIGNED DEFAULT NULL,
  `matchTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `matchDateTime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `advanceCount` tinyint(1) NOT NULL DEFAULT '0',
  `repeatAgainLive` tinyint(1) NOT NULL DEFAULT '0',
  `repeatDateTimeOne` datetime DEFAULT NULL,
  `repeatDateTimeTwo` datetime DEFAULT NULL,
  `repeatDateTimeThree` datetime DEFAULT NULL,
  `repeatDateTimelast` datetime DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matches_sport_id_foreign` (`sport_id`),
  KEY `matches_tournament_id_foreign` (`tournament_id`),
  KEY `matches_teamone_id_foreign` (`teamOne_id`),
  KEY `matches_teamtwo_id_foreign` (`teamTwo_id`),
  KEY `matches_created_by_foreign` (`created_by`),
  KEY `matches_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `score_id`, `sport_id`, `tournament_id`, `teamOne_id`, `teamTwo_id`, `matchTitle`, `matchDateTime`, `status`, `advanceCount`, `repeatAgainLive`, `repeatDateTimeOne`, `repeatDateTimeTwo`, `repeatDateTimeThree`, `repeatDateTimelast`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 'test', '2022-07-20 04:11:00', 0, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, '2022-06-18 03:10:18', '2022-06-18 03:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_22_062628_create_admins_table', 1),
(5, '2020_02_25_061628_create_roles_table', 1),
(6, '2020_02_25_062715_create_modules_table', 1),
(7, '2020_02_25_062834_create_access_level_table', 1),
(8, '2020_03_02_060316_create_sports_table', 1),
(9, '2020_03_02_060332_create_teams_table', 1),
(10, '2020_03_02_060617_create_tournaments_table', 1),
(11, '2020_03_03_080612_create_matches_table', 1),
(12, '2020_03_04_090648_create_betoptions_table', 1),
(13, '2020_03_06_055320_create_betdetails_table', 1),
(14, '2020_03_19_051026_create_slides_table', 1),
(15, '2020_03_26_160605_create_configs_table', 1),
(16, '2020_03_27_150806_create_bkashes_table', 1),
(17, '2020_03_27_173452_create_clubs_table', 1),
(18, '2020_03_29_142517_create_userlogindetails_table', 1),
(19, '2020_03_29_142539_create_adminlogindetails_table', 1),
(20, '2020_03_29_142551_create_clublogindetails_table', 1),
(21, '2020_03_31_101513_create_masterdeposits_table', 1),
(22, '2020_04_02_110358_create_userdeposits_table', 1),
(23, '2020_04_06_170208_create_betplaces_table', 1),
(24, '2020_04_10_095407_create_masterdepositdetails_table', 1),
(25, '2020_04_23_124256_create_cointransfers_table', 1),
(26, '2020_04_23_124336_create_userwithdraws_table', 1),
(27, '2020_04_23_124523_create_clubwithdraws_table', 1),
(28, '2020_04_24_163926_create_masterwithdraws_table', 1),
(29, '2020_05_07_165403_create_scores_table', 1),
(30, '2020_07_17_124641_create_usercomplains_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_prefix` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_created_by_foreign` (`created_by`),
  KEY `roles_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'supperAdmin', 'Super admin description', NULL, NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(2, 'admin', 'Admin description', NULL, NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(3, 'subAdmin', 'Sub admin description', NULL, NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `match_id` bigint UNSIGNED DEFAULT NULL,
  `overs` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `match_id`, `overs`, `score`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, '2022-06-18 03:10:18', '2022-06-18 03:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `slideTitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sliderContent` text COLLATE utf8mb4_unicode_ci,
  `slideBtnText` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slideBtnLink` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slideImage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slides_created_by_foreign` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slideTitle`, `sliderContent`, `slideBtnText`, `slideBtnLink`, `slideImage`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'This is slider Title', 'For joining this website demo text.For joining this website demo text.For joining this website demo text.For joining this website demo text.', 'Join', 'user/registration', 'backend/uploads/slides/default.jpg', NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
CREATE TABLE IF NOT EXISTS `sports` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sportName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sports_sportname_unique` (`sportName`),
  KEY `sports_created_by_foreign` (`created_by`),
  KEY `sports_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `sportName`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'cricket', 1, NULL, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(2, 'football', 1, NULL, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(3, 'basket', 1, NULL, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(4, 'volley', 1, NULL, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56'),
(5, 'tennis', 1, NULL, NULL, '2022-06-14 12:59:56', '2022-06-14 12:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sport_id` bigint UNSIGNED DEFAULT NULL,
  `teamName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_sport_id_foreign` (`sport_id`),
  KEY `teams_created_by_foreign` (`created_by`),
  KEY `teams_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `sport_id`, `teamName`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'test1', 1, 1, NULL, '2022-06-18 03:09:40', '2022-06-18 03:09:40'),
(2, 1, 'test2', 1, 1, NULL, '2022-06-18 03:09:45', '2022-06-18 03:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
CREATE TABLE IF NOT EXISTS `tournaments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sport_id` bigint UNSIGNED DEFAULT NULL,
  `tournamentName` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tournaments_sport_id_foreign` (`sport_id`),
  KEY `tournaments_created_by_foreign` (`created_by`),
  KEY `tournaments_updated_by_foreign` (`updated_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `sport_id`, `tournamentName`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 1, 1, NULL, '2022-06-18 03:09:34', '2022-06-18 03:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `usercomplains`
--

DROP TABLE IF EXISTS `usercomplains`;
CREATE TABLE IF NOT EXISTS `usercomplains` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `complainAcceptedBy` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usercomplains_user_id_foreign` (`user_id`),
  KEY `usercomplains_complainacceptedby_foreign` (`complainAcceptedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdeposits`
--

DROP TABLE IF EXISTS `userdeposits`;
CREATE TABLE IF NOT EXISTS `userdeposits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `paymentMethodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneForm` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneTo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depositAmount` decimal(8,2) DEFAULT NULL,
  `userPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptedPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceptedInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accepted_by` bigint UNSIGNED DEFAULT NULL,
  `depositType` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userdeposits_user_id_foreign` (`user_id`),
  KEY `userdeposits_accepted_by_foreign` (`accepted_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlogindetails`
--

DROP TABLE IF EXISTS `userlogindetails`;
CREATE TABLE IF NOT EXISTS `userlogindetails` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `loginInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userlogindetails_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `club_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsorName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalBalance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalRegularDepositAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalSpecialDepositAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalCoinReceiveAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalSponsorAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalProfitAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalCoinTransferAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalLossAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `totalWithdrawAmount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `pcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userInfo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stand` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `club_id`, `name`, `username`, `email`, `email_verified_at`, `password`, `sponsorName`, `phone`, `country`, `totalBalance`, `totalRegularDepositAmount`, `totalSpecialDepositAmount`, `totalCoinReceiveAmount`, `totalSponsorAmount`, `totalProfitAmount`, `totalCoinTransferAmount`, `totalLossAmount`, `totalWithdrawAmount`, `pcMac`, `userInfo`, `remember_token`, `status`, `created_at`, `updated_at`, `stand`) VALUES
(1, 1, 'Demo User', 'demo', 'demo@gmail.com', NULL, '$2y$10$iDZp.E1ZpSD8JfUPZOk1eONZrKAtW12gcZfW7xox3/UnIh/3d1BSi', '', '01829600478', 'Bangladesh', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, 'Device:Computer - Operation System:Windows 10.0 - Browser:Google Chrome - IP:103.54.43.193 - Containent:Asia - Country: Bangladesh - City:Dhaka - Latitude:23.726 - Longitude:90.4251 - Timezone:Asia/Dhaka', NULL, 1, '2022-06-14 12:59:56', '2022-06-14 12:59:56', '1');

-- --------------------------------------------------------

--
-- Table structure for table `userwithdraws`
--

DROP TABLE IF EXISTS `userwithdraws`;
CREATE TABLE IF NOT EXISTS `userwithdraws` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `withdrawAmount` decimal(8,2) DEFAULT NULL,
  `withdrawNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawPaymentType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawUserPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawReturnDateTime` timestamp NULL DEFAULT NULL,
  `withdrawAcceptedBy` bigint UNSIGNED DEFAULT NULL,
  `withdrawAcceptedPcMac` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userwithdraws_user_id_foreign` (`user_id`),
  KEY `userwithdraws_withdrawacceptedby_foreign` (`withdrawAcceptedBy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
