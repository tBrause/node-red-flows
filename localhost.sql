-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Okt 2022 um 22:36
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
-- Datenbank: `mqtt`
--
CREATE DATABASE IF NOT EXISTS `mqtt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mqtt`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `msg`
--

CREATE TABLE `msg` (
  `id` int(11) NOT NULL,
  `msg_topic` varchar(255) DEFAULT NULL,
  `msg_payload` text DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `msg`
--
ALTER TABLE `msg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `msg`
--
ALTER TABLE `msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `raumklima`
--
CREATE DATABASE IF NOT EXISTS `raumklima` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `raumklima`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `apis`
--

CREATE TABLE `apis` (
  `id` int(11) NOT NULL,
  `api_name` varchar(50) NOT NULL,
  `api_shorty_name` varchar(3) NOT NULL,
  `api_headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`api_headers`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `api_data_current`
--

CREATE TABLE `api_data_current` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `temperatur` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `sky_description` varchar(100) DEFAULT NULL,
  `sky_clouds` int(3) DEFAULT NULL,
  `air_pressure` float DEFAULT NULL,
  `probability_of_precipitation` int(3) DEFAULT NULL,
  `wind_speed` float DEFAULT NULL,
  `wind_direction_deg` int(3) DEFAULT NULL,
  `wind_direction_name` varchar(30) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `api_data_forecast`
--

CREATE TABLE `api_data_forecast` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `forecast_time` datetime NOT NULL,
  `temperatur` float DEFAULT NULL,
  `humidity` float DEFAULT NULL,
  `sky_description` varchar(100) DEFAULT NULL,
  `sky_clouds` int(3) DEFAULT NULL,
  `air_pressure` float DEFAULT NULL,
  `probability_of_precipitation` int(3) DEFAULT NULL,
  `wind_speed` float DEFAULT NULL,
  `wind_direction_deg` int(3) DEFAULT NULL,
  `wind_direction_name` varchar(30) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `compare_data`
--

CREATE TABLE `compare_data` (
  `id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `temp` float NOT NULL,
  `diff_temp` varchar(4) DEFAULT NULL,
  `humi` float DEFAULT NULL,
  `diff_humi` varchar(4) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `forecast_0h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `forecast_0h` (
`api_id` int(11)
,`forecast_time` datetime
,`temperatur` float
,`humidity` float
,`updated` timestamp
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `forecast_18h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `forecast_18h` (
`api_id` int(11)
,`forecast_time` datetime
,`temperatur` float
,`humidity` float
,`updated` timestamp
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `forecast_21h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `forecast_21h` (
`id` int(11)
,`api_id` int(11)
,`forecast_time` datetime
,`temperatur` float
,`humidity` float
,`sky_description` varchar(100)
,`sky_clouds` int(3)
,`air_pressure` float
,`probability_of_precipitation` int(3)
,`wind_speed` float
,`wind_direction_deg` int(3)
,`wind_direction_name` varchar(30)
,`updated` timestamp
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `outdoor_0h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `outdoor_0h` (
`id` int(11)
,`sensor_id` int(11)
,`temp` float
,`humi` float
,`updated` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `outdoor_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `outdoor_1d` (
`id` int(11)
,`sensor_id` int(11)
,`temp` float
,`humi` float
,`battery` int(3)
,`updated` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `outdoor_21h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `outdoor_21h` (
`id` int(11)
,`sensor_id` int(11)
,`temp` float
,`humi` float
,`updated` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_humi_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_humi_1d` (
`ow_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_humi_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_humi_1h` (
`ow_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_humi_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_humi_1m` (
`ow_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_temp_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_temp_1d` (
`ow_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_temp_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_temp_1h` (
`ow_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_temp_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_temp_1m` (
`ow_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `ow_sum_temp_all`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `ow_sum_temp_all` (
`ow_sum_temp` double
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `room_name` varchar(200) DEFAULT NULL,
  `room_description` text DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `room_settings`
--

CREATE TABLE `room_settings` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `min_temp` float NOT NULL,
  `opt_temp` float NOT NULL,
  `max_temp` float NOT NULL,
  `min_humidity` float NOT NULL,
  `max_humidity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sensor`
--

CREATE TABLE `sensor` (
  `id` int(11) NOT NULL,
  `sensor_name` varchar(150) CHARACTER SET utf8mb4 DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `temp` float DEFAULT NULL,
  `humi` float DEFAULT NULL,
  `co` int(4) DEFAULT NULL,
  `db` int(3) DEFAULT NULL,
  `battery` int(3) DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_humi_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_humi_1d` (
`wa_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_humi_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_humi_1h` (
`wa_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_humi_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_humi_1m` (
`wa_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_temp_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_temp_1d` (
`wa_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_temp_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_temp_1h` (
`wa_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wa_sum_temp_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wa_sum_temp_1m` (
`wa_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_humi_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_humi_1d` (
`wb_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_humi_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_humi_1h` (
`wb_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_humi_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_humi_1m` (
`wb_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_temp_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_temp_1d` (
`wb_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_temp_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_temp_1h` (
`wb_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `wb_sum_temp_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `wb_sum_temp_1m` (
`wb_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_humi_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_humi_1d` (
`yr_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_humi_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_humi_1h` (
`yr_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_humi_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_humi_1m` (
`yr_sum_humi` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_temp_1d`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_temp_1d` (
`yr_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_temp_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_temp_1h` (
`yr_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_temp_1m`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_temp_1m` (
`yr_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_sum_temp_all`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_sum_temp_all` (
`yr_sum_temp` double
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `yr_temp_1h`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `yr_temp_1h` (
`yr_sum_temp` double
,`api_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur des Views `forecast_0h`
--
DROP TABLE IF EXISTS `forecast_0h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `forecast_0h`  AS SELECT `api_data_forecast`.`api_id` AS `api_id`, `api_data_forecast`.`forecast_time` AS `forecast_time`, `api_data_forecast`.`temperatur` AS `temperatur`, `api_data_forecast`.`humidity` AS `humidity`, `api_data_forecast`.`updated` AS `updated` FROM `api_data_forecast` WHERE `api_data_forecast`.`forecast_time` like '%00:00:00' AND `api_data_forecast`.`updated` like '%21:%' AND `api_data_forecast`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `forecast_18h`
--
DROP TABLE IF EXISTS `forecast_18h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `forecast_18h`  AS SELECT `api_data_forecast`.`api_id` AS `api_id`, `api_data_forecast`.`forecast_time` AS `forecast_time`, `api_data_forecast`.`temperatur` AS `temperatur`, `api_data_forecast`.`humidity` AS `humidity`, `api_data_forecast`.`updated` AS `updated` FROM `api_data_forecast` WHERE `api_data_forecast`.`forecast_time` like '%18:00:00' AND `api_data_forecast`.`updated` like '%15:%' AND `api_data_forecast`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `forecast_21h`
--
DROP TABLE IF EXISTS `forecast_21h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `forecast_21h`  AS SELECT `api_data_forecast`.`id` AS `id`, `api_data_forecast`.`api_id` AS `api_id`, `api_data_forecast`.`forecast_time` AS `forecast_time`, `api_data_forecast`.`temperatur` AS `temperatur`, `api_data_forecast`.`humidity` AS `humidity`, `api_data_forecast`.`sky_description` AS `sky_description`, `api_data_forecast`.`sky_clouds` AS `sky_clouds`, `api_data_forecast`.`air_pressure` AS `air_pressure`, `api_data_forecast`.`probability_of_precipitation` AS `probability_of_precipitation`, `api_data_forecast`.`wind_speed` AS `wind_speed`, `api_data_forecast`.`wind_direction_deg` AS `wind_direction_deg`, `api_data_forecast`.`wind_direction_name` AS `wind_direction_name`, `api_data_forecast`.`updated` AS `updated` FROM `api_data_forecast` WHERE `api_data_forecast`.`forecast_time` like '%21:00:00' AND `api_data_forecast`.`updated` like '%18:%' AND `api_data_forecast`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `outdoor_0h`
--
DROP TABLE IF EXISTS `outdoor_0h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `outdoor_0h`  AS SELECT `outdoor_1d`.`id` AS `id`, `outdoor_1d`.`sensor_id` AS `sensor_id`, `outdoor_1d`.`temp` AS `temp`, `outdoor_1d`.`humi` AS `humi`, `outdoor_1d`.`updated` AS `updated` FROM `outdoor_1d` WHERE `outdoor_1d`.`updated` like '% 00:%' AND `outdoor_1d`.`updated` like '%:3%:%' AND `outdoor_1d`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `outdoor_1d`
--
DROP TABLE IF EXISTS `outdoor_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `outdoor_1d`  AS SELECT `sensor_data`.`id` AS `id`, `sensor_data`.`sensor_id` AS `sensor_id`, `sensor_data`.`temp` AS `temp`, `sensor_data`.`humi` AS `humi`, `sensor_data`.`battery` AS `battery`, `sensor_data`.`updated` AS `updated` FROM `sensor_data` WHERE `sensor_data`.`updated` >= current_timestamp() - interval 1 day AND `sensor_data`.`sensor_id` = 44  ;

-- --------------------------------------------------------

--
-- Struktur des Views `outdoor_21h`
--
DROP TABLE IF EXISTS `outdoor_21h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `outdoor_21h`  AS SELECT `outdoor_1d`.`id` AS `id`, `outdoor_1d`.`sensor_id` AS `sensor_id`, `outdoor_1d`.`temp` AS `temp`, `outdoor_1d`.`humi` AS `humi`, `outdoor_1d`.`updated` AS `updated` FROM `outdoor_1d` WHERE `outdoor_1d`.`updated` like '%21:%' AND `outdoor_1d`.`updated` like '%:3%:%' AND `outdoor_1d`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_humi_1d`
--
DROP TABLE IF EXISTS `ow_sum_humi_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_humi_1d`  AS SELECT sum(`compare_data`.`humi`) AS `ow_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '2' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_humi_1h`
--
DROP TABLE IF EXISTS `ow_sum_humi_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_humi_1h`  AS SELECT sum(`compare_data`.`humi`) AS `ow_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '2' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_humi_1m`
--
DROP TABLE IF EXISTS `ow_sum_humi_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_humi_1m`  AS SELECT sum(`compare_data`.`humi`) AS `ow_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '2' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_temp_1d`
--
DROP TABLE IF EXISTS `ow_sum_temp_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_temp_1d`  AS SELECT sum(`compare_data`.`temp`) AS `ow_sum_temp` FROM `compare_data` WHERE `compare_data`.`updated` >= current_timestamp() - interval 1 day AND `compare_data`.`api_id` = '2''2'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_temp_1h`
--
DROP TABLE IF EXISTS `ow_sum_temp_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_temp_1h`  AS SELECT sum(`compare_data`.`temp`) AS `ow_sum_temp` FROM `compare_data` WHERE `compare_data`.`updated` >= current_timestamp() - interval 1 hour AND `compare_data`.`api_id` = '2''2'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_temp_1m`
--
DROP TABLE IF EXISTS `ow_sum_temp_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_temp_1m`  AS SELECT sum(`compare_data`.`temp`) AS `ow_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '2' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `ow_sum_temp_all`
--
DROP TABLE IF EXISTS `ow_sum_temp_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ow_sum_temp_all`  AS SELECT sum(`compare_data`.`temp`) AS `ow_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '2''2'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_humi_1d`
--
DROP TABLE IF EXISTS `wa_sum_humi_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_humi_1d`  AS SELECT sum(`compare_data`.`humi`) AS `wa_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_humi_1h`
--
DROP TABLE IF EXISTS `wa_sum_humi_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_humi_1h`  AS SELECT sum(`compare_data`.`humi`) AS `wa_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_humi_1m`
--
DROP TABLE IF EXISTS `wa_sum_humi_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_humi_1m`  AS SELECT sum(`compare_data`.`humi`) AS `wa_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_temp_1d`
--
DROP TABLE IF EXISTS `wa_sum_temp_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_temp_1d`  AS SELECT sum(`compare_data`.`temp`) AS `wa_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_temp_1h`
--
DROP TABLE IF EXISTS `wa_sum_temp_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_temp_1h`  AS SELECT sum(`compare_data`.`temp`) AS `wa_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wa_sum_temp_1m`
--
DROP TABLE IF EXISTS `wa_sum_temp_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wa_sum_temp_1m`  AS SELECT sum(`compare_data`.`temp`) AS `wa_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '4' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_humi_1d`
--
DROP TABLE IF EXISTS `wb_sum_humi_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_humi_1d`  AS SELECT sum(`compare_data`.`humi`) AS `wb_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_humi_1h`
--
DROP TABLE IF EXISTS `wb_sum_humi_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_humi_1h`  AS SELECT sum(`compare_data`.`humi`) AS `wb_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_humi_1m`
--
DROP TABLE IF EXISTS `wb_sum_humi_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_humi_1m`  AS SELECT sum(`compare_data`.`humi`) AS `wb_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_temp_1d`
--
DROP TABLE IF EXISTS `wb_sum_temp_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_temp_1d`  AS SELECT sum(`compare_data`.`temp`) AS `wb_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_temp_1h`
--
DROP TABLE IF EXISTS `wb_sum_temp_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_temp_1h`  AS SELECT sum(`compare_data`.`temp`) AS `wb_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `wb_sum_temp_1m`
--
DROP TABLE IF EXISTS `wb_sum_temp_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wb_sum_temp_1m`  AS SELECT sum(`compare_data`.`temp`) AS `wb_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '3' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_humi_1d`
--
DROP TABLE IF EXISTS `yr_sum_humi_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_humi_1d`  AS SELECT sum(`compare_data`.`humi`) AS `yr_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '1' AND `compare_data`.`updated` >= current_timestamp() - interval 1 dayday  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_humi_1h`
--
DROP TABLE IF EXISTS `yr_sum_humi_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_humi_1h`  AS SELECT sum(`compare_data`.`humi`) AS `yr_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '1' AND `compare_data`.`updated` >= current_timestamp() - interval 1 hourhour  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_humi_1m`
--
DROP TABLE IF EXISTS `yr_sum_humi_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_humi_1m`  AS SELECT sum(`compare_data`.`humi`) AS `yr_sum_humi` FROM `compare_data` WHERE `compare_data`.`api_id` = '1' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_temp_1d`
--
DROP TABLE IF EXISTS `yr_sum_temp_1d`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_temp_1d`  AS SELECT sum(`compare_data`.`temp`) AS `yr_sum_temp` FROM `compare_data` WHERE `compare_data`.`updated` >= current_timestamp() - interval 1 day AND `compare_data`.`api_id` = '1''1'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_temp_1h`
--
DROP TABLE IF EXISTS `yr_sum_temp_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_temp_1h`  AS SELECT sum(`compare_data`.`temp`) AS `yr_sum_temp` FROM `compare_data` WHERE `compare_data`.`updated` >= current_timestamp() - interval 1 hour AND `compare_data`.`api_id` = '1''1'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_temp_1m`
--
DROP TABLE IF EXISTS `yr_sum_temp_1m`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_temp_1m`  AS SELECT sum(`compare_data`.`temp`) AS `yr_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '1' AND `compare_data`.`updated` >= current_timestamp() - interval 1 monthmonth  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_sum_temp_all`
--
DROP TABLE IF EXISTS `yr_sum_temp_all`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_sum_temp_all`  AS SELECT sum(`compare_data`.`temp`) AS `yr_sum_temp` FROM `compare_data` WHERE `compare_data`.`api_id` = '1''1'  ;

-- --------------------------------------------------------

--
-- Struktur des Views `yr_temp_1h`
--
DROP TABLE IF EXISTS `yr_temp_1h`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yr_temp_1h`  AS SELECT sum(`cd`.`temp`) AS `yr_sum_temp`, `api_id`.`api_name` AS `api_name` FROM (`compare_data` `cd` join `apis` `api_id` on(`cd`.`api_id` = 1)) WHERE `cd`.`updated` >= current_timestamp() - interval 1 hour AND `cd`.`api_id` = '1''1'  ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `api_data_current`
--
ALTER TABLE `api_data_current`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_api_id_current` (`api_id`);

--
-- Indizes für die Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkForecast` (`api_id`);

--
-- Indizes für die Tabelle `compare_data`
--
ALTER TABLE `compare_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkApiIdCompare` (`api_id`);

--
-- Indizes für die Tabelle `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `room_settings`
--
ALTER TABLE `room_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkRoomId` (`room_id`);

--
-- Indizes für die Tabelle `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_id` (`room_id`);

--
-- Indizes für die Tabelle `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk9` (`sensor_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `apis`
--
ALTER TABLE `apis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `api_data_current`
--
ALTER TABLE `api_data_current`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `compare_data`
--
ALTER TABLE `compare_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `room_settings`
--
ALTER TABLE `room_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `api_data_current`
--
ALTER TABLE `api_data_current`
  ADD CONSTRAINT `fk_api_id_current` FOREIGN KEY (`api_id`) REFERENCES `apis` (`id`);

--
-- Constraints der Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  ADD CONSTRAINT `fkForecast` FOREIGN KEY (`api_id`) REFERENCES `apis` (`id`);

--
-- Constraints der Tabelle `compare_data`
--
ALTER TABLE `compare_data`
  ADD CONSTRAINT `fkApiIdCompare` FOREIGN KEY (`api_id`) REFERENCES `apis` (`id`);

--
-- Constraints der Tabelle `room_settings`
--
ALTER TABLE `room_settings`
  ADD CONSTRAINT `fkRoomId` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints der Tabelle `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints der Tabelle `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD CONSTRAINT `fk9` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`id`);
--
-- Datenbank: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `compare`
--

CREATE TABLE `compare` (
  `id` int(11) NOT NULL,
  `fk_offerer` int(11) NOT NULL,
  `temp` float NOT NULL,
  `diff_temp` varchar(4) DEFAULT NULL,
  `humi` float DEFAULT NULL,
  `diff_humi` varchar(4) DEFAULT NULL,
  `wann` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mqtt`
--

CREATE TABLE `mqtt` (
  `id` int(11) NOT NULL,
  `msg_topic` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `msg_payload` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nodered`
--

CREATE TABLE `nodered` (
  `id` int(11) NOT NULL,
  `offerer` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `offerer`
--

CREATE TABLE `offerer` (
  `id` int(11) NOT NULL,
  `oname` varchar(50) NOT NULL,
  `cname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sensor`
--

CREATE TABLE `sensor` (
  `id` int(11) NOT NULL,
  `sensor_name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `temp` float DEFAULT NULL,
  `humi` float DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `compare`
--
ALTER TABLE `compare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`fk_offerer`);

--
-- Indizes für die Tabelle `mqtt`
--
ALTER TABLE `mqtt`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `nodered`
--
ALTER TABLE `nodered`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `offerer`
--
ALTER TABLE `offerer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `compare`
--
ALTER TABLE `compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `mqtt`
--
ALTER TABLE `mqtt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `nodered`
--
ALTER TABLE `nodered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `offerer`
--
ALTER TABLE `offerer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `compare`
--
ALTER TABLE `compare`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`fk_offerer`) REFERENCES `offerer` (`id`);
--
-- Datenbank: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235commentmeta`
--

CREATE TABLE `wp_235commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235comments`
--

CREATE TABLE `wp_235comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235links`
--

CREATE TABLE `wp_235links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235options`
--

CREATE TABLE `wp_235options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235postmeta`
--

CREATE TABLE `wp_235postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235posts`
--

CREATE TABLE `wp_235posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235termmeta`
--

CREATE TABLE `wp_235termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235terms`
--

CREATE TABLE `wp_235terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235term_relationships`
--

CREATE TABLE `wp_235term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235term_taxonomy`
--

CREATE TABLE `wp_235term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235usermeta`
--

CREATE TABLE `wp_235usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wp_235users`
--

CREATE TABLE `wp_235users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `wp_235commentmeta`
--
ALTER TABLE `wp_235commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_235comments`
--
ALTER TABLE `wp_235comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indizes für die Tabelle `wp_235links`
--
ALTER TABLE `wp_235links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indizes für die Tabelle `wp_235options`
--
ALTER TABLE `wp_235options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indizes für die Tabelle `wp_235postmeta`
--
ALTER TABLE `wp_235postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_235posts`
--
ALTER TABLE `wp_235posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indizes für die Tabelle `wp_235termmeta`
--
ALTER TABLE `wp_235termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_235terms`
--
ALTER TABLE `wp_235terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indizes für die Tabelle `wp_235term_relationships`
--
ALTER TABLE `wp_235term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indizes für die Tabelle `wp_235term_taxonomy`
--
ALTER TABLE `wp_235term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indizes für die Tabelle `wp_235usermeta`
--
ALTER TABLE `wp_235usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indizes für die Tabelle `wp_235users`
--
ALTER TABLE `wp_235users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `wp_235commentmeta`
--
ALTER TABLE `wp_235commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235comments`
--
ALTER TABLE `wp_235comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235links`
--
ALTER TABLE `wp_235links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235options`
--
ALTER TABLE `wp_235options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235postmeta`
--
ALTER TABLE `wp_235postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235posts`
--
ALTER TABLE `wp_235posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235termmeta`
--
ALTER TABLE `wp_235termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235terms`
--
ALTER TABLE `wp_235terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235term_taxonomy`
--
ALTER TABLE `wp_235term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235usermeta`
--
ALTER TABLE `wp_235usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wp_235users`
--
ALTER TABLE `wp_235users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
