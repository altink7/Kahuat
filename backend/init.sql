-- --------------------------------------------------------
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: backend_db:3306
-- Erstellungszeit: 04. Nov 2023 um 18:14
-- Server-Version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204
-- PHP-Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `quizapplication`
--

CREATE DATABASE IF NOT EXISTS `quizapplication` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quizapplication`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `answer` varchar(255) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `answer`
--

INSERT INTO `answer` (`id`, `created_at`, `updated_at`, `answer`) VALUES
    (1, '2023-11-04 17:27:43.169110', '2023-11-04 17:27:43.169158', 'Paris'),
    (2, '2023-11-04 17:27:43.174867', '2023-11-04 17:27:43.174905', 'London'),
    (3, '2023-11-04 17:27:43.180127', '2023-11-04 17:27:43.180201', 'Berlin'),
    (4, '2023-11-04 17:27:43.184505', '2023-11-04 17:27:43.184547', 'Madrid'),
    (5, '2023-11-04 17:27:43.190817', '2023-11-04 17:27:43.190854', 'Jupiter'),
    (6, '2023-11-04 17:27:43.196035', '2023-11-04 17:27:43.196098', 'Mars'),
    (7, '2023-11-04 17:27:43.199889', '2023-11-04 17:27:43.199913', 'Venus'),
    (8, '2023-11-04 17:27:43.203423', '2023-11-04 17:27:43.203454', 'Saturn'),
    (9, '2023-11-04 17:27:43.208917', '2023-11-04 17:27:43.208956', 'France'),
    (10, '2023-11-04 17:27:43.212331', '2023-11-04 17:27:43.212359', 'Brazil'),
    (11, '2023-11-04 17:27:43.214682', '2023-11-04 17:27:43.214769', 'Germany'),
    (12, '2023-11-04 17:27:43.217141', '2023-11-04 17:27:43.217171', 'Spain'),
    (13, '2023-11-04 17:27:43.221599', '2023-11-04 17:27:43.221640', 'Japan'),
    (14, '2023-11-04 17:27:43.223886', '2023-11-04 17:27:43.223905', 'China'),
    (15, '2023-11-04 17:27:43.226207', '2023-11-04 17:27:43.226227', 'South Korea'),
    (16, '2023-11-04 17:27:43.228192', '2023-11-04 17:27:43.228210', 'Vietnam'),
    (17, '2023-11-04 17:27:43.232076', '2023-11-04 17:27:43.232105', 'Kareem Abdul-Jabbar'),
    (18, '2023-11-04 17:27:43.234462', '2023-11-04 17:27:43.234484', 'LeBron James'),
    (19, '2023-11-04 17:27:43.236715', '2023-11-04 17:27:43.236736', 'Michael Jordan'),
    (20, '2023-11-04 17:27:43.238822', '2023-11-04 17:27:43.238839', 'Kobe Bryant'),
    (21, '2023-11-04 17:32:29.243638', '2023-11-04 17:32:29.243669', 'asa'),
    (22, '2023-11-04 17:32:29.247733', '2023-11-04 17:32:29.247761', 'asas'),
    (23, '2023-11-04 17:32:29.250379', '2023-11-04 17:32:29.250401', 'asa'),
    (24, '2023-11-04 17:32:29.253450', '2023-11-04 17:32:29.253516', 'bbbbbbb'),
    (25, '2023-11-04 17:55:51.142422', '2023-11-04 17:55:51.142451', 'Paris'),
    (26, '2023-11-04 17:55:51.146290', '2023-11-04 17:55:51.146312', 'London'),
    (27, '2023-11-04 17:55:51.148053', '2023-11-04 17:55:51.148068', 'Berlin'),
    (28, '2023-11-04 17:55:51.150087', '2023-11-04 17:55:51.150105', 'Madrid'),
    (29, '2023-11-04 17:55:51.158372', '2023-11-04 17:55:51.158403', 'Jupiter'),
    (30, '2023-11-04 17:55:51.162439', '2023-11-04 17:55:51.162461', 'Mars'),
    (31, '2023-11-04 17:55:51.164355', '2023-11-04 17:55:51.164372', 'Venus'),
    (32, '2023-11-04 17:55:51.166314', '2023-11-04 17:55:51.166332', 'Saturn'),
    (33, '2023-11-04 17:55:51.169559', '2023-11-04 17:55:51.169586', 'France'),
    (34, '2023-11-04 17:55:51.171890', '2023-11-04 17:55:51.171915', 'Brazil'),
    (35, '2023-11-04 17:55:51.173929', '2023-11-04 17:55:51.173944', 'Germany'),
    (36, '2023-11-04 17:55:51.175488', '2023-11-04 17:55:51.175502', 'Spain'),
    (37, '2023-11-04 17:55:51.177747', '2023-11-04 17:55:51.177758', 'Japan'),
    (38, '2023-11-04 17:55:51.179711', '2023-11-04 17:55:51.179725', 'China'),
    (39, '2023-11-04 17:55:51.181035', '2023-11-04 17:55:51.181045', 'South Korea'),
    (40, '2023-11-04 17:55:51.182119', '2023-11-04 17:55:51.182130', 'Vietnam'),
    (41, '2023-11-04 17:55:51.184272', '2023-11-04 17:55:51.184287', 'Kareem Abdul-Jabbar'),
    (42, '2023-11-04 17:55:51.185615', '2023-11-04 17:55:51.185627', 'LeBron James'),
    (43, '2023-11-04 17:55:51.187156', '2023-11-04 17:55:51.187167', 'Michael Jordan'),
    (44, '2023-11-04 17:55:51.188348', '2023-11-04 17:55:51.188359', 'Kobe Bryant'),
    (45, '2023-11-04 18:13:40.409700', '2023-11-04 18:13:40.409714', 'wrong'),
    (46, '2023-11-04 18:13:40.411369', '2023-11-04 18:13:40.411381', 'wrong'),
    (47, '2023-11-04 18:13:40.412870', '2023-11-04 18:13:40.412880', 'correct'),
    (48, '2023-11-04 18:13:40.414742', '2023-11-04 18:13:40.414757', 'wrong');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_option`
--

CREATE TABLE IF NOT EXISTS `answer_option` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `correct` bit(1) DEFAULT NULL,
    `answer_id` bigint(20) NOT NULL,
    `question_id` bigint(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `answer_option`
--

INSERT INTO `answer_option` (`id`, `created_at`, `updated_at`, `correct`, `answer_id`, `question_id`) VALUES
    (1, '2023-11-04 17:27:43.172579', '2023-11-04 17:27:43.172639', b'1', 1, 1),
    (2, '2023-11-04 17:27:43.176711', '2023-11-04 17:27:43.176788', b'0', 2, 1),
    (3, '2023-11-04 17:27:43.182564', '2023-11-04 17:27:43.182612', b'0', 3, 1),
    (4, '2023-11-04 17:27:43.186568', '2023-11-04 17:27:43.186602', b'0', 4, 1),
    (5, '2023-11-04 17:27:43.193954', '2023-11-04 17:27:43.194031', b'1', 5, 2),
    (6, '2023-11-04 17:27:43.198530', '2023-11-04 17:27:43.198573', b'0', 6, 2),
    (7, '2023-11-04 17:27:43.201722', '2023-11-04 17:27:43.201754', b'0', 7, 2),
    (8, '2023-11-04 17:27:43.205454', '2023-11-04 17:27:43.205487', b'0', 8, 2),
    (9, '2023-11-04 17:27:43.211023', '2023-11-04 17:27:43.211056', b'1', 9, 3),
    (10, '2023-11-04 17:27:43.213558', '2023-11-04 17:27:43.213582', b'0', 10, 3),
    (11, '2023-11-04 17:27:43.215804', '2023-11-04 17:27:43.215829', b'0', 11, 3),
    (12, '2023-11-04 17:27:43.218241', '2023-11-04 17:27:43.218260', b'0', 12, 3),
    (13, '2023-11-04 17:27:43.222854', '2023-11-04 17:27:43.222874', b'1', 13, 4),
    (14, '2023-11-04 17:27:43.225043', '2023-11-04 17:27:43.225065', b'0', 14, 4),
    (15, '2023-11-04 17:27:43.227084', '2023-11-04 17:27:43.227102', b'0', 15, 4),
    (16, '2023-11-04 17:27:43.229287', '2023-11-04 17:27:43.229306', b'0', 16, 4),
    (17, '2023-11-04 17:27:43.233306', '2023-11-04 17:27:43.233344', b'1', 17, 5),
    (18, '2023-11-04 17:27:43.235531', '2023-11-04 17:27:43.235611', b'0', 18, 5),
    (19, '2023-11-04 17:27:43.237807', '2023-11-04 17:27:43.237828', b'0', 19, 5),
    (20, '2023-11-04 17:27:43.239866', '2023-11-04 17:27:43.239884', b'0', 20, 5),
    (21, '2023-11-04 17:32:29.246121', '2023-11-04 17:32:29.246150', b'0', 21, 6),
    (22, '2023-11-04 17:32:29.249214', '2023-11-04 17:32:29.249242', b'0', 22, 6),
    (23, '2023-11-04 17:32:29.251902', '2023-11-04 17:32:29.251931', b'0', 23, 6),
    (24, '2023-11-04 17:32:29.254935', '2023-11-04 17:32:29.254962', b'1', 24, 6),
    (25, '2023-11-04 17:55:51.144793', '2023-11-04 17:55:51.144829', b'1', 25, 7),
    (26, '2023-11-04 17:55:51.147187', '2023-11-04 17:55:51.147203', b'0', 26, 7),
    (27, '2023-11-04 17:55:51.149026', '2023-11-04 17:55:51.149041', b'0', 27, 7),
    (28, '2023-11-04 17:55:51.151218', '2023-11-04 17:55:51.151250', b'0', 28, 7),
    (29, '2023-11-04 17:55:51.161079', '2023-11-04 17:55:51.161111', b'1', 29, 8),
    (30, '2023-11-04 17:55:51.163423', '2023-11-04 17:55:51.163443', b'0', 30, 8),
    (31, '2023-11-04 17:55:51.165244', '2023-11-04 17:55:51.165259', b'0', 31, 8),
    (32, '2023-11-04 17:55:51.167240', '2023-11-04 17:55:51.167255', b'0', 32, 8),
    (33, '2023-11-04 17:55:51.170694', '2023-11-04 17:55:51.170719', b'1', 33, 9),
    (34, '2023-11-04 17:55:51.173033', '2023-11-04 17:55:51.173057', b'0', 34, 9),
    (35, '2023-11-04 17:55:51.174618', '2023-11-04 17:55:51.174631', b'0', 35, 9),
    (36, '2023-11-04 17:55:51.176188', '2023-11-04 17:55:51.176200', b'0', 36, 9),
    (37, '2023-11-04 17:55:51.178831', '2023-11-04 17:55:51.178851', b'1', 37, 10),
    (38, '2023-11-04 17:55:51.180411', '2023-11-04 17:55:51.180435', b'0', 38, 10),
    (39, '2023-11-04 17:55:51.181536', '2023-11-04 17:55:51.181546', b'0', 39, 10),
    (40, '2023-11-04 17:55:51.182758', '2023-11-04 17:55:51.182771', b'0', 40, 10),
    (41, '2023-11-04 17:55:51.184948', '2023-11-04 17:55:51.184960', b'1', 41, 11),
    (42, '2023-11-04 17:55:51.186533', '2023-11-04 17:55:51.186546', b'0', 42, 11),
    (43, '2023-11-04 17:55:51.187698', '2023-11-04 17:55:51.187711', b'0', 43, 11),
    (44, '2023-11-04 17:55:51.189151', '2023-11-04 17:55:51.189164', b'0', 44, 11),
    (45, '2023-11-04 18:13:40.410322', '2023-11-04 18:13:40.410333', b'0', 45, 12),
    (46, '2023-11-04 18:13:40.412219', '2023-11-04 18:13:40.412231', b'0', 46, 12),
    (47, '2023-11-04 18:13:40.413853', '2023-11-04 18:13:40.413866', b'1', 47, 12),
    (48, '2023-11-04 18:13:40.415848', '2023-11-04 18:13:40.415860', b'0', 48, 12);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `nickname` varchar(255) DEFAULT NULL,
    `quiz_duration` double DEFAULT NULL,
    `points` int(11) DEFAULT NULL,
    `user_id` bigint(20) DEFAULT NULL,
    `quiz_id` bigint(20) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `participant`
--

INSERT INTO `participant` (`id`, `created_at`, `updated_at`, `nickname`, `quiz_duration`, `points`, `user_id`, `quiz_id`) VALUES
    (1, '2023-11-04 17:28:14.532933', '2023-11-04 17:28:14.532962', 'player_1', 2.763, 375, NULL, 1),
    (2, '2023-11-04 17:28:28.450505', '2023-11-04 17:28:28.450530', 'player2', 2.328, 1500, NULL, 1),
    (3, '2023-11-04 17:58:41.694097', '2023-11-04 17:58:41.694132', 'player3', 5.309, 355, NULL, 1),
    (4, '2023-11-04 18:08:34.907190', '2023-11-04 18:08:34.907242', 'player4', 5.274, 1470, NULL, 1),
    (5, '2023-11-04 18:13:08.857226', '2023-11-04 18:13:08.857258', 'player6', 4.262, 1490, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question`
--

CREATE TABLE IF NOT EXISTS `question` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `file` varbinary(255) DEFAULT NULL,
    `kategorie` tinyint(4) DEFAULT NULL CHECK (`kategorie` between 0 and 6),
    `question` varchar(255) NOT NULL,
    `quiz_id` bigint(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `created_at`, `updated_at`, `file`, `kategorie`, `question`, `quiz_id`) VALUES
    (1, '2023-11-04 17:27:43.164992', '2023-11-04 17:27:43.165031', NULL, NULL, 'What is the capital of France?', 1),
    (2, '2023-11-04 17:27:43.188807', '2023-11-04 17:27:43.188840', NULL, NULL, 'What is the largest planet in our solar system?', 1),
    (3, '2023-11-04 17:27:43.206994', '2023-11-04 17:27:43.207018', NULL, NULL, 'Who won the FIFA World Cup in 2018?', 1),
    (4, '2023-11-04 17:27:43.219713', '2023-11-04 17:27:43.219740', NULL, NULL, 'Which country is known as the Land of the Rising Sun?', 1),
    (5, '2023-11-04 17:27:43.230608', '2023-11-04 17:27:43.230635', NULL, NULL, 'Who is the all-time leading scorer in NBA history?', 1),
    (6, '2023-11-04 17:32:29.240813', '2023-11-04 17:32:29.240861', NULL, NULL, 'asasa', 2),
    (7, '2023-11-04 17:55:51.139769', '2023-11-04 17:55:51.139800', NULL, NULL, 'What is the capital of France?', 3),
    (8, '2023-11-04 17:55:51.155947', '2023-11-04 17:55:51.155980', NULL, NULL, 'What is the largest planet in our solar system?', 3),
    (9, '2023-11-04 17:55:51.168124', '2023-11-04 17:55:51.168139', NULL, NULL, 'Who won the FIFA World Cup in 2018?', 3),
    (10, '2023-11-04 17:55:51.177002', '2023-11-04 17:55:51.177014', NULL, NULL, 'Which country is known as the Land of the Rising Sun?', 3),
    (11, '2023-11-04 17:55:51.183526', '2023-11-04 17:55:51.183537', NULL, NULL, 'Who is the all-time leading scorer in NBA history?', 3),
    (12, '2023-11-04 18:13:40.408585', '2023-11-04 18:13:40.408609', NULL, NULL, 'culture question', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `duration` int(11) DEFAULT NULL,
    `kategorie` tinyint(4) DEFAULT NULL CHECK (`kategorie` between 0 and 6),
    `start_date` date DEFAULT NULL,
    `creator_id` bigint(20) DEFAULT NULL,
    `user_statistic_id` bigint(20) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `quiz`
--

INSERT INTO `quiz` (`id`, `created_at`, `updated_at`, `duration`, `kategorie`, `start_date`, `creator_id`, `user_statistic_id`) VALUES
    (1, '2023-11-04 17:27:43.115870', '2023-11-04 17:27:43.115906', 30, 0, '2023-10-18', 1, NULL),
    (2, '2023-11-04 17:32:29.222694', '2023-11-04 17:32:29.222771', 30, 0, '2023-11-04', 1, NULL),
    (3, '2023-11-04 17:55:51.119556', '2023-11-04 17:55:51.119654', 30, 0, '2023-09-18', 1, NULL),
    (4, '2023-11-04 18:13:40.405646', '2023-11-04 18:13:40.405677', 30, 3, '2023-11-04', 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `country` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name` varchar(255) DEFAULT NULL,
    `password` varchar(255) NOT NULL,
    `role` tinyint(4) DEFAULT NULL CHECK (`role` between 0 and 1),
    `salutation` tinyint(4) DEFAULT NULL CHECK (`salutation` between 0 and 2)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`, `country`, `email`, `first_name`, `last_name`, `password`, `role`, `salutation`) VALUES
    (1, '2023-11-04 17:27:34.567695', '2023-11-04 17:27:34.567821', 'USA', 'max@muster.com', 'Max', 'Muster', 'secretsecret', 0, 0),
    (2, '2023-11-04 17:27:36.418840', '2023-11-04 17:27:36.418882', 'AUT', 'mar@tin.com', 'Martin', 'Mustermann', 'secretsecret', 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_statistic`
--

CREATE TABLE IF NOT EXISTS `user_statistic` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `points` int(11) DEFAULT NULL,
    `user_id` bigint(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `answer`
--
ALTER TABLE `answer`
    ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `answer_option`
--
ALTER TABLE `answer_option`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKftc5t8ovr3odleva6662dvdhu` (`answer_id`),
    ADD KEY `FKfqeqisl0e28xp3yn9bmlgkhej` (`question_id`);

--
-- Indizes für die Tabelle `participant`
--
ALTER TABLE `participant`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK2nrwjlcghkpsxavbh36f7hmun` (`quiz_id`);

--
-- Indizes für die Tabelle `question`
--
ALTER TABLE `question`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FKb0yh0c1qaxfwlcnwo9dms2txf` (`quiz_id`);

--
-- Indizes für die Tabelle `quiz`
--
ALTER TABLE `quiz`
    ADD PRIMARY KEY (`id`),
    ADD KEY `FK3blfbd5i0et34f65wbdfwf8iv` (`creator_id`),
    ADD KEY `FK6iuoeil261ww1gguo0gk1t05t` (`user_statistic_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indizes für die Tabelle `user_statistic`
--
ALTER TABLE `user_statistic`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `answer`
--
ALTER TABLE `answer`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT für Tabelle `answer_option`
--
ALTER TABLE `answer_option`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT für Tabelle `participant`
--
ALTER TABLE `participant`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `quiz`
--
ALTER TABLE `quiz`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user_statistic`
--
ALTER TABLE `user_statistic`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `answer_option`
--
ALTER TABLE `answer_option`
    ADD CONSTRAINT `FKfqeqisl0e28xp3yn9bmlgkhej` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
    ADD CONSTRAINT `FKftc5t8ovr3odleva6662dvdhu` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`);

--
-- Constraints der Tabelle `participant`
--
ALTER TABLE `participant`
    ADD CONSTRAINT `FK2nrwjlcghkpsxavbh36f7hmun` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints der Tabelle `question`
--
ALTER TABLE `question`
    ADD CONSTRAINT `FKb0yh0c1qaxfwlcnwo9dms2txf` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints der Tabelle `quiz`
--
ALTER TABLE `quiz`
    ADD CONSTRAINT `FK3blfbd5i0et34f65wbdfwf8iv` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
    ADD CONSTRAINT `FK6iuoeil261ww1gguo0gk1t05t` FOREIGN KEY (`user_statistic_id`) REFERENCES `user_statistic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


