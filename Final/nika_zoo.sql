-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 16, 2020 at 06:28 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nika_zoo`
--

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `animal_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `animal_name` varchar(30) NOT NULL,
  `animal_DOB` date NOT NULL,
  `animal_gender` varchar(6) DEFAULT NULL,
  `animal_breed` varchar(30) NOT NULL,
  `animal_display` varchar(3) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `animal_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`animal_id`),
  KEY `department_id` (`department_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`animal_id`, `department_id`, `animal_name`, `animal_DOB`, `animal_gender`, `animal_breed`, `animal_display`, `user_id`, `animal_time`) VALUES
(20, 1, 'Daisy Duck', '1996-10-31', 'Female', 'Bird', 'Yes', 30, '2020-04-13 20:49:15'),
(21, 1, 'Larry The Lion', '1989-02-22', 'Male', 'Mammal', 'Yes', 30, '2020-04-13 20:49:57'),
(22, 1, 'Dumbo', '1941-10-23', 'Male', 'Elephant', 'Yes', 24, '2020-04-13 21:08:08');

--
-- Triggers `animal`
--
DROP TRIGGER IF EXISTS `DUP_ANIMAL`;
DELIMITER $$
CREATE TRIGGER `DUP_ANIMAL` BEFORE INSERT ON `animal` FOR EACH ROW BEGIN
IF(EXISTS(SELECT 1 FROM animal WHERE
          animal_name = NEW.animal_name AND
          animal_breed = NEW.animal_breed AND
          animal_DOB = NEW.animal_DOB AND
          animal_gender = NEW.animal_gender)) THEN
          SIGNAL SQLSTATE VALUE '45000'
          SET MESSAGE_TEXT = 'Animal already exists';
          END IF;
          END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(30) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'Animal'),
(2, 'Membership'),
(3, 'Ride'),
(4, 'SuperAdmin'),
(5, 'Sale'),
(6, 'Product');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `member_fname` varchar(30) NOT NULL,
  `member_fsize` int(11) NOT NULL,
  `member_lname` varchar(30) NOT NULL,
  `member_start` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `member_expire` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`member_id`),
  KEY `sale_id` (`sale_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member_id`, `sale_id`, `member_fname`, `member_fsize`, `member_lname`, `member_start`, `user_id`, `member_expire`) VALUES
(16, 26, 'Xannet', 4, 'Doe', '2020-04-15 03:13:13', 31, '2021-04-15 03:13:13'),
(17, 23, 'John', 6, 'Turner', '2020-04-13 21:27:22', 31, '2021-04-13 21:27:22'),
(18, 29, 'Austin', 8, 'Zarz', '2020-04-13 21:16:10', 31, '2021-04-13 21:16:10'),
(20, 41, 'Timmy', 4, 'Turner', '2020-04-13 21:31:19', 31, '2021-04-13 21:31:19'),
(21, 38, 'Bolo', 5, 'Bala', '2020-04-14 21:21:01', 31, '2021-04-14 21:21:01'),
(22, 53, 'Jasmine', 4, 'Mifand', '2020-04-15 22:15:05', 26, '2021-04-15 22:15:05'),
(23, 41, 'Charles', 3, 'Villa', '2020-04-15 22:17:39', 26, '2021-04-15 22:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_id`),
  KEY `product_type_id` (`product_type_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_type_id`, `product_name`, `product_price`, `user_id`, `product_time`) VALUES
(28, 4, 'Pencil', '0.99', 22, '2020-04-13 17:11:15'),
(29, 2, 'Bunny Cap', '5.00', 22, '2020-04-13 20:58:00'),
(30, 3, 'Silver membership', '125.00', 22, '2020-04-13 20:59:01'),
(31, 3, 'Bronze Membership', '75.00', 35, '2020-04-13 21:01:34'),
(32, 2, 'Necklace', '10.50', 35, '2020-04-13 21:03:48'),
(33, 2, 'Coca cola', '1.99', 35, '2020-04-14 15:20:52'),
(34, 2, 'Coffee Cup', '2.99', 25, '2020-04-14 23:32:58'),
(35, 2, 'Coffee Big Cup', '4.99', 25, '2020-04-14 23:32:58'),
(36, 3, 'Gold Membership', '175.00', 25, '2020-04-15 03:07:04'),
(38, 4, 'Adult Ticket', '75.00', 25, '2020-04-16 13:16:21'),
(39, 1, 'Teacup Ticket', '0.99', 25, '2020-04-16 13:21:49'),
(40, 1, 'Pony Ride', '0.50', 25, '2020-04-16 13:22:17');

--
-- Triggers `product`
--
DROP TRIGGER IF EXISTS `DUP_PRODUCT`;
DELIMITER $$
CREATE TRIGGER `DUP_PRODUCT` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
IF(EXISTS(SELECT 1 FROM product WHERE
          product_name = NEW.product_name AND
          product_price = NEW.product_price AND
          product_type_id = NEW.product_type_id)) THEN
          SIGNAL SQLSTATE VALUE '45000'
          SET MESSAGE_TEXT = 'Product already exists';
          END IF;
          END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `RIDE_PRICE_VIOLATION`;
DELIMITER $$
CREATE TRIGGER `RIDE_PRICE_VIOLATION` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
	IF(NEW.product_type_id = 1 
	AND 
	EXISTS(SELECT 1 FROM product WHERE product_type_id = 4 AND product_price < NEW.product_price))
	THEN
	BEGIN
		DECLARE v2 DECIMAL(10,2);
		SELECT MIN(product_price) INTO v2
		FROM product WHERE product_type_id = 4;
		SET NEW.product_price = v2;
	END;
END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `TICKET_PRICE_VIOLATION`;
DELIMITER $$
CREATE TRIGGER `TICKET_PRICE_VIOLATION` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
	IF(NEW.product_type_id = 4 
	AND 
	EXISTS(SELECT 1 FROM product WHERE product_type_id = 3 AND product_price < NEW.product_price))
	THEN
	BEGIN
		DECLARE v1 DECIMAL(10,2);
		SELECT MIN(product_price) INTO v1
		FROM product WHERE product_type_id = 3;
		SET NEW.product_price = v1;
	END;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `product_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`) VALUES
(1, 'Rides'),
(2, 'Gift Shops'),
(3, 'Memberships'),
(4, 'Tickets');

-- --------------------------------------------------------

--
-- Table structure for table `ride`
--

DROP TABLE IF EXISTS `ride`;
CREATE TABLE IF NOT EXISTS `ride` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `ride_name` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ride_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ride_id`),
  KEY `department_id` (`department_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ride`
--

INSERT INTO `ride` (`ride_id`, `department_id`, `ride_name`, `user_id`, `ride_time`) VALUES
(22, 3, 'Pony Ride', 39, '2020-04-13 21:00:40'),
(23, 3, 'Wild Water Ride', 32, '2020-04-13 21:18:32');

--
-- Triggers `ride`
--
DROP TRIGGER IF EXISTS `DUP_RIDE`;
DELIMITER $$
CREATE TRIGGER `DUP_RIDE` BEFORE INSERT ON `ride` FOR EACH ROW BEGIN
IF(EXISTS(SELECT 1 FROM ride WHERE
          department_id = NEW.department_id AND
          ride_name = NEW.ride_name)) THEN
          SIGNAL SQLSTATE VALUE '45000'
          SET MESSAGE_TEXT = 'Ride already exists';
          END IF;
          END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp(),
  `sale_qty` int(11) NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `user_id`, `product_id`, `sale_date`, `sale_qty`) VALUES
(34, 38, 31, '2020-04-13 21:23:39', 8),
(35, 23, 29, '2020-04-13 21:23:49', 2),
(36, 33, 28, '2020-04-13 21:24:06', 3),
(37, 33, 28, '2020-04-13 21:24:25', 3),
(38, 33, 31, '2020-04-13 21:24:56', 1),
(39, 23, 32, '2020-04-13 21:25:17', 2),
(40, 23, 29, '2020-04-13 21:25:17', 2),
(42, 23, 30, '2020-04-13 21:39:20', 4),
(43, 33, 33, '2020-04-15 01:08:27', 12),
(44, 38, 35, '2020-04-15 01:08:27', 17),
(45, 38, 34, '2020-04-15 01:08:45', 8),
(46, 38, 32, '2020-04-15 01:09:33', 3),
(47, 33, 29, '2020-04-15 01:09:33', 23),
(48, 33, 29, '2020-04-15 17:43:25', 8),
(49, 33, 29, '2020-04-15 17:43:25', 7),
(50, 23, 33, '2020-04-15 18:43:35', 10),
(51, 23, 29, '2020-04-15 18:43:35', 99),
(52, 23, 29, '2020-04-15 20:25:12', 17),
(53, 23, 36, '2020-04-15 20:25:12', 2),
(54, 23, 28, '2020-04-16 03:28:32', 2),
(55, 23, 32, '2020-04-16 03:28:32', 45),
(56, 23, 34, '2020-04-16 03:28:32', 46);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `user_fname` varchar(30) NOT NULL,
  `user_lname` varchar(30) NOT NULL,
  `user_DOB` date NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_gender` varchar(6) DEFAULT NULL,
  `user_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_added` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `department_id`, `user_fname`, `user_lname`, `user_DOB`, `user_email`, `user_password`, `user_gender`, `user_create_date`, `user_added`) VALUES
(22, 4, 'Super', 'Admin', '2020-04-13', 'super', 'super', 'Male', '2020-04-13 17:04:04', 22),
(23, 5, 'Darina', 'Gabuardy', '2020-04-13', 'sale', 'sale', 'Female', '2020-04-13 17:12:55', 22),
(24, 1, 'Mike', 'Carney', '1973-04-07', 'mikec@yahoo.com', 'mikec', 'male', '2020-04-13 18:03:50', 22),
(25, 6, 'Jack', 'Griffin', '1995-08-16', 'jackg@yahoo.com', 'jackg', 'male', '2020-04-13 18:14:59', 22),
(26, 2, 'Hank', 'Falcon', '1980-08-17', 'hfalcon@gmail.com', 'hfalcon', 'male', '2020-04-13 19:23:22', 22),
(27, 3, 'Nika', 'Nika', '2020-04-01', 'nika', 'nika', 'female', '2020-04-13 20:19:49', 22),
(29, 4, 'Lauren', 'Tess', '2002-07-14', 'tess2002@gmail.com', 'tess2002', 'female', '2020-04-13 20:40:47', 22),
(30, 1, 'Jannet', 'Johnson', '1990-10-31', 'animal', 'animal', 'female', '2020-04-13 20:42:27', 22),
(31, 2, 'John', 'Toast', '1990-10-31', 'member', 'member', 'male', '2020-04-13 20:43:07', 22),
(32, 3, 'Manila', 'Luzon', '1990-10-31', 'ride90', 'ride', 'female', '2020-04-13 20:43:34', 22),
(33, 5, 'Gigi', 'Goode', '1990-10-31', 'sale90', 'sale', 'female', '2020-04-13 20:44:18', 22),
(34, 5, 'Kaitlin', 'Mending', '1994-07-19', 'km9419@aol.com', 'km9419', 'female', '2020-04-13 20:44:34', 22),
(35, 6, 'Katya', 'Zamolodchikova', '1990-10-31', 'product', 'product', 'female', '2020-04-13 20:45:46', 22),
(36, 3, 'Joe', 'Snapper', '1964-09-08', 'snapperj64@yahoo.com', 'snapperj64', 'male', '2020-04-13 20:46:26', 22),
(37, 4, 'RuPaul', 'Charles', '1990-10-31', 'super90', 'super', 'Male', '2020-04-13 20:46:55', 22),
(38, 5, 'Brian', 'Finch', '1964-10-07', 'sale64', 'sale64', 'Male', '2020-04-13 20:50:33', 22),
(39, 3, 'Leo', 'Black', '2020-04-01', 'ride', 'ride', 'male', '2020-04-13 20:59:08', 22),
(40, 4, 'SuperAd2', 'SuperAd2', '2020-04-08', 'sup2', 'sup2', 'male', '2020-04-13 21:54:58', 22),
(41, 3, 'Olga', 'White', '2020-04-09', '123456', '123456', 'female', '2020-04-13 21:55:54', 40),
(42, 6, 'James', 'Turner', '1988-11-21', 'jturner@gmail.com', 'supersecretpassword', 'male', '2020-04-13 21:58:03', 40),
(43, 6, 'Pang', 'Tin', '1995-08-08', 'product99', 'product99', 'female', '2020-04-13 21:58:06', 40);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ride`
--
ALTER TABLE `ride`
  ADD CONSTRAINT `ride_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
