-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: backend_db:3306
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
      (5, NOW(), NOW(), 'France'),
      (6, NOW(), NOW(), 'Brazil'),
      (7, NOW(), NOW(), 'Germany'),
      (8, NOW(), NOW(), 'Argentina'),
      (9, NOW(), NOW(), 'Babe Ruth'),
      (10, NOW(), NOW(), 'Hank Aaron'),
      (11, NOW(), NOW(), 'Barry Bonds'),
      (12, NOW(), NOW(), 'Willie Mays'),
      (13, NOW(), NOW(), 'Russia'),
      (14, NOW(), NOW(), 'Canada'),
      (15, NOW(), NOW(), 'China'),
      (16, NOW(), NOW(), 'United States'),
      (17, NOW(), NOW(), 'Nile'),
      (18, NOW(), NOW(), 'Amazon'),
      (19, NOW(), NOW(), 'Yangtze'),
      (20, NOW(), NOW(), 'Mississippi'),
      (21, NOW(), NOW(), 'George Washington'),
      (22, NOW(), NOW(), 'Abraham Lincoln'),
      (23, NOW(), NOW(), 'Thomas Jefferson'),
      (24, NOW(), NOW(), 'John Adams'),
      (25, NOW(), NOW(), '1945'),
      (26, NOW(), NOW(), '1944'),
      (27, NOW(), NOW(), '1946'),
      (28, NOW(), NOW(), '1947'),
      (29, NOW(), NOW(), 'Harper Lee'),
      (30, NOW(), NOW(), 'Ernest Hemingway'),
      (31, NOW(), NOW(), 'Mark Twain'),
      (32, NOW(), NOW(), 'F. Scott Fitzgerald'),
      (33, NOW(), NOW(), 'Paris'),
      (34, NOW(), NOW(), 'New York'),
      (35, NOW(), NOW(), 'London'),
      (36, NOW(), NOW(), 'Tokyo'),
      (37, NOW(), NOW(), 'O'),
      (38, NOW(), NOW(), 'H'),
      (39, NOW(), NOW(), 'N'),
      (40, NOW(), NOW(), 'C'),
      (41, NOW(), NOW(), '299,792 km/s'),
      (42, NOW(), NOW(), '150,000 km/s'),
      (43, NOW(), NOW(), '1,080 km/s'),
      (44, NOW(), NOW(), '2,998 km/s'),
      (45, NOW(), NOW(), 'Blue Whale'),
      (46, NOW(), NOW(), 'Elephant'),
      (47, NOW(), NOW(), 'Giraffe'),
      (48, NOW(), NOW(), 'Brown Bear'),
      (49, NOW(), NOW(), 'Hyperion'),
      (50, NOW(), NOW(), 'General Sherman'),
      (51, NOW(), NOW(), 'Methuselah'),
      (52, NOW(), NOW(), 'Old Tjikko'),
      (53, NOW(), NOW(), 'Mandarin Chinese'),
      (54, NOW(), NOW(), 'English'),
      (55, NOW(), NOW(), 'Spanish'),
      (56, NOW(), NOW(), 'Hindi'),
      (57, NOW(), NOW(), 'Yen'),
      (58, NOW(), NOW(), 'Dollar'),
      (59, NOW(), NOW(), 'Euro'),
      (60, NOW(), NOW(), 'Pound');

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
      (5, NOW(), NOW(), b'0', 5, 1),
      (6, NOW(), NOW(), b'0', 6, 1),
      (7, NOW(), NOW(), b'0', 7, 1),
      (8, NOW(), NOW(), b'1', 8, 1), -- Assume Argentina won
      (9, NOW(), NOW(), b'0', 9, 2),
      (10, NOW(), NOW(), b'0', 10, 2),
      (11, NOW(), NOW(), b'1', 11, 2), -- Assume Barry Bonds holds the record
      (12, NOW(), NOW(), b'0', 12, 2),
      (13, NOW(), NOW(), b'1', 13, 3), -- Assume Russia is the largest
      (14, NOW(), NOW(), b'0', 14, 3),
      (15, NOW(), NOW(), b'0', 15, 3),
      (16, NOW(), NOW(), b'0', 16, 3),
      (17, NOW(), NOW(), b'0', 17, 4),
      (18, NOW(), NOW(), b'1', 18, 4), -- Assume Nile is the longest
      (19, NOW(), NOW(), b'0', 19, 4),
      (20, NOW(), NOW(), b'0', 20, 4),
      (21, NOW(), NOW(), b'1', 21, 5), -- George Washington was the first president
      (22, NOW(), NOW(), b'0', 22, 5),
      (23, NOW(), NOW(), b'0', 23, 5),
      (24, NOW(), NOW(), b'0', 24, 5),
      (25, NOW(), NOW(), b'1', 25, 6), -- World War II ended in 1945
      (26, NOW(), NOW(), b'0', 26, 6),
      (27, NOW(), NOW(), b'0', 27, 6),
      (28, NOW(), NOW(), b'0', 28, 6),
      (29, NOW(), NOW(), b'1', 29, 7), -- Harper Lee wrote "To Kill a Mockingbird"
      (30, NOW(), NOW(), b'0', 30, 7),
      (31, NOW(), NOW(), b'0', 31, 7),
      (32, NOW(), NOW(), b'0', 32, 7),
      (33, NOW(), NOW(), b'1', 33, 8), -- Paris is considered the capital of the art world
      (34, NOW(), NOW(), b'0', 34, 8),
      (35, NOW(), NOW(), b'0', 35, 8),
      (36, NOW(), NOW(), b'0', 36, 8),
      (37, NOW(), NOW(), b'1', 37, 9), -- O is the chemical symbol for oxygen
      (38, NOW(), NOW(), b'0', 38, 9),
      (39, NOW(), NOW(), b'0', 39, 9),
      (40, NOW(), NOW(), b'0', 40, 9),
      (41, NOW(), NOW(), b'1', 41, 10), -- The speed of light in vacuum is 299,792 km/s
      (42, NOW(), NOW(), b'0', 42, 10),
      (43, NOW(), NOW(), b'0', 43, 10),
      (44, NOW(), NOW(), b'0', 44, 10),
      (45, NOW(), NOW(), b'1', 45, 11), -- The largest animal currently on Earth is the Blue Whale
      (46, NOW(), NOW(), b'0', 46, 11),
      (47, NOW(), NOW(), b'0', 47, 11),
      (48, NOW(), NOW(), b'0', 48, 11),
      (49, NOW(), NOW(), b'1', 49, 12), -- The tallest tree in the world is Hyperion
      (50, NOW(), NOW(), b'0', 50, 12),
      (51, NOW(), NOW(), b'0', 51, 12),
      (52, NOW(), NOW(), b'0', 52, 12),
      (53, NOW(), NOW(), b'1', 53, 13), -- The most spoken language in the world is Mandarin Chinese
      (54, NOW(), NOW(), b'0', 54, 13),
      (55, NOW(), NOW(), b'0', 55, 13),
      (56, NOW(), NOW(), b'0', 56, 13),
      (57, NOW(), NOW(), b'1', 57, 14), -- The currency of Japan is Yen
      (58, NOW(), NOW(), b'0', 58, 14),
      (59, NOW(), NOW(), b'0', 59, 14),
      (60, NOW(), NOW(), b'0', 60, 14);

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
    (1, NOW(), NOW(), NULL, 0, 'Who won the 2022 FIFA World Cup?', 'SPORZYI0'),
    (2, NOW(), NOW(), NULL, 0, 'Who holds the record for the most home runs in a single season in Major League Baseball?', 'SPORZYJ0'),
    (3, NOW(), NOW(), NULL, 1, 'What is the largest country in the world by land area?', 'GEOGI1B1'),
    (4, NOW(), NOW(), NULL, 1, 'What is the longest river in the world?', 'GEOGI1C1'),
    (5, NOW(), NOW(), NULL, 2, 'Who was the first president of the United States?', 'HISTLKO2'),
    (6, NOW(), NOW(), NULL, 2, 'In which year did World War II end?', 'HISTLJO2'),
    (7, NOW(), NOW(), NULL, 3, 'Who wrote the novel "To Kill a Mockingbird"?', 'CULT8EW3'),
    (8, NOW(), NOW(), NULL, 3, 'What is the capital of the art world?', 'CULT8EX3'),
    (9, NOW(), NOW(), NULL, 4, 'What is the chemical symbol for the element oxygen?', 'SCIEPPK4'),
    (10, NOW(), NOW(), NULL, 4, 'What is the speed of light in vacuum?', 'SCIEPPL4'),
    (11, NOW(), NOW(), NULL, 5, 'What is the largest animal currently on Earth?', 'NATUYZN5'),
    (12, NOW(), NOW(), NULL, 5, 'What is the tallest tree in the world?', 'NATUYZO5'),
    (13, NOW(), NOW(), NULL, 6, 'What is the most spoken language in the world?', 'RANDBND6'),
    (14, NOW(), NOW(), NULL, 6, 'What is the currency of Japan?', 'RANDBNE6');

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
    `title` varchar(255) DEFAULT NULL,
    `creator_id` bigint(20) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `quiz`
--

INSERT INTO `quiz` (`id`, `created_at`, `duration`, `kategorie`, `start_date`, `updated_at`, `creator_id`) VALUES
    ('SPORZYI0', NOW(), 180, 0, NOW(), NOW(), 1),
    ('SPORZYJ0', NOW(), 180, 0, NOW(), NOW(), 1),
    ('GEOGI1B1', NOW(), 180, 1, NOW(), NOW(), 1),
    ('GEOGI1C1', NOW(), 180, 1, NOW(), NOW(), 1),
    ('HISTLKO2', NOW(), 180, 2, NOW(), NOW(), 1),
    ('HISTLJO2', NOW(), 180, 2, NOW(), NOW(), 1),
    ('CULT8EW3', NOW(), 180, 3, NOW(), NOW(), 1),
    ('CULT8EX3', NOW(), 180, 3, NOW(), NOW(), 1),
    ('SCIEPPK4', NOW(), 180, 4, NOW(), NOW(), 1),
    ('SCIEPPL4', NOW(), 180, 4, NOW(), NOW(), 1),
    ('NATUYZN5', NOW(), 180, 5, NOW(), NOW(), 1),
    ('NATUYZO5', NOW(), 180, 5, NOW(), NOW(), 1),
    ('RANDBND6', NOW(), 180, 6, NOW(), NOW(), 1),
    ('RANDBNE6', NOW(), 180, 6, NOW(), NOW(), 1);

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
    (1, NOW(), NOW(), 'AT', 'admin@domain.loc', 'Admin', 'User', 'Password1!', 0, 0);

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
