-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2020 at 02:10 PM
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
-- Table structure for table `business_appointment`
--

DROP TABLE IF EXISTS `business_appointment`;
CREATE TABLE IF NOT EXISTS `business_appointment` (
  `appointmentid` int(11) NOT NULL AUTO_INCREMENT,
  `businessid` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `appointmentdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`appointmentid`)
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
-- Table structure for table `business_orders`
--

DROP TABLE IF EXISTS `business_orders`;
CREATE TABLE IF NOT EXISTS `business_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `products` varchar(500) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` enum('COD','Card','Net Banking','UPI') NOT NULL,
  `payment_status` enum('Success','Fail') NOT NULL DEFAULT 'Fail',
  `order_type` enum('Normal','Express') NOT NULL DEFAULT 'Normal',
  `order_status` enum('In Progress','Confirmed','Delivered','Cancelled','Out for Delivery') NOT NULL DEFAULT 'In Progress',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(500) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`add_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_card_details`
--

DROP TABLE IF EXISTS `customer_card_details`;
CREATE TABLE IF NOT EXISTS `customer_card_details` (
  `carddetailsid` int(11) NOT NULL AUTO_INCREMENT,
  `cartnumber` varchar(50) DEFAULT NULL,
  `expirydate` varchar(50) DEFAULT NULL,
  `cvv` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`carddetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
CREATE TABLE IF NOT EXISTS `tax` (
  `taxid` int(11) NOT NULL AUTO_INCREMENT,
  `taxname` varchar(100) NOT NULL,
  `percentage` decimal(18,2) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
CREATE TABLE IF NOT EXISTS `timeslot` (
  `timeslotid` int(11) NOT NULL AUTO_INCREMENT,
  `formtime` varchar(20) NOT NULL,
  `totime` varchar(20) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`timeslotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trust`
--

DROP TABLE IF EXISTS `trust`;
CREATE TABLE IF NOT EXISTS `trust` (
  `trust_id` int(11) NOT NULL AUTO_INCREMENT,
  `trust_name` varchar(200) NOT NULL,
  `trust_address` varchar(200) NOT NULL,
  `trusttype` int(11) NOT NULL,
  `image` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`trust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trust_donate`
--

DROP TABLE IF EXISTS `trust_donate`;
CREATE TABLE IF NOT EXISTS `trust_donate` (
  `donate_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(500) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type` enum('COD','Card','Net Banking','UPI') NOT NULL,
  `payment_status` enum('Success','Fail') NOT NULL DEFAULT 'Fail',
  PRIMARY KEY (`donate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trust_type`
--

DROP TABLE IF EXISTS `trust_type`;
CREATE TABLE IF NOT EXISTS `trust_type` (
  `trusttype_id` int(11) NOT NULL AUTO_INCREMENT,
  `trusttype_name` varchar(250) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `image` text,
  PRIMARY KEY (`trusttype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`wishlist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
