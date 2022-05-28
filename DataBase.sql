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

-- Dumping structure for table tallerutp.accesorio
CREATE TABLE IF NOT EXISTS `accesorio` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `almacen_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accesorio_almacen_id_foreign` (`almacen_id`),
  CONSTRAINT `accesorio_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.accesorio: ~0 rows (approximately)
DELETE FROM `accesorio`;
/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesorio` ENABLE KEYS */;

-- Dumping structure for table tallerutp.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.almacen: ~0 rows (approximately)
DELETE FROM `almacen`;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;

-- Dumping structure for table tallerutp.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.cliente: ~0 rows (approximately)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Dumping structure for table tallerutp.detallerecibo
CREATE TABLE IF NOT EXISTS `detallerecibo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `recibo_id` bigint(20) unsigned DEFAULT NULL,
  `equipo_id` bigint(20) unsigned DEFAULT NULL,
  `equipoSubTotal` double(8,2) DEFAULT NULL,
  `accesorio_id` bigint(20) unsigned DEFAULT NULL,
  `accesorioSubTotal` double(8,2) DEFAULT NULL,
  `repuesto_id` bigint(20) unsigned DEFAULT NULL,
  `repuestoSubTotal` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detallerecibo_recibo_id_foreign` (`recibo_id`),
  KEY `detallerecibo_equipo_id_foreign` (`equipo_id`),
  KEY `detallerecibo_accesorio_id_foreign` (`accesorio_id`),
  KEY `detallerecibo_repuesto_id_foreign` (`repuesto_id`),
  CONSTRAINT `detallerecibo_accesorio_id_foreign` FOREIGN KEY (`accesorio_id`) REFERENCES `accesorio` (`id`),
  CONSTRAINT `detallerecibo_equipo_id_foreign` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `detallerecibo_recibo_id_foreign` FOREIGN KEY (`recibo_id`) REFERENCES `recibo` (`id`),
  CONSTRAINT `detallerecibo_repuesto_id_foreign` FOREIGN KEY (`repuesto_id`) REFERENCES `repuesto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.detallerecibo: ~0 rows (approximately)
DELETE FROM `detallerecibo`;
/*!40000 ALTER TABLE `detallerecibo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallerecibo` ENABLE KEYS */;

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
  `cliente_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `equipo_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
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

-- Dumping structure for table tallerutp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.migrations: ~12 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_05_14_134046_tecnico', 1),
	(6, '2022_05_28_050828_almacen', 1),
	(7, '2022_05_28_051250_accesorio', 1),
	(8, '2022_05_28_051734_repuesto', 1),
	(9, '2022_05_28_052028_servicios', 1),
	(10, '2022_05_28_052640_cliente', 1),
	(11, '2022_05_28_052741_equipo', 1),
	(12, '2022_05_28_053711_worklist', 1),
	(13, '2022_05_28_055235_recibo', 2),
	(14, '2022_05_28_055743_detallerecibo', 3);
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

-- Dumping structure for table tallerutp.recibo
CREATE TABLE IF NOT EXISTS `recibo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `igv` double(8,2) DEFAULT NULL,
  `mediopago` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente_id` bigint(20) unsigned DEFAULT NULL,
  `tecnico_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recibo_cliente_id_foreign` (`cliente_id`),
  KEY `recibo_tecnico_id_foreign` (`tecnico_id`),
  CONSTRAINT `recibo_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `recibo_tecnico_id_foreign` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.recibo: ~0 rows (approximately)
DELETE FROM `recibo`;
/*!40000 ALTER TABLE `recibo` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibo` ENABLE KEYS */;

-- Dumping structure for table tallerutp.repuesto
CREATE TABLE IF NOT EXISTS `repuesto` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `almacen_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repuesto_almacen_id_foreign` (`almacen_id`),
  CONSTRAINT `repuesto_almacen_id_foreign` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.repuesto: ~0 rows (approximately)
DELETE FROM `repuesto`;
/*!40000 ALTER TABLE `repuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `repuesto` ENABLE KEYS */;

-- Dumping structure for table tallerutp.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.servicios: ~0 rows (approximately)
DELETE FROM `servicios`;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;

-- Dumping structure for table tallerutp.tecnico
CREATE TABLE IF NOT EXISTS `tecnico` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costoxhora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puesto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.tecnico: ~0 rows (approximately)
DELETE FROM `tecnico`;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;

-- Dumping structure for table tallerutp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.users: ~0 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table tallerutp.worklist
CREATE TABLE IF NOT EXISTS `worklist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equipo_id` bigint(20) unsigned DEFAULT NULL,
  `servicio_id` bigint(20) unsigned DEFAULT NULL,
  `tecnico_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worklist_equipo_id_foreign` (`equipo_id`),
  KEY `worklist_servicio_id_foreign` (`servicio_id`),
  KEY `worklist_tecnico_id_foreign` (`tecnico_id`),
  CONSTRAINT `worklist_equipo_id_foreign` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `worklist_servicio_id_foreign` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  CONSTRAINT `worklist_tecnico_id_foreign` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tallerutp.worklist: ~0 rows (approximately)
DELETE FROM `worklist`;
/*!40000 ALTER TABLE `worklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `worklist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
