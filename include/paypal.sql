-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2016 at 09:48 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paypal`
--

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `paypalPaymentId` text NOT NULL,
  `create_time` text NOT NULL,
  `update_time` text NOT NULL,
  `state` varchar(15) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `userId`, `paypalPaymentId`, `create_time`, `update_time`, `state`, `amount`, `currency`, `created_at`) VALUES
(4, 1, 'PAY-26K14238DW768902DK3VG43A', '2016-03-17T08:44:35Z', '2016-03-17T08:44:42Z', 'approved', '66.00', '66.', '2016-03-17 08:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `sku` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `sku`, `created_at`) VALUES
(1, 'Google Nexus 6', '690.50', 'Midnight Blue, with 32 GB', 'http://api.androidhive.info/images/nexus5.jpeg', 'sku-2123wers100', '2015-02-04 17:49:42'),
(2, 'Sandisk Cruzer Blade 16 GB Flash Pendrive', '4.50', 'USB 2.0, 16 GB, Black & Red, Read 17.62 MB/sec, Write 4.42 MB/sec', 'http://api.androidhive.info/images/sandisk.jpeg', 'sku-78955545w', '2015-02-10 17:24:28'),
(3, 'Kanvas Katha Backpack', '11.25', '1 Zippered Pocket Outside at Front, Loop Handle, Dual Padded Straps at the Back, 1 Compartment', 'http://api.androidhive.info/images/backpack.jpeg', 'sku-8493948kk4', '2015-02-10 17:25:34'),
(4, 'Prestige Pressure Cooker', '30.00', 'Prestige Induction Starter Pack Deluxe Plus Pressure Cooker 5 L', 'http://api.androidhive.info/images/prestige.jpeg', 'sku-90903034ll', '2015-02-10 17:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `state` varchar(15) NOT NULL,
  `salePrice` decimal(6,2) NOT NULL,
  `quantity` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentId` (`paymentId`),
  KEY `productId` (`productId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `paymentId`, `productId`, `state`, `salePrice`, `quantity`) VALUES
(17, 4, 2, 'completed', '4.50', 1),
(18, 4, 3, 'completed', '11.25', 1),
(19, 4, 3, 'completed', '11.25', 1),
(20, 4, 2, 'completed', '4.50', 1),
(21, 4, 4, 'completed', '30.00', 1),
(22, 4, 2, 'completed', '4.50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1, 'Android Hive', 'androidhive@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`paymentId`) REFERENCES `payments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
