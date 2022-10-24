-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Okt 2022 um 03:48
-- Server-Version: 10.5.15-MariaDB-0+deb11u1
-- PHP-Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `raumklima`
--

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum` (
`yr_sum_temp` double
);

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum`
--
DROP TABLE IF EXISTS `yr_sum`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum`  AS SELECT sum(`compare_data`.`temp`) AS `yr_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '1''1'  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
