-- Adminer 4.8.1 MySQL 8.0.33-0ubuntu0.20.04.2 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `tbl_TypeIntervention`;
CREATE TABLE `tbl_TypeIntervention` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_client`;
CREATE TABLE `tbl_client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `celphone` int NOT NULL,
  `fixe` int DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `professional` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tbl_client` (`id`, `name`, `firstname`, `celphone`, `fixe`, `address`, `mail`, `professional`, `created_at`, `updated_at`) VALUES
(1,	'test',	'test',	52528137,	0,	'test',	'test',	1,	'2023-05-23 19:49:44',	'2023-05-23 19:49:44');

DROP TABLE IF EXISTS `tbl_equipment`;
CREATE TABLE `tbl_equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_equipmentincomplete`;
CREATE TABLE `tbl_equipmentincomplete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_intervention`;
CREATE TABLE `tbl_intervention` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_depot` datetime NOT NULL,
  `date_restitution` datetime NOT NULL,
  `session_user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `os_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `client_id` int NOT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `os_id` (`os_id`),
  KEY `equipment_id` (`equipment_id`),
  KEY `client_id` (`client_id`),
  KEY `IDX_2F4B6E3D6BF700BD` (`status_id`),
  CONSTRAINT `FK_2F4B6E3D6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`id`),
  CONSTRAINT `tbl_intervention_ibfk_1` FOREIGN KEY (`os_id`) REFERENCES `tbl_os` (`id`),
  CONSTRAINT `tbl_intervention_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `tbl_equipment` (`id`),
  CONSTRAINT `tbl_intervention_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `tbl_client` (`id`),
  CONSTRAINT `tbl_intervention_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_observation`;
CREATE TABLE `tbl_observation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `object` varchar(255) NOT NULL,
  `paragraph` text NOT NULL,
  `intervention_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `intervention_id` (`intervention_id`),
  CONSTRAINT `tbl_observation_ibfk_1` FOREIGN KEY (`intervention_id`) REFERENCES `tbl_intervention` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_os`;
CREATE TABLE `tbl_os` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE `tbl_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tbl_technician`;
CREATE TABLE `tbl_technician` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `nb_intervention` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- 2023-05-23 19:06:21
