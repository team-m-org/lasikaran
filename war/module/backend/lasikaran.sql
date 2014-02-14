-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 14, 2014 at 12:42 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lasikaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `child_details`
--

CREATE TABLE IF NOT EXISTS `child_details` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `child_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `parent_id` int(11) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  PRIMARY KEY (`child_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `child_details`
--

INSERT INTO `child_details` (`child_id`, `child_name`, `birth_date`, `parent_id`, `gender`) VALUES
(1, 'anvee', '2014-02-12', 1, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `doc_details`
--

CREATE TABLE IF NOT EXISTS `doc_details` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(100) NOT NULL,
  `mobile` int(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `text_msg` varchar(200) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `doc_details`
--

INSERT INTO `doc_details` (`doc_id`, `doc_name`, `mobile`, `password`, `email`, `address`, `pincode`, `location`, `phone`, `text_msg`, `group_id`) VALUES
(3, 'mahesh', 2147483647, '123', 'test@test.com', 'eqe qw  q', 123123, 'Mumbai', 123123231, '2312 13 123dasda 1ad a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_details`
--

CREATE TABLE IF NOT EXISTS `group_details` (
  `group_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_details`
--

INSERT INTO `group_details` (`group_id`, `code`, `name`) VALUES
(1, 'd_user', 'Doctor'),
(2, 'e_user', 'User ');

-- --------------------------------------------------------

--
-- Table structure for table `msg_schedule_master`
--

CREATE TABLE IF NOT EXISTS `msg_schedule_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `msg_type` enum('pregnancy','child','health','other') NOT NULL DEFAULT 'child',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `mobile`, `password`, `email`, `address`, `pincode`, `location`, `phone`, `group_id`) VALUES
(1, '9324202563', 9324202563, '9324202563', 'test@test.com', '', 0, '', 2233, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vac_details`
--

CREATE TABLE IF NOT EXISTS `vac_details` (
  `vac_id` int(11) NOT NULL,
  `vac_name` varchar(100) NOT NULL,
  `effctive_for` varchar(100) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
