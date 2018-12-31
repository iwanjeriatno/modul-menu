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
-- Table structure for table `app_menu`
--

CREATE TABLE `app_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `modul_id` int(10) UNSIGNED NOT NULL,
  `label` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `link` varchar(100) DEFAULT '#',
  `no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_menu`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_menu`
--
ALTER TABLE `app_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`modul_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_menu`
--
ALTER TABLE `app_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_menu`
--
ALTER TABLE `app_menu`
  ADD CONSTRAINT `app_menu_ibfk_1` FOREIGN KEY (`modul_id`) REFERENCES `app_modul` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
