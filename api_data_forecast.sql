-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 11. Okt 2022 um 20:13
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

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkForecast` (`api_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `api_data_forecast`
--
ALTER TABLE `api_data_forecast`
  ADD CONSTRAINT `fkForecast` FOREIGN KEY (`api_id`) REFERENCES `apis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
