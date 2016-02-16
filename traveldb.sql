-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2016 at 08:30 AM
-- Server version: 5.5.45-37.4-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aadamlue_traveldb`
--
CREATE DATABASE IF NOT EXISTS `traveldb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `traveldb`;

-- --------------------------------------------------------

--
-- Table structure for table `attractionratings`
--

CREATE TABLE IF NOT EXISTS `attractionratings` (
  `user_id` int(6) NOT NULL,
  `attraction_id` int(6) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attractions`
--

CREATE TABLE IF NOT EXISTS `attractions` (
  `attraction_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(50) NOT NULL DEFAULT '',
  `city_id` smallint(6) NOT NULL DEFAULT '0',
  `attraction_type` varchar(1000) NOT NULL DEFAULT 'Tourist Spot',
  `attraction_description` blob NOT NULL,
  `attraction_address` varchar(100) NOT NULL DEFAULT '',
  `attraction_hours_of_operation` blob NOT NULL,
  `attraction_entrance_price` varchar(1000) NOT NULL,
  `attraction_website` varchar(100) NOT NULL DEFAULT '',
  `attraction_picture` varchar(50) NOT NULL DEFAULT 'default_attraction_pic.jpg',
  PRIMARY KEY (`attraction_id`),
  KEY `attraction_name` (`attraction_name`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=205 ;

-- --------------------------------------------------------

--
-- Table structure for table `attraction_comments`
--

CREATE TABLE IF NOT EXISTS `attraction_comments` (
  `comment_id` int(6) NOT NULL AUTO_INCREMENT,
  `attraction_id` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `comment_subject` varchar(50) NOT NULL DEFAULT '',
  `comment_body` blob NOT NULL,
  `comment_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`comment_id`),
  KEY `attraction_comments_attraction_id_fk` (`attraction_id`),
  KEY `attraction_comments_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `attraction_photos`
--

CREATE TABLE IF NOT EXISTS `attraction_photos` (
  `photo_id` int(6) NOT NULL AUTO_INCREMENT,
  `attraction_id` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `subject` varchar(50) NOT NULL DEFAULT '',
  `photo` blob NOT NULL,
  `photo_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`photo_id`),
  KEY `attraction_photos_attraction_id_fk` (`attraction_id`),
  KEY `attraction_photos_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL DEFAULT '',
  `country_id` smallint(6) NOT NULL DEFAULT '0',
  `city_region` varchar(50) NOT NULL DEFAULT '',
  `city_population` int(11) NOT NULL DEFAULT '0',
  `city_map` varchar(50) NOT NULL DEFAULT 'default_city_map.jpg',
  `city_flag` varchar(50) NOT NULL DEFAULT 'default_city_flag.jpg',
  `city_coat_of_arms` varchar(50) NOT NULL DEFAULT 'default_city_coa.jpg',
  `city_pic` varchar(50) NOT NULL DEFAULT 'default_city_pic.jpg',
  `city_website` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`city_id`),
  KEY `city_name` (`city_name`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Table structure for table `cityratings`
--

CREATE TABLE IF NOT EXISTS `cityratings` (
  `user_id` int(6) NOT NULL,
  `city_id` smallint(6) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city_comments`
--

CREATE TABLE IF NOT EXISTS `city_comments` (
  `comment_id` int(6) NOT NULL AUTO_INCREMENT,
  `city_id` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `comment_subject` varchar(50) NOT NULL DEFAULT '',
  `comment_body` blob NOT NULL,
  `comment_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`comment_id`),
  KEY `city_comments_country_id_fk` (`city_id`),
  KEY `city_comments_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_photos`
--

CREATE TABLE IF NOT EXISTS `city_photos` (
  `photo_id` int(6) NOT NULL AUTO_INCREMENT,
  `city_id` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `subject` varchar(50) NOT NULL DEFAULT '',
  `photo` varchar(200) NOT NULL,
  `photo_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`photo_id`),
  KEY `city_photos_city_id_fk` (`city_id`),
  KEY `city_photos_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_photo_comments`
--

CREATE TABLE IF NOT EXISTS `city_photo_comments` (
  `comment_id` int(6) NOT NULL AUTO_INCREMENT,
  `photo_id` int(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `comment_subject` varchar(50) NOT NULL DEFAULT '',
  `comment_body` blob NOT NULL,
  `comment_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`comment_id`),
  KEY `city_photo_comments_photo_id_fk` (`photo_id`),
  KEY `city_photo_comments_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` int(6) NOT NULL AUTO_INCREMENT,
  `comment_name` varchar(50) NOT NULL DEFAULT '',
  `comment_subject` varchar(50) NOT NULL DEFAULT '',
  `comment_body` blob NOT NULL,
  `comment_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) NOT NULL DEFAULT '',
  `country_capital` varchar(50) NOT NULL DEFAULT ' ',
  `country_government` varchar(50) NOT NULL DEFAULT '',
  `country_currency` varchar(50) NOT NULL DEFAULT '',
  `country_population` int(11) NOT NULL DEFAULT '0',
  `country_area` int(11) NOT NULL DEFAULT '0',
  `country_official_language` varchar(50) NOT NULL DEFAULT '',
  `country_religion` varchar(50) NOT NULL DEFAULT '',
  `country_map` varchar(50) NOT NULL DEFAULT 'default_map.jpg',
  `country_flag` varchar(50) NOT NULL DEFAULT 'default_flag.jpg',
  `country_coat_of_arms` varchar(50) NOT NULL DEFAULT 'default_coa.jpg',
  `country_website` varchar(100) NOT NULL DEFAULT '',
  `country_anthem` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`country_id`),
  KEY `country_name` (`country_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `countryratings`
--

CREATE TABLE IF NOT EXISTS `countryratings` (
  `user_id` int(6) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country_comments`
--

CREATE TABLE IF NOT EXISTS `country_comments` (
  `comment_id` int(6) NOT NULL AUTO_INCREMENT,
  `country_id` smallint(6) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL DEFAULT '0',
  `comment_subject` varchar(50) NOT NULL DEFAULT '',
  `comment_body` blob NOT NULL,
  `comment_date_submitted` timestamp NOT NULL DEFAULT '2010-12-31 18:30:00',
  PRIMARY KEY (`comment_id`),
  KEY `country_comments_country_id_fk` (`country_id`),
  KEY `country_comments_user_id_fk` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `favoriteattractions`
--

CREATE TABLE IF NOT EXISTS `favoriteattractions` (
  `user_id` int(6) NOT NULL,
  `attraction_id` smallint(6) NOT NULL,
  KEY `attraction_id` (`attraction_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favoritecities`
--

CREATE TABLE IF NOT EXISTS `favoritecities` (
  `user_id` int(6) NOT NULL,
  `city_id` smallint(6) NOT NULL,
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `favoritecountries`
--

CREATE TABLE IF NOT EXISTS `favoritecountries` (
  `user_id` int(6) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  KEY `country_id` (`country_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profilepictures`
--

CREATE TABLE IF NOT EXISTS `profilepictures` (
  `user_id` int(6) NOT NULL,
  `photo` blob NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usercities`
--

CREATE TABLE IF NOT EXISTS `usercities` (
  `user_id` int(6) NOT NULL,
  `city_id` smallint(6) NOT NULL,
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usercountries`
--

CREATE TABLE IF NOT EXISTS `usercountries` (
  `user_id` int(6) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  KEY `country_id` (`country_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(6) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `origin` varchar(50) NOT NULL DEFAULT 'N/A',
  `homeCity` varchar(50) NOT NULL DEFAULT 'N/A',
  `admin` int(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attractions`
--
ALTER TABLE `attractions`
  ADD CONSTRAINT `attractions_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`);

--
-- Constraints for table `attraction_comments`
--
ALTER TABLE `attraction_comments`
  ADD CONSTRAINT `attraction_comments_attraction_id_fk` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`),
  ADD CONSTRAINT `attraction_comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attraction_photos`
--
ALTER TABLE `attraction_photos`
  ADD CONSTRAINT `attraction_photos_attraction_id_fk` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`),
  ADD CONSTRAINT `attraction_photos_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `city_comments`
--
ALTER TABLE `city_comments`
  ADD CONSTRAINT `city_comments_country_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `city_comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `city_photos`
--
ALTER TABLE `city_photos`
  ADD CONSTRAINT `city_photos_city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `city_photos_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `city_photo_comments`
--
ALTER TABLE `city_photo_comments`
  ADD CONSTRAINT `city_photo_comments_photo_id_fk` FOREIGN KEY (`photo_id`) REFERENCES `city_photos` (`photo_id`),
  ADD CONSTRAINT `city_photo_comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `country_comments`
--
ALTER TABLE `country_comments`
  ADD CONSTRAINT `country_comments_country_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `country_comments_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `favoriteattractions`
--
ALTER TABLE `favoriteattractions`
  ADD CONSTRAINT `favoriteAttractions_ibfk_1` FOREIGN KEY (`attraction_id`) REFERENCES `attractions` (`attraction_id`),
  ADD CONSTRAINT `favoriteAttractions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `favoritecities`
--
ALTER TABLE `favoritecities`
  ADD CONSTRAINT `favoriteCities_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `favoriteCities_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `favoritecountries`
--
ALTER TABLE `favoritecountries`
  ADD CONSTRAINT `favoriteCountries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `favoriteCountries_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `profilepictures`
--
ALTER TABLE `profilepictures`
  ADD CONSTRAINT `prof_pic_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `usercities`
--
ALTER TABLE `usercities`
  ADD CONSTRAINT `userCities_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`),
  ADD CONSTRAINT `userCities_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `usercountries`
--
ALTER TABLE `usercountries`
  ADD CONSTRAINT `userCountries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`),
  ADD CONSTRAINT `userCountries_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
