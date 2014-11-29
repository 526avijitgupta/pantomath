-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2014 at 03:27 AM
-- Server version: 5.5.40
-- PHP Version: 5.3.10-1ubuntu3.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pantomath`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inparam`(in temp_id int)
begin
select id from try where id = temp_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pro`()
begin
select * from try;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `temp`(in temp_id int)
begin
select * from try where id = temp_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `try1`()
begin
select * from try;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `BusCities`
--

CREATE TABLE IF NOT EXISTS `BusCities` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_source` varchar(30) DEFAULT NULL,
  `bus_destination` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `BusCities`
--

INSERT INTO `BusCities` (`route_id`, `bus_source`, `bus_destination`) VALUES
(1, 'Delhi', 'Lucknow'),
(2, 'Lucknow', 'Delhi'),
(3, 'Mumbai', 'Goa'),
(4, 'Goa', 'Mumbai'),
(5, 'Bangalore', 'Mumbai'),
(6, 'Mumbai', 'Bangalore'),
(7, 'Bangalore', 'Chennai'),
(8, 'Chennai', 'Bangalore'),
(9, 'Mumbai', 'Chennai'),
(10, 'Chennai', 'Mumbai'),
(11, 'Lucknow', 'Kanpur'),
(12, 'Kanpur', 'Lucknow'),
(13, 'Bangalore', 'Hyderabad'),
(14, 'Hyderabad', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `BusData`
--

CREATE TABLE IF NOT EXISTS `BusData` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_arr_time` varchar(30) DEFAULT NULL,
  `bus_dept_time` varchar(30) DEFAULT NULL,
  `bus_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`bus_id`),
  KEY `bus_id` (`bus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `BusData`
--

INSERT INTO `BusData` (`bus_id`, `bus_arr_time`, `bus_dept_time`, `bus_price`) VALUES
(1, '02:00', '15:30', 880),
(2, '00:45', '15:15', 850),
(3, '01:30', '16:00', 825),
(4, '02:15', '16:45', 850),
(5, '03:00', '14:00', 800),
(6, '02:00', '13:30', 400),
(7, '01:30', '11:30', 1000),
(8, '04:15', '12:30', 600),
(9, '03:30', '11:30', 1680),
(10, '03:00', '08:00', 1050),
(11, '00:00', '08:30', 1049),
(12, '04:46', '12:45', 1200),
(13, '00:25', '15:45', 350),
(14, '23:00', '17:15', 500),
(15, '11:30', '05:15', 500),
(16, '00:15', '17:45', 500),
(17, '06:55', '05:15', 1600),
(18, '00:45', '00:45', 1600),
(19, '09:00', '06:30', 1600),
(20, '14:00', '10:30', 1700),
(21, '03:00', '14:00', 400),
(22, '02:00', '13:30', 425),
(23, '01:30', '11:30', 500),
(24, '04:15', '12:30', 450),
(25, '01:30', '14:30', 1200),
(26, '19:45', '11:30', 1080),
(27, '01:00', '16:30', 950),
(28, '00:30', '17:30', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `BusRoutes`
--

CREATE TABLE IF NOT EXISTS `BusRoutes` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bus_id`,`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `BusRoutes`
--

INSERT INTO `BusRoutes` (`bus_id`, `route_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(16, 8),
(17, 9),
(18, 9),
(19, 10),
(20, 10),
(21, 11),
(22, 11),
(23, 12),
(24, 12),
(25, 13),
(26, 13),
(27, 14),
(28, 14);

-- --------------------------------------------------------

--
-- Table structure for table `BusTypes`
--

CREATE TABLE IF NOT EXISTS `BusTypes` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`bus_id`,`bus_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `BusTypes`
--

INSERT INTO `BusTypes` (`bus_id`, `bus_type`) VALUES
(1, 'Non A/C, Seater'),
(2, 'A/C, Seater & Sleeper, 2 + 2 ( 50 )'),
(3, 'A/C, Seater & Sleeper, 2 + 2 ( 50 )'),
(4, 'Volvo, A/C, Seater, 2 + 2 ( 40 )'),
(5, 'Non A/C Seater (2+2)'),
(6, 'A/C Sleeper (2+1)'),
(7, 'A/C Sleeper (2+1)'),
(8, 'Volvo A/C Multi Axle Semi Sleeper (2+2)'),
(9, 'Volvo A/C Multi Axle Semi Sleeper (2+2)'),
(10, 'A/C Sleeper (2+1)'),
(11, 'Volvo A/C Multi Axle Semi Sleeper (2+2)'),
(12, 'Volvo A/C Multi Axle Sleeper(2+1)'),
(13, 'Volvo A/C Semi Sleeper (2+2)'),
(14, 'Non A/C Seater (1+1+1)'),
(15, 'Volvo A/C Multi Axle Semisleeper(2+1)'),
(16, 'Volvo A/C Multi-Axel (2+2)'),
(17, 'Multi-Axle Volvo, A/C, Seater, 2 + 2'),
(18, 'Multi-Axle Volvo, A/C, Seater, 2 + 2'),
(19, 'Multi-Axle Volvo, A/C, Seater, 2 + 2'),
(20, 'Multi-Axle Volvo, A/C, Seater, 2 + 2'),
(21, 'Non A/C, Seater'),
(22, 'Non A/C, Seater'),
(23, 'Non A/C, Seater'),
(24, 'Non A/C, Seater'),
(25, 'Volvo A/C Multi Axle Semi Sleeper (2+2)'),
(26, 'Non A/C Airbus (2+2)'),
(27, 'Volvo A/C Multi Axle SemiSleeper (2+2)'),
(28, 'Volvo A/C Multi Axle Semi Sleeper (2+2)');

-- --------------------------------------------------------

--
-- Table structure for table `CabCities`
--

CREATE TABLE IF NOT EXISTS `CabCities` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `cab_source` varchar(30) DEFAULT NULL,
  `cab_destination` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `CabCities`
--

INSERT INTO `CabCities` (`route_id`, `cab_source`, `cab_destination`) VALUES
(1, 'New Delhi', 'Bangalore'),
(2, 'New Delhi', 'Kolkata'),
(3, 'New Delhi', 'Mumbai'),
(4, 'New Delhi', 'Hyderabad'),
(5, 'New Delhi', 'Chennai'),
(6, 'Bangalore', 'New Delhi'),
(7, 'Bangalore', 'Kolkata'),
(8, 'Bangalore', 'Mumbai'),
(9, 'Bangalore', 'Hyderabad'),
(10, 'Bangalore', 'Chennai'),
(11, 'Kolkata', 'New Delhi'),
(12, 'Kolkata', 'Bangalore'),
(13, 'Kolkata', 'Mumbai'),
(14, 'Kolkata', 'Hyderabad'),
(15, 'Kolkata', 'Chennai'),
(16, 'Mumbai', 'New Delhi'),
(17, 'Mumbai', 'Bangalore'),
(18, 'Mumbai', 'Kolkata'),
(19, 'Mumbai', 'Hyderabad'),
(20, 'Mumbai', 'Chennai'),
(21, 'Hyderabad', 'New Delhi'),
(22, 'Hyderabad', 'Bangalore'),
(23, 'Hyderabad', 'Kolkata'),
(24, 'Hyderabad', 'Mumbai'),
(25, 'Hyderabad', 'Chennai'),
(26, 'Chennai', 'New Delhi'),
(27, 'Chennai', 'Bangalore'),
(28, 'Chennai', 'Kolkata'),
(29, 'Chennai', 'Mumbai'),
(30, 'Chennai', 'Hyderabad');

-- --------------------------------------------------------

--
-- Table structure for table `CabNames`
--

CREATE TABLE IF NOT EXISTS `CabNames` (
  `cab_id` int(11) NOT NULL AUTO_INCREMENT,
  `cab_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`cab_id`,`cab_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `CabNames`
--

INSERT INTO `CabNames` (`cab_id`, `cab_name`) VALUES
(1, 'Tata Indica or Equivalent'),
(2, 'Tata Indigo or Equivalent'),
(3, 'Chevrolet Tavera or Equivalent'),
(4, 'Tata Indica or Equivalent'),
(5, 'Tata Indigo or Equivalent'),
(6, 'Chevrolet Tavera or Equivalent'),
(7, 'Tata Indica or Equivalent'),
(8, 'Tata Indigo or Equivalent'),
(9, 'Chevrolet Tavera or Equivalent'),
(10, 'Tata Indica or Equivalent'),
(11, 'Tata Indigo or Equivalent'),
(12, 'Chevrolet Tavera or Equivalent'),
(13, 'Tata Indica or Equivalent'),
(14, 'Tata Indigo or Equivalent'),
(15, 'Chevrolet Tavera or Equivalent'),
(16, 'Tata Indica or Equivalent'),
(17, 'Tata Indigo or Equivalent'),
(18, 'Chevrolet Tavera or Equivalent'),
(19, 'Tata Indica or Equivalent'),
(20, 'Tata Indigo or Equivalent'),
(21, 'Chevrolet Tavera or Equivalent'),
(22, 'Tata Indica or Equivalent'),
(23, 'Tata Indigo or Equivalent'),
(24, 'Chevrolet Tavera or Equivalent'),
(25, 'Tata Indica or Equivalent'),
(26, 'Tata Indigo or Equivalent'),
(27, 'Chevrolet Tavera or Equivalent'),
(28, 'Tata Indica or Equivalent'),
(29, 'Tata Indigo or Equivalent'),
(30, 'Chevrolet Tavera or Equivalent'),
(31, 'Tata Indica or Equivalent'),
(32, 'Tata Indigo or Equivalent'),
(33, 'Toyota Innova'),
(34, 'Tata Indica or Equivalent'),
(35, 'Tata Indigo or Equivalent'),
(36, 'Toyota Innova'),
(37, 'Tata Indica or Equivalent'),
(38, 'Tata Indigo or Equivalent'),
(39, 'Toyota Innova'),
(40, 'Tata Indica or Equivalent'),
(41, 'Tata Indigo or Equivalent'),
(42, 'Toyota Innova'),
(43, 'Tata Indica or Equivalent'),
(44, 'Tata Indigo or Equivalent'),
(45, 'Toyota Innova'),
(46, 'Tata Indica or Equivalent'),
(47, 'Tata Indigo or Equivalent'),
(48, 'Chevrolet Tavera or Equivalent'),
(49, 'Tata Indica or Equivalent'),
(50, 'Tata Indigo or Equivalent'),
(51, 'Chevrolet Tavera or Equivalent'),
(52, 'Tata Indica or Equivalent'),
(53, 'Tata Indigo or Equivalent'),
(54, 'Chevrolet Tavera or Equivalent'),
(55, 'Tata Indica or Equivalent'),
(56, 'Tata Indigo or Equivalent'),
(57, 'Chevrolet Tavera or Equivalent'),
(58, 'Tata Indica or Equivalent'),
(59, 'Tata Indigo or Equivalent'),
(60, 'Chevrolet Tavera or Equivalent'),
(61, 'Tata Indica or Equivalent'),
(62, 'Tata Indigo or Equivalent'),
(63, 'Toyota Innova'),
(64, 'Tata Indica or Equivalent'),
(65, 'Tata Indigo or Equivalent'),
(66, 'Toyota Innova'),
(67, 'Tata Indica or Equivalent'),
(68, 'Tata Indigo or Equivalent'),
(69, 'Toyota Innova'),
(70, 'Tata Indica or Equivalent'),
(71, 'Tata Indigo or Equivalent'),
(72, 'Toyota Innova'),
(73, 'Tata Indica or Equivalent'),
(74, 'Tata Indigo or Equivalent'),
(75, 'Toyota Innova'),
(76, 'Tata Indica or Equivalent'),
(77, 'Tata Indigo or Equivalent'),
(78, 'Chevrolet Tavera or Equivalent'),
(79, 'Tata Indica or Equivalent'),
(80, 'Tata Indigo or Equivalent'),
(81, 'Chevrolet Tavera or Equivalent'),
(82, 'Tata Indica or Equivalent'),
(83, 'Tata Indigo or Equivalent'),
(84, 'Chevrolet Tavera or Equivalent'),
(85, 'Tata Indica or Equivalent'),
(86, 'Tata Indigo or Equivalent'),
(87, 'Chevrolet Tavera or Equivalent'),
(88, 'Tata Indica or Equivalent'),
(89, 'Tata Indigo or Equivalent'),
(90, 'Chevrolet Tavera or Equivalent');

-- --------------------------------------------------------

--
-- Table structure for table `CabPrices`
--

CREATE TABLE IF NOT EXISTS `CabPrices` (
  `cab_id` int(11) NOT NULL AUTO_INCREMENT,
  `cab_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`cab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `CabPrices`
--

INSERT INTO `CabPrices` (`cab_id`, `cab_price`) VALUES
(1, 3117),
(2, 3117),
(3, 3673),
(4, 3117),
(5, 3117),
(6, 3673),
(7, 3117),
(8, 3117),
(9, 3673),
(10, 3117),
(11, 3117),
(12, 3673),
(13, 3117),
(14, 3117),
(15, 3673),
(16, 2744),
(17, 3138),
(18, 3794),
(19, 2744),
(20, 3138),
(21, 3794),
(22, 2744),
(23, 3138),
(24, 3794),
(25, 2744),
(26, 3138),
(27, 3794),
(28, 2744),
(29, 3138),
(30, 3794),
(31, 3400),
(32, 3269),
(33, 4450),
(34, 3400),
(35, 3269),
(36, 4450),
(37, 3400),
(38, 3269),
(39, 4450),
(40, 3400),
(41, 3269),
(42, 4450),
(43, 3400),
(44, 3269),
(45, 4450),
(46, 3138),
(47, 3175),
(48, 3663),
(49, 3138),
(50, 3175),
(51, 3663),
(52, 3138),
(53, 3175),
(54, 3663),
(55, 3138),
(56, 3175),
(57, 3663),
(58, 3138),
(59, 3175),
(60, 3663),
(61, 3306),
(62, 4250),
(63, 4912),
(64, 3306),
(65, 4250),
(66, 4912),
(67, 3306),
(68, 4250),
(69, 4912),
(70, 3306),
(71, 4250),
(72, 4912),
(73, 3306),
(74, 4250),
(75, 4912),
(76, 2811),
(77, 4513),
(78, 4382),
(79, 2811),
(80, 4513),
(81, 4382),
(82, 2811),
(83, 4513),
(84, 4382),
(85, 2811),
(86, 4513),
(87, 4382),
(88, 2811),
(89, 4513),
(90, 4382);

-- --------------------------------------------------------

--
-- Table structure for table `CabRoutes`
--

CREATE TABLE IF NOT EXISTS `CabRoutes` (
  `cab_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cab_id`,`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `CabRoutes`
--

INSERT INTO `CabRoutes` (`cab_id`, `route_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(11, 4),
(12, 4),
(13, 5),
(14, 5),
(15, 5),
(16, 6),
(17, 6),
(18, 6),
(19, 7),
(20, 7),
(21, 7),
(22, 8),
(23, 8),
(24, 8),
(25, 9),
(26, 9),
(27, 9),
(28, 10),
(29, 10),
(30, 10),
(31, 11),
(32, 11),
(33, 11),
(34, 12),
(35, 12),
(36, 12),
(37, 13),
(38, 13),
(39, 13),
(40, 14),
(41, 14),
(42, 14),
(43, 15),
(44, 15),
(45, 15),
(46, 16),
(47, 16),
(48, 16),
(49, 17),
(50, 17),
(51, 17),
(52, 18),
(53, 18),
(54, 18),
(55, 19),
(56, 19),
(57, 19),
(58, 20),
(59, 20),
(60, 20),
(61, 21),
(62, 21),
(63, 21),
(64, 22),
(65, 22),
(66, 22),
(67, 23),
(68, 23),
(69, 23),
(70, 24),
(71, 24),
(72, 24),
(73, 25),
(74, 25),
(75, 25),
(76, 26),
(77, 26),
(78, 26),
(79, 27),
(80, 27),
(81, 27),
(82, 28),
(83, 28),
(84, 28),
(85, 29),
(86, 29),
(87, 29),
(88, 30),
(89, 30),
(90, 30);

-- --------------------------------------------------------

--
-- Table structure for table `CabTypes`
--

CREATE TABLE IF NOT EXISTS `CabTypes` (
  `cab_id` int(11) NOT NULL AUTO_INCREMENT,
  `cab_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`cab_id`,`cab_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `CabTypes`
--

INSERT INTO `CabTypes` (`cab_id`, `cab_type`) VALUES
(1, 'AC Economy'),
(2, 'AC Mid-Size'),
(3, 'AC SUV Large'),
(4, 'AC Economy'),
(5, 'AC Mid-Size'),
(6, 'AC SUV Large'),
(7, 'AC Economy'),
(8, 'AC Mid-Size'),
(9, 'AC SUV Large'),
(10, 'AC Economy'),
(11, 'AC Mid-Size'),
(12, 'AC SUV Large'),
(13, 'AC Economy'),
(14, 'AC Mid-Size'),
(15, 'AC SUV Large'),
(16, 'AC Economy'),
(17, 'AC Mid-Size'),
(18, 'AC SUV Large'),
(19, 'AC Economy'),
(20, 'AC Mid-Size'),
(21, 'AC SUV Large'),
(22, 'AC Economy'),
(23, 'AC Mid-Size'),
(24, 'AC SUV Large'),
(25, 'AC Economy'),
(26, 'AC Mid-Size'),
(27, 'AC SUV Large'),
(28, 'AC Economy'),
(29, 'AC Mid-Size'),
(30, 'AC SUV Large'),
(31, 'AC Economy'),
(32, 'AC Mid-Size'),
(33, 'AC Minivan'),
(34, 'AC Economy'),
(35, 'AC Mid-Size'),
(36, 'AC Minivan'),
(37, 'AC Economy'),
(38, 'AC Mid-Size'),
(39, 'AC Minivan'),
(40, 'AC Economy'),
(41, 'AC Mid-Size'),
(42, 'AC Minivan'),
(43, 'AC Economy'),
(44, 'AC Mid-Size'),
(45, 'AC Minivan'),
(46, 'AC Economy'),
(47, 'AC Mid-Size'),
(48, 'AC SUV Large'),
(49, 'AC Economy'),
(50, 'AC Mid-Size'),
(51, 'AC SUV Large'),
(52, 'AC Economy'),
(53, 'AC Mid-Size'),
(54, 'AC SUV Large'),
(55, 'AC Economy'),
(56, 'AC Mid-Size'),
(57, 'AC SUV Large'),
(58, 'AC Economy'),
(59, 'AC Mid-Size'),
(60, 'AC SUV Large'),
(61, 'AC Economy'),
(62, 'AC Mid-Size'),
(63, 'AC Minivan'),
(64, 'AC Economy'),
(65, 'AC Mid-Size'),
(66, 'AC Minivan'),
(67, 'AC Economy'),
(68, 'AC Mid-Size'),
(69, 'AC Minivan'),
(70, 'AC Economy'),
(71, 'AC Mid-Size'),
(72, 'AC Minivan'),
(73, 'AC Economy'),
(74, 'AC Mid-Size'),
(75, 'AC Minivan'),
(76, 'AC Economy'),
(77, 'AC Mid-Size'),
(78, 'AC SUV Large'),
(79, 'AC Economy'),
(80, 'AC Mid-Size'),
(81, 'AC SUV Large'),
(82, 'AC Economy'),
(83, 'AC Mid-Size'),
(84, 'AC SUV Large'),
(85, 'AC Economy'),
(86, 'AC Mid-Size'),
(87, 'AC SUV Large'),
(88, 'AC Economy'),
(89, 'AC Mid-Size'),
(90, 'AC SUV Large');

-- --------------------------------------------------------

--
-- Table structure for table `FlightCities`
--

CREATE TABLE IF NOT EXISTS `FlightCities` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_source` varchar(30) DEFAULT NULL,
  `flight_destination` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `FlightCities`
--

INSERT INTO `FlightCities` (`route_id`, `flight_source`, `flight_destination`) VALUES
(1, 'Delhi', 'Mumbai'),
(2, 'Delhi', 'Chennai'),
(3, 'Delhi', 'Bangalore'),
(4, 'Delhi', 'Goa'),
(5, 'Mumbai', 'Delhi'),
(6, 'Mumbai', 'Chennai'),
(7, 'Mumbai', 'Bangalore'),
(8, 'Mumbai', 'Goa'),
(9, 'Chennai', 'Delhi'),
(10, 'Chennai', 'Mumbai'),
(11, 'Chennai', 'Bangalore'),
(12, 'Chennai', 'Goa'),
(13, 'Bangalore', 'Delhi'),
(14, 'Bangalore', 'Mumbai'),
(15, 'Bangalore', 'Chennai'),
(16, 'Bangalore', 'Goa'),
(17, 'Goa', 'Delhi'),
(18, 'Goa', 'Mumbai'),
(19, 'Goa', 'Chennai'),
(20, 'Goa', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `FlightData`
--

CREATE TABLE IF NOT EXISTS `FlightData` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_arr_time` varchar(30) DEFAULT NULL,
  `flight_dept_time` varchar(30) DEFAULT NULL,
  `flight_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `FlightData`
--

INSERT INTO `FlightData` (`flight_id`, `flight_arr_time`, `flight_dept_time`, `flight_price`) VALUES
(1, '19:55', '17:50', 6307),
(2, '15:25', '13:15', 6267),
(3, '07:45', '05:30', 6267),
(4, '14:05', '12:10', 8890),
(5, '14:05', '12:10', 6057),
(6, '14:05', '12:10', 6057),
(7, '12:30', '09:45', 6500),
(8, '12:15', '09:30', 6500),
(9, '19:15', '16:35', 6500),
(10, '16:10', '14:00', 9574),
(11, '18:00', '15:30', 7842),
(12, '18:00', '15:30', 7842),
(13, '18:40', '16:30', 6491),
(14, '08:25', '06:20', 6491),
(15, '10:40', '08:30', 6491),
(16, '16:50', '14:45', 5180),
(17, '23:15', '21:15', 4608),
(18, '04:50', '02:55', 5181),
(19, '21:45', '20:20', 4094),
(20, '17:30', '15:55', 4094),
(21, '16:55', '15:15', 4198),
(22, '16:00', '14:55', 3688),
(23, '23:25', '22:15', 4020),
(24, '16:00', '14:55', 3688),
(25, '23:45', '21:05', 8304),
(26, '18:20', '17:15', 7875),
(27, '07:55', '06:50', 8011),
(28, '15:35', '13:40', 6027),
(29, '18:20', '17:15', 5415),
(30, '07:10', '05:15', 5266),
(31, '06:55', '06:00', 1452),
(32, '23:00', '21:55', 1450),
(33, '23:00', '21:55', 1450),
(34, '23:00', '21:55', 3950),
(35, '12:40', '11:35', 4763),
(36, '07:55', '06:50', 3988),
(37, '14:25', '11:45', 8300),
(38, '01:05', '22:15', 6503),
(39, '12:40', '10:00', 6500),
(40, '23:25', '21:50', 4678),
(41, '06:55', '05:20', 4105),
(42, '06:55', '05:20', 4105),
(43, '16:30', '15:30', 1650),
(44, '07:25', '06:25', 2299),
(45, '07:35', '06:40', 1452),
(46, '07:40', '06:30', 2499),
(47, '07:40', '06:30', 1890),
(48, '07:35', '06:20', 2090),
(49, '15:50', '14:35', 9462),
(50, '15:50', '14:35', 8413),
(51, '21:00', '18:30', 7731),
(52, '01:05', '23:55', 4536),
(53, '01:05', '23:55', 3329),
(54, '15:00', '13:30', 3329),
(55, '01:05', '23:55', 3329),
(56, '09:00', '07:35', 4652),
(57, '15:00', '13:30', 5323),
(58, '09:30', '08:10', 4232),
(59, '09:30', '08:10', 3630),
(60, '09:30', '08:10', 2499);

-- --------------------------------------------------------

--
-- Table structure for table `FlightNames`
--

CREATE TABLE IF NOT EXISTS `FlightNames` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `FlightNames`
--

INSERT INTO `FlightNames` (`flight_id`, `flight_name`) VALUES
(1, 'Go Air'),
(2, 'IndiGo'),
(3, 'IndiGo'),
(4, 'Air India'),
(5, 'Go Air'),
(6, 'Go Air'),
(7, 'Air India'),
(8, 'Air India'),
(9, 'Air India'),
(10, 'Jet Airways'),
(11, 'SpiceJet'),
(12, 'SpiceJet'),
(13, 'IndiGo'),
(14, 'Air India'),
(15, 'IndiGo'),
(16, 'IndiGo'),
(17, 'AirIndia Express'),
(18, 'Jet Airways'),
(19, 'IndiGo'),
(20, 'IndiGo'),
(21, 'Go Air'),
(22, 'Go Air'),
(23, 'Go Air'),
(24, 'Go Air'),
(25, 'Air India'),
(26, 'Air India'),
(27, 'Jet Airways'),
(28, 'Jet Airways'),
(29, 'Air India'),
(30, 'Go Air'),
(31, 'Air India'),
(32, 'Jet Airways'),
(33, 'Jet Airways'),
(34, 'Jet Airways'),
(35, 'IndiGo'),
(36, 'Jet Airways'),
(37, 'Go Air'),
(38, 'Jet Airways'),
(39, 'SpiceJet'),
(40, 'Jet Airways'),
(41, 'IndiGo'),
(42, 'IndiGo'),
(43, 'Air India'),
(44, 'IndiGo'),
(45, 'Jet Airways'),
(46, 'IndiGo'),
(47, 'IndiGo'),
(48, 'SpiceJet'),
(49, 'Jet Airways'),
(50, 'Jet Airways'),
(51, 'SpiceJet'),
(52, 'Go Air'),
(53, 'Go Air'),
(54, 'Go Air'),
(55, 'Go Air'),
(56, 'Air India'),
(57, 'Go Air'),
(58, 'IndiGo'),
(59, 'IndiGo'),
(60, 'IndiGo');

-- --------------------------------------------------------

--
-- Table structure for table `FlightRoutes`
--

CREATE TABLE IF NOT EXISTS `FlightRoutes` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flight_id`,`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `FlightRoutes`
--

INSERT INTO `FlightRoutes` (`flight_id`, `route_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 4),
(11, 4),
(12, 4),
(13, 5),
(14, 5),
(15, 5),
(16, 6),
(17, 6),
(18, 6),
(19, 7),
(20, 7),
(21, 7),
(22, 8),
(23, 8),
(24, 8),
(25, 9),
(26, 9),
(27, 9),
(28, 10),
(29, 10),
(30, 10),
(31, 11),
(32, 11),
(33, 11),
(34, 12),
(35, 12),
(36, 12),
(37, 13),
(38, 13),
(39, 13),
(40, 14),
(41, 14),
(42, 14),
(43, 15),
(44, 15),
(45, 15),
(46, 16),
(47, 16),
(48, 16),
(49, 17),
(50, 17),
(51, 17),
(52, 18),
(53, 18),
(54, 18),
(55, 19),
(56, 19),
(57, 19),
(58, 20),
(59, 20),
(60, 20);

-- --------------------------------------------------------

--
-- Table structure for table `HotelCities`
--

CREATE TABLE IF NOT EXISTS `HotelCities` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`location_id`,`location`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `HotelCities`
--

INSERT INTO `HotelCities` (`location_id`, `location`) VALUES
(1, 'Mumbai'),
(2, 'Bangalore'),
(3, 'Chennai'),
(4, 'Kolkata'),
(5, 'Lucknow'),
(6, 'Delhi'),
(7, 'Goa');

-- --------------------------------------------------------

--
-- Table structure for table `HotelNames`
--

CREATE TABLE IF NOT EXISTS `HotelNames` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(50) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `HotelNames`
--

INSERT INTO `HotelNames` (`hotel_id`, `hotel_name`, `location_id`) VALUES
(1, 'Palladium Hotel, Mumbai', 1),
(2, 'Trident Nariman Point', 1),
(3, 'Best Western Hotel Sahil Mumbai', 1),
(4, 'Four Seasons Hotel Mumbai', 1),
(5, 'The Taj Mahal Palace', 1),
(6, 'The Oberoi Mumbai', 1),
(7, 'The Ritz - Carlton, Bangalore', 2),
(8, 'Oakwood Premier Prestige Bangalore', 2),
(9, 'Citadines Richmond Bangalore', 2),
(10, 'The Oberoi Bangalore', 2),
(11, 'My Fortune Bengaluru', 2),
(12, 'The Gateway Hotel Residency Road', 2),
(13, 'Hyatt Regency Chennai', 3),
(14, 'The Residency Towers', 3),
(15, 'The Accord Metropolitan', 3),
(16, 'The Raintree Hotel, Anna Salai', 3),
(17, 'The Residency, Chennai', 3),
(18, 'Savera Hotel', 3),
(19, 'The Oberoi Grand Kolkata', 4),
(20, 'New Kenilworth Hotel', 4),
(21, 'Hotel Casa Fortuna', 4),
(22, 'Taj Bengal', 4),
(23, 'The Peerless Inn', 4),
(24, 'Sapphire Suites', 4),
(25, 'Golden Tulip Lucknow', 5),
(26, 'Vivanta by Taj Gomti Nagar', 5),
(27, 'Clarks Avadh', 5),
(28, 'Best Western Plus Levana', 5),
(29, 'York Inn', 5),
(30, 'Hotel Santa Inn', 5),
(31, 'Shangri-La''s - Eros Hotel, New Delhi', 6),
(32, 'The LaLiT New Delhi', 6),
(33, 'Hotel Cabana @ Pahar Ganj', 6),
(34, 'The Imperial, New Delhi', 6),
(35, 'Radisson Blu Marina Hotel Connaught Place', 6),
(36, 'Hotel Palm D''Or', 6),
(37, 'Beleza By The Beach', 7),
(38, 'Alila Diwa Goa', 7),
(39, 'Kenilworth Resort & SPA,Goa', 7),
(40, 'The Treehouse Blue', 7),
(41, 'Ramada Caravela Beach Resort', 7),
(42, 'The Fern Beira Mar Resort', 7),
(43, 'Palladium Hotel, Mumbai', 1),
(44, 'Trident Nariman Point', 1),
(45, 'Best Western Hotel Sahil Mumbai', 1),
(46, 'Four Seasons Hotel Mumbai', 1),
(47, 'The Taj Mahal Palace', 1),
(48, 'The Oberoi Mumbai', 1),
(49, 'The Ritz - Carlton, Bangalore', 2),
(50, 'Oakwood Premier Prestige Bangalore', 2),
(51, 'Citadines Richmond Bangalore', 2),
(52, 'The Oberoi Bangalore', 2),
(53, 'My Fortune Bengaluru', 2),
(54, 'The Gateway Hotel Residency Road', 2),
(55, 'Hyatt Regency Chennai', 3),
(56, 'The Residency Towers', 3),
(57, 'The Accord Metropolitan', 3),
(58, 'The Raintree Hotel, Anna Salai', 3),
(59, 'The Residency, Chennai', 3),
(60, 'Savera Hotel', 3),
(61, 'The Oberoi Grand Kolkata', 4),
(62, 'New Kenilworth Hotel', 4),
(63, 'Hotel Casa Fortuna', 4),
(64, 'Taj Bengal', 4),
(65, 'The Peerless Inn', 4),
(66, 'Sapphire Suites', 4),
(67, 'Golden Tulip Lucknow', 5),
(68, 'Vivanta by Taj Gomti Nagar', 5),
(69, 'Clarks Avadh', 5),
(70, 'Best Western Plus Levana', 5),
(71, 'York Inn', 5),
(72, 'Hotel Santa Inn', 5),
(73, 'Shangri-La''s - Eros Hotel, New Delhi', 6),
(74, 'The LaLiT New Delhi', 6),
(75, 'Hotel Cabana @ Pahar Ganj', 6),
(76, 'The Imperial, New Delhi', 6),
(77, 'Radisson Blu Marina Hotel Connaught Place', 6),
(78, 'Hotel Palm D''Or', 6),
(79, 'Beleza By The Beach', 7),
(80, 'Alila Diwa Goa', 7),
(81, 'Kenilworth Resort & SPA,Goa', 7),
(82, 'The Treehouse Blue', 7),
(83, 'Ramada Caravela Beach Resort', 7),
(84, 'The Fern Beira Mar Resort', 7),
(85, 'Palladium Hotel, Mumbai', 1),
(86, 'Trident Nariman Point', 1),
(87, 'Best Western Hotel Sahil Mumbai', 1),
(88, 'Four Seasons Hotel Mumbai', 1),
(89, 'The Taj Mahal Palace', 1),
(90, 'The Oberoi Mumbai', 1),
(91, 'The Ritz - Carlton, Bangalore', 2),
(92, 'Oakwood Premier Prestige Bangalore', 2),
(93, 'Citadines Richmond Bangalore', 2),
(94, 'The Oberoi Bangalore', 2),
(95, 'My Fortune Bengaluru', 2),
(96, 'The Gateway Hotel Residency Road', 2),
(97, 'Hyatt Regency Chennai', 3),
(98, 'The Residency Towers', 3),
(99, 'The Accord Metropolitan', 3),
(100, 'The Raintree Hotel, Anna Salai', 3),
(101, 'The Residency, Chennai', 3),
(102, 'Savera Hotel', 3),
(103, 'The Oberoi Grand Kolkata', 4),
(104, 'New Kenilworth Hotel', 4),
(105, 'Hotel Casa Fortuna', 4),
(106, 'Taj Bengal', 4),
(107, 'The Peerless Inn', 4),
(108, 'Sapphire Suites', 4),
(109, 'Golden Tulip Lucknow', 5),
(110, 'Vivanta by Taj Gomti Nagar', 5),
(111, 'Clarks Avadh', 5),
(112, 'Best Western Plus Levana', 5),
(113, 'York Inn', 5),
(114, 'Hotel Santa Inn', 5),
(115, 'Shangri-La''s - Eros Hotel, New Delhi', 6),
(116, 'The LaLiT New Delhi', 6),
(117, 'Hotel Cabana @ Pahar Ganj', 6),
(118, 'The Imperial, New Delhi', 6),
(119, 'Radisson Blu Marina Hotel Connaught Place', 6),
(120, 'Hotel Palm D''Or', 6),
(121, 'Beleza By The Beach', 7),
(122, 'Alila Diwa Goa', 7),
(123, 'Kenilworth Resort & SPA,Goa', 7),
(124, 'The Treehouse Blue', 7),
(125, 'Ramada Caravela Beach Resort', 7),
(126, 'The Fern Beira Mar Resort', 7);

-- --------------------------------------------------------

--
-- Table structure for table `HotelPrices`
--

CREATE TABLE IF NOT EXISTS `HotelPrices` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_price` double DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `HotelPrices`
--

INSERT INTO `HotelPrices` (`hotel_id`, `hotel_price`) VALUES
(1, 5234),
(2, 6453),
(3, 7623),
(4, 3457),
(5, 3241),
(6, 6587),
(7, 6000),
(8, 6500),
(9, 8000),
(10, 4213),
(11, 5346),
(12, 4236),
(13, 8776),
(14, 6435),
(15, 2435),
(16, 6632),
(17, 7679),
(18, 6235),
(19, 7236),
(20, 7325),
(21, 4535),
(22, 3255),
(23, 7627),
(24, 2738),
(25, 8328),
(26, 8781),
(27, 9267),
(28, 2211),
(29, 3233),
(30, 3237),
(31, 6732),
(32, 7624),
(33, 3724),
(34, 5366),
(35, 4632),
(36, 4347),
(37, 7273),
(38, 8723),
(39, 2327),
(40, 6737),
(41, 6763),
(42, 9832);

-- --------------------------------------------------------

--
-- Table structure for table `HotelRatings`
--

CREATE TABLE IF NOT EXISTS `HotelRatings` (
  `hotel_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_rating` float DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `HotelRatings`
--

INSERT INTO `HotelRatings` (`hotel_id`, `hotel_rating`) VALUES
(1, 9.1),
(2, 8.9),
(3, 7.8),
(4, 8.7),
(5, 9.3),
(6, 9.3),
(7, 9.1),
(8, 7.8),
(9, 8.2),
(10, 9.2),
(11, 9.4),
(12, 8.2),
(13, 8.1),
(14, 8.2),
(15, 8),
(16, 8.6),
(17, 7.8),
(18, 7.7),
(19, 9.1),
(20, 8.7),
(21, 8),
(22, 9),
(23, 7.3),
(24, 7.5),
(25, 7.8),
(26, 8.1),
(27, 6.6),
(28, 7.8),
(29, 7.7),
(30, 6.3),
(31, 8.7),
(32, 7.9),
(33, 9.3),
(34, 7.8),
(35, 7.4),
(36, 8.5),
(37, 8),
(38, 8.5),
(39, 8.3),
(40, 8),
(41, 7.5),
(42, 8.6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
