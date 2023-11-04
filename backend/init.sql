-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: backend_db:3306
-- Generation Time: Oct 23, 2023 at 09:04 AM
-- Server version: 11.0.2-MariaDB-1:11.0.2+maria~ubu2204
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizapplication`
--
CREATE DATABASE IF NOT EXISTS `quizapplication` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quizapplication`;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
    `created_at` datetime(6) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `updated_at` datetime(6) DEFAULT NULL,
    `answer` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`created_at`, `id`, `updated_at`, `answer`) VALUES
                                                                      ('2023-10-23 09:02:36.557815', 1, '2023-10-23 09:02:36.557822', 'France'),
                                                                      ('2023-10-23 09:02:36.562896', 2, '2023-10-23 09:02:36.562902', 'Brazil'),
                                                                      ('2023-10-23 09:02:36.565790', 3, '2023-10-23 09:02:36.565797', 'Germany'),
                                                                      ('2023-10-23 09:02:36.566665', 4, '2023-10-23 09:02:36.566670', 'Spain'),
                                                                      ('2023-10-23 09:02:36.567991', 5, '2023-10-23 09:02:36.567996', 'Kareem Abdul-Jabbar'),
                                                                      ('2023-10-23 09:02:36.568746', 6, '2023-10-23 09:02:36.568751', 'LeBron James'),
                                                                      ('2023-10-23 09:02:36.569476', 7, '2023-10-23 09:02:36.569481', 'Michael Jordan'),
                                                                      ('2023-10-23 09:02:36.570153', 8, '2023-10-23 09:02:36.570158', 'Kobe Bryant'),
                                                                      ('2023-10-23 09:02:36.571216', 9, '2023-10-23 09:02:36.571221', 'High Jump'),
                                                                      ('2023-10-23 09:02:36.571976', 10, '2023-10-23 09:02:36.571980', 'Long Jump'),
                                                                      ('2023-10-23 09:02:36.572704', 11, '2023-10-23 09:02:36.572709', 'Pole Vault'),
                                                                      ('2023-10-23 09:02:36.573438', 12, '2023-10-23 09:02:36.573442', 'Triple Jump'),
                                                                      ('2023-10-23 09:02:36.574668', 13, '2023-10-23 09:02:36.574674', 'Paris'),
                                                                      ('2023-10-23 09:02:36.575740', 14, '2023-10-23 09:02:36.575746', 'London'),
                                                                      ('2023-10-23 09:02:36.576619', 15, '2023-10-23 09:02:36.576626', 'Berlin'),
                                                                      ('2023-10-23 09:02:36.577547', 16, '2023-10-23 09:02:36.577552', 'Madrid'),
                                                                      ('2023-10-23 09:02:36.578842', 17, '2023-10-23 09:02:36.578848', 'Japan'),
                                                                      ('2023-10-23 09:02:36.579607', 18, '2023-10-23 09:02:36.579612', 'China'),
                                                                      ('2023-10-23 09:02:36.580301', 19, '2023-10-23 09:02:36.580305', 'South Korea'),
                                                                      ('2023-10-23 09:02:36.581149', 20, '2023-10-23 09:02:36.581155', 'Vietnam'),
                                                                      ('2023-10-23 09:02:36.582322', 21, '2023-10-23 09:02:36.582326', 'Jupiter'),
                                                                      ('2023-10-23 09:02:36.583048', 22, '2023-10-23 09:02:36.583053', 'Mars'),
                                                                      ('2023-10-23 09:02:36.583746', 23, '2023-10-23 09:02:36.583752', 'Venus'),
                                                                      ('2023-10-23 09:02:36.584644', 24, '2023-10-23 09:02:36.584651', 'Saturn'),
                                                                      ('2023-10-23 09:02:36.585845', 25, '2023-10-23 09:02:36.585849', 'Gold'),
                                                                      ('2023-10-23 09:02:36.586512', 26, '2023-10-23 09:02:36.586517', 'Silver'),
                                                                      ('2023-10-23 09:02:36.587212', 27, '2023-10-23 09:02:36.587216', 'Aluminum'),
                                                                      ('2023-10-23 09:02:36.587996', 28, '2023-10-23 09:02:36.588001', 'Astatine'),
                                                                      ('2023-10-23 09:02:36.589153', 29, '2023-10-23 09:02:36.589158', 'Man landed on the Moon'),
                                                                      ('2023-10-23 09:02:36.589847', 30, '2023-10-23 09:02:36.589852', 'End of World War II'),
                                                                      ('2023-10-23 09:02:36.590560', 31, '2023-10-23 09:02:36.590565', 'Start of the French Revolution'),
                                                                      ('2023-10-23 09:02:36.591460', 32, '2023-10-23 09:02:36.591466', 'Discovery of America'),
                                                                      ('2023-10-23 09:02:36.592735', 33, '2023-10-23 09:02:36.592742', 'Portuguese'),
                                                                      ('2023-10-23 09:02:36.593527', 34, '2023-10-23 09:02:36.593532', 'Spanish'),
                                                                      ('2023-10-23 09:02:36.594201', 35, '2023-10-23 09:02:36.594205', 'French'),
                                                                      ('2023-10-23 09:02:36.594881', 36, '2023-10-23 09:02:36.594886', 'English'),
                                                                      ('2023-10-23 09:02:36.595932', 37, '2023-10-23 09:02:36.595937', 'Lion'),
                                                                      ('2023-10-23 09:02:36.596657', 38, '2023-10-23 09:02:36.596662', 'Elephant'),
                                                                      ('2023-10-23 09:02:36.597472', 39, '2023-10-23 09:02:36.597478', 'Tiger'),
                                                                      ('2023-10-23 09:02:36.598190', 40, '2023-10-23 09:02:36.598194', 'Giraffe'),
                                                                      ('2023-10-23 09:02:36.599237', 41, '2023-10-23 09:02:36.599241', 'Roger Federer'),
                                                                      ('2023-10-23 09:02:36.599903', 42, '2023-10-23 09:02:36.599908', 'Serena Williams'),
                                                                      ('2023-10-23 09:02:36.600618', 43, '2023-10-23 09:02:36.600623', 'Rafael Nadal'),
                                                                      ('2023-10-23 09:02:36.601265', 44, '2023-10-23 09:02:36.601270', 'Margaret Court'),
                                                                      ('2023-10-23 09:02:36.602322', 45, '2023-10-23 09:02:36.602326', 'Amazon River'),
                                                                      ('2023-10-23 09:02:36.602993', 46, '2023-10-23 09:02:36.602998', 'Nile River'),
                                                                      ('2023-10-23 09:02:36.603653', 47, '2023-10-23 09:02:36.603658', 'Yangtze River'),
                                                                      ('2023-10-23 09:02:36.604354', 48, '2023-10-23 09:02:36.604358', 'Mississippi River'),
                                                                      ('2023-10-23 09:02:36.605374', 49, '2023-10-23 09:02:36.605378', 'Julius Caesar'),
                                                                      ('2023-10-23 09:02:36.606077', 50, '2023-10-23 09:02:36.606082', 'Nero'),
                                                                      ('2023-10-23 09:02:36.606856', 51, '2023-10-23 09:02:36.606861', 'Augustus'),
                                                                      ('2023-10-23 09:02:36.607635', 52, '2023-10-23 09:02:36.607642', 'Trajan'),
                                                                      ('2023-10-23 09:02:36.608931', 53, '2023-10-23 09:02:36.608936', 'Vincent van Gogh'),
                                                                      ('2023-10-23 09:02:36.609570', 54, '2023-10-23 09:02:36.609575', 'Leonardo da Vinci'),
                                                                      ('2023-10-23 09:02:36.610231', 55, '2023-10-23 09:02:36.610236', 'Michelangelo'),
                                                                      ('2023-10-23 09:02:36.610904', 56, '2023-10-23 09:02:36.610926', 'Raphael'),
                                                                      ('2023-10-23 09:02:36.612019', 57, '2023-10-23 09:02:36.612029', 'Femur'),
                                                                      ('2023-10-23 09:02:36.612727', 58, '2023-10-23 09:02:36.612748', 'Stapes'),
                                                                      ('2023-10-23 09:02:36.613442', 59, '2023-10-23 09:02:36.613444', 'Radius'),
                                                                      ('2023-10-23 09:02:36.614091', 60, '2023-10-23 09:02:36.614094', 'Ulna'),
                                                                      ('2023-10-23 09:02:36.615048', 61, '2023-10-23 09:02:36.615050', 'Peacock'),
                                                                      ('2023-10-23 09:02:36.615688', 62, '2023-10-23 09:02:36.615690', 'Sparrow'),
                                                                      ('2023-10-23 09:02:36.616320', 63, '2023-10-23 09:02:36.616322', 'Ostrich'),
                                                                      ('2023-10-23 09:02:36.616978', 64, '2023-10-23 09:02:36.616980', 'Eagle');

-- --------------------------------------------------------

--
-- Table structure for table `answer_option`
--

CREATE TABLE IF NOT EXISTS `answer_option` (
    `correct` bit(1) DEFAULT NULL,
    `answer_id` bigint(20) NOT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `question_id` bigint(20) NOT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKftc5t8ovr3odleva6662dvdhu` (`answer_id`),
    KEY `FKfqeqisl0e28xp3yn9bmlgkhej` (`question_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answer_option`
--

INSERT INTO `answer_option` (`correct`, `answer_id`, `created_at`, `id`, `question_id`, `updated_at`) VALUES
                                                                                                          (b'1', 1, '2023-10-23 09:02:36.559721', 1, 1, '2023-10-23 09:02:36.559728'),
                                                                                                          (b'0', 2, '2023-10-23 09:02:36.563311', 2, 1, '2023-10-23 09:02:36.563318'),
                                                                                                          (b'0', 3, '2023-10-23 09:02:36.566256', 3, 1, '2023-10-23 09:02:36.566267'),
                                                                                                          (b'0', 4, '2023-10-23 09:02:36.567098', 4, 1, '2023-10-23 09:02:36.567104'),
                                                                                                          (b'1', 5, '2023-10-23 09:02:36.568335', 5, 2, '2023-10-23 09:02:36.568340'),
                                                                                                          (b'0', 6, '2023-10-23 09:02:36.569115', 6, 2, '2023-10-23 09:02:36.569120'),
                                                                                                          (b'0', 7, '2023-10-23 09:02:36.569808', 7, 2, '2023-10-23 09:02:36.569813'),
                                                                                                          (b'0', 8, '2023-10-23 09:02:36.570491', 8, 2, '2023-10-23 09:02:36.570496'),
                                                                                                          (b'1', 9, '2023-10-23 09:02:36.571593', 9, 3, '2023-10-23 09:02:36.571598'),
                                                                                                          (b'0', 10, '2023-10-23 09:02:36.572349', 10, 3, '2023-10-23 09:02:36.572354'),
                                                                                                          (b'0', 11, '2023-10-23 09:02:36.573078', 11, 3, '2023-10-23 09:02:36.573083'),
                                                                                                          (b'0', 12, '2023-10-23 09:02:36.573785', 12, 3, '2023-10-23 09:02:36.573790'),
                                                                                                          (b'1', 13, '2023-10-23 09:02:36.575295', 13, 4, '2023-10-23 09:02:36.575301'),
                                                                                                          (b'0', 14, '2023-10-23 09:02:36.576177', 14, 4, '2023-10-23 09:02:36.576183'),
                                                                                                          (b'0', 15, '2023-10-23 09:02:36.577145', 15, 4, '2023-10-23 09:02:36.577150'),
                                                                                                          (b'0', 16, '2023-10-23 09:02:36.577922', 16, 4, '2023-10-23 09:02:36.577927'),
                                                                                                          (b'1', 17, '2023-10-23 09:02:36.579246', 17, 5, '2023-10-23 09:02:36.579251'),
                                                                                                          (b'0', 18, '2023-10-23 09:02:36.579943', 18, 5, '2023-10-23 09:02:36.579948'),
                                                                                                          (b'0', 19, '2023-10-23 09:02:36.580710', 19, 5, '2023-10-23 09:02:36.580715'),
                                                                                                          (b'0', 20, '2023-10-23 09:02:36.581518', 20, 5, '2023-10-23 09:02:36.581524'),
                                                                                                          (b'1', 21, '2023-10-23 09:02:36.582686', 21, 6, '2023-10-23 09:02:36.582691'),
                                                                                                          (b'0', 22, '2023-10-23 09:02:36.583358', 22, 6, '2023-10-23 09:02:36.583363'),
                                                                                                          (b'0', 23, '2023-10-23 09:02:36.584149', 23, 6, '2023-10-23 09:02:36.584155'),
                                                                                                          (b'0', 24, '2023-10-23 09:02:36.585056', 24, 6, '2023-10-23 09:02:36.585061'),
                                                                                                          (b'1', 25, '2023-10-23 09:02:36.586168', 25, 7, '2023-10-23 09:02:36.586172'),
                                                                                                          (b'0', 26, '2023-10-23 09:02:36.586863', 26, 7, '2023-10-23 09:02:36.586868'),
                                                                                                          (b'0', 27, '2023-10-23 09:02:36.587569', 27, 7, '2023-10-23 09:02:36.587583'),
                                                                                                          (b'0', 28, '2023-10-23 09:02:36.588396', 28, 7, '2023-10-23 09:02:36.588401'),
                                                                                                          (b'1', 29, '2023-10-23 09:02:36.589490', 29, 8, '2023-10-23 09:02:36.589494'),
                                                                                                          (b'0', 30, '2023-10-23 09:02:36.590206', 30, 8, '2023-10-23 09:02:36.590211'),
                                                                                                          (b'0', 31, '2023-10-23 09:02:36.590970', 31, 8, '2023-10-23 09:02:36.590976'),
                                                                                                          (b'0', 32, '2023-10-23 09:02:36.591851', 32, 8, '2023-10-23 09:02:36.591857'),
                                                                                                          (b'1', 33, '2023-10-23 09:02:36.593141', 33, 9, '2023-10-23 09:02:36.593147'),
                                                                                                          (b'0', 34, '2023-10-23 09:02:36.593872', 34, 9, '2023-10-23 09:02:36.593877'),
                                                                                                          (b'0', 35, '2023-10-23 09:02:36.594517', 35, 9, '2023-10-23 09:02:36.594522'),
                                                                                                          (b'0', 36, '2023-10-23 09:02:36.595199', 36, 9, '2023-10-23 09:02:36.595203'),
                                                                                                          (b'1', 37, '2023-10-23 09:02:36.596297', 37, 10, '2023-10-23 09:02:36.596302'),
                                                                                                          (b'0', 38, '2023-10-23 09:02:36.597080', 38, 10, '2023-10-23 09:02:36.597086'),
                                                                                                          (b'0', 39, '2023-10-23 09:02:36.597868', 39, 10, '2023-10-23 09:02:36.597873'),
                                                                                                          (b'0', 40, '2023-10-23 09:02:36.598497', 40, 10, '2023-10-23 09:02:36.598502'),
                                                                                                          (b'0', 41, '2023-10-23 09:02:36.599548', 41, 11, '2023-10-23 09:02:36.599553'),
                                                                                                          (b'0', 42, '2023-10-23 09:02:36.600263', 42, 11, '2023-10-23 09:02:36.600267'),
                                                                                                          (b'0', 43, '2023-10-23 09:02:36.600938', 43, 11, '2023-10-23 09:02:36.600943'),
                                                                                                          (b'1', 44, '2023-10-23 09:02:36.601618', 44, 11, '2023-10-23 09:02:36.601623'),
                                                                                                          (b'0', 45, '2023-10-23 09:02:36.602667', 45, 12, '2023-10-23 09:02:36.602672'),
                                                                                                          (b'1', 46, '2023-10-23 09:02:36.603329', 46, 12, '2023-10-23 09:02:36.603335'),
                                                                                                          (b'0', 47, '2023-10-23 09:02:36.604034', 47, 12, '2023-10-23 09:02:36.604039'),
                                                                                                          (b'0', 48, '2023-10-23 09:02:36.604677', 48, 12, '2023-10-23 09:02:36.604682'),
                                                                                                          (b'0', 49, '2023-10-23 09:02:36.605725', 49, 13, '2023-10-23 09:02:36.605730'),
                                                                                                          (b'0', 50, '2023-10-23 09:02:36.606471', 50, 13, '2023-10-23 09:02:36.606477'),
                                                                                                          (b'1', 51, '2023-10-23 09:02:36.607204', 51, 13, '2023-10-23 09:02:36.607209'),
                                                                                                          (b'0', 52, '2023-10-23 09:02:36.608094', 52, 13, '2023-10-23 09:02:36.608101'),
                                                                                                          (b'0', 53, '2023-10-23 09:02:36.609248', 53, 14, '2023-10-23 09:02:36.609253'),
                                                                                                          (b'1', 54, '2023-10-23 09:02:36.609879', 54, 14, '2023-10-23 09:02:36.609884'),
                                                                                                          (b'0', 55, '2023-10-23 09:02:36.610550', 55, 14, '2023-10-23 09:02:36.610555'),
                                                                                                          (b'0', 56, '2023-10-23 09:02:36.611268', 56, 14, '2023-10-23 09:02:36.611273'),
                                                                                                          (b'0', 57, '2023-10-23 09:02:36.612391', 57, 15, '2023-10-23 09:02:36.612405'),
                                                                                                          (b'1', 58, '2023-10-23 09:02:36.613095', 58, 15, '2023-10-23 09:02:36.613123'),
                                                                                                          (b'0', 59, '2023-10-23 09:02:36.613781', 59, 15, '2023-10-23 09:02:36.613784'),
                                                                                                          (b'0', 60, '2023-10-23 09:02:36.614386', 60, 15, '2023-10-23 09:02:36.614388'),
                                                                                                          (b'1', 61, '2023-10-23 09:02:36.615352', 61, 16, '2023-10-23 09:02:36.615354'),
                                                                                                          (b'0', 62, '2023-10-23 09:02:36.616003', 62, 16, '2023-10-23 09:02:36.616005'),
                                                                                                          (b'0', 63, '2023-10-23 09:02:36.616652', 63, 16, '2023-10-23 09:02:36.616654'),
                                                                                                          (b'0', 64, '2023-10-23 09:02:36.617297', 64, 16, '2023-10-23 09:02:36.617299');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
    `kategorie` tinyint(4) NOT NULL CHECK (`kategorie` between 0 and 6),
    `created_at` datetime(6) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `quiz_id` bigint(20) NOT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `question` varchar(255) NOT NULL,
    `file` varbinary(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKb0yh0c1qaxfwlcnwo9dms2txf` (`quiz_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`kategorie`, `created_at`, `id`, `quiz_id`, `updated_at`, `question`, `file`) VALUES
                                                                                                          (0, '2023-10-23 09:02:36.554410', 1, 1, '2023-10-23 09:02:36.554418', 'Who won the FIFA World Cup in 2018?', NULL),
                                                                                                          (0, '2023-10-23 09:02:36.567590', 2, 1, '2023-10-23 09:02:36.567596', 'Who is the all-time leading scorer in NBA history?', NULL),
                                                                                                          (0, '2023-10-23 09:02:36.570860', 3, 1, '2023-10-23 09:02:36.570865', 'In which sport would you perform the Fosbury Flop?', NULL),
                                                                                                          (1, '2023-10-23 09:02:36.574183', 4, 1, '2023-10-23 09:02:36.574188', 'What is the capital of France?', NULL),
                                                                                                          (1, '2023-10-23 09:02:36.578408', 5, 1, '2023-10-23 09:02:36.578414', 'Which country is known as the Land of the Rising Sun?', NULL),
                                                                                                          (4, '2023-10-23 09:02:36.581941', 6, 1, '2023-10-23 09:02:36.581946', 'What is the largest planet in our solar system?', NULL),
                                                                                                          (4, '2023-10-23 09:02:36.585473', 7, 1, '2023-10-23 09:02:36.585480', 'Which element is represented by the symbol \'Au\'?', NULL),
                                                                                                          (2, '2023-10-23 09:02:36.588767', 8, 1, '2023-10-23 09:02:36.588771', 'Which historical event took place on July 20, 1969?', NULL),
                                                                                                          (3, '2023-10-23 09:02:36.592278', 9, 1, '2023-10-23 09:02:36.592284', 'What is the primary language spoken in Brazil?', NULL),
                                                                                                          (5, '2023-10-23 09:02:36.595590', 10, 1, '2023-10-23 09:02:36.595595', 'Which animal is known as the king of the jungle?', NULL),
                                                                                                          (0, '2023-10-23 09:02:36.598900', 11, 1, '2023-10-23 09:02:36.598905', 'Which tennis player has won the most Grand Slam titles?', NULL),
                                                                                                          (1, '2023-10-23 09:02:36.601975', 12, 1, '2023-10-23 09:02:36.601979', 'Which river is the longest in the world?', NULL),
                                                                                                          (2, '2023-10-23 09:02:36.605034', 13, 1, '2023-10-23 09:02:36.605039', 'Who was the first emperor of Rome?', NULL),
                                                                                                          (3, '2023-10-23 09:02:36.608560', 14, 1, '2023-10-23 09:02:36.608566', 'Which artist painted the Mona Lisa?', NULL),
                                                                                                          (4, '2023-10-23 09:02:36.611650', 15, 1, '2023-10-23 09:02:36.611655', 'What is the smallest bone in the human body?', NULL),
                                                                                                          (5, '2023-10-23 09:02:36.614718', 16, 1, '2023-10-23 09:02:36.614721', 'Which bird is known for its elaborate courtship dance?', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
    `kategorie` tinyint(4) NOT NULL CHECK (`kategorie` between 0 and 6),
    `duration` int(11) DEFAULT NULL,
    `start_date` date DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `creator_id` bigint(20) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_statistic_id` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK3blfbd5i0et34f65wbdfwf8iv` (`creator_id`),
    KEY `FK6iuoeil261ww1gguo0gk1t05t` (`user_statistic_id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`kategorie`, `duration`, `start_date`, `creator_id`, `id`, `user_statistic_id`) VALUES
                                                                                                        (0, 9999999999, NOW(), 1, 1, NULL),
                                                                                                        (0, 9999999999, '2023-10-01 00:00:00.000000', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_participants`
--

CREATE TABLE IF NOT EXISTS `quiz_participants` (
    `quiz_id` bigint(20) NOT NULL,
    `user_id` bigint(20) NOT NULL,
    KEY `FKfu8encynylskvwyw0ncun6cb8` (`user_id`),
    KEY `FK4x1g8effd85wcc0pr12qa3k19` (`quiz_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
    `role` tinyint(4) DEFAULT NULL CHECK (`role` between 0 and 1),
    `salutation` tinyint(4) DEFAULT NULL CHECK (`salutation` between 0 and 2),
    `created_at` datetime(6) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `updated_at` datetime(6) DEFAULT NULL,
    `country` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name` varchar(255) DEFAULT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`role`, `salutation`, `created_at`, `id`, `updated_at`, `country`, `email`, `first_name`, `last_name`, `password`) VALUES
    (0, 0, '2023-10-23 09:02:25.291359', 1, '2023-10-23 09:02:25.291374', 'USA', 'altin@office.com', 'Test', 'Altin', 'secret');

-- --------------------------------------------------------

--
-- Table structure for table `user_statistic`
--

CREATE TABLE IF NOT EXISTS `user_statistic` (
    `points` int(11) DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_id` bigint(20) NOT NULL,
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer_option`
--
ALTER TABLE `answer_option`
    ADD CONSTRAINT `FKfqeqisl0e28xp3yn9bmlgkhej` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `FKftc5t8ovr3odleva6662dvdhu` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
    ADD CONSTRAINT `FKb0yh0c1qaxfwlcnwo9dms2txf` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
    ADD CONSTRAINT `FK3blfbd5i0et34f65wbdfwf8iv` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK6iuoeil261ww1gguo0gk1t05t` FOREIGN KEY (`user_statistic_id`) REFERENCES `user_statistic` (`id`);

--
-- Constraints for table `quiz_participants`
--
ALTER TABLE `quiz_participants`
    ADD CONSTRAINT `FK4x1g8effd85wcc0pr12qa3k19` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`),
  ADD CONSTRAINT `FKfu8encynylskvwyw0ncun6cb8` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
