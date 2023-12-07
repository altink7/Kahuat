-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: backend_db:3306
-- Erstellungszeit: 04. Dez 2023 um 15:04
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

-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `quizapplication` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quizapplication`;
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
    (1, '2023-11-25 18:19:23.007372', '2023-11-25 18:19:23.007411', 'as'),
    (2, '2023-11-25 18:19:23.021259', '2023-11-25 18:19:23.021298', 'as'),
    (3, '2023-11-25 18:19:23.025845', '2023-11-25 18:19:23.025880', '123'),
    (4, '2023-11-25 18:19:23.028538', '2023-11-25 18:19:23.028558', 'asa');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `answer_option`
--

CREATE TABLE IF NOT EXISTS`answer_option` (
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
    (1, '2023-11-25 18:19:23.013043', '2023-11-25 18:19:23.013079', b'0', 1, 1),
    (2, '2023-11-25 18:19:23.023042', '2023-11-25 18:19:23.023074', b'0', 2, 1),
    (3, '2023-11-25 18:19:23.027275', '2023-11-25 18:19:23.027296', b'1', 3, 1),
    (4, '2023-11-25 18:19:23.029468', '2023-11-25 18:19:23.029481', b'0', 4, 1);

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
    `quiz_id` varchar(255) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `participant`
--

INSERT INTO `participant` (`id`, `created_at`, `updated_at`, `nickname`, `quiz_duration`, `points`, `user_id`, `quiz_id`) VALUES
    (1, '2023-11-25 18:19:27.970645', '2023-11-25 18:19:27.970678', 'xyvxyv', 0.842, 300, 1, 'KX6LDUX1');

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
    `quiz_id` varchar(255) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `question`
--

INSERT INTO `question` (`id`, `created_at`, `updated_at`, `file`, `kategorie`, `question`, `quiz_id`) VALUES
    (1, '2023-11-25 18:19:22.998414', '2023-11-25 18:19:22.998454', NULL, NULL, 'asas', 'KX6LDUX1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz`
--

CREATE TABLE IF NOT EXISTS`quiz` (
    `id` varchar(255) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `duration` int(11) DEFAULT NULL,
    `kategorie` tinyint(4) DEFAULT NULL CHECK (`kategorie` between 0 and 6),
    `start_date` date DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `creator_id` bigint(20) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `quiz`
--

INSERT INTO `quiz` (`id`, `created_at`, `duration`, `kategorie`, `start_date`, `updated_at`, `creator_id`) VALUES
    ('KX6LDUX1', '2023-11-25 18:19:22.993214', 30, 0, '2023-11-25', '2023-11-25 18:19:22.993245', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `quiz_user_statistic`
--

CREATE TABLE IF NOT EXISTS`quiz_user_statistic` (
    `quiz_id` varchar(255) NOT NULL,
    `user_statistic_id` bigint(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS`user` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `country` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name` varchar(255) DEFAULT NULL,
    `password` varchar(255),
    `role` tinyint(4) DEFAULT NULL CHECK (`role` between 0 and 1),
    `salutation` tinyint(4) DEFAULT NULL CHECK (`salutation` between 0 and 2)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`, `country`, `email`, `first_name`, `last_name`, `password`, `role`, `salutation`) VALUES
    (1, '2023-11-25 18:18:37.961533', '2023-11-25 18:18:37.961756', 'AT', 'altin@gmaadsail.at', 'Altin', 'asdasd', 'U]U2uaYXwd5._jy', 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_statistic`
--

CREATE TABLE IF NOT EXISTS`user_statistic` (
    `id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_id` bigint(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user_statistic`
--

INSERT INTO `user_statistic` (`id`, `created_at`, `updated_at`, `user_id`) VALUES
    (1, '2023-11-25 18:19:27.952479', '2023-11-25 18:19:27.952518', 1);

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
    ADD KEY `FK3blfbd5i0et34f65wbdfwf8iv` (`creator_id`);

--
-- Indizes für die Tabelle `quiz_user_statistic`
--
ALTER TABLE `quiz_user_statistic`
    ADD KEY `FKevvfj1gh9nmjlm4ucpicxfjlk` (`user_statistic_id`),
    ADD KEY `FKfgvfgpicxm19uau3gilh8hrwv` (`quiz_id`);

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
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `answer_option`
--
ALTER TABLE `answer_option`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `participant`
--
ALTER TABLE `participant`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `question`
--
ALTER TABLE `question`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user_statistic`
--
ALTER TABLE `user_statistic`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
    ADD CONSTRAINT `FK3blfbd5i0et34f65wbdfwf8iv` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `quiz_user_statistic`
--
ALTER TABLE `quiz_user_statistic`
    ADD CONSTRAINT `FKevvfj1gh9nmjlm4ucpicxfjlk` FOREIGN KEY (`user_statistic_id`) REFERENCES `user_statistic` (`id`),
    ADD CONSTRAINT `FKfgvfgpicxm19uau3gilh8hrwv` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
