-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tallerutp
CREATE DATABASE IF NOT EXISTS `tallerutp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tallerutp`;

-- Dumping structure for table tallerutp.cola_de_cita
CREATE TABLE IF NOT EXISTS `cola_de_cita` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `numero_cita` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_cita` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.cola_de_cita: ~0 rows (approximately)
DELETE FROM `cola_de_cita`;
/*!40000 ALTER TABLE `cola_de_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cola_de_cita` ENABLE KEYS */;

-- Dumping structure for table tallerutp.detalle_hoja_trabajo
CREATE TABLE IF NOT EXISTS `detalle_hoja_trabajo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `equipoSubTotal` double(8,2) DEFAULT NULL,
  `perifericoSubTotal` double(8,2) DEFAULT NULL,
  `repuestoSubTotal` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hoja_trabajo_id` bigint(20) unsigned DEFAULT NULL,
  `pieza_id` bigint(20) unsigned DEFAULT NULL,
  `servicio_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalle_hoja_trabajo_hoja_trabajo_id_foreign` (`hoja_trabajo_id`),
  KEY `detalle_hoja_trabajo_pieza_id_foreign` (`pieza_id`),
  KEY `detalle_hoja_trabajo_servicio_id_foreign` (`servicio_id`),
  CONSTRAINT `detalle_hoja_trabajo_hoja_trabajo_id_foreign` FOREIGN KEY (`hoja_trabajo_id`) REFERENCES `hoja_trabajo` (`id`),
  CONSTRAINT `detalle_hoja_trabajo_pieza_id_foreign` FOREIGN KEY (`pieza_id`) REFERENCES `pieza` (`id`),
  CONSTRAINT `detalle_hoja_trabajo_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.detalle_hoja_trabajo: ~0 rows (approximately)
DELETE FROM `detalle_hoja_trabajo`;
/*!40000 ALTER TABLE `detalle_hoja_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_hoja_trabajo` ENABLE KEYS */;

-- Dumping structure for table tallerutp.distrito
CREATE TABLE IF NOT EXISTS `distrito` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.distrito: ~0 rows (approximately)
DELETE FROM `distrito`;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;

-- Dumping structure for table tallerutp.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `procesador` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motherboard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ramarca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ramsize` double(8,2) DEFAULT NULL,
  `diskmarca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disksize` double(8,2) DEFAULT NULL,
  `grafica` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loados` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipoequipo_id` bigint(20) unsigned DEFAULT NULL,
  `persona_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo_tipoequipo_id_foreign` (`tipoequipo_id`),
  KEY `equipo_persona_id_foreign` (`persona_id`),
  CONSTRAINT `equipo_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `equipo_tipoequipo_id_foreign` FOREIGN KEY (`tipoequipo_id`) REFERENCES `tipoequipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.equipo: ~0 rows (approximately)
DELETE FROM `equipo`;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

-- Dumping structure for table tallerutp.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table tallerutp.hoja_trabajo
CREATE TABLE IF NOT EXISTS `hoja_trabajo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `igv` double(8,2) DEFAULT NULL,
  `mediopago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('PRESUPUESTO','RECIBO','ANULADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PRESUPUESTO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tecnico_persona_id` bigint(20) unsigned DEFAULT NULL,
  `cliente_persona_id` bigint(20) unsigned DEFAULT NULL,
  `equipo_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hoja_trabajo_tecnico_persona_id_foreign` (`tecnico_persona_id`),
  KEY `hoja_trabajo_cliente_persona_id_foreign` (`cliente_persona_id`),
  KEY `hoja_trabajo_equipo_id_foreign` (`equipo_id`),
  CONSTRAINT `hoja_trabajo_cliente_persona_id_foreign` FOREIGN KEY (`cliente_persona_id`) REFERENCES `persona` (`id`),
  CONSTRAINT `hoja_trabajo_equipo_id_foreign` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `hoja_trabajo_tecnico_persona_id_foreign` FOREIGN KEY (`tecnico_persona_id`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.hoja_trabajo: ~0 rows (approximately)
DELETE FROM `hoja_trabajo`;
/*!40000 ALTER TABLE `hoja_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoja_trabajo` ENABLE KEYS */;

-- Dumping structure for table tallerutp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.migrations: ~13 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_100000_create_password_resets_table', 1),
	(2, '2019_08_19_000000_create_failed_jobs_table', 1),
	(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(4, '2022_05_28_050818_cola_de_cita', 1),
	(5, '2022_05_28_050820_tipo_persona', 1),
	(6, '2022_05_28_050821_distrito', 1),
	(7, '2022_05_28_050822_persona', 1),
	(8, '2022_05_28_051734_pieza', 1),
	(9, '2022_05_28_052028_servicio', 1),
	(10, '2022_05_28_052740_tipoequipo', 1),
	(11, '2022_05_28_052741_equipo', 1),
	(12, '2022_05_28_055235_hoja_trabajo', 1),
	(13, '2022_05_28_055743_detalle_hoja_trabajo', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table tallerutp.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table tallerutp.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costoxhora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipo_persona_id` bigint(20) unsigned DEFAULT NULL,
  `distrito_id` bigint(20) unsigned DEFAULT NULL,
  `cola_de_cita_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona_tipo_persona_id_foreign` (`tipo_persona_id`),
  KEY `persona_distrito_id_foreign` (`distrito_id`),
  KEY `persona_cola_de_cita_id_foreign` (`cola_de_cita_id`),
  CONSTRAINT `persona_cola_de_cita_id_foreign` FOREIGN KEY (`cola_de_cita_id`) REFERENCES `cola_de_cita` (`id`),
  CONSTRAINT `persona_distrito_id_foreign` FOREIGN KEY (`distrito_id`) REFERENCES `distrito` (`id`),
  CONSTRAINT `persona_tipo_persona_id_foreign` FOREIGN KEY (`tipo_persona_id`) REFERENCES `tipo_persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.persona: ~0 rows (approximately)
DELETE FROM `persona`;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Dumping structure for table tallerutp.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table tallerutp.pieza
CREATE TABLE IF NOT EXISTS `pieza` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.pieza: ~0 rows (approximately)
DELETE FROM `pieza`;
/*!40000 ALTER TABLE `pieza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pieza` ENABLE KEYS */;

-- Dumping structure for table tallerutp.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.servicio: ~0 rows (approximately)
DELETE FROM `servicio`;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;

-- Dumping structure for table tallerutp.tipoequipo
CREATE TABLE IF NOT EXISTS `tipoequipo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.tipoequipo: ~0 rows (approximately)
DELETE FROM `tipoequipo`;
/*!40000 ALTER TABLE `tipoequipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoequipo` ENABLE KEYS */;

-- Dumping structure for table tallerutp.tipo_persona
CREATE TABLE IF NOT EXISTS `tipo_persona` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.tipo_persona: ~0 rows (approximately)
DELETE FROM `tipo_persona`;
/*!40000 ALTER TABLE `tipo_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_persona` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
