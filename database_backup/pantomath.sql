-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2014 at 02:02 AM
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
-- Table structure for table `BusTimes`
--

CREATE TABLE IF NOT EXISTS `BusTimes` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_arr_time` varchar(30) DEFAULT NULL,
  `bus_dept_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `BusTimes`
--

INSERT INTO `BusTimes` (`bus_id`, `bus_arr_time`, `bus_dept_time`) VALUES
(1, '02:00', '15:30'),
(2, '00:45', '15:15'),
(3, '01:30', '16:00'),
(4, '02:15', '16:45'),
(5, '03:00', '14:00'),
(6, '02:00', '13:30'),
(7, '01:30', '11:30'),
(8, '04:15', '12:30'),
(9, '03:30', '11:30'),
(10, '03:00', '08:00'),
(11, '00:00', '08:30'),
(12, '04:46', '12:45'),
(13, '00:25', '15:45'),
(14, '23:00', '17:15'),
(15, '11:30', '05:15'),
(16, '00:15', '17:45'),
(17, '06:55', '05:15'),
(18, '00:45', '00:45'),
(19, '09:00', '06:30'),
(20, '14:00', '10:30'),
(21, '03:00', '14:00'),
(22, '02:00', '13:30'),
(23, '01:30', '11:30'),
(24, '04:15', '12:30'),
(25, '01:30', '14:30'),
(26, '19:45', '11:30'),
(27, '01:00', '16:30'),
(28, '00:30', '17:30');

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
