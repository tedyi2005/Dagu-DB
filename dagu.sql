-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 17, 2020 at 02:56 AM
-- Server version: 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dagu`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `businessid` int(11) NOT NULL AUTO_INCREMENT,
  `serviceid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `ownername` varchar(250) DEFAULT NULL,
  `ownercontact` varchar(50) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `image` text,
  `websiteurl` varchar(250) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `createdby` int(11) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) DEFAULT NULL,
  `updatedated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`businessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `business_items`
--

DROP TABLE IF EXISTS `business_items`;
CREATE TABLE IF NOT EXISTS `business_items` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `businessid` int(11) NOT NULL,
  `itemname` varchar(250) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `image` text,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `createdby` int(11) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedby` int(11) DEFAULT NULL,
  `updateddate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_base`
--

DROP TABLE IF EXISTS `customer_base`;
CREATE TABLE IF NOT EXISTS `customer_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` set('Mr','Mrs','Ms') DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` varchar(250) DEFAULT NULL,
  `otp` varchar(50) NOT NULL,
  `token_id` text,
  `device_type` enum('Android','Ios') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('Active','InActive') CHARACTER SET utf8 NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
