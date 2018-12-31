-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2018 at 03:30 PM
-- Server version: 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `im_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_modul`
--

CREATE TABLE `app_modul` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT '#',
  `no` int(11) DEFAULT NULL,
  `modul_cat_id` int(10) UNSIGNED DEFAULT NULL,
  `sheet` tinyint(1) NOT NULL COMMENT '0=nosheet, 1=sheet'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_modul`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_modul`
--
ALTER TABLE `app_modul`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modul_kategori_id` (`modul_cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_modul`
--
ALTER TABLE `app_modul`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_modul`
--
ALTER TABLE `app_modul`
  ADD CONSTRAINT `app_modul_ibfk_1` FOREIGN KEY (`modul_cat_id`) REFERENCES `app_modul_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
