-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2014 at 03:11 PM
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
  PRIMARY KEY (`child_id`),
  UNIQUE KEY `child_id` (`birth_date`,`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `child_details`
--

INSERT INTO `child_details` (`child_id`, `child_name`, `birth_date`, `parent_id`, `gender`) VALUES
(1, 'wwwww', '2014-03-04', 6, 'female'),
(3, 'tst', '2013-12-11', 7, 'female'),
(4, 'testfor ', '2014-03-13', 8, 'female'),
(6, 'testfor ', '2014-03-13', 9, 'female'),
(7, 'second', '2014-03-09', 8, 'female'),
(11, '123123', '2014-03-10', 8, 'female');

-- --------------------------------------------------------

--
-- Table structure for table `doc_details`
--

CREATE TABLE IF NOT EXISTS `doc_details` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `text_msg` varchar(200) NOT NULL,
  `per_patient_amt` bigint(20) NOT NULL,
  `registration_date` datetime NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `doc_details`
--

INSERT INTO `doc_details` (`doc_id`, `first_name`, `last_name`, `mobile`, `password`, `email`, `address`, `pincode`, `location`, `phone`, `text_msg`, `per_patient_amt`, `registration_date`, `status`, `group_id`) VALUES
(1, 'mahesh', 'sikwal', 9324202563, '123', 'mahesh.sikwal@gmail.com', '', 0, '', 0, 'Hi test is gomin on "with "?', 50, '2014-03-05 09:55:04', 'active', 1),
(2, 'mahesh', 'sikwal', 1111111111, '123', 'qweqe@gmail.com', '', 0, '', 0, 'dad ', 50, '2014-03-06 11:24:52', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_details`
--

CREATE TABLE IF NOT EXISTS `group_details` (
  `group_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` enum('active','deative','','') NOT NULL,
  `access_to_module` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_details`
--

INSERT INTO `group_details` (`group_id`, `code`, `name`, `status`, `access_to_module`) VALUES
(1, 'd_user', 'Doctor', 'active', ''),
(2, 'e_user', 'User ', 'active', '');

-- --------------------------------------------------------

--
-- Table structure for table `module_details`
--

CREATE TABLE IF NOT EXISTS `module_details` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `module_details`
--

INSERT INTO `module_details` (`module_id`, `module_name`, `status`) VALUES
(1, 'm_child', 'active'),
(2, 'm_preg', 'active'),
(3, 'm_appntment', 'active'),
(4, 'm_health', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `msg_schedule_master`
--

CREATE TABLE IF NOT EXISTS `msg_schedule_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vac_id` int(11) NOT NULL,
  `msg_type` enum('pregnancy','child','health','other') NOT NULL DEFAULT 'child',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `given_date` date NOT NULL,
  `msg_send_status` enum('pending','failed','other','send') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `msg_schedule_master`
--

INSERT INTO `msg_schedule_master` (`id`, `user_id`, `vac_id`, `msg_type`, `start_date`, `end_date`, `given_date`, `msg_send_status`) VALUES
(1, 8, 1, 'child', '2014-04-13', '2014-05-13', '0000-00-00', 'pending'),
(2, 8, 2, 'child', '2014-05-13', '2014-06-11', '0000-00-00', 'pending'),
(3, 8, 3, 'child', '2014-07-13', '2014-08-10', '0000-00-00', 'pending'),
(4, 8, 4, 'child', '2014-09-13', '2014-10-09', '0000-00-00', 'pending'),
(5, 8, 5, 'child', '2014-09-13', '2015-09-13', '0000-00-00', 'pending'),
(6, 8, 6, 'child', '2015-03-13', '2015-06-13', '0000-00-00', 'pending'),
(7, 8, 7, 'child', '2015-03-13', '2016-02-13', '0000-00-00', 'pending'),
(8, 8, 8, 'child', '2015-06-13', '2015-09-13', '0000-00-00', 'pending'),
(9, 8, 9, 'child', '2018-03-13', '2020-03-13', '0000-00-00', 'pending'),
(17, 9, 1, 'child', '2014-04-13', '2014-05-13', '0000-00-00', 'pending'),
(18, 9, 2, 'child', '2014-05-13', '2014-06-11', '0000-00-00', 'pending'),
(19, 9, 3, 'child', '2014-07-13', '2014-08-10', '0000-00-00', 'pending'),
(20, 9, 4, 'child', '2014-09-13', '2014-10-09', '0000-00-00', 'pending'),
(21, 9, 5, 'child', '2014-09-13', '2015-09-13', '0000-00-00', 'pending'),
(22, 9, 6, 'child', '2015-03-13', '2015-06-13', '0000-00-00', 'pending'),
(23, 9, 7, 'child', '2015-03-13', '2016-02-13', '0000-00-00', 'pending'),
(24, 9, 8, 'child', '2015-06-13', '2015-09-13', '0000-00-00', 'pending'),
(25, 9, 9, 'child', '2018-03-13', '2020-03-13', '0000-00-00', 'pending'),
(27, 8, 1, 'child', '2014-04-09', '2014-05-09', '0000-00-00', 'pending'),
(28, 8, 2, 'child', '2014-05-09', '2014-06-07', '0000-00-00', 'pending'),
(29, 8, 3, 'child', '2014-07-09', '2014-08-06', '0000-00-00', 'pending'),
(30, 8, 4, 'child', '2014-09-09', '2014-10-05', '0000-00-00', 'pending'),
(31, 8, 5, 'child', '2014-09-09', '2015-09-09', '0000-00-00', 'pending'),
(32, 8, 6, 'child', '2015-03-09', '2015-06-09', '0000-00-00', 'pending'),
(33, 8, 7, 'child', '2015-03-09', '2016-02-09', '0000-00-00', 'pending'),
(34, 8, 8, 'child', '2015-06-09', '2015-09-09', '0000-00-00', 'pending'),
(35, 8, 9, 'child', '2018-03-09', '2020-03-09', '0000-00-00', 'pending'),
(36, 8, 1, 'child', '2014-04-10', '2014-05-10', '0000-00-00', 'pending'),
(37, 8, 2, 'child', '2014-05-10', '2014-06-08', '0000-00-00', 'pending'),
(38, 8, 3, 'child', '2014-07-10', '2014-08-07', '0000-00-00', 'pending'),
(39, 8, 4, 'child', '2014-09-10', '2014-10-06', '0000-00-00', 'pending'),
(40, 8, 5, 'child', '2014-09-10', '2015-09-10', '0000-00-00', 'pending'),
(41, 8, 6, 'child', '2015-03-10', '2015-06-10', '0000-00-00', 'pending'),
(42, 8, 7, 'child', '2015-03-10', '2016-02-10', '0000-00-00', 'pending'),
(43, 8, 8, 'child', '2015-06-10', '2015-09-10', '0000-00-00', 'pending'),
(44, 8, 9, 'child', '2018-03-10', '2020-03-10', '0000-00-00', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `salutation` varchar(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `refer_by_doc` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` enum('active','deactive','','') NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `salutation`, `first_name`, `last_name`, `mobile`, `refer_by_doc`, `email`, `address`, `pincode`, `location`, `phone`, `registration_date`, `group_id`, `status`) VALUES
(1, 'Mr.', '', '', 7777777777, 1, 'test@test.com', '', 0, '', 0, '0000-00-00 00:00:00', 2, 'active'),
(2, 'Mr.', '', '', 2222222222, 0, 'test@test.com', '', 0, '', 0, '2014-03-06 11:25:14', 2, 'active'),
(3, 'Mr.', 'test1', 'test2', 1111111111, 0, 'test@test.com', 'yiur adwer ', 0, '', 0, '2014-03-06 11:48:15', 2, 'active'),
(4, 'Mr.', '', '', 7894566442, 2, 'test@test.com', '', 0, '', 0, '2014-03-10 10:28:21', 2, 'active'),
(5, 'Mr.', '', '', 1111111123, 2, 'test@test.com', '', 0, '', 0, '2014-03-10 10:45:01', 2, 'active'),
(6, 'Mr.', '', '', 7345678999, 2, 'test@test.com', '', 0, '', 0, '2014-03-10 10:48:50', 2, 'active'),
(7, 'Mr.', '', '', 2341231231, 2, 'test@test.com', '', 0, '', 0, '2014-03-11 12:08:34', 2, 'active'),
(8, 'Mr.', '', '', 8524785261, 2, 'test@test.com', '', 0, '', 0, '2014-03-13 11:54:44', 2, 'active'),
(9, 'Mr.', 'mahesh', 'sikwal', 1232312312, 2, 'test@test.com', 'dasdas ', 0, '', 0, '2014-03-13 14:55:14', 2, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_details`
--

CREATE TABLE IF NOT EXISTS `user_login_details` (
  `user_mobile` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login_details`
--

INSERT INTO `user_login_details` (`user_mobile`, `user_name`, `password`, `group_id`) VALUES
(9324202563, '', '123', 1),
(7777777777, '', '7777777777', 2),
(1111111111, '', '123', 1),
(2222222222, '', '2222222222', 2),
(1111111111, '', '1111111111', 2),
(7894566442, '', '7894566442', 2),
(1111111123, '', '1111111123', 2),
(7345678999, '', '7345678999', 2),
(2341231231, '', '2341231231', 2),
(8524785261, '', '8524785261', 2),
(1232312312, '', '1232312312', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vac_details`
--

CREATE TABLE IF NOT EXISTS `vac_details` (
  `vac_id` int(11) NOT NULL AUTO_INCREMENT,
  `vac_name` varchar(100) NOT NULL,
  `effctive_for` varchar(100) NOT NULL,
  `start_month` varchar(50) NOT NULL,
  `end_month` varchar(50) NOT NULL,
  PRIMARY KEY (`vac_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vac_details`
--

INSERT INTO `vac_details` (`vac_id`, `vac_name`, `effctive_for`, `start_month`, `end_month`) VALUES
(1, 'Hepatitis B', 'Hepatitis B', '1 ', '2 '),
(2, 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', '2', '2'),
(3, 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', 'DTaP Hib Polio (IPV) Pneumococcal (PCV) Rotavirus', '4', '4'),
(4, 'DTaP Hib Pneumococcal (PCV) Rotavirus', 'DTaP Hib Pneumococcal (PCV) Rotavirus', '6', '6'),
(5, 'Hepatitis B Polio (IPV)', 'Hepatitis B Polio (IPV)', '6', '18'),
(6, 'Hib MMR Pneumococcal (PCV) Varicella', 'Hib MMR Pneumococcal (PCV) Varicella', '12', '15'),
(7, 'Hepatitis A', 'Hepatitis A', '12', '23'),
(8, 'DTaP', 'DTaP', '15', '18'),
(9, 'Varicella DTaP Polio (IPV) MMR', 'Varicella DTaP Polio (IPV) MMR', '48', '72');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
