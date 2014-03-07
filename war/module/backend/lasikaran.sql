-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2014 at 02:49 PM
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
  UNIQUE KEY `birth_date` (`birth_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `child_details`
--

INSERT INTO `child_details` (`child_id`, `child_name`, `birth_date`, `parent_id`, `gender`) VALUES
(1, 'anvee', '2014-03-04', 1, 'female'),
(4, '123', '2014-03-03', 1, 'female'),
(5, 'arnav', '2014-03-05', 2, 'male');

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
  `map_id` int(11) NOT NULL,
  `msg_type` enum('pregnancy','child','health','other') NOT NULL DEFAULT 'child',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `msg_send_status` enum('pending','failed','other','send') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `msg_schedule_master`
--

INSERT INTO `msg_schedule_master` (`id`, `user_id`, `map_id`, `msg_type`, `start_date`, `end_date`, `msg_send_status`) VALUES
(1, 1, 1, 'child', '2014-02-18', '2014-04-18', 'pending');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `salutation`, `first_name`, `last_name`, `mobile`, `refer_by_doc`, `email`, `address`, `pincode`, `location`, `phone`, `registration_date`, `group_id`, `status`) VALUES
(1, 'Mr.', '', '', 7777777777, 1, 'test@test.com', '', 0, '', 0, '0000-00-00 00:00:00', 2, 'active'),
(2, 'Mr.', '', '', 2222222222, 0, 'test@test.com', '', 0, '', 0, '2014-03-06 11:25:14', 2, 'active'),
(3, 'Mr.', '', '', 1111111111, 0, 'test@test.com', '', 0, '', 0, '2014-03-06 11:48:15', 2, 'active');

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
(1111111111, '', '1111111111', 2);

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
(1, 'Hepatitis B', 'Hepatitis B', '1', '2'),
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
