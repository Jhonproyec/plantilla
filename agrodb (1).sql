-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 25, 2025 at 04:35 AM
-- Server version: 8.0.42-0ubuntu0.24.10.1
-- PHP Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agrodb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `account_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `initial_balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `account_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone_number` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `opening_date` datetime DEFAULT NULL,
  `url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `total_deposit` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_withdraw` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_transfer_from_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_transfer_to_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `account_name`, `account_details`, `initial_balance`, `account_no`, `contact_person`, `phone_number`, `opening_date`, `url`, `total_deposit`, `total_withdraw`, `total_transfer_from_other`, `total_transfer_to_other`, `created_at`, `updated_at`) VALUES
(1, 'Default Account', 'This is a default account for any store', '0.0000', '1234567890', 'iAngryboy', '+880133333333', '2019-05-15 08:27:03', 'http://itsolution24.com', '4033.0000', '0.0000', '0.0000', '0.0000', '2024-03-30 02:07:33', '2025-08-07 16:14:13'),
(2, 'Default', 'default', '0.0000', '1000000000000000', 'default', '11111111111111', NULL, '', '0.0000', '0.0000', '0.0000', '0.0000', '2024-03-30 02:07:33', '2024-03-30 02:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `bank_account_to_store`
--

CREATE TABLE `bank_account_to_store` (
  `ba2s` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL,
  `account_id` int UNSIGNED NOT NULL,
  `deposit` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `withdraw` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `transfer_from_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `transfer_to_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bank_account_to_store`
--

INSERT INTO `bank_account_to_store` (`ba2s`, `store_id`, `account_id`, `deposit`, `withdraw`, `transfer_from_other`, `transfer_to_other`, `status`, `sort_order`) VALUES
(1, 1, 2, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0),
(2, 4, 1, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0),
(3, 5, 1, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction_info`
--

CREATE TABLE `bank_transaction_info` (
  `info_id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `transaction_type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_substract` tinyint(1) NOT NULL DEFAULT '0',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0',
  `account_id` int UNSIGNED NOT NULL,
  `source_id` int DEFAULT NULL,
  `exp_category_id` int DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `from_account_id` int UNSIGNED DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bank_transaction_info`
--

INSERT INTO `bank_transaction_info` (`info_id`, `store_id`, `transaction_type`, `is_substract`, `is_hide`, `account_id`, `source_id`, `exp_category_id`, `ref_no`, `invoice_id`, `title`, `details`, `from_account_id`, `status`, `image`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'withdraw', 0, 0, 1, NULL, 5, 'W1', 'EXP345', 'Debit for Bonous Expense', '', NULL, 1, 'NULL', 1, '2025-07-04 13:11:43', '2025-07-04 19:11:43'),
(2, 1, 'withdraw', 0, 0, 1, NULL, 9, 'W2', 'B53689009', 'Debit for Product Purchase', 'Supplier name: No Supplier', NULL, 1, 'NULL', 1, '2025-07-19 15:39:40', '2025-07-19 21:39:40'),
(3, 1, 'withdraw', 0, 0, 1, NULL, 9, 'W3', 'Beef07c9c', 'Debit for Product Purchase', 'Supplier name: No Supplier', NULL, 1, 'NULL', 1, '2025-07-19 15:40:52', '2025-07-19 21:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction_price`
--

CREATE TABLE `bank_transaction_price` (
  `price_id` int NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `info_id` int DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `bank_transaction_price`
--

INSERT INTO `bank_transaction_price` (`price_id`, `store_id`, `info_id`, `ref_no`, `amount`) VALUES
(1, 1, 1, 'W1', '33.0000'),
(2, 1, 2, 'W2', '1200.0000'),
(3, 1, 3, 'W3', '1800.0000');

-- --------------------------------------------------------

--
-- Table structure for table `boxes`
--

CREATE TABLE `boxes` (
  `box_id` int UNSIGNED NOT NULL,
  `box_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `box_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `boxes`
--

INSERT INTO `boxes` (`box_id`, `box_name`, `code_name`, `box_details`) VALUES
(1, 'Common Box', 'common', 'Common Box details here...');

-- --------------------------------------------------------

--
-- Table structure for table `box_to_store`
--

CREATE TABLE `box_to_store` (
  `id` int NOT NULL,
  `box_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `box_to_store`
--

INSERT INTO `box_to_store` (`id`, `box_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int UNSIGNED NOT NULL,
  `brand_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `brand_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `brand_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `code_name`, `brand_details`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Marca Agrotactic', 'agrotactic', '', '', '2024-03-30 02:07:33', '2025-08-07 17:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `brand_to_store`
--

CREATE TABLE `brand_to_store` (
  `b2s_id` int NOT NULL,
  `brand_id` int NOT NULL DEFAULT '0',
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `brand_to_store`
--

INSERT INTO `brand_to_store` (`b2s_id`, `brand_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 0, 1, 1, 0),
(3, 1, 1, 1, 0),
(4, 1, 1, 1, 0),
(5, 1, 1, 1, 0),
(6, 1, 1, 1, 0),
(7, 0, 1, 1, 0),
(8, 1, 2, 1, 0),
(10, 1, 1, 1, 0),
(11, 1, 2, 1, 0),
(12, 1, 5, 1, 0),
(13, 1, 1, 1, 0),
(14, 1, 2, 1, 0),
(15, 1, 5, 1, 0),
(16, 1, 1, 1, 0),
(17, 1, 2, 1, 0),
(18, 1, 1, 1, 0),
(19, 1, 2, 1, 0),
(20, 1, 1, 1, 0),
(21, 1, 2, 1, 0),
(22, 1, 5, 1, 0),
(23, 0, 1, 1, 0),
(24, 0, 1, 1, 0),
(25, 0, 1, 1, 0),
(26, 1, 1, 1, 0),
(27, 1, 1, 1, 0),
(28, 0, 1, 1, 0),
(29, 0, 2, 1, 0),
(30, 1, 1, 1, 0),
(31, 1, 1, 1, 0),
(32, 1, 1, 1, 0),
(33, 1, 1, 1, 0),
(34, 1, 1, 1, 0),
(35, 0, 1, 1, 0),
(36, 1, 1, 1, 0),
(37, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `category_id` int UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `category_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `category_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Sin categoría', 'sin_categoria', 0, 'this is a category details, simple text will be display here', '', '2024-03-30 02:07:33', '2025-08-28 00:13:00'),
(2, 'Vitaminas ganado', 'vitaminas_ganado', 0, '', '', '2025-08-07 13:04:40', '2025-08-07 19:04:40'),
(3, 'HERBICIDA', 'herbicida', 0, '', '', '2025-08-07 16:23:04', '2025-08-07 22:23:04'),
(4, 'INSECTICIDA', 'insecticida', 0, '', '/cartel-peligro-insecticidas.jpg', '2025-09-12 14:11:31', '2025-09-12 20:13:21'),
(5, 'FERTILIZANTES HIDROSOLUBLES', 'fertilizantes_hidrosolubles', 0, 'FERTILIZANTES HIDROSOLUBLES', '/fertilizer-solid-icon-design-illustration-agriculture-symbol-on-white-background-eps-10-file-vector.jpg', '2025-09-12 16:13:08', '2025-09-12 22:13:08'),
(6, 'VETERINARIO', 'veterinario', 0, '', '', '2025-09-16 10:28:42', '2025-09-16 16:28:42'),
(7, 'Prueba Categoría 23092025', 'prueba_categoría_23092025', 0, '', '', '2025-09-23 01:36:38', '2025-09-23 07:36:38');

-- --------------------------------------------------------

--
-- Table structure for table `category_to_store`
--

CREATE TABLE `category_to_store` (
  `c2s_id` int NOT NULL,
  `ccategory_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `category_to_store`
--

INSERT INTO `category_to_store` (`c2s_id`, `ccategory_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 2, 1, 1, 0),
(3, 3, 1, 1, 0),
(4, 1, 2, 1, 0),
(6, 3, 2, 1, 0),
(7, 4, 1, 1, 1),
(8, 5, 1, 1, 1),
(9, 5, 2, 1, 0),
(10, 6, 1, 1, 0),
(11, 7, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `symbol_left` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `symbol_right` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `decimal_place` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` decimal(25,4) NOT NULL DEFAULT '1.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `created_at`) VALUES
(1, 'Quetzal Guatemalteco', 'USD', 'Q', '', '1', '1.0000', '2025-08-27 00:36:24'),
(18, 'Quetzal', 'GTQ', 'Q', '', '2', '1.0000', '2025-08-07 16:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `currency_to_store`
--

CREATE TABLE `currency_to_store` (
  `ca2s_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `currency_to_store`
--

INSERT INTO `currency_to_store` (`ca2s_id`, `currency_id`, `store_id`, `status`, `sort_order`) VALUES
(53, 18, 1, 1, 0),
(54, 18, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int UNSIGNED NOT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_mobile` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `dob` date DEFAULT NULL,
  `customer_sex` tinyint(1) NOT NULL DEFAULT '1',
  `customer_age` int UNSIGNED DEFAULT NULL,
  `gtin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_state` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_giftcard` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `dob`, `customer_sex`, `customer_age`, `gtin`, `customer_city`, `customer_state`, `customer_country`, `is_giftcard`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Walking Customer', 'wc@itsolution24.com', '0170000000000', '5-56 Zona 1 Tactic, Alta Verapaz, Guatemala', '1993-01-01', 1, 20, '147258', 'AN', 'AN', 'GT', 0, 'c33367701511b4f6020ec61ded352059', '2024-03-30 02:07:33', '2025-08-07 17:12:11'),
(2, 'test', '49bf0c@gmail.com', '', 'ds&amp;lt;fs&amp;lt;df', '2024-11-26', 1, 2, '', 'Guatemala', 'Guatemala', 'GT', 0, NULL, '2025-08-23 08:51:52', '2025-08-23 14:51:52'),
(3, 'Prueba customer', 'e9220b@gmail.com', '', '', '1969-12-31', 1, 0, '', '', '', 'AD', 0, NULL, '2025-09-23 02:22:35', '2025-09-23 08:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_to_store`
--

CREATE TABLE `customer_to_store` (
  `c2s_id` int UNSIGNED NOT NULL,
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `balance` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `customer_to_store`
--

INSERT INTO `customer_to_store` (`c2s_id`, `customer_id`, `store_id`, `balance`, `due`, `status`, `sort_order`) VALUES
(1, 1, 1, '0.0000', '0.0000', 1, 1),
(2, 2, 1, '0.0000', '0.0000', 1, 0),
(3, 1, 4, '0.0000', '0.0000', 1, 0),
(4, 1, 5, '0.0000', '0.0000', 1, 0),
(5, 3, 1, '0.0000', '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_transactions`
--

CREATE TABLE `customer_transactions` (
  `id` int UNSIGNED NOT NULL,
  `type` enum('purchase','add_balance','substract_balance','due_paid','others') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_invoice_id` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL,
  `pmethod_id` int UNSIGNED NOT NULL DEFAULT '0',
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `balance` decimal(25,4) DEFAULT '0.0000',
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `id_document_type` int NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id_document_type`, `name`, `created_at`) VALUES
(1, 'Factura', '2025-08-27'),
(2, 'Factura Cambiaria', '2025-08-27'),
(3, 'Factura Pequeño Contribuyente', '2025-08-27'),
(4, 'Factura Pequeño Contribuyente Cambiaria', '2025-08-27'),
(5, 'Recibo Abono', '2025-08-27'),
(11, 'Nota de Crédito de Descuento', NULL),
(13, 'Nota de Crédito de Devolución', NULL),
(14, 'Noda de Débido', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `returnable` enum('no','yes') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'no',
  `note` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attachment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `store_id`, `reference_no`, `category_id`, `title`, `amount`, `returnable`, `note`, `attachment`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'EXP345', 5, 'aaaa', '33.0000', 'no', '', '', 1, 1, '2025-07-04 13:11:43', '2025-07-04 19:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categorys`
--

CREATE TABLE `expense_categorys` (
  `category_id` int UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `category_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `sell_return` tinyint(1) NOT NULL DEFAULT '0',
  `sell_delete` tinyint(1) NOT NULL DEFAULT '0',
  `loan_delete` tinyint(1) NOT NULL DEFAULT '0',
  `loan_payment` tinyint(1) NOT NULL DEFAULT '0',
  `giftcard_sell_delete` tinyint(1) NOT NULL DEFAULT '0',
  `topup_delete` tinyint(1) NOT NULL DEFAULT '0',
  `product_purchase` tinyint(1) NOT NULL DEFAULT '0',
  `stock_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `due_paid` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `expense_categorys`
--

INSERT INTO `expense_categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `sell_return`, `sell_delete`, `loan_delete`, `loan_payment`, `giftcard_sell_delete`, `topup_delete`, `product_purchase`, `stock_transfer`, `due_paid`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Employee Salary', 'employee_salary', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(2, 'Showroom Rent', 'showroom_rent', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(3, 'Electricity Bill + Dish', 'electricity_bill_+_dish', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(4, 'Advertisements', 'advertisements', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(5, 'Bonous', 'bonous', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(6, 'Others', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(7, 'Returnable', 'returnable', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(8, 'Sell Return', 'sell_return', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(9, 'Product Purchase', 'product_purchase', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(10, 'Sell Delete', 'sell_delete', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(11, 'Loan Delete', 'loan_delete', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(12, 'Giftcard Topup Delete', 'giftcard_topup_delete', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(13, 'Giftcard Sell Delete', 'giftcard_sell_delete', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(14, 'Loan Payment', 'loan_payment', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(15, 'Due Paid to Supplier', 'due_paid_to_supplier', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_no` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_topups`
--

CREATE TABLE `gift_card_topups` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `card_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_info`
--

CREATE TABLE `holding_info` (
  `info_id` int NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `order_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `customer_mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `total_items` smallint DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_item`
--

CREATE TABLE `holding_item` (
  `id` int NOT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `item_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `brand_id` int DEFAULT '0',
  `sup_id` int NOT NULL DEFAULT '0',
  `item_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_discount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `tax_method` enum('inclusive','exclusive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int UNSIGNED NOT NULL,
  `tax` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gst` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` int UNSIGNED NOT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holding_price`
--

CREATE TABLE `holding_price` (
  `price_id` int NOT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `subtotal` decimal(25,4) DEFAULT '0.0000',
  `discount_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `order_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `others_charge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payable_amount` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_sources`
--

CREATE TABLE `income_sources` (
  `source_id` int UNSIGNED NOT NULL,
  `source_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` enum('credit','debit') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'credit',
  `source_slug` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `source_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `for_sell` tinyint(1) NOT NULL DEFAULT '0',
  `for_purchase_return` tinyint(1) NOT NULL DEFAULT '0',
  `for_due_collection` tinyint(1) NOT NULL DEFAULT '0',
  `for_loan` tinyint(1) NOT NULL DEFAULT '0',
  `for_giftcard_sell` tinyint(1) NOT NULL DEFAULT '0',
  `for_topup` tinyint(1) NOT NULL DEFAULT '0',
  `for_stock_transfer` tinyint(1) NOT NULL DEFAULT '0',
  `for_purchase_delete` tinyint(1) NOT NULL DEFAULT '0',
  `for_expense_delete` tinyint(1) NOT NULL DEFAULT '0',
  `profitable` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'yes',
  `show_in_income` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'yes',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `income_sources`
--

INSERT INTO `income_sources` (`source_id`, `source_name`, `type`, `source_slug`, `parent_id`, `source_details`, `for_sell`, `for_purchase_return`, `for_due_collection`, `for_loan`, `for_giftcard_sell`, `for_topup`, `for_stock_transfer`, `for_purchase_delete`, `for_expense_delete`, `profitable`, `show_in_income`, `status`, `is_hide`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Sell', 'credit', 'sell', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 'yes', 'no', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(2, 'Purchase Return', 'credit', 'purchase_return', 0, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(3, 'Due Collection', 'credit', 'due_collection', 0, '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 'yes', 'no', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(4, 'Others', 'credit', 'others', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'yes', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(5, 'Loan Taken', 'credit', 'loan_taken', 0, '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(6, 'Giftcard Sell', 'credit', 'giftcard_sell', 0, '', 0, 0, 0, 0, 1, 0, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(7, 'Giftcard Topup', 'credit', 'giftcard_topup', 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(8, 'Stock Transfer', 'credit', 'stock_transfer', 0, '', 0, 0, 0, 0, 0, 0, 1, 0, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(9, 'Purchase Delete', 'credit', 'purchase_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33'),
(10, 'Expense Delete', 'credit', 'expense_delete', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 1, 'no', 'yes', 1, 1, 0, '2024-03-30 02:07:33', '2024-03-30 02:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `installment_orders`
--

CREATE TABLE `installment_orders` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchase_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL,
  `interval_count` int NOT NULL,
  `installment_count` int NOT NULL,
  `interest_percentage` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `interest_amount` decimal(25,2) NOT NULL DEFAULT '0.00',
  `initial_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payment_status` enum('paid','due') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'due',
  `last_installment_date` datetime DEFAULT NULL,
  `installment_end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment_payments`
--

CREATE TABLE `installment_payments` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `pmethod_id` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `capital` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `interest` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payable` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `due` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payment_status` enum('paid','due','pending','cancel') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'due'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id_movement` int NOT NULL,
  `id_product_to_store` int UNSIGNED NOT NULL,
  `date_register` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` enum('input','output') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `quantity` int NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `average_cost` decimal(10,2) NOT NULL,
  `balance` int NOT NULL,
  `reference_id` int DEFAULT NULL,
  `reference_type` enum('purchase','sale','adjustment') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `inventory_movements`
--

INSERT INTO `inventory_movements` (`id_movement`, `id_product_to_store`, `date_register`, `type`, `quantity`, `unit_cost`, `average_cost`, `balance`, `reference_id`, `reference_type`) VALUES
(1, 17, '2025-09-08 10:10:52', 'input', 30000, '50.00', '44.64', 30000, 13, 'purchase'),
(2, 19, '2025-09-08 10:10:52', 'input', 40000, '60.00', '53.57', 40000, 13, 'purchase'),
(5, 19, '2025-09-08 10:30:13', 'input', 10000, '55.00', '52.68', 10040, 20, 'purchase'),
(6, 19, '2025-09-09 16:38:04', 'input', 30000, '44.00', '42.64', 40040, 21, 'purchase'),
(7, 25, '2025-09-12 20:51:47', 'input', 7500, '18.50', '16.52', 7500, 22, 'purchase'),
(8, 19, '2025-09-12 23:52:48', 'input', 50000, '44.00', '40.78', 90040, 28, 'purchase'),
(9, 28, '2025-09-12 23:56:17', 'input', 260000, '0.00', '0.00', 260000, 29, 'purchase'),
(10, 27, '2025-09-12 23:58:06', 'input', 24000, '1259.00', '1124.11', 24000, 27, 'purchase'),
(11, 26, '2025-09-13 00:01:10', 'input', 80000, '48.00', '42.86', 80000, 26, 'purchase'),
(12, 28, '2025-09-16 16:21:48', 'input', 260000, '57.50', '25.67', 520000, 30, 'purchase'),
(19, 31, '2025-09-22 22:20:34', 'input', 175000, '192.51', '171.88', 175000, 31, 'purchase'),
(20, 32, '2025-09-22 22:20:34', 'input', 175000, '196.94', '175.84', 175000, 31, 'purchase'),
(21, 31, '2025-09-22 22:38:37', 'input', 175000, '192.51', '171.88', 350000, 32, 'purchase'),
(22, 32, '2025-09-22 22:38:37', 'input', 175000, '196.94', '175.84', 350000, 32, 'purchase'),
(23, 33, '2025-09-22 22:38:37', 'input', 6803880, '239.30', '213.66', 6803880, 32, 'purchase'),
(27, 31, '2025-09-22 22:52:39', 'input', 175000, '192.51', '171.88', 525000, 33, 'purchase'),
(28, 32, '2025-09-22 22:52:39', 'input', 175000, '196.94', '175.84', 525000, 33, 'purchase'),
(29, 34, '2025-09-22 23:04:55', 'input', 0, '30.00', '26.79', 0, 34, 'purchase'),
(30, 38, '2025-09-23 07:41:53', 'input', 98421, '10.00', '8.93', 98421, 35, 'purchase'),
(31, 38, '2025-09-23 08:54:42', 'input', 1000000, '10.00', '8.93', 1000000, 36, 'purchase');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `slug`, `code`) VALUES
(1, 'English', 'english', 'en'),
(7, 'Spanish', 'spanish', 'es');

-- --------------------------------------------------------

--
-- Table structure for table `language_translations`
--

CREATE TABLE `language_translations` (
  `id` int NOT NULL,
  `lang_id` int NOT NULL,
  `lang_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key_type` enum('specific','default') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'specific',
  `lang_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `language_translations`
--

INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(1, 1, 'title_dashboard', 'specific', 'Dashboard'),
(2, 1, 'text_arabic', 'specific', 'Arabic'),
(3, 1, 'text_french', 'specific', 'French'),
(4, 1, 'text_germany', 'specific', 'Germany'),
(5, 1, 'text_spanish', 'specific', 'Spanish'),
(6, 1, 'text_pos', 'specific', 'POS'),
(7, 1, 'menu_pos', 'specific', 'POS'),
(8, 1, 'text_cashbook_report', 'specific', 'Cashbook Report'),
(9, 1, 'menu_cashbook', 'specific', 'CASHBOOK'),
(10, 1, 'text_invoice', 'specific', 'Invoice'),
(11, 1, 'menu_invoice', 'specific', 'INVOICE'),
(12, 1, 'text_user_preference', 'specific', 'User Preference'),
(13, 1, 'text_settings', 'specific', 'Settings'),
(14, 1, 'text_stock_alert', 'specific', 'Stock Alert'),
(15, 1, 'text_expired', 'specific', 'Expired'),
(16, 1, 'text_itsolution24', 'specific', 'ITsolution24'),
(17, 1, 'text_reports', 'specific', 'Reports'),
(18, 1, 'text_lockscreen', 'specific', 'Lockscreen'),
(19, 1, 'text_logout', 'specific', 'Logout'),
(20, 1, 'menu_dashboard', 'specific', 'DASHBOARD'),
(21, 1, 'menu_point_of_sell', 'specific', 'POINT OF SELL'),
(22, 1, 'menu_sell', 'specific', 'SELL'),
(23, 1, 'menu_sale_list', 'specific', 'SELL LIST'),
(24, 1, 'menu_return_list', 'specific', 'RETURN LIST'),
(25, 1, 'menu_giftcard', 'specific', 'GIFTCARD'),
(26, 1, 'menu_add_giftcard', 'specific', 'ADD GIFTCARD'),
(27, 1, 'menu_giftcard_list', 'specific', 'GIFTCARD LIST'),
(28, 1, 'menu_giftcard_topup', 'specific', 'GIFTCARD TOPUP'),
(29, 1, 'menu_quotation', 'specific', 'QUOTATION'),
(30, 1, 'menu_add_quotation', 'specific', 'ADD QUOTATION'),
(31, 1, 'menu_quotation_list', 'specific', 'QUOTATION LIST'),
(32, 1, 'menu_installment', 'specific', 'INSTALLMENT'),
(33, 1, 'menu_installment_list', 'specific', 'INSTALLMENT LIST'),
(34, 1, 'menu_payment_list', 'specific', 'PAYMENT LIST'),
(35, 1, 'menu_payment_due_today', 'specific', 'PAYMENT DUE TODAY'),
(36, 1, 'menu_payment_due_all', 'specific', 'PAYMENT DUE ALL'),
(37, 1, 'menu_payment_due_expired', 'specific', 'PAYMENT DUE EXP.'),
(38, 1, 'menu_overview_report', 'specific', 'OVERVIEW REPORT'),
(39, 1, 'menu_purchase', 'specific', 'PURCHASE'),
(40, 1, 'menu_add_purchase', 'specific', 'ADD PURCHASE'),
(41, 1, 'menu_purchase_list', 'specific', 'PURCHASE LIST'),
(42, 1, 'menu_due_invoice', 'specific', 'DUE INVOICE'),
(43, 1, 'menu_transfer', 'specific', 'STOCK TRANSFER'),
(44, 1, 'menu_add_transfer', 'specific', 'ADD TRANSFER'),
(45, 1, 'menu_transfer_list', 'specific', 'TRANSFER LIST'),
(46, 1, 'menu_product', 'specific', 'PRODUCT'),
(47, 1, 'menu_product_list', 'specific', 'PRODUCT LIST'),
(48, 1, 'menu_add_product', 'specific', 'ADD PRODUCT'),
(49, 1, 'menu_barcode_print', 'specific', 'BARCODE PRINT'),
(50, 1, 'menu_category', 'specific', 'CATEGORY LIST'),
(51, 1, 'menu_add_category', 'specific', 'ADD CATEGORY'),
(52, 1, 'menu_product_import', 'specific', 'IMPORT (.xls)'),
(53, 1, 'menu_stock_alert', 'specific', 'STOCK ALERT'),
(54, 1, 'menu_expired', 'specific', 'EXPIRED'),
(55, 1, 'menu_customer', 'specific', 'CUSTOMER'),
(56, 1, 'menu_add_customer', 'specific', 'ADD CUSTOMER'),
(57, 1, 'menu_customer_list', 'specific', 'CUSTOMER LIST'),
(58, 1, 'menu_transaction_list', 'specific', 'TRANSACTION LIST'),
(59, 1, 'menu_supplier', 'specific', 'SUPPLIER'),
(60, 1, 'menu_add_supplier', 'specific', 'ADD SUPPLIER'),
(61, 1, 'menu_supplier_list', 'specific', 'SUPPLIER LIST'),
(62, 1, 'menu_accounting', 'specific', 'ACCOUNTING'),
(63, 1, 'menu_new_deposit', 'specific', 'DEPOSIT'),
(64, 1, 'menu_new_withdraw', 'specific', 'WIDTHDRAW'),
(65, 1, 'menu_new_transfer', 'specific', 'ADD TRANSFER '),
(66, 1, 'menu_list_transfer', 'specific', 'TRANSFER LIST'),
(67, 1, 'menu_add_bank_account', 'specific', 'ADD BANK ACCOUNT'),
(68, 1, 'menu_bank_accounts', 'specific', 'BANK ACCOUNT LIST'),
(69, 1, 'menu_income_source', 'specific', 'INCOME SOURCE'),
(70, 1, 'menu_list_transactions', 'specific', 'TRANSACTION LIST'),
(71, 1, 'menu_balance_sheet', 'specific', 'BALANCE SHEET'),
(72, 1, 'menu_income_monthwise', 'specific', 'INCOME MONTHWISE'),
(73, 1, 'menu_income_and_expense', 'specific', 'INCOME VS EXPENSE'),
(74, 1, 'menu_profit_and_loss', 'specific', 'PROFIT VS LOSS'),
(75, 1, 'menu_expenditure', 'specific', 'EXPANDITURE'),
(76, 1, 'menu_create_expense', 'specific', 'ADD EXPENSE'),
(77, 1, 'menu_expense_list', 'specific', 'EXPENSE LIST'),
(78, 1, 'menu_expense_monthwise', 'specific', 'EXPENSE MONTHWISE'),
(79, 1, 'menu_summary', 'specific', 'SUMMARY'),
(80, 1, 'menu_loan_manager', 'specific', 'LOAN MANAGER'),
(81, 1, 'menu_take_loan', 'specific', 'TAKE LOAN'),
(82, 1, 'menu_loan_list', 'specific', 'LOAN LIST'),
(83, 1, 'menu_loan_summary', 'specific', 'SUMMARY'),
(84, 1, 'menu_reports', 'specific', 'REPORTS'),
(85, 1, 'menu_report_overview', 'specific', 'OVERVIEW REPORT'),
(86, 1, 'menu_report_collection', 'specific', 'COLLECTION REPORT'),
(87, 1, 'menu_report_due_collection', 'specific', 'DUE COLLECTION RPT'),
(88, 1, 'menu_report_due_paid', 'specific', 'DUE PAID RPT'),
(89, 1, 'menu_sell_report', 'specific', 'SELL REPORT'),
(90, 1, 'menu_purchase_report', 'specific', 'PURCHASE REPORT'),
(91, 1, 'menu_sell_payment_report', 'specific', 'SELL PAYMENT REPORT'),
(92, 1, 'menu_purchase_payment_report', 'specific', 'PUR. PAYMENT RPT.'),
(93, 1, 'menu_tax_report', 'specific', 'SELL TAX REPORT'),
(94, 1, 'menu_purchase_tax_report', 'specific', 'PURCHASE TAX RPT.'),
(95, 1, 'menu_tax_overview_report', 'specific', 'TAX OVERVIEW RPT.'),
(96, 1, 'menu_report_stock', 'specific', 'STOCK REPORT'),
(97, 1, 'menu_analytics', 'specific', 'ANALYTICS'),
(98, 1, 'menu_sms', 'specific', 'SMS'),
(99, 1, 'menu_send_sms', 'specific', 'SEND SMS'),
(100, 1, 'menu_sms_report', 'specific', 'SMS REPORT'),
(101, 1, 'menu_sms_setting', 'specific', 'SMS SETTING'),
(102, 1, 'menu_user', 'specific', 'USER'),
(103, 1, 'menu_add_user', 'specific', 'ADD USER'),
(104, 1, 'menu_user_list', 'specific', 'USER LIST'),
(105, 1, 'menu_add_usergroup', 'specific', 'ADD USERGROUP'),
(106, 1, 'menu_usergroup_list', 'specific', 'USERGROUP LIST'),
(107, 1, 'menu_password', 'specific', 'PASSWORD'),
(108, 1, 'menu_filemanager', 'specific', 'FILEMANAGER'),
(109, 1, 'menu_system', 'specific', 'SYSTEM'),
(110, 1, 'menu_store', 'specific', 'STORE'),
(111, 1, 'menu_create_store', 'specific', 'STORE CREATE'),
(112, 1, 'menu_store_list', 'specific', 'STORE LIST'),
(113, 1, 'menu_store_setting', 'specific', 'STORE SETTING'),
(114, 1, 'menu_receipt_template', 'specific', 'RECEIPT TEMPLATE'),
(115, 1, 'menu_user_preference', 'specific', 'USER PREFERENCE'),
(116, 1, 'menu_brand', 'specific', 'BRAND'),
(117, 1, 'menu_add_brand', 'specific', 'ADD BRAND'),
(118, 1, 'menu_brand_list', 'specific', 'BRAND LIST'),
(119, 1, 'menu_currency', 'specific', 'CURRENCY'),
(120, 1, 'menu_pmethod', 'specific', 'PAYMENT METHOD'),
(121, 1, 'menu_unit', 'specific', 'UNIT'),
(122, 1, 'menu_taxrate', 'specific', 'TAXRATE'),
(123, 1, 'menu_box', 'specific', 'BOX'),
(124, 1, 'menu_printer', 'specific', 'PRINTER'),
(125, 1, 'menu_backup_restore', 'specific', 'BACKUP/RESTORE'),
(126, 1, 'menu_store_change', 'specific', 'STORE CHANGE'),
(127, 1, 'text_dashboard', 'specific', 'Dashboard'),
(128, 1, 'text_old_dashboard', 'specific', 'Old Dashboard'),
(129, 1, 'button_pos', 'specific', 'POS'),
(130, 1, 'button_invoice', 'specific', 'Invoice'),
(131, 1, 'button_overview_report', 'specific', 'Overview Report'),
(132, 1, 'button_sell_report', 'specific', 'Sell Report'),
(133, 1, 'button_purchase_report', 'specific', 'Purchase Report'),
(134, 1, 'button_stock_alert', 'specific', 'Stock Alert'),
(135, 1, 'button_expired_alert', 'specific', 'Expired'),
(136, 1, 'button_backup_restore', 'specific', 'Backup/Restore'),
(137, 1, 'button_stores', 'specific', 'Stores'),
(138, 1, 'text_total_invoice', 'specific', 'TOTAL INVOICE'),
(139, 1, 'text_total_invoice_today', 'specific', 'TOTAL INVOICE TODAY'),
(140, 1, 'text_details', 'specific', 'Details'),
(141, 1, 'text_total_customer', 'specific', 'TOTAL CUSTOMER'),
(142, 1, 'text_total_customer_today', 'specific', 'TOTAL CUSTOMER TODAY'),
(143, 1, 'text_total_supplier', 'specific', 'TOTAL SUPPLIER'),
(144, 1, 'text_total_supplier_today', 'specific', 'TOTAL SUPPLIER TODAY'),
(145, 1, 'text_total_product', 'specific', 'TOTAL PRODUCT'),
(146, 1, 'text_total_product_today', 'specific', 'TOTAL PRODUCT TODAY'),
(147, 1, 'text_deposit_today', 'specific', 'Deposit Today'),
(148, 1, 'text_withdraw_today', 'specific', 'Widthdraw Today'),
(149, 1, 'text_total_deposit', 'specific', 'Total Deposit'),
(150, 1, 'text_total_withdraw', 'specific', 'Total Widthdraw'),
(151, 1, 'text_recent_deposit', 'specific', 'Recent Deposit'),
(152, 1, 'label_date', 'specific', 'Date'),
(153, 1, 'label_description', 'specific', 'Description'),
(154, 1, 'label_amount', 'specific', 'Amount'),
(155, 1, 'button_view_all', 'specific', 'View All'),
(156, 1, 'text_recent_withdraw', 'specific', 'Recent Withdraw'),
(157, 1, 'text_collection_report', 'specific', 'Collection Report'),
(158, 1, 'label_serial_no', 'specific', 'SL'),
(159, 1, 'label_username', 'specific', 'Username'),
(160, 1, 'label_total_inv', 'specific', 'Total Inv'),
(161, 1, 'label_net_amount', 'specific', 'Net Amount'),
(162, 1, 'label_prev_due_collection', 'specific', 'Prev. Due Col.'),
(163, 1, 'label_due_collection', 'specific', 'Due Collection'),
(164, 1, 'label_due_given', 'specific', 'Due GIven'),
(165, 1, 'label_received', 'specific', 'Received'),
(166, 1, 'text_sells_analytics', 'specific', 'Sell Analytics'),
(167, 1, 'text_version', 'specific', 'Version'),
(168, 1, 'button_today', 'specific', 'Today'),
(169, 1, 'button_last_7_days', 'specific', 'Last 7 Days'),
(170, 1, 'button_last_30_days', 'specific', 'Last 30 Days'),
(171, 1, 'button_last_365_days', 'specific', 'Last 365 Days'),
(172, 1, 'button_filter', 'specific', 'Filter'),
(173, 1, 'title_language', 'specific', 'Language'),
(174, 1, 'text_language_title', 'specific', 'Language'),
(175, 1, 'text_language_list_title', 'specific', 'Language Translate'),
(176, 1, 'label_key', 'specific', 'Key'),
(177, 1, 'label_value', 'specific', 'Value'),
(178, 1, 'label_translate', 'specific', 'Translate'),
(179, 1, 'button_translate', 'specific', 'Translate'),
(180, 1, 'title_quotation', 'specific', 'Quotation'),
(181, 1, 'text_quotation_title', 'specific', 'Quotation'),
(182, 1, 'text_add', 'specific', 'Add'),
(183, 1, 'text_new_quotation_title', 'specific', 'Add New Quotation'),
(184, 1, 'label_reference_no', 'specific', 'Ref. No.'),
(185, 1, 'label_note', 'specific', 'Notes'),
(186, 1, 'label_status', 'specific', 'Status'),
(187, 1, 'text_sent', 'specific', 'Sent'),
(188, 1, 'text_pending', 'specific', 'Pending'),
(189, 1, 'text_complete', 'specific', 'Complete'),
(190, 1, 'label_customer', 'specific', 'Customer'),
(191, 1, 'text_select', 'specific', '--- Please Select ---'),
(192, 1, 'label_supplier', 'specific', 'Supplier'),
(193, 1, 'text_all_suppliers', 'specific', 'All Supplier'),
(194, 1, 'label_add_product', 'specific', 'Add Product'),
(195, 1, 'placeholder_search_product', 'specific', 'Search Product'),
(196, 1, 'label_product', 'specific', 'Product'),
(197, 1, 'label_available', 'specific', 'Available'),
(198, 1, 'label_quantity', 'specific', 'Quantity'),
(199, 1, 'label_sell_price', 'specific', 'Sell Price'),
(200, 1, 'label_item_tax', 'specific', 'Item Tax'),
(201, 1, 'label_subtotal', 'specific', 'Subtotal'),
(202, 1, 'label_order_tax', 'specific', 'Order Tax'),
(203, 1, 'label_shipping_charge', 'specific', 'Shipping Charge'),
(204, 1, 'label_others_charge', 'specific', 'Other Charge'),
(205, 1, 'label_discount_amount', 'specific', 'Discount'),
(206, 1, 'label_payable_amount', 'specific', 'Payable Amount'),
(207, 1, 'button_save', 'specific', 'Save'),
(208, 1, 'button_reset', 'specific', 'Reset'),
(209, 1, 'text_quotation_list_title', 'specific', 'Quotation List'),
(210, 1, 'button_all', 'specific', 'All'),
(211, 1, 'button_sent', 'specific', 'Sent'),
(212, 1, 'button_pending', 'specific', 'Pending'),
(213, 1, 'button_complete', 'specific', 'Complete'),
(214, 1, 'label_biller', 'specific', 'Biller'),
(215, 1, 'label_total', 'specific', 'Total'),
(216, 1, 'label_action', 'specific', 'Action'),
(217, 1, 'text_translation_success', 'specific', 'Translation Successfull'),
(218, 1, 'title_purchase', 'specific', 'Purchase'),
(219, 1, 'text_purchase_title', 'specific', 'Purchase'),
(220, 1, 'text_new_purchase_title', 'specific', 'Add New Purchase'),
(221, 1, 'text_received', 'specific', 'Received'),
(222, 1, 'text_ordered', 'specific', 'Ordered'),
(223, 1, 'label_attachment', 'specific', 'Attachment'),
(224, 1, 'label_cost', 'specific', 'Cost'),
(225, 1, 'label_item_total', 'specific', 'Item Total'),
(226, 1, 'label_payment_method', 'specific', 'Payment Method'),
(227, 1, 'label_paid_amount', 'specific', 'Paid Amount'),
(228, 1, 'label_due_amount', 'specific', 'Due Amount'),
(229, 1, 'label_change_amount', 'specific', 'Change Amount'),
(230, 1, 'button_submit', 'specific', 'Submit'),
(231, 1, 'text_purchase_list_title', 'specific', 'Purchase List'),
(232, 1, 'button_today_invoice', 'specific', 'Today Invoice'),
(233, 1, 'button_all_invoice', 'specific', 'All Invoice'),
(234, 1, 'button_due_invoice', 'specific', 'Due Invoice'),
(235, 1, 'button_all_due_invoice', 'specific', 'All Due Invoice'),
(236, 1, 'button_paid_invoice', 'specific', 'Paid Invoice'),
(237, 1, 'button_inactive_invoice', 'specific', 'Inactive Invoice'),
(238, 1, 'label_datetime', 'specific', 'Date Time'),
(239, 1, 'label_invoice_id', 'specific', 'Invoice Id'),
(240, 1, 'label_creator', 'specific', 'Creator'),
(241, 1, 'label_invoice_paid', 'specific', 'Paid Amount'),
(242, 1, 'label_due', 'specific', 'Due'),
(243, 1, 'label_pay', 'specific', 'Pay'),
(244, 1, 'label_return', 'specific', 'Return'),
(245, 1, 'label_view', 'specific', 'View'),
(246, 1, 'label_edit', 'specific', 'Edit'),
(247, 1, 'title_language_translation', 'specific', 'Language Translate'),
(248, 1, 'title_invoice', 'specific', 'Invoice'),
(249, 1, 'text_invoice_title', 'specific', 'Invoice'),
(250, 1, 'text_invoice_sub_title', 'specific', 'Invoice List'),
(251, 1, 'label_customer_name', 'specific', 'Customer Name'),
(252, 1, 'label_invoice_amount', 'specific', 'Inv. Amount'),
(253, 1, 'label_invoice_due', 'specific', 'Invoice Due'),
(254, 1, 'title_transfer', 'specific', 'Transfer'),
(255, 1, 'text_transfer_title', 'specific', 'Transfer'),
(256, 1, 'text_add_transfer_title', 'specific', 'Add New Transfer'),
(257, 1, 'label_ref_no', 'specific', 'Ref. No.'),
(258, 1, 'label_from', 'specific', 'From'),
(259, 1, 'label_to', 'specific', 'To'),
(260, 1, 'text_stock_list', 'specific', 'Stock List'),
(261, 1, 'search', 'specific', 'Search'),
(262, 1, 'text_invoice_id', 'specific', 'Invoice Id'),
(263, 1, 'text_stock', 'specific', 'Stock'),
(264, 1, 'text_transfer_list', 'specific', 'Transfer List'),
(265, 1, 'label_item_name', 'specific', 'Item Name'),
(266, 1, 'label_transfer_qty', 'specific', 'Transfer Qty.'),
(267, 1, 'button_transfer_now', 'specific', 'Transfer Now'),
(268, 1, 'text_list_transfer_title', 'specific', 'Transfer List'),
(269, 1, 'label_from_store', 'specific', 'From Store'),
(270, 1, 'label_to_store', 'specific', 'To Store'),
(271, 1, 'label_total_item', 'specific', 'Total Item'),
(272, 1, 'label_total_quantity', 'specific', 'Total Quantity'),
(273, 1, 'text_success', 'specific', 'Successfully Created'),
(274, 1, 'title_product', 'specific', 'Product'),
(275, 1, 'text_products', 'specific', 'Products'),
(276, 1, 'text_add_new', 'specific', 'Add New Product'),
(277, 1, 'text_product', 'specific', 'Product'),
(278, 1, 'text_general', 'specific', 'General'),
(279, 1, 'text_image', 'specific', 'Image'),
(280, 1, 'label_image', 'specific', 'Image'),
(281, 1, 'label_url', 'specific', 'Url'),
(282, 1, 'label_sort_order', 'specific', 'Order'),
(283, 1, 'label_thumbnail', 'specific', 'Thumbnail'),
(284, 1, 'label_product_type', 'specific', 'Product Type'),
(285, 1, 'text_standard', 'specific', 'Standard'),
(286, 1, 'text_service', 'specific', 'Service'),
(287, 1, 'label_name', 'specific', 'Name'),
(288, 1, 'label_pcode', 'specific', 'P. Code'),
(289, 1, 'label_category', 'specific', 'Category'),
(290, 1, 'label_brand', 'specific', 'Brand'),
(291, 1, 'label_barcode_symbology', 'specific', 'Barcode Symbiology'),
(292, 1, 'label_box', 'specific', 'Box'),
(293, 1, 'label_expired_date', 'specific', 'Expired Date'),
(294, 1, 'label_unit', 'specific', 'Unit'),
(295, 1, 'label_product_cost', 'specific', 'Product Cost'),
(296, 1, 'label_product_price', 'specific', 'Product Price'),
(297, 1, 'label_product_tax', 'specific', 'Product Tax'),
(298, 1, 'label_tax_method', 'specific', 'Tax Method'),
(299, 1, 'text_inclusive', 'specific', 'Inclusive'),
(300, 1, 'text_exclusive', 'specific', 'Exclusive'),
(301, 1, 'label_store', 'specific', 'Store'),
(302, 1, 'label_alert_quantity', 'specific', 'Alert Quantity'),
(303, 1, 'text_active', 'specific', 'Active'),
(304, 1, 'text_inactive', 'specific', 'Inactive'),
(305, 1, 'text_view_all', 'specific', 'View All'),
(306, 1, 'label_all_product', 'specific', 'All Product'),
(307, 1, 'button_trash', 'specific', 'Trash'),
(308, 1, 'button_bulk', 'specific', 'Bulk Action'),
(309, 1, 'button_delete_all', 'specific', 'Delete All'),
(310, 1, 'label_stock', 'specific', 'Stock'),
(311, 1, 'label_purchase_price', 'specific', 'Purchase Price'),
(312, 1, 'label_selling_price', 'specific', 'Selling Price'),
(313, 1, 'label_purchase', 'specific', 'Purchase'),
(314, 1, 'label_print_barcode', 'specific', 'Print Barcode'),
(315, 1, 'button_view', 'specific', 'View'),
(316, 1, 'button_edit', 'specific', 'Edit'),
(317, 1, 'button_purchase_product', 'specific', 'Purchase Product'),
(318, 1, 'button_barcode', 'specific', 'Barcode'),
(319, 1, 'button_delete', 'specific', 'Delete'),
(320, 1, 'error_no_selected', 'specific', 'Not Selected'),
(321, 1, 'success_delete_all', 'specific', 'Successfully Deleted'),
(322, 1, 'text_language_translation_title', 'specific', 'Language Translate'),
(323, 1, 'title_user_preference', 'specific', 'User Preference'),
(324, 1, 'text_user_preference_title', 'specific', 'User Preference'),
(325, 1, 'text_language_preference_title', 'specific', 'Language Translate'),
(326, 1, 'label_select_language', 'specific', 'Select Language'),
(327, 1, 'text_english', 'specific', 'English'),
(328, 1, 'text_color_preference_title', 'specific', 'Color Preference'),
(329, 1, 'label_base_color', 'specific', 'Base color'),
(330, 1, 'text_color_black', 'specific', 'Black'),
(331, 1, 'text_color_blue', 'specific', 'Blue'),
(332, 1, 'text_color_green', 'specific', 'Green'),
(333, 1, 'text_color_red', 'specific', 'Red'),
(334, 1, 'text_color_yellow', 'specific', 'Yellow'),
(335, 1, 'text_pos_side_panel_position_title', 'specific', 'POS Side Panel Position'),
(336, 1, 'label_pos_side_panel_position', 'specific', 'Pos Side Panel Position'),
(337, 1, 'text_right', 'specific', 'Right'),
(338, 1, 'text_left', 'specific', 'Left'),
(339, 1, 'text_pos_pattern_title', 'specific', 'POS Pattern'),
(340, 1, 'label_select_pos_pattern', 'specific', 'Select POS Pattern'),
(341, 1, 'button_update', 'specific', 'Update'),
(342, 1, 'text_login_title', 'specific', 'Login'),
(344, 1, 'button_sign_in', 'specific', 'Sign In'),
(345, 1, 'text_forgot_password', 'specific', 'Forgot Password?'),
(346, 1, 'title_forgot_password', 'specific', 'Forgot Password'),
(347, 1, 'text_forgot_password_instruction', 'specific', 'Please type your email.  We will send you a link just follow the steps.'),
(348, 1, 'button_close', 'specific', 'Close'),
(349, 1, 'title_receipt_template', 'specific', 'Receipt Template'),
(350, 1, 'text_receipt_tempalte_title', 'specific', 'Receipt Template'),
(351, 1, 'title_pos_setting', 'specific', 'POS Settings'),
(352, 1, 'text_receipt_template', 'specific', 'Receipt Template'),
(353, 1, 'text_receipt_tempalte_sub_title', 'specific', 'Receipt Template'),
(354, 1, 'button_preview', 'specific', 'Preview'),
(355, 1, 'text_tempalte_content_title', 'specific', 'Template Content'),
(356, 1, 'text_tempalte_css_title', 'specific', 'Template CSS'),
(357, 1, 'text_template_tags', 'specific', 'Template Tags'),
(358, 1, 'text_translations', 'specific', 'Translations'),
(359, 1, 'text_bangla', 'specific', 'Bangla'),
(360, 1, 'menu_language', 'specific', 'LANGUAGE'),
(361, 1, 'button_default', 'specific', 'Default'),
(362, 1, 'text_paid', 'specific', 'Paid'),
(363, 1, 'button_return', 'specific', 'Return'),
(364, 1, 'button_view_receipt', 'specific', 'View Receipt'),
(365, 1, 'label_delete', 'default', 'Delete'),
(366, 1, 'button_dublicate_entry', 'specific', 'Dublicate Entry'),
(367, 1, 'text_delete_success', 'specific', 'Successfully Deleted'),
(368, 1, 'label_delete', 'specific', 'Delete'),
(369, 1, 'text_customer_list_title', 'specific', 'Customer List'),
(370, 1, 'text_customer_title', 'specific', 'Customer'),
(371, 1, 'text_new_customer_title', 'specific', 'Add New Customer'),
(372, 1, 'label_phone', 'specific', 'Phone'),
(373, 1, 'label_date_of_birth', 'specific', 'Date of Birth'),
(374, 1, 'label_email', 'specific', 'Email'),
(375, 1, 'label_sex', 'specific', 'Sex'),
(376, 1, 'label_male', 'specific', 'Male'),
(377, 1, 'label_female', 'specific', 'Female'),
(378, 1, 'label_others', 'specific', 'Others'),
(379, 1, 'label_age', 'specific', 'Age'),
(380, 1, 'label_address', 'specific', 'Address'),
(381, 1, 'label_city', 'specific', 'City'),
(382, 1, 'label_state', 'specific', 'State'),
(383, 1, 'label_country', 'specific', 'Country'),
(384, 1, 'label_id', 'specific', 'Id'),
(385, 1, 'label_balance', 'specific', 'Balance'),
(386, 1, 'label_sell', 'specific', 'Sell'),
(387, 1, 'button_sell', 'specific', 'Sell'),
(388, 1, 'button_view_profile', 'specific', 'View Profile'),
(389, 1, 'login_success', 'specific', 'Login Successfull'),
(390, 1, 'title_installment_payment', 'specific', 'Installment Payment'),
(391, 1, 'text_installment_payment_title', 'specific', 'Installment Payment'),
(392, 1, 'text_installment', 'specific', 'Installment'),
(393, 1, 'text_installment_payment_list_title', 'specific', 'Installment Payment List'),
(394, 1, 'text_all_payment', 'specific', 'All Payment'),
(395, 1, 'button_all_payment', 'specific', 'All Payment'),
(396, 1, 'button_todays_due_payment', 'specific', 'Todays Due Payment'),
(397, 1, 'button_all_due_payment', 'specific', 'All Due Payment'),
(398, 1, 'button_expired_due_payment', 'specific', 'Expired Due Payment'),
(399, 1, 'label_payment_date', 'specific', 'Payment Date'),
(400, 1, 'label_payable', 'specific', 'Payable'),
(401, 1, 'label_paid', 'specific', 'Paid'),
(402, 1, 'button_payment', 'specific', 'Payment'),
(403, 1, 'title_backup_restore', 'specific', 'Backup/Restore'),
(404, 1, 'text_backup_restore_title', 'specific', 'Backup/Restore'),
(405, 1, 'text_backup', 'specific', 'Backup'),
(406, 1, 'text_restore', 'specific', 'Restore'),
(407, 1, 'label_databases', 'specific', 'Databases'),
(408, 1, 'label_select_all', 'specific', 'Select All'),
(409, 1, 'label_unselect_all', 'specific', 'Unselect All'),
(410, 1, 'button_export', 'specific', 'Export'),
(411, 1, 'label_progress', 'specific', 'Progress'),
(412, 1, 'button_select_sql_file', 'specific', 'Select .sql File'),
(413, 1, 'title_printer', 'specific', 'Printer'),
(414, 1, 'text_printer_title', 'specific', 'Printer'),
(415, 1, 'text_new_printer_title', 'specific', 'Add New Printer'),
(416, 1, 'label_title', 'specific', 'Title'),
(417, 1, 'label_type', 'specific', 'Type'),
(418, 1, 'label_char_per_line', 'specific', 'Char Per Line'),
(419, 1, 'label_path', 'specific', 'Path'),
(420, 1, 'label_ip_address', 'specific', 'Ip Address'),
(421, 1, 'label_port', 'specific', 'Port'),
(422, 1, 'text_printer_list_title', 'specific', 'Printer List'),
(423, 1, 'title_box', 'specific', 'Box'),
(424, 1, 'text_box_title', 'specific', 'Box'),
(425, 1, 'text_box_box_title', 'specific', 'Box '),
(426, 1, 'label_box_name', 'specific', 'Box Name'),
(427, 1, 'label_code_name', 'specific', 'Code Name'),
(428, 1, 'label_box_details', 'specific', 'Box Details'),
(429, 1, 'text_in_active', 'specific', 'Inactive'),
(430, 1, 'text_box_list_title', 'specific', 'Box List'),
(431, 1, 'title_taxrate', 'specific', 'Taxrate'),
(432, 1, 'text_taxrate_title', 'specific', 'Taxrate'),
(433, 1, 'text_new_taxrate_title', 'specific', 'Add New Taxrate'),
(434, 1, 'label_taxrate_name', 'specific', 'Taxrate Name'),
(435, 1, 'label_taxrate', 'specific', 'Taxrate'),
(436, 1, 'text_taxrate_list_title', 'specific', 'Taxrate List'),
(437, 1, 'title_unit', 'specific', 'Unit'),
(438, 1, 'text_unit_title', 'specific', 'Unit'),
(439, 1, 'text_new_unit_title', 'specific', 'Add New Unit'),
(440, 1, 'label_unit_name', 'specific', 'Unit Name'),
(441, 1, 'label_unit_details', 'specific', 'Unit Details'),
(442, 1, 'text_unit_list_title', 'specific', 'Unit List'),
(443, 1, 'title_pmethod', 'specific', 'Payment Mehtod'),
(444, 1, 'text_pmethod_title', 'specific', 'Payment Method'),
(445, 1, 'text_new_pmethod_title', 'specific', 'Add New Payment Method'),
(446, 1, 'label_details', 'specific', 'Details'),
(447, 1, 'text_pmethod_list_title', 'specific', 'Payment Method List'),
(448, 1, 'title_currency', 'specific', 'Currency'),
(449, 1, 'text_currency_title', 'specific', 'Currency'),
(450, 1, 'text_new_currency_title', 'specific', 'Add New Currency'),
(451, 1, 'label_code', 'specific', 'Code'),
(452, 1, 'hint_code', 'specific', 'Code name here'),
(453, 1, 'label_symbol_left', 'specific', 'Symbol Left'),
(454, 1, 'hint_symbol_left', 'specific', 'It will display in Left side'),
(455, 1, 'label_symbol_right', 'specific', 'Symbol Right'),
(456, 1, 'hint_symbol_right', 'specific', 'It will display in right  side'),
(457, 1, 'label_decimal_place', 'specific', 'Decimal  Place'),
(458, 1, 'hint_decimal_place', 'specific', 'It indicates number of digit after ponts. I.E.  100.00'),
(459, 1, 'text_currency_list_title', 'specific', 'Currency List'),
(460, 1, 'text_enabled', 'specific', 'Enabled'),
(461, 1, 'button_activate', 'specific', 'Active'),
(462, 1, 'button_activated', 'specific', 'Activated'),
(463, 1, 'text_brand_list_title', 'specific', 'Brand List'),
(464, 1, 'text_brand_title', 'specific', 'Brand'),
(465, 1, 'text_new_brand_title', 'specific', 'Brand'),
(466, 1, 'label_total_product', 'specific', 'Total Product'),
(467, 1, 'title_create_store', 'specific', 'Create Store'),
(468, 1, 'text_create_store_title', 'specific', 'Create Store'),
(469, 1, 'text_stores', 'specific', 'Stores'),
(470, 1, 'text_currency', 'specific', 'Currency'),
(471, 1, 'text_payment_method', 'specific', 'Paymen Method'),
(472, 1, 'text_printer', 'specific', 'Printer'),
(473, 1, 'text_email_setting', 'specific', 'Email Setting'),
(474, 1, 'text_ftp_setting', 'specific', 'FTP Setting'),
(475, 1, 'label_mobile', 'specific', 'Mobile'),
(476, 1, 'label_zip_code', 'specific', 'Zip Code'),
(477, 1, 'label_vat_reg_no', 'specific', 'VAT Reg. No.'),
(478, 1, 'label_cashier_name', 'specific', 'Cashier Name'),
(479, 1, 'label_timezone', 'specific', 'Timezone'),
(480, 1, 'label_invoice_edit_lifespan', 'specific', 'Invoice Edit Lifespan'),
(481, 1, 'hint_invoice_edit_lifespan', 'specific', 'After this time you won\'t be able to edit invoice.'),
(482, 1, 'text_minute', 'specific', 'Minute'),
(483, 1, 'text_second', 'specific', 'Second'),
(484, 1, 'label_invoice_delete_lifespan', 'specific', 'Invoice Delete Lifespan'),
(485, 1, 'hint_invoice_delete_lifespan', 'specific', 'After this time you won\'t be able to delete invoice.'),
(486, 1, 'label_after_sell_page', 'specific', 'After Sell Page'),
(487, 1, 'hint_after_sell_page', 'specific', 'After Sell Page'),
(488, 1, 'label_pos_printing', 'specific', 'POS Printing'),
(489, 1, 'label_receipt_printer', 'specific', 'Receipt Printer'),
(490, 1, 'label_auto_print_receipt', 'specific', 'Auto Print Receipt'),
(491, 1, 'label_deposit_account', 'specific', 'Deposit Account'),
(492, 1, 'label_tax', 'specific', 'TAX'),
(493, 1, 'hint_tax', 'specific', 'Tax'),
(494, 1, 'label_stock_alert_quantity', 'specific', 'Stock Alert Quantity'),
(495, 1, 'hint_stock_alert_quantity', 'specific', 'If quantity reach this value so it will be alert as stock low alert'),
(496, 1, 'label_datatable_item_limit', 'specific', 'Datatable Item Limit'),
(497, 1, 'hint_datatable_item_limit', 'specific', 'It indicates how many row you will show in any table'),
(498, 1, 'label_invoice_footer_text', 'specific', 'Invoice Footer Text'),
(499, 1, 'hint_invoice_footer_text', 'specific', 'This will display in footer of invoice'),
(500, 1, 'label_sound_effect', 'specific', 'Sound Effect'),
(501, 1, 'label_email_from', 'specific', 'Email From'),
(502, 1, 'hint_email_from', 'specific', 'Email From'),
(503, 1, 'label_email_address', 'specific', 'Email Address'),
(504, 1, 'hint_email_address', 'specific', 'Email Addrress'),
(505, 1, 'label_email_driver', 'specific', 'Email Driver'),
(506, 1, 'hint_email_driver', 'specific', 'Email Driver'),
(507, 1, 'label_smtp_host', 'specific', 'SMTP Host'),
(508, 1, 'hint_smtp_host', 'specific', 'SMTP Host'),
(509, 1, 'label_smtp_username', 'specific', 'SMTP Username'),
(510, 1, 'hint_smtp_username', 'specific', 'SMTP Username'),
(511, 1, 'label_smtp_password', 'specific', 'SMTP Password'),
(512, 1, 'hint_smtp_password', 'specific', 'SMTP Password'),
(513, 1, 'label_smtp_port', 'specific', 'SMTP Port'),
(514, 1, 'hint_smtp_port', 'specific', 'SMTP Port'),
(515, 1, 'label_ssl_tls', 'specific', 'SSL/TLS'),
(516, 1, 'hint_ssl_tls', 'specific', 'SSL/TLS'),
(517, 1, 'label_ftp_hostname', 'specific', 'FTP Hostname'),
(518, 1, 'label_ftp_username', 'specific', 'FTP Username'),
(519, 1, 'label_ftp_password', 'specific', 'FTP Password'),
(520, 1, 'button_back', 'specific', 'Back'),
(521, 1, 'title_store', 'specific', 'Store'),
(522, 1, 'text_store_title', 'specific', 'Store'),
(523, 1, 'text_store_list_title', 'specific', 'Store List'),
(524, 1, 'label_created_at', 'specific', 'Created At'),
(525, 1, 'title_edit_store', 'specific', 'Edit Store'),
(526, 1, 'text_title', 'specific', 'Title'),
(527, 1, 'text_pos_setting', 'specific', 'POS Setting'),
(528, 1, 'label_gst_reg_no', 'specific', 'GST Reg. No.'),
(529, 1, 'label_sms_gateway', 'specific', 'SMS Gateway'),
(530, 1, 'hint_sms_gateway', 'specific', 'SMS Gateway like clickatell, 91sms'),
(531, 1, 'label_sms_alert', 'specific', 'SMS Alert'),
(532, 1, 'hint_sms_alert', 'specific', 'SMS Alert'),
(533, 1, 'text_yes', 'specific', 'Yes'),
(534, 1, 'text_no', 'specific', 'No.'),
(535, 1, 'label_auto_sms', 'specific', 'Auto SMS'),
(536, 1, 'text_sms_after_creating_invoice', 'specific', 'SMS After Create Invoice'),
(537, 1, 'label_expiration_system', 'specific', 'Expiration System'),
(538, 1, 'label_invoice_prefix', 'specific', 'Invoive Prefix'),
(539, 1, 'label_receipt_template', 'specific', 'Receipt Template'),
(540, 1, 'label_invoice_view', 'specific', 'Invoice View'),
(541, 1, 'hint_invoice_view', 'specific', 'Invoice View'),
(542, 1, 'text_tax_invoice', 'specific', 'Tax Invoice'),
(543, 1, 'text_indian_gst', 'specific', 'Indian GST'),
(544, 1, 'label_change_item_price_while_billing', 'specific', 'Change Price when Billing'),
(545, 1, 'hint_change_item_price_while_billing', 'specific', 'You will be able to edit sell price when you will create a invoice.'),
(546, 1, 'label_pos_product_display_limit', 'specific', 'POS Product Display Limit'),
(547, 1, 'hint_pos_product_display_limit', 'specific', 'Number of product that will display in POS'),
(548, 1, 'label_send_mail_path', 'specific', 'Send Mail Path'),
(549, 1, 'hint_send_mail_path', 'specific', 'Type send mail path here'),
(550, 1, 'text_logo', 'specific', 'Logo'),
(551, 1, 'label_logo_size', 'specific', 'Logo Size'),
(552, 1, 'button_upload', 'specific', 'Upload'),
(553, 1, 'text_favicon', 'specific', 'Favicon'),
(554, 1, 'label_favicon_size', 'specific', 'Favicon Size'),
(555, 1, 'title_user', 'specific', 'User'),
(556, 1, 'text_user_title', 'specific', 'User'),
(557, 1, 'text_new_user_title', 'specific', 'Add New User'),
(558, 1, 'label_password', 'specific', 'Password'),
(559, 1, 'label_password_retype', 'specific', 'Retype Password'),
(560, 1, 'label_group', 'specific', 'Group'),
(561, 1, 'hint_group', 'specific', 'Group name here'),
(562, 1, 'text_user_list_title', 'specific', 'User List'),
(563, 1, 'label_profile', 'specific', 'Profile'),
(564, 1, 'title_user_group', 'specific', 'Usergroup'),
(565, 1, 'text_group_title', 'specific', 'User Group'),
(566, 1, 'text_new_group_title', 'specific', 'Add New Usergroup'),
(567, 1, 'label_slug', 'specific', 'Slug'),
(568, 1, 'text_group_list_title', 'specific', 'User Group List'),
(569, 1, 'label_total_user', 'specific', 'Total User'),
(570, 1, 'title_password', 'specific', 'Password'),
(571, 1, 'text_password_title', 'specific', 'Password'),
(572, 1, 'text_password_box_title', 'specific', 'Password'),
(573, 1, 'label_password_user', 'specific', 'Password'),
(574, 1, 'label_password_new', 'specific', 'New Password'),
(575, 1, 'label_password_confirm', 'specific', 'Password Confirm'),
(576, 1, 'title_send_sms', 'specific', 'Send SMS'),
(577, 1, 'text_sms_title', 'specific', 'SMS'),
(578, 1, 'text_send_sms', 'specific', 'Send SMS'),
(579, 1, 'text_send_sms_title', 'specific', 'Send SMS'),
(580, 1, 'text_event_sms', 'specific', 'Event SMS'),
(581, 1, 'text_single', 'specific', 'Single'),
(582, 1, 'text_group', 'specific', 'User Group'),
(583, 1, 'label_sms_for', 'specific', 'SMS For'),
(584, 1, 'text_birthday', 'specific', 'Birthday'),
(585, 1, 'label_people_type', 'specific', 'People Type'),
(586, 1, 'text_all_customer', 'specific', 'All Customer'),
(587, 1, 'text_all_user', 'specific', 'All User'),
(588, 1, 'label_people', 'specific', 'People'),
(589, 1, 'label_message', 'specific', 'Messeage'),
(590, 1, 'button_send', 'specific', 'Send'),
(591, 1, 'label_phone_number', 'specific', 'Phone Number'),
(592, 1, 'title_sms_report', 'specific', 'SMS Report'),
(593, 1, 'text_sms_report_title', 'specific', 'SMS Report'),
(594, 1, 'text_sms_list_title', 'specific', 'SMS List'),
(595, 1, 'text_all', 'specific', 'All'),
(596, 1, 'button_delivered', 'specific', 'Delivered'),
(597, 1, 'button_failed', 'specific', 'Failed'),
(598, 1, 'label_schedule_at', 'specific', 'Schedule At'),
(599, 1, 'label_campaign_name', 'specific', 'Campaign Name'),
(600, 1, 'label_people_name', 'specific', 'People Name'),
(601, 1, 'label_mobile_number', 'specific', 'Mobile Number'),
(602, 1, 'label_process_status', 'specific', 'Process Status'),
(603, 1, 'label_response_text', 'specific', 'Response Text'),
(604, 1, 'label_delivered', 'specific', 'Delivered'),
(605, 1, 'label_resend', 'specific', 'Resend'),
(606, 1, 'title_sms_setting', 'specific', 'SMS Setting'),
(607, 1, 'text_sms_setting_title', 'specific', 'SMS Setting'),
(608, 1, 'text_sms_setting', 'specific', 'SMS Setting'),
(609, 1, 'text_clickatell', 'specific', 'clickatell'),
(610, 1, 'text_twilio', 'specific', 'twilio'),
(611, 1, 'text_msg91', 'specific', 'msg91'),
(612, 1, 'text_onnorokomsms', 'specific', 'Onnorokom SMS'),
(613, 1, 'label_api_key', 'specific', 'API Key'),
(614, 1, 'label_sender_id', 'specific', 'Sender Id'),
(615, 1, 'label_auth_key', 'specific', 'Auth Key'),
(616, 1, 'label_contact', 'specific', 'Contact'),
(617, 1, 'label_country_code', 'specific', 'Country Code'),
(618, 1, 'label_maskname', 'specific', 'Maskname'),
(619, 1, 'label_optional', 'specific', 'Optional'),
(620, 1, 'label_campaignname', 'specific', 'Campaign Name'),
(621, 1, 'title_analytics', 'specific', 'Analytics'),
(622, 1, 'text_analytics_title', 'specific', 'Analytics'),
(623, 1, 'text_report_title', 'specific', 'Report'),
(624, 1, 'text_best_customer', 'specific', 'Best Customer'),
(625, 1, 'text_purchase_amount', 'specific', 'Purchase Amount'),
(626, 1, 'text_top_product', 'specific', 'Top Product'),
(627, 1, 'title_overview', 'specific', 'Overview Report'),
(628, 1, 'text_overview_title', 'specific', 'Overview Report'),
(629, 1, 'text_sell_overview', 'specific', 'Sell Overview'),
(630, 1, 'text_purchase_overview', 'specific', 'Purchase Overview'),
(631, 1, 'text_title_sells_overview', 'specific', 'Sell Overview'),
(632, 1, 'text_invoice_amount', 'specific', 'Invoice Amount'),
(633, 1, 'button_details', 'specific', 'Details'),
(634, 1, 'text_discount_amount', 'specific', 'Discount'),
(635, 1, 'text_due_given', 'specific', 'Due Given'),
(636, 1, 'text_due_collection', 'specific', 'Due Collection'),
(637, 1, 'text_others', 'specific', 'Others'),
(638, 1, 'text_shipping_charge', 'specific', 'Shipping Charge'),
(639, 1, 'text_others_charge', 'specific', 'Others Charge'),
(640, 1, 'text_profit_or_loss', 'specific', 'Profit or Loss'),
(641, 1, 'text_order_tax', 'specific', 'Order Tax'),
(642, 1, 'text_item_tax', 'specific', 'Item Tax'),
(643, 1, 'text_total_tax', 'specific', 'Total Tax'),
(644, 1, 'text_title_purchase_overview', 'specific', 'Purchase Overview'),
(645, 1, 'text_due_taken', 'specific', 'Due Taken'),
(646, 1, 'text_due_paid', 'specific', 'Due Paid'),
(647, 1, 'text_total_paid', 'specific', 'Total Paid'),
(648, 1, 'title_collection_report', 'specific', 'Collection Report'),
(649, 1, 'text_collection_report_title', 'specific', 'Collection Report'),
(650, 1, 'title_due_collection', 'specific', 'Due Collection'),
(651, 1, 'text_due_collection_title', 'specific', 'Due Collection'),
(652, 1, 'text_due_collection_sub_title', 'specific', 'Due Collection List'),
(653, 1, 'label_pmethod_name', 'specific', 'Payment Mehtod'),
(654, 1, 'label_created_by', 'specific', 'Created By'),
(655, 1, 'title_supplier_due_paid', 'specific', 'Supplier Due Paid'),
(656, 1, 'text_supplier_due_paid_title', 'specific', 'Supplier Due Paid'),
(657, 1, 'text_supplier_due_paid_sub_title', 'specific', 'Supplier Due Paid'),
(658, 1, 'title_sell_report', 'specific', 'Sell Report'),
(659, 1, 'text_selling_report_title', 'specific', 'Selling Report'),
(660, 1, 'text_selling_report_sub_title', 'specific', 'Selling Report'),
(661, 1, 'button_itemwise', 'specific', 'Itemwise'),
(662, 1, 'button_categorywise', 'specific', 'Categorywise'),
(663, 1, 'button_supplierwise', 'specific', 'Supplierwise'),
(664, 1, 'label_product_name', 'specific', 'Product Name'),
(665, 1, 'label_selling_price_tax', 'specific', 'Selling Price Tax'),
(666, 1, 'label_profit', 'specific', 'Profit'),
(667, 1, 'title_purchase_report', 'specific', 'Purchase Report'),
(668, 1, 'text_purchase_report_title', 'specific', 'Purchase Report'),
(669, 1, 'text_purchase_report_sub_title', 'specific', 'Purchase Report'),
(670, 1, 'label_sup_name', 'specific', 'Sup Name'),
(671, 1, 'title_sell_payment_report', 'specific', 'Sell Payment Report'),
(672, 1, 'text_sell_payment_report_title', 'specific', 'Sell Payment Report'),
(673, 1, 'title_purchase_payment_report', 'specific', 'Purchase Payment Report'),
(674, 1, 'text_purchase_payment_report_title', 'specific', 'Purchase Payment Report'),
(675, 1, 'title_sell_tax_report', 'specific', 'Sell Tax Report'),
(676, 1, 'text_sell_tax_report_title', 'specific', 'Sell Tax Report '),
(677, 1, 'text_sell_amount', 'specific', 'Sell Amount'),
(678, 1, 'text_product_tax_amount', 'specific', 'Product Tax'),
(679, 1, 'text_order_tax_amount', 'specific', 'Order Tax'),
(680, 1, 'text_tax_report_sub_title', 'specific', 'Tax Report '),
(681, 1, 'label_total_amount', 'specific', 'Total Amount'),
(682, 1, 'title_purchase_tax_report', 'specific', 'Purchase Tax Report'),
(683, 1, 'text_purchase_tax_report_title', 'specific', 'Purchase Tax Report'),
(684, 1, 'text_total_tax_amount', 'specific', 'Total Tax'),
(685, 1, 'text_purchase_tax_report_sub_title', 'specific', 'Purcahse Tax Report'),
(686, 1, 'label_tax_amount', 'specific', 'Tax Amount'),
(687, 1, 'title_tax_overview_report', 'specific', 'Tax Overview Report'),
(688, 1, 'text_tax_overview_report_title', 'specific', 'Tax Overview Report'),
(689, 1, 'text_sell_tax', 'specific', 'Sell Tax'),
(690, 1, 'text_purchase_tax', 'specific', 'Purchase Tax'),
(691, 1, 'label_tax_percent', 'specific', 'Tax Percent'),
(692, 1, 'label_count', 'specific', 'Count'),
(693, 1, 'title_stock_report', 'specific', 'Stock Report'),
(694, 1, 'text_stock_report_title', 'specific', 'Stock Report'),
(695, 1, 'text_stock_report', 'specific', 'Stock Report'),
(696, 1, 'supplier_name', 'specific', 'Supplier Name'),
(697, 1, 'title_filemanager', 'specific', 'Filemanager'),
(698, 1, 'title_loan', 'specific', 'Loan'),
(699, 1, 'text_loan_title', 'specific', 'Loan'),
(700, 1, 'text_take_loan_title', 'specific', 'Take Loan'),
(701, 1, 'label_loan_from', 'specific', 'Loan From'),
(702, 1, 'label_interest', 'specific', 'Interest'),
(703, 1, 'label_loan_for', 'specific', 'Loan For'),
(704, 1, 'text_loan_list_title', 'specific', 'Loan List'),
(705, 1, 'button_paid', 'specific', 'Paid'),
(706, 1, 'button_due', 'specific', 'Due'),
(707, 1, 'button_disabled', 'specific', 'Disabled'),
(708, 1, 'label_basic_amount', 'specific', 'Basic Amount'),
(709, 1, 'title_loan_summary', 'specific', 'Loan Summary'),
(710, 1, 'text_loan_summary_title', 'specific', 'Loan Summary'),
(711, 1, 'text_summary_title', 'specific', 'Summary'),
(712, 1, 'text_total_loan', 'specific', 'Total Loan'),
(713, 1, 'text_total_due', 'specific', 'Total Due'),
(714, 1, 'text_recent_payments', 'specific', 'Recent Payments'),
(715, 1, 'title_expense', 'specific', 'Expense'),
(716, 1, 'text_expense_title', 'specific', 'Expense'),
(717, 1, 'text_new_expense_title', 'specific', 'Add New Expense'),
(718, 1, 'label_returnable', 'specific', 'Returnable?'),
(719, 1, 'label_notes', 'specific', 'Notes'),
(720, 1, 'text_expense_list_title', 'specific', 'Expense Category List'),
(721, 1, 'label_category_name', 'specific', 'Category Name'),
(722, 1, 'title_expense_category', 'specific', 'Expense Category'),
(723, 1, 'text_expense_category_title', 'specific', 'Expense Category'),
(724, 1, 'text_new_expense_category_title', 'specific', 'Add New Expense Category'),
(725, 1, 'label_category_slug', 'specific', 'Category Slug'),
(726, 1, 'label_parent', 'specific', 'Parent'),
(727, 1, 'label_category_details', 'specific', 'Category Details'),
(728, 1, 'text_category_list_title', 'specific', 'Category List'),
(729, 1, 'title_expense_monthwise', 'specific', 'Expense Monthwise'),
(730, 1, 'text_expense_monthwise_title', 'specific', 'Expense Monthwise'),
(731, 1, 'text_print', 'specific', 'Print'),
(732, 1, 'text_supplier_list_title', 'specific', 'Supplier List'),
(733, 1, 'text_supplier_title', 'specific', 'Supplier '),
(734, 1, 'text_new_supplier_title', 'specific', 'Add New Supplier'),
(735, 1, 'title_purchase_transaction', 'specific', 'Purchase Transaction'),
(736, 1, 'text_purchase_transaction_title', 'specific', 'Purchase Transaction'),
(737, 1, 'text_transaction_title', 'specific', 'Transaction'),
(738, 1, 'text_transaction_list_title', 'specific', 'Transaction List'),
(739, 1, 'label_pmethod', 'specific', 'Payment Method'),
(740, 1, 'title_sell_transaction', 'specific', 'Sell Transaction'),
(741, 1, 'text_sell_transaction_title', 'specific', 'Sell Transaction'),
(742, 1, 'text_sell_transaction_list_title', 'specific', 'Sell Transaction List'),
(743, 1, 'title_barcode', 'specific', 'Barcode'),
(744, 1, 'text_barcode_title', 'specific', 'Barcode'),
(745, 1, 'text_barcode_generate_title', 'specific', 'Barcode Generate'),
(746, 1, 'label_product_name_with_code', 'specific', 'Product Name with Code'),
(747, 1, 'text_no_product', 'specific', 'No. Proudct'),
(748, 1, 'label_page_layout', 'specific', 'Page Layout'),
(749, 1, 'label_fields', 'specific', 'Fileds'),
(750, 1, 'button_generate', 'specific', 'Generate'),
(751, 1, 'title_category', 'specific', 'Category'),
(752, 1, 'text_category_title', 'specific', 'Category'),
(753, 1, 'text_new_category_title', 'specific', 'Add New Category'),
(754, 1, 'text_product_import_alert', 'specific', 'Product Import Alert'),
(755, 1, 'title_import_product', 'specific', 'Import Product'),
(756, 1, 'text_import_title', 'specific', 'Import'),
(757, 1, 'text_download', 'specific', 'Download'),
(758, 1, 'button_download', 'specific', 'Download'),
(759, 1, 'text_select_xls_file', 'specific', 'Select .xls File'),
(760, 1, 'button_import', 'specific', 'Import'),
(761, 1, 'title_stock_alert', 'specific', 'Stock Alert'),
(762, 1, 'text_stock_alert_title', 'specific', 'Stock Alert'),
(763, 1, 'text_stock_alert_box_title', 'specific', 'Stock Alert'),
(764, 1, 'title_expired', 'specific', 'Expired'),
(765, 1, 'text_expired_title', 'specific', 'Expired'),
(766, 1, 'text_expired_box_title', 'specific', 'Expired'),
(767, 1, 'button_expired', 'specific', 'Expired'),
(768, 1, 'button_expiring_soon', 'specific', 'Comming Soon'),
(769, 1, 'text_due', 'specific', 'Due'),
(770, 1, 'title_purchase_return', 'specific', 'Purchase Return'),
(771, 1, 'text_purchase_return_title', 'specific', 'Purchase Return'),
(772, 1, 'text_return_list_title', 'specific', 'Return List'),
(773, 1, 'text_purchase_return_list_title', 'specific', 'Purchase Return List'),
(774, 1, 'title_sell_return', 'specific', 'Sell Return'),
(775, 1, 'text_sell_return_title', 'specific', 'Sell Return'),
(776, 1, 'text_sell_return_list_title', 'specific', 'Sell Return List'),
(777, 1, 'title_giftcard', 'specific', 'Giftcard'),
(778, 1, 'text_giftcard_title', 'specific', 'Giftcard'),
(779, 1, 'text_new_giftcard_title', 'specific', 'Add New Giftcard'),
(780, 1, 'label_card_no', 'specific', 'Card No.'),
(781, 1, 'label_giftcard_value', 'specific', 'GIftcard Value'),
(782, 1, 'label_expiry_date', 'specific', 'Expiry Date'),
(783, 1, 'button_create_giftcard', 'specific', 'Create GIftcard'),
(784, 1, 'text_giftcard_list_title', 'specific', 'Giftcard List'),
(785, 1, 'label_expiry', 'specific', 'Expiry'),
(786, 1, 'label_topup', 'specific', 'Topup'),
(787, 1, 'title_giftcard_topup', 'specific', 'Giftcard Topup'),
(788, 1, 'text_giftcard_topup_title', 'specific', 'Giftcard Topup'),
(789, 1, 'text_topup_title', 'specific', 'Topup'),
(790, 1, 'text_giftcard_topup_list_title', 'specific', 'Giftcard Popup List'),
(791, 1, 'title_pos', 'specific', 'POS'),
(792, 1, 'text_gift_card', 'specific', 'Giftcard'),
(793, 1, 'button_sell_gift_card', 'specific', 'Giftcard'),
(794, 1, 'text_keyboard_shortcut', 'specific', 'Keyboard Shortcut '),
(795, 1, 'text_holding_order', 'specific', 'Holding Order'),
(796, 1, 'text_search_product', 'specific', 'Search/Barcode Scan'),
(797, 1, 'button_add_product', 'specific', 'Add Product'),
(798, 1, 'button_purchase_now', 'specific', 'Purchase Now'),
(799, 1, 'label_add_to_cart', 'specific', 'Add To Cart'),
(800, 1, 'text_add_note', 'specific', 'Add Note'),
(801, 1, 'label_price', 'specific', 'Price'),
(802, 1, 'label_total_items', 'specific', 'Total Item'),
(803, 1, 'label_discount', 'specific', 'Discount'),
(804, 1, 'label_total_payable', 'specific', 'Total Payable'),
(805, 1, 'button_pay', 'specific', 'Pay Now'),
(806, 1, 'button_hold', 'specific', 'Hold'),
(807, 1, 'text_update_title', 'specific', 'Update '),
(808, 1, 'text_male', 'specific', 'Male'),
(809, 1, 'text_female', 'specific', 'Female'),
(810, 1, 'text_thumbnail', 'specific', 'Thumbnail'),
(811, 1, 'text_update_success', 'specific', 'Successfully Updated'),
(812, 1, 'title_user_profile', 'specific', 'User Profile'),
(813, 1, 'text_profile_title', 'specific', 'Profile'),
(814, 1, 'text_users', 'specific', 'Users'),
(815, 1, 'text_since', 'specific', 'Since'),
(816, 1, 'text_contact_information', 'specific', 'Contact Information'),
(817, 1, 'label_collection', 'specific', 'Collection'),
(818, 1, 'text_sell_report', 'specific', 'Sell Report'),
(819, 1, 'text_purchase_report', 'specific', 'Purchase Report'),
(820, 1, 'text_payment_report', 'specific', 'Payment Report'),
(821, 1, 'text_login_log', 'specific', 'Login History'),
(822, 1, 'button_collection_report', 'specific', 'Collection Report'),
(823, 1, 'button_log', 'specific', 'Log'),
(824, 1, 'text_invoice_list', 'specific', 'Invoice List'),
(825, 1, 'label_items', 'specific', 'Items'),
(826, 1, 'label_time', 'specific', 'Time'),
(827, 1, 'title_bank_transactions', 'specific', 'Bank Transactions'),
(828, 1, 'text_bank_transaction_title', 'specific', 'Bank Transaction'),
(829, 1, 'text_bank_account_title', 'specific', 'Bank Account'),
(830, 1, 'text_bank_transaction_list_title', 'specific', 'Bank Transaction List'),
(831, 1, 'button_filtering', 'specific', 'Filtering'),
(832, 1, 'text_view_all_transactions', 'specific', 'View All Transactions'),
(833, 1, 'label_account', 'specific', 'Account'),
(834, 1, 'label_credit', 'specific', 'Credit'),
(835, 1, 'label_debit', 'specific', 'Debit'),
(836, 1, 'text_unpaid', 'specific', 'Unpaid'),
(837, 1, 'title_income_source', 'specific', 'Income Source'),
(838, 1, 'text_income_source_title', 'specific', 'Income Source'),
(839, 1, 'text_new_income_source_title', 'specific', 'Add New Income Source'),
(840, 1, 'label_source_name', 'specific', 'Source Name'),
(841, 1, 'label_source_slug', 'specific', 'Source Slug'),
(842, 1, 'label_source_details', 'specific', 'Source Details'),
(843, 1, 'text_income_source_sub_title', 'specific', 'Income Source List'),
(844, 1, 'title_income_monthwise', 'specific', 'Income Monthwise'),
(845, 1, 'text_income_monthwise_title', 'specific', 'Income Monthwise'),
(846, 1, 'label_capital', 'specific', 'Capital'),
(847, 1, 'title_bank_transfer', 'specific', 'Bank Transfer'),
(848, 1, 'text_bank_transfer_title', 'specific', 'Bank Transfer'),
(849, 1, 'text_banking_title', 'specific', 'Banking'),
(850, 1, 'text_list_bank_transfer_title', 'specific', 'Bank Transfer List'),
(851, 1, 'label_from_account', 'specific', 'From Account'),
(852, 1, 'label_to_account', 'specific', 'To Account'),
(853, 1, 'title_income_and_expense', 'specific', 'Income '),
(854, 1, 'text_income_and_expense_title', 'specific', 'Income vs Expense'),
(855, 1, 'text_date', 'specific', 'Date'),
(856, 1, 'title_income', 'specific', 'Income'),
(857, 1, 'label_this_month', 'specific', 'This Month'),
(858, 1, 'label_this_year', 'specific', 'This Year'),
(859, 1, 'label_till_now', 'specific', 'Till Now'),
(860, 1, 'error_currency_title', 'specific', 'Currency Tittle is not valid'),
(861, 1, 'text_pmethod', 'specific', 'Payment Method'),
(862, 1, 'button_full_payment', 'specific', 'FULL PAYMENT'),
(863, 1, 'button_full_due', 'specific', 'FULL DUE'),
(864, 1, 'button_sell_with_installment', 'specific', 'Sell With Installment'),
(865, 1, 'text_pay_amount', 'specific', 'Pay Amount'),
(866, 1, 'placeholder_input_an_amount', 'specific', 'Input Amount'),
(867, 1, 'placeholder_note_here', 'specific', 'Note Here'),
(868, 1, 'title_installment_details', 'specific', 'Installment Details'),
(869, 1, 'label_duration', 'specific', 'Duration'),
(870, 1, 'text_days', 'specific', 'Days'),
(871, 1, 'label_interval', 'specific', 'Interval'),
(872, 1, 'label_total_installment', 'specific', 'Total Installment'),
(873, 1, 'label_interest_percentage', 'specific', 'Interest Percentage'),
(874, 1, 'label_interest_amount', 'specific', 'Interest Amount'),
(875, 1, 'text_order_details', 'specific', 'Order Details'),
(876, 1, 'error_reference_no', 'specific', 'Reference no. is not valid'),
(877, 1, 'error_date', 'specific', 'Date is not valid'),
(878, 1, 'error_total_amount', 'specific', 'Total amount is not valid'),
(879, 1, 'error_customer', 'specific', 'Customer is not valid'),
(880, 1, 'text_quotation_create_success', 'specific', 'Successfully Created'),
(881, 1, 'button_action', 'specific', 'Action'),
(882, 1, 'button_create_sell', 'specific', 'Create Sell'),
(883, 1, 'title_installment_overview', 'specific', 'Installment Overview'),
(884, 1, 'text_installment_overview_title', 'specific', 'Installment Overview Report');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(885, 1, 'text_installment_overview', 'specific', 'Installment Overview'),
(886, 1, 'text_invoice_count', 'specific', 'Invoice Count'),
(887, 1, 'text_interest_amount', 'specific', 'Interest Amount'),
(888, 1, 'text_amount_received', 'specific', 'Amount Received'),
(889, 1, 'text_amount_due', 'specific', 'Amount Due'),
(890, 1, 'text_expired_due_payment', 'specific', 'Expired Due Payment'),
(891, 1, 'text_all_due_payment', 'specific', 'All Due Payment'),
(892, 1, 'text_todays_due_payment', 'specific', 'Todays Due Payment'),
(893, 1, 'title_installment', 'specific', 'Installment'),
(894, 1, 'text_installment_title', 'specific', 'Installment'),
(895, 1, 'text_installment_sub_title', 'specific', 'Installment List'),
(896, 1, 'button_all_installment', 'specific', 'All Installment'),
(897, 1, 'button_due_installment', 'specific', 'Due Installment'),
(898, 1, 'button_paid_installment', 'specific', 'Paid Installment'),
(899, 1, 'label_total_ins', 'specific', 'Total Ins.'),
(900, 1, 'text_order_summary', 'specific', 'Order Summary'),
(901, 1, 'label_previous_due', 'specific', 'Previous Due'),
(902, 1, 'text_return_item', 'specific', 'Return Item'),
(903, 1, 'label_return_quantity', 'specific', 'Return Quantity'),
(904, 1, 'placeholder_type_any_note', 'specific', 'Type Note'),
(905, 1, 'error_quantity_exceed', 'specific', 'Quantity Exceed'),
(906, 1, 'text_return_success', 'specific', 'Return Successfull'),
(907, 1, 'label_purchase_note', 'specific', 'Purchase Note'),
(908, 1, 'text_purchase_update_success', 'specific', 'Successfully Updated'),
(909, 1, 'error_items', 'specific', 'Items is not valid'),
(910, 1, 'error_store_id', 'specific', 'Store is not valid'),
(911, 1, 'text_transfer_success', 'specific', 'Successfully Transfered'),
(912, 1, 'button_transfer_edit', 'specific', 'Transfer Edit'),
(913, 1, 'text_update_transfer_status_success', 'specific', 'Successfully Updated'),
(914, 1, 'label_transferred_to', 'specific', 'Transfered To'),
(915, 1, 'text_product_list', 'specific', 'Product List'),
(916, 1, 'error_category_name', 'specific', 'Category name is not valid'),
(917, 1, 'error_sup_name', 'specific', 'Suppllier name is not valid'),
(918, 1, 'error_supplier_email_or_mobile', 'specific', 'Supplier email or mobile is not valid'),
(919, 1, 'error_sup_address', 'specific', 'Supplier Address is not valid'),
(920, 1, 'error_unit_name', 'specific', 'Unit name is not valid'),
(921, 1, 'error_product_name', 'specific', 'Product name is not valid'),
(922, 1, 'error_sup_id', 'specific', 'Supplier is not valid'),
(923, 1, 'text_product_name', 'specific', 'Product Name'),
(924, 1, 'text_quantity', 'specific', 'Quantity'),
(925, 1, 'button_print', 'specific', 'Print'),
(926, 1, 'error_walking_customer_can_not_craete_due', 'specific', 'Walking Customer Can\'t to Create a Due'),
(927, 1, 'error_stock', 'specific', 'Stock amount is not valid'),
(928, 1, 'error_installment_count', 'specific', 'Installment count is not valid'),
(929, 1, 'title_bank_account', 'specific', 'Bank Account'),
(930, 1, 'text_new_bank_account_title', 'specific', 'Add New Bank Account'),
(931, 1, 'label_account_name', 'specific', 'Account Name'),
(932, 1, 'label_account_details', 'specific', 'Account Details'),
(933, 1, 'label_account_no', 'specific', 'Account No.'),
(934, 1, 'label_contact_person', 'specific', 'Contact Person'),
(935, 1, 'label_internal_banking_url', 'specific', 'Internal Banking Url'),
(936, 1, 'text_bank_account_list_title', 'specific', 'Bank Account List'),
(937, 1, 'label_account_description', 'specific', 'Account Description'),
(938, 1, 'title_bank_account_sheet', 'specific', 'Balance Sheet'),
(939, 1, 'text_bank_account_sheet_title', 'specific', 'Balance Sheet'),
(940, 1, 'text_bank_account_sheet_list_title', 'specific', 'Balance Sheet Details'),
(941, 1, 'label_account_id', 'specific', 'Account Id'),
(942, 1, 'label_transfer_to_other', 'specific', 'Transfer To Other'),
(943, 1, 'label_transfer_from_other', 'specific', 'Transfer From Other'),
(944, 1, 'label_deposit', 'specific', 'Deposit'),
(945, 1, 'label_withdraw', 'specific', 'Widthdraw'),
(946, 1, 'text_select_store', 'specific', 'Select Store'),
(947, 1, 'text_activate_success', 'specific', 'Successfully Activated'),
(948, 1, 'text_template_content_update_success', 'specific', 'Successfully updated'),
(949, 1, 'text_template_css_update_success', 'specific', 'Successfully updated'),
(950, 1, 'title_cashbook', 'specific', 'Cashbook'),
(951, 1, 'text_cashbook_title', 'specific', 'Cashbook'),
(952, 1, 'text_cashbook_details_title', 'specific', 'Cashbook Details'),
(953, 1, 'label_opening_balance', 'specific', 'Opening Balance'),
(954, 1, 'label_today_income', 'specific', 'Today Income'),
(955, 1, 'label_total_income', 'specific', 'Total Income'),
(956, 1, 'label_today_expense', 'specific', 'Today Expense'),
(957, 1, 'label_cash_in_hand', 'specific', 'Cash In Hand'),
(958, 1, 'label_today_closing_balance', 'specific', 'Today Closing Balance'),
(959, 1, 'text_balance_update_success', 'specific', 'Successfully Updated'),
(960, 1, 'title_profit_and_loss', 'specific', 'Profit vs Loss'),
(961, 1, 'text_profit_and_loss_title', 'specific', 'Profit vs Loss'),
(962, 1, 'text_profit_and_loss_details_title', 'specific', 'Profit vs Loss Details'),
(963, 1, 'text_loss_title', 'specific', 'Loss'),
(964, 1, 'text_profit_title', 'specific', 'Profit'),
(965, 1, 'label_total_profit', 'specific', 'Total Profit'),
(966, 1, 'label_total_loss', 'specific', 'Total Loss'),
(967, 1, 'label_net_profit', 'specific', 'Net Profit'),
(968, 1, 'label_source', 'specific', 'Source'),
(969, 1, 'label_slip_no', 'specific', 'Slip No.'),
(970, 1, 'label_by', 'specific', 'By'),
(971, 1, 'label_exp_category', 'specific', 'Expense Category'),
(972, 1, 'label_about', 'specific', 'About'),
(973, 1, 'button_withdraw_now', 'specific', 'Widthdraw Now'),
(974, 1, 'label_income_source', 'specific', 'Income Source'),
(975, 1, 'button_deposit_now', 'specific', 'Deposit Now'),
(976, 1, 'text_deposit_success', 'specific', 'Deposit Successfull'),
(977, 1, 'text_delete_title', 'specific', 'Delete'),
(978, 1, 'text_delete_instruction', 'specific', 'What should be done with data belong to the content?'),
(979, 1, 'label_insert_content_to', 'specific', 'Insert Content To'),
(980, 1, 'button_add_language', 'specific', 'Add Language'),
(981, 1, 'code', 'specific', 'code'),
(982, 1, 'error_code', 'specific', 'Code is not valid'),
(983, 1, 'text_uppdate_success', 'specific', 'Successfully Updated'),
(984, 1, 'error_name', 'specific', 'Name is not valid'),
(985, 1, 'text_hindi', 'specific', 'Hindi'),
(986, 1, 'text_create_success', 'specific', 'Successfully Created'),
(987, 1, 'text_gremany', 'specific', 'Germany'),
(988, 1, 'button_add_new_language', 'specific', 'Add New Language'),
(989, 1, 'text_fullscreen', 'specific', 'Fullscreen'),
(990, 1, 'text_sales', 'specific', 'Sells'),
(991, 1, 'text_quotations', 'specific', 'Quotations'),
(992, 1, 'text_purchases', 'specific', 'Purchases'),
(993, 1, 'text_transfers', 'specific', 'Transfers'),
(994, 1, 'text_customers', 'specific', 'Customers'),
(995, 1, 'text_suppliers', 'specific', 'Suppliers'),
(996, 1, 'label_payment_status', 'specific', 'Payment Status'),
(997, 1, 'button_add_sales', 'specific', 'Add Sell'),
(998, 1, 'button_list_sales', 'specific', 'SELL LIST'),
(999, 1, 'text_sales_amount', 'specific', 'Sell Amount'),
(1000, 1, 'text_discount_given', 'specific', 'Discount Given'),
(1001, 1, 'text_received_amount', 'specific', 'Received Amount'),
(1002, 1, 'button_add_quotations', 'specific', 'Add Quotation'),
(1003, 1, 'button_list_quotations', 'specific', 'Quotation List'),
(1004, 1, 'label_supplier_name', 'specific', 'Supplier Name'),
(1005, 1, 'button_add_purchases', 'specific', 'Add Purchase'),
(1006, 1, 'button_list_purchases', 'specific', 'Purchase List'),
(1007, 1, 'button_add_transfers', 'specific', 'Add Transfer'),
(1008, 1, 'button_list_transfers', 'specific', 'Transfer List'),
(1009, 1, 'button_add_customer', 'specific', 'Add Customer'),
(1010, 1, 'button_list_customers', 'specific', 'Customer List'),
(1011, 1, 'button_add_supplier', 'specific', 'Add Supplier'),
(1012, 1, 'button_list_suppliers', 'specific', 'Supplier List'),
(1013, 1, 'text_permission', 'specific', 'Permission'),
(1014, 1, 'text_recent_activities', 'specific', 'Recent Activities'),
(1015, 1, 'text_top_products', 'specific', 'Top Products'),
(1016, 1, 'text_top_customers', 'specific', 'Top Customers'),
(1017, 1, 'text_top_suppliers', 'specific', 'Top Suppliers'),
(1018, 1, 'text_top_brands', 'specific', 'Top Brands'),
(1019, 1, 'text_amount', 'specific', 'Amount'),
(1020, 1, 'text_purchase', 'specific', 'Purchase'),
(1021, 1, 'title_login_logs', 'specific', 'Login Logs'),
(1022, 1, 'title_activity_logs', 'specific', 'Activity Logs'),
(1023, 1, 'text_birthday_today', 'specific', 'Birthday Today'),
(1024, 1, 'text_birthday_coming', 'specific', 'Birthday Coming'),
(1025, 1, 'title_income_vs_expense', 'specific', 'Income vs Expense'),
(1026, 1, 'text_download_as_jpg', 'specific', 'Download as PNG'),
(1027, 1, 'error_disabled_by_default', 'specific', 'Disabled By Default'),
(1028, 1, 'button_empty_value', 'specific', 'Empty Value'),
(1029, 1, 'text_invoice_create_success', 'specific', 'Successfully Created'),
(1030, 1, 'button_send_sms', 'specific', 'Send SMS'),
(1031, 1, 'button_email', 'specific', 'Email'),
(1032, 1, 'button_back_to_pos', 'specific', 'Back to POS'),
(1033, 1, 'error_status', 'specific', 'Status is not valid'),
(1034, 1, 'error_reference_no_exist', 'specific', 'Ref. no. is not valid'),
(1035, 1, 'text_view_invoice_title', 'specific', 'View Invoice Title'),
(1036, 1, 'text_new_dashboard', 'specific', 'New Dashboard'),
(1037, 1, 'text_recent_customer_box_title', 'specific', 'Recent Customers'),
(1038, 1, 'label_customer_mobile', 'specific', 'Customer Mobile'),
(1039, 1, 'label_invoice_note', 'specific', 'Invoice Note'),
(1040, 1, 'text_sell_update_success', 'specific', 'Successfully Updated'),
(1041, 1, 'label_customer_id', 'specific', 'Customer Id'),
(1042, 1, 'label_returened_by', 'specific', 'Returned By'),
(1043, 1, 'text_return_products', 'specific', 'Return Products'),
(1044, 1, 'button_topup', 'specific', 'Topup'),
(1045, 1, 'button_topup_now', 'specific', 'Topup Now'),
(1046, 1, 'error_amount', 'specific', 'Amount is not Valid'),
(1047, 1, 'error_expiry_date', 'specific', 'Expiry Date'),
(1048, 1, 'text_topup_success', 'specific', 'Topup Successfull'),
(1049, 1, 'label_vat_number', 'specific', 'VAT Number'),
(1050, 1, 'label_unit_price', 'specific', 'Unit Price'),
(1051, 1, 'label_shipping', 'specific', 'Shipping'),
(1052, 1, 'label_stamp_and_signature', 'specific', 'Stamp and Signature'),
(1053, 1, 'title_quotation_edit', 'specific', 'Quotation Edit'),
(1054, 1, 'text_quotation_edit_title', 'specific', 'Quotation Edit'),
(1055, 1, 'text_quotation_update_success', 'specific', 'Successfully Updated'),
(1056, 1, 'error_product_not_found', 'specific', 'Product Not Found'),
(1057, 1, 'error_invoice_product_type', 'specific', 'Invoice product type is not valid'),
(1058, 1, 'label_checkout_status', 'specific', 'Checkout Status'),
(1059, 1, 'label_sub_total', 'specific', 'Sub Total'),
(1060, 1, 'text_payments', 'specific', 'Payments'),
(1061, 1, 'error_select_at_least_one_item', 'specific', 'Select at least one product'),
(1062, 1, 'button_pay_now', 'specific', 'Pay Now'),
(1063, 1, 'text_billing_details', 'specific', 'Billing Details'),
(1064, 1, 'Print Barcode', 'specific', 'undefined'),
(1065, 1, 'error_new_category_name', 'specific', 'Please select a category'),
(1066, 1, 'error_customer_name', 'specific', 'Customer name is not valid'),
(1067, 1, 'error_expired_date_below', 'specific', 'Expired date is not valid'),
(1068, 1, 'label_insert_invoice_to', 'specific', 'Insert Invoice To'),
(1069, 1, 'error_new_customer_name', 'specific', 'Please select a customer'),
(1070, 1, 'title_customer_profile', 'specific', 'Customer Profile'),
(1071, 1, 'text_total_purchase', 'specific', 'Total Purchase'),
(1072, 1, 'label_mobile_phone', 'specific', 'Mobile Phone'),
(1073, 1, 'button_transaction_list', 'specific', 'Transaction List'),
(1074, 1, 'label_ref_invoice_Id', 'specific', 'Ref. Invoice Id'),
(1075, 1, 'error_code_name', 'specific', 'Code name is not valid'),
(1076, 1, 'title_supplier_profile', 'specific', 'Supplier Profile'),
(1077, 1, 'text_supplier_profile_title', 'specific', 'Supplier Profile'),
(1078, 1, 'text_supplier_products', 'specific', 'Supplier Products'),
(1079, 1, 'button_products', 'specific', 'Products'),
(1080, 1, 'text_balance_amount', 'specific', 'Balance Amount'),
(1081, 1, 'text_sells', 'specific', 'Sells'),
(1082, 1, 'text_chart', 'specific', 'Chart'),
(1083, 1, 'text_purchase_invoice_list', 'specific', 'Purchase Invoice List'),
(1084, 1, 'button_all_purchase', 'specific', 'All Purchase'),
(1085, 1, 'button_due_purchase', 'specific', 'Due Purchase'),
(1086, 1, 'button_paid_purchase', 'specific', 'Paid Purchase'),
(1087, 1, 'button_stock_transfer', 'specific', 'Stock Transfer'),
(1088, 1, 'text_selling_invoice_list', 'specific', 'Selling Invoice List'),
(1089, 1, 'error_account', 'specific', 'Account is not valid'),
(1090, 1, 'error_ref_no', 'specific', 'Ref. no. is not valid'),
(1091, 1, 'error_about', 'specific', 'About is not valid'),
(1092, 1, 'error_title', 'specific', 'Title is not valid'),
(1093, 1, 'text_withdraw_success', 'specific', 'successfully created'),
(1094, 1, 'error_from_account', 'specific', 'From account is not valid'),
(1095, 1, 'error_to_account', 'specific', 'To account is not valid'),
(1096, 1, 'error_same_account', 'specific', 'Receiver and sender can\'t be same'),
(1097, 1, 'error_insufficient_balance', 'specific', 'Insufficient balance'),
(1098, 1, 'error_ref_no_exist', 'specific', 'Ref. no. already exists'),
(1099, 1, 'error_account_name', 'specific', 'Account name is not valid'),
(1100, 1, 'error_account_no', 'specific', 'Account no. is not valid'),
(1101, 1, 'error_contact_person', 'specific', 'Contact person is not valid'),
(1102, 1, 'error_phone_number', 'specific', 'Phone number is not valid'),
(1103, 1, 'text_income', 'specific', 'Income'),
(1104, 1, 'text_expense', 'specific', 'Expense'),
(1105, 1, 'text_update_income_source_success', 'specific', 'Successfully updated'),
(1106, 1, 'error_new_source_name', 'specific', 'Please select a source'),
(1107, 1, 'text_delete_income_source_success', 'specific', 'Successfully deleted'),
(1108, 1, 'label_day', 'specific', 'Day'),
(1109, 1, 'error_category_id', 'specific', 'Category id is not valid'),
(1110, 1, 'button_viefw', 'specific', 'View'),
(1111, 1, 'label_summary', 'specific', 'Summary'),
(1112, 1, 'label_grand_total', 'specific', 'Grand Total'),
(1113, 1, 'label_this_week', 'specific', 'This Week'),
(1114, 1, 'error_loan_from', 'specific', 'Loan from is not valid'),
(1115, 1, 'error_loan_headline', 'specific', 'Loan headline is not valid'),
(1116, 1, 'error_loan_amount', 'specific', 'Loan amount is not valid'),
(1117, 1, 'text_take_loan_success', 'specific', 'Successfully created'),
(1118, 1, 'error_paid_amount', 'specific', 'Paid amount is not valid'),
(1119, 1, 'error_pay_amount_greater_than_due_amount', 'specific', 'Pay amount can\'t be greater than due amount'),
(1120, 1, 'text_loan_paid_success', 'specific', 'Successfully paid'),
(1121, 1, 'error_sms_text', 'specific', 'SMS text is not valid'),
(1122, 1, 'text_success_sms_sent', 'specific', 'SMS successfully sent'),
(1123, 1, 'error_user_name', 'specific', 'user name is not valid'),
(1124, 1, 'error_user_email_or_mobile', 'specific', 'Email or mobile is not valid'),
(1125, 1, 'error_user_group', 'specific', 'User Group is not valid'),
(1126, 1, 'error_user_password_match', 'specific', 'Retype password didn\'t matched'),
(1127, 1, 'error_user_password_length', 'specific', 'User password length is not valid'),
(1128, 1, 'text_income_vs_expense', 'specific', 'Income vs Expense'),
(1129, 1, 'error_mobile', 'specific', 'Mobile number is not valid'),
(1130, 1, 'error_email', 'specific', 'Email is not valid'),
(1131, 1, 'error_zip_code', 'specific', 'Zip code is not valid'),
(1132, 1, 'error_addreess', 'specific', 'Address is not valid'),
(1133, 1, 'error_preference_receipt_template', 'specific', 'Receipt template is not valid'),
(1134, 1, 'error_currency', 'specific', 'Currency is not valid'),
(1135, 1, 'error_brand_name', 'specific', 'Please select a brand name'),
(1136, 1, 'title_brand_profile', 'specific', 'Brand Profile'),
(1137, 1, 'text_brand_profile_title', 'specific', 'Brand Profile'),
(1138, 1, 'text_brands', 'specific', 'Brands'),
(1139, 1, 'text_brand_products', 'specific', 'Brand Products'),
(1140, 1, 'button_all_products', 'specific', 'All Products'),
(1141, 1, 'text_total_sell', 'specific', 'Total Sell'),
(1142, 1, 'label_brand_name', 'specific', 'Brand Name'),
(1143, 1, 'label_insert_product_to', 'specific', 'Insert Product To'),
(1144, 1, 'error_currency_code', 'specific', 'Currency code is not valid'),
(1145, 1, 'error_currency_symbol', 'specific', 'Currency symbol is not valid'),
(1146, 1, 'error_currency_decimal_place', 'specific', 'Decimal number is not valid'),
(1147, 1, 'error_pmethod_name', 'specific', 'Payment method is not valid'),
(1148, 1, 'label_invoice_to', 'specific', 'Invoice To'),
(1149, 1, 'error_delete_unit_name', 'specific', 'Please select a unit'),
(1150, 1, 'label_ip', 'specific', 'Ip'),
(1151, 1, 'error_taxrate_name', 'specific', 'Taxrate name is not valid'),
(1152, 1, 'error_taxrate', 'specific', 'Taxrate is not valid'),
(1153, 1, 'error_delete_taxrate_name', 'specific', 'Please select a taxrate'),
(1154, 1, 'error_box_name', 'specific', 'Box name is not valid'),
(1155, 1, 'error_delete_box_name', 'specific', 'Please select a box'),
(1156, 1, 'label_success', 'specific', 'Success'),
(1157, 1, 'title_customer_analysis', 'specific', 'Customer Analysis'),
(1158, 1, 'title_customer_analytics', 'specific', 'Customer Analytics'),
(1159, 1, 'error_not_found', 'specific', 'Not Found'),
(1160, 1, 'menu_sell_list', 'specific', 'SELL LIST'),
(1161, 1, 'menu_sell_log', 'specific', 'SELL LOG'),
(1162, 1, 'menu_purchase_logs', 'specific', 'PURCHASE LOG'),
(1163, 1, 'menu_receive_list', 'specific', 'RECEIVE LIST'),
(1164, 1, 'menu_statements', 'specific', 'STATEMENTS'),
(1165, 1, 'menu_data_reset', 'specific', 'DATA RESET'),
(1166, 1, 'placeholder_search_here', 'specific', 'Search Here...'),
(1167, 1, 'text_sell_list_title', 'specific', 'Sell List'),
(1168, 1, 'text_invoices', 'specific', 'Invoices'),
(1169, 1, 'placeholder_input_discount_amount', 'specific', 'Input Discount Amount'),
(1170, 1, 'label_previous_due_paid', 'specific', 'Prev. Due Paid'),
(1171, 1, 'button_add_purchase', 'specific', 'Add Purchase'),
(1172, 1, 'text_selling_tax', 'specific', 'Selling Tax'),
(1173, 1, 'text_igst', 'specific', 'IGST'),
(1174, 1, 'text_cgst', 'specific', 'CGST'),
(1175, 1, 'text_sgst', 'specific', 'SGST'),
(1176, 1, 'text_return_amount', 'specific', 'Return Amount'),
(1177, 1, 'text_sell_due_paid_success', 'specific', 'Due successfully paid'),
(1178, 1, 'text_images', 'specific', 'Images'),
(1179, 1, 'label_hsn_code', 'specific', 'HSN Code'),
(1180, 1, 'label_select', 'specific', '-- Please Select --'),
(1181, 1, 'label_sold', 'specific', 'Sold'),
(1182, 1, 'button_view_details', 'specific', 'View'),
(1183, 1, 'text_installment_details', 'specific', 'Installment Details'),
(1184, 1, 'label_initial_payment', 'specific', 'Initial Payment'),
(1185, 1, 'label_interval_count', 'specific', 'Internal Count'),
(1186, 1, 'label_installment_count', 'specific', 'Installment Count'),
(1187, 1, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(1188, 1, 'label_installment_end_date', 'specific', 'Installment End Date'),
(1189, 1, 'label_sl', 'specific', 'SL'),
(1190, 1, 'text_update_installment_payment_success', 'specific', 'Installment payment successfull'),
(1191, 1, 'error_amount_exceed', 'specific', 'Amount Exceed'),
(1192, 1, 'text_expiry', 'specific', 'Expiry'),
(1193, 1, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(1194, 1, 'title_reset_your_system', 'specific', 'Reset your system'),
(1195, 1, 'title_sell_log', 'specific', 'Sell Log'),
(1196, 1, 'text_sell_log_title', 'specific', 'Sell Log'),
(1197, 1, 'text_sell_title', 'specific', 'Sell'),
(1198, 1, 'label_gtin', 'specific', ''),
(1199, 1, 'button_add_balance', 'specific', 'Add Balance'),
(1200, 1, 'button_statement', 'specific', 'Statement'),
(1201, 1, 'text_all_invoice', 'specific', 'All Invoice'),
(1202, 1, 'label_prev_due', 'specific', 'Prev. Due'),
(1203, 1, 'error_invoice_id', 'specific', 'Invoice id is not valid'),
(1204, 1, 'title_settings', 'specific', ''),
(1205, 1, 'text_cronjob', 'specific', ''),
(1208, 1, 'button_due_invoice_list', 'specific', ''),
(1209, 1, 'text_substract_amount', 'specific', ''),
(1210, 1, 'text_balance_added', 'specific', ''),
(1211, 1, 'button_substract_balance', 'specific', ''),
(1212, 1, 'title_purchase_log', 'specific', 'Purchase log'),
(1213, 1, 'text_purchase_log_title', 'specific', 'Purchase Log'),
(1214, 1, 'title_log_in', 'specific', ''),
(1215, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;font-weight:bold&quot; href=&quot;http://docs.itsolution24.com/pos/&quot;&gt;Online Documentation&lt;/a&gt;  |  &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(1216, 1, 'error_disabled_in_demo', 'specific', 'This feature is disable in error!'),
(1217, 1, 'text_order_title', 'specific', ''),
(1218, 1, 'error_purchase_price', 'specific', ''),
(1219, 1, 'text_list__transfer__title', 'specific', ''),
(1220, 1, 'text_download_sample_format_file', 'specific', ''),
(1221, 1, 'text_barcode_print', 'specific', ''),
(1222, 1, 'button_semd_email', 'specific', ''),
(1223, 1, 'button_send_email', 'specific', 'Send Email'),
(1224, 1, 'error_email_not_sent', 'specific', ''),
(1225, 1, 'text_success_email_sent', 'specific', ''),
(1226, 1, 'button_installment_payment', 'specific', ''),
(1227, 1, 'text_sell_log_list_title', 'specific', 'Sell Log Details'),
(1228, 1, 'text_purchase_log_list_title', 'specific', 'Purchase Log Details'),
(1229, 1, 'text_stock_transfer_title', 'specific', ''),
(1230, 1, 'title_receive', 'specific', 'Receive'),
(1231, 1, 'text_stock_receive_title', 'specific', 'Stock Receive'),
(1232, 1, 'text_receive_title', 'specific', 'Receive'),
(1233, 1, 'text_list__receive__title', 'specific', 'Receive Details'),
(1234, 1, 'label_what_for', 'specific', ''),
(1235, 1, 'error_out_of_stock', 'specific', ''),
(1236, 1, 'xxx', 'specific', ''),
(1237, 1, 'error_login', 'specific', ''),
(1238, 1, 'text_purchase_due_paid_success', 'specific', ''),
(1239, 1, 'text_trash', 'specific', ''),
(1240, 1, 'button_restore_all', 'specific', 'Restore All'),
(1241, 1, 'success_restore_all', 'specific', ''),
(1242, 1, 'title_customer_statement', 'specific', ''),
(1243, 1, 'text_statement_title', 'specific', ''),
(1244, 1, 'title_profit', 'specific', ''),
(1245, 1, 'error_return_quantity_exceed', 'specific', ''),
(1246, 1, 'label_transferred_from', 'specific', ''),
(1247, 1, 'label_member_since', 'specific', ''),
(1248, 1, 'text_not_found', 'specific', ''),
(1249, 1, 'label_logged_in', 'specific', ''),
(1250, 1, 'text_disabled', 'specific', ''),
(1251, 1, 'text_gtin', 'specific', ''),
(1252, 1, 'text_balance', 'specific', ''),
(1253, 1, 'error_invalid_username_password', 'specific', ''),
(1254, 1, 'error_installment_interest_percentage', 'specific', ''),
(1255, 1, 'error_installment_interest_amount', 'specific', ''),
(1256, 1, 'button_resend', 'specific', ''),
(1257, 1, 'error_sms_not_sent', 'specific', ''),
(1258, 1, 'text_sms_logs_title', 'specific', ''),
(1259, 1, 'text_sms_history_title', 'specific', ''),
(1260, 1, 'error_mobile_exist', 'specific', ''),
(1261, 1, 'text_success_sms_schedule', 'specific', ''),
(1262, 1, 'text_success_sms_added_to_schedule', 'specific', ''),
(1263, 1, 'text_mimsms', 'specific', ''),
(1264, 1, 'label_api_token', 'specific', ''),
(1265, 1, 'error_gateway', 'specific', ''),
(1266, 1, 'error_sms_not_send', 'specific', ''),
(1267, 1, 'invoice_sms_text', 'specific', 'Dear [customer_name],  Invoice ID: [invoice_id],  Payable: [payable_amount],  Paid: [paid_amount] ,  Due: [due]. Purchase at- [date_time]. Regards, [store_name],  [address]'),
(1268, 1, 'text_stock_register', 'specific', ''),
(1269, 1, 'text_urdu', 'specific', ''),
(1270, 1, 'error_default_language', 'specific', ''),
(1271, 1, 'error_active_or_sold', 'specific', ''),
(1272, 1, 'title_home', 'specific', 'Home'),
(1273, 1, 'error_supplier_name', 'specific', ''),
(1274, 1, 'error_expired_date_belowx', 'specific', ''),
(1275, 1, 'title_categories', 'specific', ''),
(1276, 1, 'title_products', 'specific', 'Products'),
(1277, 1, 'title_shop_on_sale', 'specific', ''),
(1278, 1, 'title_cart', 'specific', 'Cart'),
(1279, 1, 'title_wishlist', 'specific', ''),
(1280, 1, 'title_account', 'specific', ''),
(1281, 1, 'title_contact', 'specific', ''),
(1282, 1, 'title_contact_us', 'specific', ''),
(1283, 1, 'title_return_refund', 'specific', ''),
(1284, 1, 'title_faq', 'specific', ''),
(1285, 1, 'title_terms_condition', 'specific', ''),
(1286, 1, 'title_support', 'specific', ''),
(1287, 1, 'title_login', 'specific', ''),
(1288, 1, 'title_about', 'specific', ''),
(1289, 1, 'text_restore_completed', 'specific', 'Restored successfully completed'),
(1290, 1, 'error_receipt_printer', 'specific', 'Receipt printer is not valid'),
(1291, 1, 'title_checkout', 'specific', 'Checkout'),
(1292, 1, 'label_credit_balance', 'specific', 'Credit Balance'),
(1293, 1, 'label_giftcard_taken', 'specific', 'Gift Card taken'),
(1294, 1, 'text_are_you_sure', 'specific', 'Are you sure?'),
(1295, 1, 'text_information', 'specific', 'Information'),
(1296, 1, 'text_store_access_success', 'specific', 'Store  successfully activated'),
(1297, 1, 'title_cart_empty', 'specific', 'Cart is empty'),
(1298, 1, 'title_payment', 'specific', 'Payment'),
(1299, 1, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(1300, 1, 'error_password_mismatch', 'specific', 'Confirm password did\'t match'),
(1301, 1, 'error_email_exist', 'specific', 'Email already exists!'),
(9493, 1, 'error_invalid_purchase_code', 'specific', 'Invalid Purchase Code'),
(9494, 1, 'label_member_since', 'specific', 'Member Since'),
(9497, 1, 'error_printer_ip_address_or_port', 'specific', 'IP address or Port'),
(9498, 1, 'error_printer_path', 'specific', 'Printer Path'),
(9499, 1, 'text_barcode_print', 'specific', 'Barcode Print'),
(9500, 1, 'label_select', 'specific', 'Select'),
(9501, 1, 'label_sold', 'specific', 'Sold'),
(9504, 1, 'error_invalid_username_password', 'specific', 'Username or Password is invalid'),
(9505, 1, 'text_order_title', 'specific', 'Order'),
(9506, 1, 'placeholder_search_here', 'specific', 'Search here...'),
(9533, 1, 'text_order', 'specific', 'Order'),
(9534, 1, 'menu_order', 'specific', 'ORDER'),
(9535, 1, 'menu_hold_order', 'specific', 'Hold Order'),
(9543, 1, 'menu_stock_transfer', 'specific', 'Stock Transfer'),
(9552, 1, 'button_gift_card', 'specific', 'Gift Card'),
(9556, 1, 'title_settings', 'specific', 'Settings'),
(9559, 1, 'placeholder_input_discount_amount', 'specific', 'Discount Amount'),
(9560, 1, 'text_sell_due_paid_success', 'specific', 'Successfully Paid'),
(9561, 1, 'button_due_invoice_list', 'specific', 'Due Invoice List'),
(9562, 1, 'button_add_balance', 'specific', 'Add Balance'),
(9563, 1, 'error_pmethod_id', 'specific', 'Payment method is not valid'),
(9564, 1, 'text_balance_added', 'specific', 'Balance successfully added'),
(9565, 1, 'button_sell_product', 'specific', 'Sell Product'),
(9566, 1, 'error_pmethod_code', 'specific', 'Payment method code is not valid'),
(9567, 1, 'invoice_sms_text', 'specific', 'SMS'),
(9568, 1, 'error_installment_duration', 'specific', 'Installment duration is not valid'),
(9569, 1, 'button_view_details', 'specific', 'View Details'),
(9570, 1, 'text_installment_details', 'specific', 'Installment Details'),
(9571, 1, 'label_initial_payment', 'specific', 'Initial Payment'),
(9572, 1, 'label_interval_count', 'specific', 'Interval Count'),
(9573, 1, 'label_installment_count', 'specific', 'Installment Count'),
(9574, 1, 'label_last_installment_date', 'specific', 'Last Installment Date'),
(9575, 1, 'label_installment_end_date', 'specific', 'Intallment End Date'),
(9576, 1, 'text_all_invoice', 'specific', 'All Invoice'),
(9577, 1, 'text_all_due', 'specific', 'All Due'),
(9578, 1, 'button_purchase', 'specific', 'Purchase'),
(9579, 1, 'error_login_attempt', 'specific', 'Error Login Attempt'),
(9580, 1, 'error_login_attempt_exceed', 'specific', 'Login Attempt Exceed'),
(9581, 1, 'error_login_attempts_exceeded', 'specific', 'Login attempt exceeded'),
(9582, 1, 'label_logged_in', 'specific', 'Logged In'),
(9583, 1, 'error_mobile_exist', 'specific', 'Mobile number already exist.'),
(9584, 1, 'error_login', 'specific', 'Login Error.'),
(9585, 1, 'button_product_purchase', 'specific', 'Product purchase'),
(9586, 1, 'button_add_purchase', 'specific', 'Add Purchase'),
(9587, 1, 'label_change', 'specific', 'Change'),
(9588, 1, 'text_demo', 'specific', 'This is a demo version. Data will be reset in every 6 hours interval. &lt;a style=&quot;color:#aafff0;font-weight:bold&quot; href=&quot;https://codecanyon.net/cart/configure_before_adding/22702683&quot;&gt;Buy Now&lt;/a&gt;'),
(9589, 1, 'error_disabled_in_demo', 'specific', 'This feature disabled in demo.'),
(9590, 1, 'button_substract_balance', 'specific', 'Substract Balance'),
(9591, 1, 'error_amount_exceed', 'specific', 'Amount is exceed.'),
(9592, 1, 'text_balance_substracted', 'specific', 'Balance successfully substracted.'),
(9593, 1, 'title_customer_transaction', 'specific', 'Customer Transaction'),
(9594, 1, 'text_customer_transaction_title', 'specific', 'Customer Transaction'),
(9595, 1, 'text_customer_transaction_list_title', 'specific', 'Customer Transaction List'),
(9596, 1, 'title_supplier_transaction', 'specific', 'Supplier Transaction'),
(9597, 1, 'text_supplier_transaction_title', 'specific', 'Supplier Transaction'),
(9598, 1, 'error_card_no', 'specific', 'Card no. is not valid'),
(9599, 1, 'error_activate_permission', 'specific', 'Activate permission is not valid.'),
(9600, 1, 'error_discount_amount_exceed', 'specific', 'Discount amount exceed'),
(9601, 1, 'error_unexpected', 'specific', 'Unexpected error.'),
(9602, 1, 'text_returns', 'specific', 'Returns'),
(9603, 1, 'label_sl', 'specific', 'Sl'),
(9604, 1, 'label_sup_id', 'specific', 'Sup Id'),
(9605, 1, 'label_delete_all', 'specific', 'Delete All'),
(9606, 1, 'label_insert_store_to', 'specific', 'Insert Store To'),
(9607, 1, 'label_insert_store_content_into', 'specific', 'Insert Content To'),
(9608, 1, 'error_store_name', 'specific', 'Store name is not valid'),
(9609, 1, 'error_email_exist', 'specific', 'Email already exist'),
(9610, 1, 'error_customer_gift_card_exist', 'specific', 'Customer giftcard already exist'),
(9611, 1, 'text_expiry', 'specific', 'Expiry'),
(9612, 1, 'label_transferred_from', 'specific', 'Transfered From'),
(9613, 1, 'text_download_samdple_format_file', 'specific', 'Download Sample Format'),
(9614, 1, 'store_code 1 is not valid!', 'specific', 'Store code is not valid'),
(9615, 1, 'text_purchase_due_paid_success', 'specific', 'Successfully Paid'),
(9616, 1, 'error_invalid_balance', 'specific', 'Invalid Balance'),
(9617, 1, 'text_opening_balance_update_success', 'specific', 'Opening balance successfully updated'),
(9618, 1, 'button_installment_payment', 'specific', 'Installment Payment'),
(9619, 1, 'text_update_installment_payment_success', 'specific', 'Installment payment successfully updated'),
(9620, 1, 'error_email_address', 'specific', 'Email address is not valid'),
(9621, 1, 'email_sent_successful', 'specific', 'Email successfully sent'),
(9622, 1, 'error_id', 'specific', 'Id is not valid'),
(9625, 1, 'store_code store2 is not valid!', 'specific', ''),
(9626, 1, 'error_xls_sheet_not_found', 'specific', ''),
(9629, 1, 'text_cronjob', 'specific', ''),
(9714, 1, 'text_delete_holding_order_success', 'specific', 'Holding order successfully deleted'),
(9715, 1, 'label_reference_format', 'specific', 'Reference Format'),
(9716, 1, 'label_sales_reference_prefix', 'specific', 'Sales Prefix'),
(9717, 1, 'text_expired_listing_title', 'specific', 'Expired Listing'),
(9718, 1, 'label_item_quantity', 'specific', 'Item Quantity'),
(9719, 1, 'error_source', 'specific', 'Source is not valid'),
(9720, 1, 'label_returned_at', 'specific', 'Returned At'),
(9721, 1, 'error_print_permission', 'specific', 'You don\'t have permission in printing.'),
(9722, 1, 'text_due_incoice', 'specific', 'Due Invoice'),
(9723, 1, 'text_loan_details', 'specific', 'Loan Details'),
(9724, 1, 'label_paid_by', 'specific', 'Paid By'),
(9729, 1, 'error_order_title', 'specific', 'Order'),
(9730, 1, 'button_conform_order', 'specific', 'Order Confirmed'),
(9731, 1, 'text_order_successfully_placed', 'specific', 'Order Successfully Placed'),
(9732, 1, 'text_order_placed', 'specific', 'Order Placed'),
(9733, 1, 'title_order_placed', 'specific', 'Order successfully placed'),
(9734, 1, 'error_address', 'specific', 'Address field is required'),
(9735, 1, 'error_current_password', 'specific', 'Current Password'),
(9736, 1, 'error_new_password', 'specific', 'New Password'),
(9737, 1, 'error_current_password_not_matched', 'specific', 'Passwords not matched!'),
(9738, 1, 'text_password_update_success', 'specific', 'Password updated successfully'),
(9739, 1, 'error_full_name', 'specific', 'Full name'),
(9740, 1, 'title_register', 'specific', 'Register'),
(9741, 1, 'error_record_not_found', 'specific', 'Recored not found!'),
(9742, 1, 'text_account_created', 'specific', 'Account created successfully'),
(9743, 1, 'text_login_success', 'specific', 'Successfully Logged in'),
(9744, 1, 'title_view_order', 'specific', 'View Order'),
(9745, 1, 'title_order', 'specific', 'Order'),
(9746, 1, 'text_new_order_title', 'specific', 'New Order'),
(9747, 1, 'text_order_list_title', 'specific', 'Order List'),
(9748, 1, 'label_shipping_and_billing_address', 'specific', 'Shipping '),
(9749, 1, 'label_order_status', 'specific', 'Order Status'),
(9750, 1, 'title_order_edit', 'specific', 'Edit Order'),
(9751, 1, 'text_order_edit_title', 'specific', 'Edit Order'),
(9752, 1, 'text_order_update_success', 'specific', 'Order successfully updated'),
(9753, 1, 'label_insert_content_into', 'specific', 'Insert Content Into'),
(9754, 1, 'label_delete_the_product', 'specific', 'Delete The Product'),
(9755, 1, 'label_soft_delete_the_product', 'specific', 'Soft Delete The Product'),
(9756, 1, 'error_phone_exist', 'specific', 'Phone number already exists'),
(9757, 1, 'title_stores', 'specific', 'Stores'),
(9758, 1, 'text_email_update_success', 'specific', 'Successfully Updated'),
(9759, 1, 'text_phone_update_success', 'specific', 'Phone number updated successfully'),
(9760, 1, 'text_phone_number_update_success', 'specific', 'Phone number updated successfully'),
(9770, 1, 'label_link', 'specific', 'Link'),
(9771, 1, 'error_unit_code', 'specific', 'Unit code is not valid'),
(9772, 1, 'error_service_can_not_be_returned', 'specific', 'Service can\'t be returned'),
(9773, 1, 'error_invalid_product_type', 'specific', 'Product type is not valid'),
(9774, 1, 'error_invalid_barcode_symbology', 'specific', 'Barcode symbology is not valid'),
(9775, 1, 'store_code store1111 is not valid!', 'specific', 'Store code is not valid'),
(9776, 1, 'error_category_slug', 'specific', 'Category slug is not valid'),
(9777, 1, 'error_invalid_category_slug', 'specific', 'Category slug is not valid'),
(9778, 1, 'error_invalid_unit_code', 'specific', 'Unit code is not valid'),
(9779, 1, 'error_invalid_taxrate_code', 'specific', 'Taxrate code is not valid'),
(9780, 1, 'error_invalid_tax_method', 'specific', 'Tax method is not valid'),
(9781, 1, 'error_invalid_supplier_code', 'specific', 'Supplier code is not valid'),
(9782, 1, 'error_invalid_brand_code', 'specific', 'Brand code is not valid'),
(9783, 1, 'error_invalid_box_code', 'specific', 'Box code is not valid'),
(9784, 1, 'error_invalid_cost_price', 'specific', 'Cost price is not valid'),
(9785, 1, 'button_sell_list', 'specific', 'Sell List'),
(9786, 1, 'text_redirecting_to_dashbaord', 'specific', NULL),
(9787, 7, 'title_language_translation', 'specific', 'TRADUCCIONES'),
(9788, 7, 'text_english', 'specific', 'Ingles'),
(9789, 7, 'text_arabic', 'specific', 'Arabe'),
(9790, 7, 'text_bangla', 'specific', 'Bangladesh'),
(9791, 7, 'text_hindi', 'specific', 'Hindi'),
(9792, 7, 'text_french', 'specific', 'Frances'),
(9793, 7, 'text_Germany', 'specific', 'Aleman'),
(9794, 7, 'text_spanish', 'specific', 'Español'),
(9795, 7, 'text_pos', 'specific', 'pos'),
(9796, 7, 'menu_pos', 'specific', 'PUNTO DE VENTA'),
(9797, 7, 'text_cashbook_report', 'specific', 'INFORME DE CAJA'),
(9798, 7, 'menu_cashbook', 'specific', 'LIBRO DE PAGOS'),
(9799, 7, 'text_invoice', 'specific', 'FACTURA'),
(9800, 7, 'menu_invoice', 'specific', 'FACTURACIÓN'),
(9801, 7, 'text_user_preference', 'specific', 'PREFERENCIAS DE USUARIO'),
(9802, 7, 'text_settings', 'specific', 'CONFIGURACIONES'),
(9803, 7, 'text_stock_alert', 'specific', 'ALERTA INVENTARIO'),
(9804, 7, 'text_itsolution24', 'specific', '®2025'),
(9805, 7, 'text_fullscreen', 'specific', 'AGROTACTIC'),
(9806, 7, 'text_reports', 'specific', 'REPORTES'),
(9807, 7, 'text_lockscreen', 'specific', 'BLOQUEAR PANTALLA'),
(9808, 7, 'text_logout', 'specific', 'CERRAR SESIÓN'),
(9809, 7, 'menu_dashboard', 'specific', 'DASHBOARD'),
(9810, 7, 'menu_point_of_sell', 'specific', 'PUNTO DE VENTA'),
(9811, 7, 'menu_sell', 'specific', 'VENTAS'),
(9812, 7, 'menu_sell_list', 'specific', 'LISTAS VENTAS'),
(9813, 7, 'menu_return_list', 'specific', 'LISTA DEVOLICIONES'),
(9814, 7, 'menu_sell_log', 'specific', 'BITACORA VENTAS'),
(9815, 7, 'menu_giftcard', 'specific', 'TARJETAS DE REGALO'),
(9816, 7, 'menu_add_giftcard', 'specific', 'AGREGAR TARJETA REGALO'),
(9817, 7, 'menu_giftcard_list', 'specific', 'LISTA TARJETAS DE REGALO'),
(9818, 7, 'menu_giftcard_topup', 'specific', 'TARJETAS DE REGALO'),
(9819, 7, 'menu_quotation', 'specific', 'COTIZACIÓN'),
(9820, 7, 'menu_add_quotation', 'specific', 'AGREGAR COTIZACIÓN'),
(9821, 7, 'menu_quotation_list', 'specific', 'LISTA DE COTIZACIONES'),
(9822, 7, 'menu_installment', 'specific', 'PAGOS'),
(9823, 7, 'menu_installment_list', 'specific', 'LISTA PAGOS'),
(9824, 7, 'menu_payment_list', 'specific', 'LISTA DE PAGOS'),
(9825, 7, 'menu_payment_due_today', 'specific', 'PEND. PAGO HOY'),
(9826, 7, 'menu_payment_due_all', 'specific', 'PEND. DE PAGAR'),
(9827, 7, 'menu_payment_due_expired', 'specific', 'PAGOS POR EXP.'),
(9828, 7, 'menu_overview_report', 'specific', 'INFORME GENERAL'),
(9829, 7, 'menu_purchase', 'specific', 'COMPRAS'),
(9830, 7, 'menu_add_purchase', 'specific', 'AGREGAR COMPRA'),
(9831, 7, 'menu_purchase_list', 'specific', 'LISTA DE COMPRAS'),
(9832, 7, 'menu_due_invoice', 'specific', 'FACTURA PEND.'),
(9833, 7, 'menu_purchase_logs', 'specific', 'REGISTROS COMPRAS'),
(9834, 7, 'menu_transfer', 'specific', 'INVENTARIO'),
(9835, 7, 'menu_add_transfer', 'specific', 'AGREGAR TRASLADO'),
(9836, 7, 'menu_transfer_list', 'specific', 'LISTA DE TRASLADOS'),
(9837, 7, 'menu_receive_list', 'specific', 'LISTA RECEPCIONES'),
(9838, 7, 'menu_product', 'specific', 'PRODUCTOS'),
(9839, 7, 'menu_product_list', 'specific', 'LISTA DE PRODUCTOS'),
(9840, 7, 'menu_add_product', 'specific', 'AGREGAR PRODUCTO'),
(9841, 7, 'menu_barcode_print', 'specific', ' CÓDIGO DE BARRAS'),
(9842, 7, 'menu_category', 'specific', 'LISTA DE CATEGORÍA'),
(9843, 7, 'menu_add_category', 'specific', 'AGREGAR CATEGORÍA'),
(9844, 7, 'menu_product_import', 'specific', 'IMPORTACIÓN (.xls)'),
(9845, 7, 'menu_stock_alert', 'specific', 'ALERTA DE INVENTARIO'),
(9846, 7, 'menu_customer', 'specific', 'CLIENTES'),
(9847, 7, 'menu_add_customer', 'specific', 'AGREGAR CLIENTE'),
(9848, 7, 'menu_customer_list', 'specific', 'LISTA DE CLIENTES'),
(9849, 7, 'menu_statements', 'specific', 'DECLARACIONES'),
(9850, 7, 'menu_supplier', 'specific', 'PROVEEDORES'),
(9851, 7, 'menu_add_supplier', 'specific', 'AGREGAR PROVEEDOR'),
(9852, 7, 'menu_supplier_list', 'specific', 'LISTA DE PROVEEDORES'),
(9853, 7, 'menu_accounting', 'specific', 'CONTABILIDAD'),
(9854, 7, 'menu_new_deposit', 'specific', 'DEPOSITAR'),
(9855, 7, 'menu_new_withdraw', 'specific', 'RETIRAR'),
(9856, 7, 'menu_list_transactions', 'specific', 'LISTA TRANSACCIONES'),
(9857, 7, 'menu_new_transfer', 'specific', 'AGREGAR TRASLADO'),
(9858, 7, 'menu_list_transfer', 'specific', 'LISTA DE TRASLADOS'),
(9859, 7, 'menu_add_bank_account', 'specific', 'AGREGAR CUENTA BANCARIA'),
(9860, 7, 'menu_bank_accounts', 'specific', 'LISTA DE CUENTAS BANCARIAS'),
(9861, 7, 'menu_income_source', 'specific', 'ORIGEN DE INGRESOS'),
(9862, 7, 'menu_balance_sheet', 'specific', 'BALANCE GRAL.'),
(9863, 7, 'menu_income_monthwise', 'specific', 'INGRESOS MESES'),
(9864, 7, 'menu_expense_monthwise', 'specific', 'GASTOS MESES'),
(9865, 7, 'menu_income_and_expense', 'specific', 'INGRESOS VS GASTOS'),
(9866, 7, 'menu_profit_and_loss', 'specific', 'INGRESOS VS GASTOS'),
(9867, 7, 'menu_expenditure', 'specific', 'GASTO'),
(9868, 7, 'menu_create_expense', 'specific', 'AGREGAR GASTOS'),
(9869, 7, 'menu_expense_list', 'specific', 'LISTA DE GASTOS'),
(9870, 7, 'menu_summary', 'specific', 'RESUMEN'),
(9871, 7, 'menu_loan_manager', 'specific', 'PRESTAMOS'),
(9872, 7, 'menu_loan_list', 'specific', 'LISTA DE PRESTAMOS'),
(9873, 7, 'menu_take_loan', 'specific', 'TOMAR PRESTAMO'),
(9874, 7, 'menu_loan_summary', 'specific', 'RESUMEN'),
(9875, 7, 'menu_reports', 'specific', 'REPORTES'),
(9876, 7, 'menu_report_overview', 'specific', 'INFORME GENERAL'),
(9877, 7, 'menu_report_collection', 'specific', 'RECOLECCIÓN'),
(9878, 7, 'menu_report_due_collection', 'specific', 'INFORME RECOLECCIÓN DEUDA'),
(9879, 7, 'menu_report_due_paid', 'specific', 'INFORME PAGOS PEND.'),
(9880, 7, 'menu_sell_report', 'specific', 'INFORME DE VENTAS'),
(9881, 7, 'menu_purchase_report', 'specific', 'INFORME DE COMPRAS'),
(9882, 7, 'menu_sell_payment_report', 'specific', 'INFORME DE PAGOS'),
(9883, 7, 'menu_purchase_payment_report', 'specific', 'INFORME PAGOS-COMPRAS'),
(9884, 7, 'menu_tax_report', 'specific', 'IMPUESTOS'),
(9885, 7, 'menu_purchase_tax_report', 'specific', 'INFORME IMPUESTOS '),
(9886, 7, 'menu_tax_overview_report', 'specific', 'INFORME RESUMEN DE IMPUESTOS'),
(9887, 7, 'menu_report_stock', 'specific', 'INFORME INVENTARIO'),
(9888, 7, 'menu_analytics', 'specific', 'REPORTERÍA'),
(9889, 7, 'menu_sms', 'specific', 'SMS'),
(9890, 7, 'menu_send_sms', 'specific', 'ENVIAR SMS'),
(9891, 7, 'menu_sms_report', 'specific', 'INFORME SMS'),
(9892, 7, 'menu_sms_setting', 'specific', 'CONFIGURACIÓN DE SMS'),
(9893, 7, 'menu_user', 'specific', 'USUARIOS'),
(9894, 7, 'menu_add_user', 'specific', 'AGREGAR USUARIO'),
(9895, 7, 'menu_user_list', 'specific', 'LISTA USUARIOS'),
(9896, 7, 'menu_add_usergroup', 'specific', 'AGREGAR PERFIL DE USUARIOS'),
(9897, 7, 'menu_usergroup_list', 'specific', 'PERFILES DE USUARIOS'),
(9898, 7, 'menu_password', 'specific', 'CONTRASEÑA'),
(9899, 7, 'menu_filemanager', 'specific', 'ARCHIVOS'),
(9900, 7, 'menu_system', 'specific', 'SISTEMA'),
(9901, 7, 'menu_store', 'specific', 'TIENDAS'),
(9902, 7, 'menu_create_store', 'specific', 'CREAR TIENDA '),
(9903, 7, 'menu_store_list', 'specific', 'LISTA TIENDAS'),
(9904, 7, 'menu_store_setting', 'specific', 'AJUSTES DE TIENDA'),
(9905, 7, 'menu_receipt_template', 'specific', 'PLANTILLA DE FACTURACIÓN'),
(9906, 7, 'menu_user_preference', 'specific', 'PREFERENCIAS DE USUARIO'),
(9907, 7, 'menu_brand', 'specific', 'MARCAS'),
(9908, 7, 'menu_add_brand', 'specific', 'AGREGAR MARCA'),
(9909, 7, 'menu_brand_list', 'specific', 'LISTA DE MARCAS'),
(9910, 7, 'menu_currency', 'specific', 'MONEDA'),
(9911, 7, 'menu_pmethod', 'specific', 'METODO DE PAGO'),
(9912, 7, 'menu_unit', 'specific', 'UNIDADES'),
(9913, 7, 'menu_taxrate', 'specific', 'TASA DE IMPUESTOS'),
(9914, 7, 'menu_box', 'specific', 'CAJA'),
(9915, 7, 'menu_printer', 'specific', 'IMPRESORAS'),
(9916, 7, 'menu_language', 'specific', 'IDIOMAS'),
(9917, 7, 'menu_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(9918, 7, 'menu_data_reset', 'specific', 'RESETEAR DATOS'),
(9919, 7, 'menu_store_change', 'specific', 'CAMBIO DE TIENDA'),
(9920, 7, 'text_language_translation_title', 'specific', 'TRADUCCION IDIOMA'),
(9921, 7, 'text_dashboard', 'specific', 'INICIO'),
(9922, 7, 'text_translations', 'specific', 'TRADUCCIONES'),
(9923, 7, 'button_add_new_language', 'specific', 'AGREGAR IDIOMA'),
(9924, 7, 'button_edit', 'specific', 'EDITAR'),
(9925, 7, 'button_delete', 'specific', 'BORRAR'),
(9926, 7, 'button_default', 'specific', 'PREDETERMINADO'),
(9927, 7, 'button_dublicate_entry', 'specific', 'DUPLICAR'),
(9928, 7, 'button_empty_value', 'specific', 'VACIO'),
(9929, 7, 'label_key', 'specific', 'LLAVE'),
(9930, 7, 'label_value', 'specific', 'VALOR'),
(9931, 7, 'label_translate', 'specific', 'TRADUCIR'),
(9932, 7, 'label_delete', 'specific', 'BORRAR'),
(9933, 7, 'placeholder_search_here', 'specific', 'BUSCAR AQUI'),
(9934, 7, 'text_version', 'specific', 'VERSION'),
(9935, 7, 'button_today', 'specific', 'HOY'),
(9936, 7, 'button_last_7_days', 'specific', 'ULTIMOS 7 DIAS'),
(9937, 7, 'button_last_30_days', 'specific', 'ULTIMOS 30 DIAS'),
(9938, 7, 'button_last_365_days', 'specific', 'ULTIMO AÑO'),
(9939, 7, 'button_filter', 'specific', 'FILTRAR'),
(10093, 7, 'button_translate', 'specific', 'TRADUCIR'),
(10094, 7, 'title_dashboard', 'specific', 'DASHBOARD'),
(10095, 7, 'button_pos', 'specific', 'PUNTO DE VENTA'),
(10096, 7, 'button_sell_list', 'specific', 'LISTA VENTAS'),
(10097, 7, 'button_overview_report', 'specific', 'REPORTES GENERAL'),
(10098, 7, 'button_sell_report', 'specific', 'REPORTE VENTAS'),
(10099, 7, 'button_purchase_report', 'specific', 'REPORTE COMPRAS'),
(10100, 7, 'button_stock_alert', 'specific', 'REPORTE ALERTA INVENTARIO'),
(10101, 7, 'button_expired_alert', 'specific', 'REPORTE ALERTA VENCIDOS'),
(10102, 7, 'button_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(10103, 7, 'button_stores', 'specific', 'TIENDAS'),
(10104, 7, 'text_total_invoice', 'specific', 'FACTURA TOTAL'),
(10105, 7, 'text_total_invoice_today', 'specific', 'FACTURA TOTAL HOY'),
(10106, 7, 'text_details', 'specific', 'DETALLES'),
(10107, 7, 'text_total_customer', 'specific', 'TOTAL CLIENTES'),
(10108, 7, 'text_total_customer_today', 'specific', 'TOTAL CLIENTES HOY'),
(10109, 7, 'text_total_supplier', 'specific', 'TOTAL PROVEEDORES'),
(10110, 7, 'text_total_supplier_today', 'specific', 'TOTAL PROVEEDORES HOY'),
(10111, 7, 'text_total_product', 'specific', 'TOTAL PRODUCTOS'),
(10112, 7, 'text_total_product_today', 'specific', 'TOTAL PRODUCTOS HOY'),
(10113, 7, 'text_recent_activities', 'specific', 'ACTIVIDADES RECIENTES'),
(10114, 7, 'text_sales', 'specific', 'VENTAS'),
(10115, 7, 'text_quotations', 'specific', 'COTIZACIONES'),
(10116, 7, 'text_purchases', 'specific', 'COMPRAS'),
(10117, 7, 'text_transfers', 'specific', 'TRASLADOS'),
(10118, 7, 'text_customers', 'specific', 'CLIENTES'),
(10119, 7, 'text_suppliers', 'specific', 'PROVEEDORES'),
(10120, 7, 'label_invoice_id', 'specific', 'ID FACTURA'),
(10121, 7, 'label_created_at', 'specific', 'CREANDO EN'),
(10122, 7, 'label_customer_name', 'specific', 'NOMBRE CLIENTE'),
(10123, 7, 'label_amount', 'specific', 'CANTIDAD'),
(10124, 7, 'label_payment_status', 'specific', 'STATUS PAGO'),
(10125, 7, 'button_add_sales', 'specific', 'AGREGAR VENTAS'),
(10126, 7, 'button_list_sales', 'specific', 'LISTA VENTAS'),
(10127, 7, 'text_sales_amount', 'specific', 'CANTIDAD VENTA'),
(10128, 7, 'text_discount_given', 'specific', 'DESCUENTO'),
(10129, 7, 'text_due_given', 'specific', 'PEND. PAGO'),
(10130, 7, 'text_received_amount', 'specific', 'CANTIDAD RECIBIDA'),
(10131, 7, 'label_date', 'specific', 'FECHA'),
(10132, 7, 'label_reference_no', 'specific', 'NO. REFERENCIA'),
(10133, 7, 'label_customer', 'specific', 'CLIENTE'),
(10134, 7, 'label_status', 'specific', 'ESTADO'),
(10135, 7, 'button_add_quotations', 'specific', 'AGREGAR COTIZACION'),
(10136, 7, 'button_list_quotations', 'specific', 'LISTA COTIZACIONES'),
(10137, 7, 'label_supplier_name', 'specific', 'NOMBRE PROVEEDOR'),
(10138, 7, 'button_add_purchases', 'specific', 'AGREGAR COMPRAS'),
(10139, 7, 'button_list_purchases', 'specific', 'LISTA COMPRAS'),
(10140, 7, 'label_from', 'specific', 'DE'),
(10141, 7, 'label_to', 'specific', 'A'),
(10142, 7, 'label_quantity', 'specific', 'CANTIDAD'),
(10143, 7, 'button_add_transfers', 'specific', 'AGREGAR TRASLADO'),
(10144, 7, 'button_list_transfers', 'specific', 'LISTA TRASLADOS'),
(10145, 7, 'label_phone', 'specific', 'CELULAR'),
(10146, 7, 'label_email', 'specific', 'EMAIL'),
(10147, 7, 'label_address', 'specific', 'DIRECCION'),
(10148, 7, 'button_add_customer', 'specific', 'AGREGAR CLIENTE'),
(10149, 7, 'button_list_customers', 'specific', 'CLIENTES'),
(10150, 7, 'button_add_supplier', 'specific', 'AGREGAR PROVEEDOR'),
(10151, 7, 'button_list_suppliers', 'specific', 'PROVEEDORES'),
(10152, 7, 'text_deposit_today', 'specific', 'DEPOSITADO HOY'),
(10153, 7, 'text_withdraw_today', 'specific', 'RETIRADO HOY'),
(10154, 7, 'text_recent_deposit', 'specific', 'DEPOSITO RECIENTE'),
(10155, 7, 'label_description', 'specific', 'DESCRIPCION'),
(10156, 7, 'button_view_all', 'specific', 'VER TODO'),
(10157, 7, 'text_recent_withdraw', 'specific', 'RETIRO RECIENTE'),
(10158, 7, 'title_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(10159, 7, 'text_download_as_jpg', 'specific', 'DESCARGAR IMAGEN'),
(10160, 7, 'label_day', 'specific', 'DIA'),
(10161, 7, 'text_income', 'specific', 'INGRESOS'),
(10162, 7, 'text_expense', 'specific', 'GASTOS'),
(10163, 7, 'text_income_vs_expense', 'specific', 'INGRESO VS GASTO'),
(10374, 7, 'text_translation_success', 'specific', 'TRADUCCION EXITOSA'),
(10375, 7, 'title_pos', 'specific', 'PUNTO DE VENTA'),
(10376, 7, 'text_gift_card', 'specific', 'TARJETA DE REGALO'),
(10377, 7, 'button_sell_gift_card', 'specific', 'VENTA TARJETA DE REGALO'),
(10378, 7, 'text_keyboard_shortcut', 'specific', 'ATAJOS TECLADO'),
(10379, 7, 'text_holding_order', 'specific', 'ORDEN EN ESPERA'),
(10380, 7, 'text_search_product', 'specific', 'BUSCAR PRODUCTO'),
(10381, 7, 'text_view_all', 'specific', 'VER TODOS'),
(10382, 7, 'button_add_product', 'specific', 'AGREGAR PRODUCTO'),
(10383, 7, 'button_add_purchase', 'specific', 'AGREGAR COMPRA'),
(10384, 7, 'label_add_to_cart', 'specific', 'AGREGAR'),
(10385, 7, 'text_add_note', 'specific', 'AGREGAR NOTA'),
(10386, 7, 'label_due', 'specific', 'PEND. PAGO'),
(10387, 7, 'label_product', 'specific', 'PRODUCTO'),
(10388, 7, 'label_price', 'specific', 'PRECIO'),
(10389, 7, 'label_subtotal', 'specific', 'SUB TOTAL'),
(10390, 7, 'label_total_items', 'specific', 'TOTAL ARTICULOS'),
(10391, 7, 'label_total', 'specific', 'TOTAL'),
(10392, 7, 'label_discount', 'specific', 'DESCUENTO'),
(10393, 7, 'label_tax_amount', 'specific', 'IMPUESTO'),
(10394, 7, 'label_shipping_charge', 'specific', 'COSTO ENVIO'),
(10395, 7, 'label_others_charge', 'specific', 'OTROS CARGOS'),
(10396, 7, 'label_total_payable', 'specific', 'TOTAL A PAGAR');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(10397, 7, 'button_pay', 'specific', 'PAGAR'),
(10398, 7, 'button_hold', 'specific', 'EN ESPERA'),
(10399, 7, 'text_general', 'specific', 'GENERAL'),
(10400, 7, 'text_images', 'specific', 'IMAGENES'),
(10401, 7, 'label_serial_no', 'specific', 'NO. SERIE'),
(10402, 7, 'label_image', 'specific', 'IMAGEN'),
(10403, 7, 'label_url', 'specific', 'URL'),
(10404, 7, 'label_sort_order', 'specific', 'ORDEN DE CLASIFICACION'),
(10405, 7, 'label_action', 'specific', 'ACCIONES'),
(10406, 7, 'label_thumbnail', 'specific', 'MINIATURA'),
(10407, 7, 'label_product_type', 'specific', 'TIPO PRODUCTO'),
(10408, 7, 'text_standard', 'specific', 'STANDARD'),
(10409, 7, 'text_service', 'specific', 'SERVICIO'),
(10410, 7, 'label_name', 'specific', 'NOMBRE'),
(10411, 7, 'text_product', 'specific', 'PRODUCTO'),
(10412, 7, 'label_pcode', 'specific', 'CODIGO'),
(10413, 7, 'label_category', 'specific', 'CATEGORIA'),
(10414, 7, 'text_select', 'specific', 'SELECCIONAR'),
(10415, 7, 'label_supplier', 'specific', 'PROVEEDOR'),
(10416, 7, 'label_brand', 'specific', 'MARCA'),
(10417, 7, 'label_barcode_symbology', 'specific', 'SÍMBOLO CODIGO DE BARRA'),
(10418, 7, 'label_box', 'specific', 'CAJA'),
(10419, 7, 'label_expired_date', 'specific', 'FECHA EXPIRA'),
(10420, 7, 'label_unit', 'specific', 'UNIDAD'),
(10421, 7, 'label_product_cost', 'specific', 'COSTO PRODUCTO'),
(10422, 7, 'label_product_price', 'specific', 'PRECIO PRODUCTO'),
(10423, 7, 'label_product_tax', 'specific', 'IMPUESTO PRODUCTO'),
(10424, 7, 'label_tax_method', 'specific', 'METODO DE IMPUESTOS'),
(10425, 7, 'text_inclusive', 'specific', 'INCLUSIVO'),
(10426, 7, 'text_exclusive', 'specific', 'EXCLUSIVO'),
(10427, 7, 'label_store', 'specific', 'ALMACENAR'),
(10428, 7, 'search', 'specific', 'BUSCAR'),
(10429, 7, 'label_alert_quantity', 'specific', 'CANTIDAD DE ALERTA'),
(10430, 7, 'text_active', 'specific', 'ACTIVO'),
(10431, 7, 'text_inactive', 'specific', 'INACTIVO'),
(10432, 7, 'button_save', 'specific', 'GUARDAR'),
(10433, 7, 'button_reset', 'specific', 'REINICIAR'),
(10434, 7, 'title_purchase', 'specific', 'COMPRAS'),
(10435, 7, 'text_purchase_title', 'specific', 'COMPRAS'),
(10436, 7, 'text_add', 'specific', 'AGREGAR'),
(10437, 7, 'text_new_purchase_title', 'specific', 'NUEVA SOLICITUD DE COMPRA'),
(10438, 7, 'label_note', 'specific', 'NOTA'),
(10439, 7, 'text_received', 'specific', 'RECIBIDA'),
(10440, 7, 'text_pending', 'specific', 'PENDIENTE'),
(10441, 7, 'text_ordered', 'specific', 'ORDEN'),
(10442, 7, 'label_attachment', 'specific', 'ARCHIVO ADJUNTO'),
(10443, 7, 'label_add_product', 'specific', 'AGREGAR PRODUCTO'),
(10444, 7, 'placeholder_search_product', 'specific', 'BUSCAR PRODUCTO'),
(10445, 7, 'label_available', 'specific', 'DISPONIBLE'),
(10446, 7, 'label_cost', 'specific', 'COSTO'),
(10447, 7, 'label_sell_price', 'specific', 'PRECIO VENTA'),
(10448, 7, 'label_item_tax', 'specific', 'IMPUESTO ARTICULO'),
(10449, 7, 'label_item_total', 'specific', 'TOTAL ARTICULO'),
(10450, 7, 'label_order_tax', 'specific', 'ORDEN IMPUESTO'),
(10451, 7, 'label_discount_amount', 'specific', 'IMPORTE DESCUENTO'),
(10452, 7, 'label_payable_amount', 'specific', 'IMPORTE A PAGAR'),
(10453, 7, 'label_payment_method', 'specific', 'METODO DE PAGO'),
(10454, 7, 'label_paid_amount', 'specific', 'MONTO DE PAGO'),
(10455, 7, 'label_due_amount', 'specific', 'PEND. PAGO'),
(10456, 7, 'label_change_amount', 'specific', 'CAMBIAR CANTIDAD'),
(10457, 7, 'button_submit', 'specific', 'ENVIAR'),
(10458, 7, 'text_purchase_list_title', 'specific', 'LISTA DE COMPRAS'),
(10459, 7, 'button_today_invoice', 'specific', 'FACTURAS HOY'),
(10460, 7, 'button_all_invoice', 'specific', 'TODAS LAS FACTURAS'),
(10461, 7, 'button_due_invoice', 'specific', 'FACTURA POR PAGAR'),
(10462, 7, 'button_all_due_invoice', 'specific', 'TODAS LAS FACTURAS POR PAGAR'),
(10463, 7, 'button_paid_invoice', 'specific', 'FACTURAS PAGADAS'),
(10464, 7, 'button_inactive_invoice', 'specific', 'FACTURA INACTIVA'),
(10465, 7, 'label_datetime', 'specific', 'FECHA Y HORA'),
(10466, 7, 'label_creator', 'specific', 'CREADO POR'),
(10467, 7, 'label_invoice_paid', 'specific', 'FACTURA PAGADA'),
(10468, 7, 'label_pay', 'specific', 'PAGO'),
(10469, 7, 'label_return', 'specific', 'REGRESAR'),
(10470, 7, 'label_view', 'specific', 'VER'),
(10471, 7, 'label_edit', 'specific', 'EDITAR'),
(10472, 7, 'label_credit_balance', 'specific', 'BALANCE CREDITO'),
(10473, 7, 'label_date_of_birth', 'specific', 'FECHA DE NACIMIENTO'),
(10474, 7, 'label_sex', 'specific', 'GENERO'),
(10475, 7, 'label_male', 'specific', 'MASCULINO'),
(10476, 7, 'label_female', 'specific', 'FEMENINO'),
(10477, 7, 'label_others', 'specific', 'OTROS'),
(10478, 7, 'label_age', 'specific', 'EDAD'),
(10479, 7, 'label_city', 'specific', 'CIUDAD'),
(10480, 7, 'label_state', 'specific', 'DEPARTAMENTO'),
(10481, 7, 'label_country', 'specific', 'PAIS'),
(10482, 7, 'text_redirecting_to_dashbaord', 'specific', 'REDIRIGIENDO A INICIO'),
(10483, 7, 'title_product', 'specific', 'PRODUCTO'),
(10484, 7, 'text_products', 'specific', 'PRODUCTOS'),
(10485, 7, 'text_add_new', 'specific', 'AGREGAR NUEVO'),
(10486, 7, 'label_all_product', 'specific', 'TODOS LOS PRODUCTOS'),
(10487, 7, 'button_trash', 'specific', 'BASURA'),
(10488, 7, 'button_bulk', 'specific', 'CAMBIO MASIVO'),
(10489, 7, 'button_delete_all', 'specific', 'ELIMINAR TODOS'),
(10490, 7, 'label_stock', 'specific', 'INVENTARIO'),
(10491, 7, 'label_purchase_price', 'specific', 'PRECIO COMPRA'),
(10492, 7, 'label_selling_price', 'specific', 'PRECIO VENTA'),
(10493, 7, 'label_purchase', 'specific', 'COMPRA'),
(10494, 7, 'label_print_barcode', 'specific', 'IMPRIMIR CODIGO DE BARRAS'),
(10495, 7, 'text_select_store', 'specific', 'SELECCIONE TIENDA'),
(10496, 7, 'title_user_preference', 'specific', 'PREFERENCIAS DE USUARIO'),
(10497, 7, 'text_user_preference_title', 'specific', 'PREFERENCIA DE USUARIO'),
(10498, 7, 'text_language_preference_title', 'specific', 'PREFERENCIAS DE IDIOMA'),
(10499, 7, 'label_select_language', 'specific', 'SELECCIONAR IDIOMA'),
(10500, 7, 'text_color_preference_title', 'specific', 'DE PREFERENCIAS COLOR'),
(10501, 7, 'label_base_color', 'specific', 'COLOR BASE'),
(10502, 7, 'text_color_black', 'specific', 'COLOR NEGRO'),
(10503, 7, 'text_color_blue', 'specific', 'COLOR AZUL'),
(10504, 7, 'text_color_green', 'specific', 'COLOR VERDE'),
(10505, 7, 'text_color_red', 'specific', 'COLOR ROJO'),
(10506, 7, 'text_color_yellow', 'specific', 'COLOR AMARILLO'),
(10507, 7, 'text_pos_side_panel_position_title', 'specific', 'POSICION MENU LATERAL'),
(10508, 7, 'label_pos_side_panel_position', 'specific', 'POSICION MENU LATERAL'),
(10509, 7, 'text_right', 'specific', 'DERECHA'),
(10510, 7, 'text_left', 'specific', 'IZQUIERDA'),
(10511, 7, 'text_pos_pattern_title', 'specific', 'PATRON'),
(10512, 7, 'label_select_pos_pattern', 'specific', 'SELECCIONE PATRON'),
(10513, 7, 'button_update', 'specific', 'ACTUALIZAR'),
(10514, 7, 'text_product_created', 'specific', 'CREADO'),
(10515, 7, 'button_view', 'specific', 'VER'),
(10516, 7, 'button_purchase_product', 'specific', 'COMPRAR PRODUCTO'),
(10517, 7, 'button_barcode', 'specific', 'CODIGO DE BARRAS'),
(10518, 7, 'label_card_no', 'specific', 'NO TARJETA'),
(10519, 7, 'label_giftcard_value', 'specific', 'VALOR TARJETA DE REGALO'),
(10520, 7, 'label_balance', 'specific', 'BALANCE'),
(10521, 7, 'label_expiry_date', 'specific', 'FECHA EXPIRACIÓN'),
(10522, 7, 'button_create_giftcard', 'specific', 'CREAR TARJETA REGALO'),
(10523, 7, 'title_stock_alert', 'specific', 'ALERTA INVENTARIO'),
(10524, 7, 'text_stock_alert_title', 'specific', 'ALERTA INVENTARIO'),
(10525, 7, 'text_stock_alert_box_title', 'specific', 'CUADRO DE ALERTA INVENTARIO'),
(10526, 7, 'label_id', 'specific', 'ID'),
(10527, 7, 'label_mobile', 'specific', 'CELULAR'),
(10528, 7, 'error_sell_price_must_be_greated_that_purchase_price', 'specific', 'EL PRECIO DE VENTA DEBE SER MAYOR QUE EL DE COMPRA'),
(10529, 7, 'text_success', 'specific', 'EXITO'),
(10530, 7, 'text_paid', 'specific', 'PAGADO'),
(10531, 7, 'button_return', 'specific', 'REGRESAR'),
(10532, 7, 'button_view_receipt', 'specific', 'VER RECIBO'),
(10533, 7, 'text_order_title', 'specific', 'PEDIDO'),
(10534, 7, 'text_order_details', 'specific', 'DETALLE DE ORDEN'),
(10535, 7, 'text_pmethod', 'specific', 'METODO'),
(10536, 7, 'button_full_payment', 'specific', 'PAGO COMPLETO'),
(10537, 7, 'button_full_due', 'specific', 'TOTAL PEND. PAGAR'),
(10538, 7, 'button_sell_with_installment', 'specific', 'VENDER PLAZOS'),
(10539, 7, 'text_pay_amount', 'specific', 'MONTO PAGO'),
(10540, 7, 'placeholder_input_an_amount', 'specific', 'INGRESE CANTIDAD'),
(10541, 7, 'placeholder_note_here', 'specific', 'NOTA AQUI'),
(10542, 7, 'title_installment_details', 'specific', 'DETALLES INSTALACION'),
(10543, 7, 'label_duration', 'specific', 'DURACION'),
(10544, 7, 'text_days', 'specific', 'DIAS'),
(10545, 7, 'label_interval', 'specific', 'INTERVALO'),
(10546, 7, 'label_total_installment', 'specific', 'TOTAL INSTALACION'),
(10547, 7, 'label_interest_percentage', 'specific', 'PORCENTAJE INTERES'),
(10548, 7, 'label_interest_amount', 'specific', 'MONTO INTERES'),
(10549, 7, 'label_previous_due', 'specific', 'PAGO ANTERIOR'),
(10550, 7, 'error_walking_customer_can_not_craete_due', 'specific', 'CLIENTE NORMAL NO PUEDE CREAR DEUDAS'),
(10551, 7, 'text_invoice_create_success', 'specific', 'CREACIÓN DE FACTURA CON ÉXITO'),
(10552, 7, 'text_update_title', 'specific', 'ACTUALIZAR'),
(10553, 7, 'text_product_updated', 'specific', 'ACTUALIZAR PRODUCTO'),
(10554, 7, 'title_settings', 'specific', 'AJUSTES'),
(10555, 7, 'title_store', 'specific', 'ALMACENAR'),
(10556, 7, 'text_pos_setting', 'specific', 'AJUSTES'),
(10557, 7, 'text_email_setting', 'specific', 'AJUSTES EMAIL'),
(10558, 7, 'text_ftp_setting', 'specific', 'CONFIGURACION FTP'),
(10559, 7, 'text_cronjob', 'specific', 'TAREAS AUTOMATIZADAS'),
(10560, 7, 'label_deposit_account', 'specific', 'CUENTA DEPOSITO'),
(10561, 7, 'label_code_name', 'specific', 'NOMBRE CODIGO'),
(10562, 7, 'label_zip_code', 'specific', 'CODIGO POSTAL'),
(10563, 7, 'label_gst_reg_no', 'specific', 'REG NRO GST'),
(10564, 7, 'label_vat_reg_no', 'specific', 'NIT'),
(10565, 7, 'label_cashier_name', 'specific', 'NOMBRE VENDEDOR'),
(10566, 7, 'label_timezone', 'specific', 'ZONA HORARIA'),
(10567, 7, 'label_invoice_edit_lifespan', 'specific', 'VIDA UTIL EDICION FACTURA'),
(10568, 7, 'hint_invoice_edit_lifespan', 'specific', 'VIDA UTIL EDICION FACTURA'),
(10569, 7, 'text_minute', 'specific', 'MINUTO'),
(10570, 7, 'text_second', 'specific', 'SEGUNDO'),
(10571, 7, 'label_invoice_delete_lifespan', 'specific', 'ELIMINAR VIDA UTIL FACTURA '),
(10572, 7, 'hint_invoice_delete_lifespan', 'specific', 'ELIMINAR VIDA UTIL FACTURA'),
(10573, 7, 'label_tax', 'specific', 'IMPUESTO'),
(10574, 7, 'hint_tax', 'specific', 'IMPUESTO'),
(10575, 7, 'label_sms_gateway', 'specific', 'SMS GATEWAY'),
(10576, 7, 'hint_sms_gateway', 'specific', 'GATEWAY'),
(10577, 7, 'label_sms_alert', 'specific', 'ALERTA SMS'),
(10578, 7, 'hint_sms_alert', 'specific', 'ALERTA SMS'),
(10579, 7, 'text_yes', 'specific', 'SI'),
(10580, 7, 'text_no', 'specific', 'NO'),
(10581, 7, 'label_auto_sms', 'specific', 'AUTO SMS '),
(10582, 7, 'text_sms_after_creating_invoice', 'specific', 'SMS DESPUES DE CREAR FACTURA'),
(10583, 7, 'label_expiration_system', 'specific', 'SISTEMA DE CADUCIDAD'),
(10584, 7, 'label_datatable_item_limit', 'specific', 'LIMITE DE ELEMENTO DE TABLA DE DATOS'),
(10585, 7, 'hint_datatable_item_limit', 'specific', 'LIMITE DE ELEMENTO DE TABLA DE DATOS'),
(10586, 7, 'label_reference_format', 'specific', 'FORMATO REFERENCIA'),
(10587, 7, 'label_sales_reference_prefix', 'specific', 'PREFIJO REFERENCIA DE VENTAS'),
(10588, 7, 'label_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10589, 7, 'label_pos_printing', 'specific', 'IMPRIMIR POS'),
(10590, 7, 'label_receipt_printer', 'specific', 'RECIBO IMPRESORA'),
(10591, 7, 'label_auto_print_receipt', 'specific', 'AUTO RECIBO IMPRESORA'),
(10592, 7, 'label_invoice_view', 'specific', 'VER FACTURA'),
(10593, 7, 'hint_invoice_view', 'specific', 'VER FACTURA'),
(10594, 7, 'text_tax_invoice', 'specific', 'IMPUESTO FACTURA'),
(10595, 7, 'text_indian_gst', 'specific', 'INDIA'),
(10596, 7, 'label_change_item_price_while_billing', 'specific', 'CAMBIAR EL PRECIO DEL ARTICULO DURANTE FACTURACION'),
(10597, 7, 'hint_change_item_price_while_billing', 'specific', 'CAMBIAR EL PRECIO DEL ARTICULO DURANTE FACTURACION'),
(10598, 7, 'label_pos_product_display_limit', 'specific', 'LIMITE VISUALIZACION PRUDUCTO'),
(10599, 7, 'hint_pos_product_display_limit', 'specific', 'LIMITE VISUALIZACION PRUDUCTO'),
(10600, 7, 'label_after_sell_page', 'specific', 'DESPUES DE LA PAGINA DE VENTA'),
(10601, 7, 'hint_after_sell_page', 'specific', 'ANTES DE LA PAGINA DE VENTA'),
(10602, 7, 'label_invoice_footer_text', 'specific', 'TEXTO DEL PIE DE PAGINA DE FACTURA'),
(10603, 7, 'hint_invoice_footer_text', 'specific', 'TEXTO DEL PIE DE PAGINA DE FACTURA'),
(10604, 7, 'label_sound_effect', 'specific', 'EFECTO SONIDO'),
(10605, 7, 'label_email_from', 'specific', 'EMAIL DE'),
(10606, 7, 'hint_email_from', 'specific', 'EMAIL DE'),
(10607, 7, 'label_email_address', 'specific', 'DIRECCION EMAIL'),
(10608, 7, 'hint_email_address', 'specific', 'DIRECCION EMAIL'),
(10609, 7, 'label_email_driver', 'specific', 'DRIVER EMAIL'),
(10610, 7, 'hint_email_driver', 'specific', 'DRIVER EMAIL'),
(10611, 7, 'label_send_mail_path', 'specific', 'ENVIAR RUTA CORREO'),
(10612, 7, 'hint_send_mail_path', 'specific', 'ENVIAR RUTA CORREO'),
(10613, 7, 'label_smtp_host', 'specific', 'HOST SMTP'),
(10614, 7, 'hint_smtp_host', 'specific', 'HOST SMTP'),
(10615, 7, 'label_smtp_username', 'specific', 'USUARIO SMTP'),
(10616, 7, 'hint_smtp_username', 'specific', 'USUARIO SMTP'),
(10617, 7, 'label_smtp_password', 'specific', 'PASSWORD SMTP'),
(10618, 7, 'hint_smtp_password', 'specific', 'PASSWORD SMTP'),
(10619, 7, 'label_smtp_port', 'specific', 'PUERTO SMTP'),
(10620, 7, 'hint_smtp_port', 'specific', 'PUERTO SMTP'),
(10621, 7, 'label_ssl_tls', 'specific', 'SSL TLS'),
(10622, 7, 'hint_ssl_tls', 'specific', 'SSL TLS'),
(10623, 7, 'label_ftp_hostname', 'specific', 'NOMBRE HOST FTP'),
(10624, 7, 'label_ftp_username', 'specific', 'USUARIO FTP'),
(10625, 7, 'label_ftp_password', 'specific', 'PASSWORD FTP'),
(10626, 7, 'button_back', 'specific', 'ATRAS'),
(10627, 7, 'text_logo', 'specific', 'LOGO'),
(10628, 7, 'button_upload', 'specific', 'SUBIR'),
(10629, 7, 'text_favicon', 'specific', 'ICONO'),
(10630, 7, 'title_invoice', 'specific', 'FACTURA'),
(10631, 7, 'text_sell_list_title', 'specific', 'LISTA VENTA'),
(10632, 7, 'text_invoices', 'specific', 'FACTURAS'),
(10633, 7, 'title_cashbook', 'specific', 'LIBRO DE PAGOS'),
(10634, 7, 'text_cashbook_title', 'specific', 'LIBRO DE PAGOS'),
(10635, 7, 'text_cashbook_details_title', 'specific', 'DETALLES LIBRO DE PAGOS'),
(10636, 7, 'text_print', 'specific', 'IMPRIMIR'),
(10637, 7, 'label_opening_balance', 'specific', 'SALDO APERTURA'),
(10638, 7, 'title_income', 'specific', 'INGRESOS'),
(10639, 7, 'label_title', 'specific', 'TITULO'),
(10640, 7, 'title_expense', 'specific', 'GASTOS'),
(10641, 7, 'button_details', 'specific', 'DETALLES'),
(10642, 7, 'label_today_income', 'specific', 'INGRESO HOY'),
(10643, 7, 'label_total_income', 'specific', 'INGRESOS TOTALES'),
(10644, 7, 'label_today_expense', 'specific', 'GATOS HOY'),
(10645, 7, 'label_cash_in_hand', 'specific', 'DINERO EFECTIVO'),
(10646, 7, 'label_today_closing_balance', 'specific', 'SALDO FINAL HOY'),
(10647, 7, 'text_opening_balance_update_success', 'specific', 'ACTUALIZACION DE SALDO INICIAL EXITOSA'),
(10648, 7, 'title_pmethod', 'specific', 'METODO DE PAGO'),
(10649, 7, 'text_pmethod_title', 'specific', 'METODO DE PAGO'),
(10650, 7, 'text_new_pmethod_title', 'specific', 'NUEVO METODO DE PAGO'),
(10651, 7, 'label_details', 'specific', 'DETALLES'),
(10652, 7, 'text_in_active', 'specific', 'INACTIVO'),
(10653, 7, 'text_pmethod_list_title', 'specific', 'LISTA METODO PAGO'),
(10654, 7, 'title_unit', 'specific', 'UNIDAD'),
(10655, 7, 'text_unit_title', 'specific', 'UNIDAD'),
(10656, 7, 'text_new_unit_title', 'specific', 'NUEVA UNIDAD'),
(10657, 7, 'label_unit_name', 'specific', 'NOMBRE UNIDAD'),
(10658, 7, 'label_unit_details', 'specific', 'DETALLES UNIDAD'),
(10659, 7, 'text_unit_list_title', 'specific', 'LISTA UNIDAD'),
(10660, 7, 'title_filemanager', 'specific', 'ADMINISTRADOR ARCHIVOS'),
(10661, 7, 'label_product_name', 'specific', 'NOMBRE PRODUCTO'),
(10662, 7, 'title_bank_account_sheet', 'specific', 'HOJA CUENTA BANCARIA'),
(10663, 7, 'text_bank_account_sheet_title', 'specific', 'HOJA CUENTA BANCARIA'),
(10664, 7, 'text_bank_account_title', 'specific', ' CUENTA BANCARIA'),
(10665, 7, 'text_bank_account_sheet_list_title', 'specific', ' LISTA  HOJA CUENTA BANCARIA'),
(10666, 7, 'label_account_id', 'specific', 'ID CUENTA'),
(10667, 7, 'label_account_name', 'specific', 'NOMBRE CUENTA'),
(10668, 7, 'label_credit', 'specific', 'CREDITO'),
(10669, 7, 'label_debit', 'specific', 'DEBITO'),
(10670, 7, 'label_transfer_to_other', 'specific', 'TRASLADAR A OTRO'),
(10671, 7, 'label_transfer_from_other', 'specific', 'TRASLADAR DE OTRO'),
(10672, 7, 'label_deposit', 'specific', 'DEPOSITAR'),
(10673, 7, 'label_withdraw', 'specific', 'RETIRAR'),
(10674, 7, 'text_due', 'specific', 'PEND. PAGO'),
(10675, 7, 'title_purchase_return', 'specific', 'DEVOLUCION DE COMPRA'),
(10676, 7, 'text_purchase_return_title', 'specific', 'DEVOLUCION DE COMPRA'),
(10677, 7, 'text_return_list_title', 'specific', 'LISTA DEVOLUCION'),
(10678, 7, 'text_purchase_return_list_title', 'specific', 'LISTA DEVOLUCION COMPRA'),
(10679, 7, 'title_purchase_log', 'specific', 'BITACORA COMPRAS'),
(10680, 7, 'text_purchase_log_title', 'specific', 'REGISTROS COMPRA'),
(10681, 7, 'text_purchase_log_list_title', 'specific', 'LISTA REGISTROS COMPRA'),
(10682, 7, 'label_type', 'specific', 'TIPO'),
(10683, 7, 'label_pmethod', 'specific', 'METODO PAGO'),
(10684, 7, 'label_created_by', 'specific', 'CREADO POR'),
(10685, 7, 'title_quotation', 'specific', 'COTIZACION'),
(10686, 7, 'text_quotation_title', 'specific', 'COTIZACION'),
(10687, 7, 'text_new_quotation_title', 'specific', 'NUEVA COTIZACION'),
(10688, 7, 'text_sent', 'specific', 'ENVIADO'),
(10689, 7, 'text_complete', 'specific', 'COMPLETAR'),
(10690, 7, 'text_all_suppliers', 'specific', 'PROVEEDORES'),
(10691, 7, 'text_quotation_list_title', 'specific', 'LISTA COTIZACION'),
(10692, 7, 'button_all', 'specific', 'TODOS'),
(10693, 7, 'button_sent', 'specific', 'ENVIADO'),
(10694, 7, 'button_pending', 'specific', 'PENDIENTE'),
(10695, 7, 'button_complete', 'specific', 'COMPLETO'),
(10696, 7, 'label_biller', 'specific', 'FACTURADOR'),
(10697, 7, 'title_sell_log', 'specific', 'REGISTROS VENTA'),
(10698, 7, 'text_sell_log_title', 'specific', 'REGISTROS VENTA'),
(10699, 7, 'text_sell_title', 'specific', 'VENDER'),
(10700, 7, 'text_sell_log_list_title', 'specific', 'LISTA REGISTROS VENTAS'),
(10701, 7, 'title_giftcard_topup', 'specific', 'RECARGAR TARJETA REGALO'),
(10702, 7, 'text_giftcard_topup_title', 'specific', 'RECARGAR TARJETA REGALO'),
(10703, 7, 'text_giftcard_title', 'specific', ' TARJETA REGALO'),
(10704, 7, 'text_topup_title', 'specific', 'RECARGA'),
(10705, 7, 'text_giftcard_topup_list_title', 'specific', 'LISTA RECARGA'),
(10706, 7, 'error_order_title', 'specific', 'PEDIDO'),
(10707, 7, 'title_sell_return', 'specific', 'VENTAS DEVUELTAS'),
(10708, 7, 'text_sell_return_title', 'specific', 'VENTAS DEVUELTAS'),
(10709, 7, 'text_sell_return_list_title', 'specific', 'LISTA VENTAS DEVUELTAS'),
(10710, 7, 'label_ref_invoice_Id', 'specific', 'ID FACTURA REFERENCIA'),
(10711, 7, 'label_pmethod_name', 'specific', 'NOMBRE METODO PAGO'),
(10712, 7, 'title_barcode', 'specific', 'CODIGO BARRAS'),
(10713, 7, 'text_barcode_title', 'specific', 'CODIGO BARRAS'),
(10714, 7, 'text_barcode_generate_title', 'specific', 'GENERAR CODIGO BARRAS'),
(10715, 7, 'label_product_name_with_code', 'specific', 'NOMBRE PRODUCTO CON CODIGO'),
(10716, 7, 'label_page_layout', 'specific', 'DISEÑO PAGINA'),
(10717, 7, 'label_fields', 'specific', 'CAMPOS'),
(10718, 7, 'button_generate', 'specific', 'GENERAR'),
(10719, 7, 'text_category_title', 'specific', 'CATEGORIA'),
(10720, 7, 'text_new_category_title', 'specific', 'NOMBRE NUEVA CATEGORIA'),
(10721, 7, 'label_category_name', 'specific', 'NOMBRE CATEGORIA'),
(10722, 7, 'label_category_slug', 'specific', 'SLUG CATEGORIA'),
(10723, 7, 'label_parent', 'specific', 'PARENTESCO'),
(10724, 7, 'label_category_details', 'specific', 'DETALLES CATEGORIA'),
(10725, 7, 'text_category_list_title', 'specific', 'LISTA CATEGORIA'),
(10726, 7, 'label_total_item', 'specific', 'TOTAL ARTICULOS'),
(10727, 7, 'title_import_product', 'specific', 'IMPORTAR PRODUCTO'),
(10728, 7, 'text_import_title', 'specific', 'IMPORTAR'),
(10729, 7, 'text_download_sample_format_file', 'specific', 'DESCARGAR ARCHIVO FORMATO MUESTRA'),
(10730, 7, 'button_download', 'specific', 'DESCARGAR'),
(10731, 7, 'text_select_xls_file', 'specific', 'SELECCIONA ARCHIVO XLS '),
(10732, 7, 'button_import', 'specific', 'IMPORTAR'),
(10733, 7, 'title_create_store', 'specific', 'CREAR TIENDA'),
(10734, 7, 'text_create_store_title', 'specific', 'CREAR TIENDA'),
(10735, 7, 'text_stores', 'specific', 'TIENDAS'),
(10736, 7, 'text_currency', 'specific', 'MONEDA'),
(10737, 7, 'text_payment_method', 'specific', 'METODO PAGO'),
(10738, 7, 'text_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10739, 7, 'text_printer', 'specific', 'IMPRESORA'),
(10740, 7, 'label_stock_alert_quantity', 'specific', 'ALERTA CANTIDAD INVENTARIO'),
(10741, 7, 'hint_stock_alert_quantity', 'specific', 'ALERTA CANTIDAD INVENTARIO'),
(10742, 7, 'text_store_title', 'specific', 'TIENDA'),
(10743, 7, 'text_store_list_title', 'specific', 'LISTA TIENDAS'),
(10744, 7, 'button_activated', 'specific', 'ACTIVADA'),
(10745, 7, 'title_receipt_template', 'specific', 'PLANTILLA RECIBO'),
(10746, 7, 'text_receipt_tempalte_title', 'specific', 'PLANTILLA RECIBO'),
(10747, 7, 'title_pos_setting', 'specific', 'AJUSTES'),
(10748, 7, 'text_receipt_tempalte_sub_title', 'specific', 'PLANTILLA RECIBO'),
(10749, 7, 'button_preview', 'specific', 'VISTA PREVIA'),
(10750, 7, 'text_tempalte_content_title', 'specific', 'PLANTILLA CONTENIDO'),
(10751, 7, 'text_tempalte_css_title', 'specific', 'PLANTILLA  CSS'),
(10752, 7, 'text_template_tags', 'specific', 'PLANTILLA  ETIQUETAS'),
(10753, 7, 'text_brand_list_title', 'specific', 'TITULO LISTA MARCAS'),
(10754, 7, 'text_brand_title', 'specific', 'TITULO MARCAS'),
(10755, 7, 'text_new_brand_title', 'specific', 'NUEVO TITULO MARCAS'),
(10756, 7, 'label_total_product', 'specific', 'TOTAL PRODUCTO'),
(10757, 7, 'button_view_profile', 'specific', 'VER PERFIL'),
(10758, 7, 'title_currency', 'specific', 'MONEDA'),
(10759, 7, 'text_currency_title', 'specific', 'TITULO MONEDA'),
(10760, 7, 'text_new_currency_title', 'specific', 'NUEVO TITULO MONEDA'),
(10761, 7, 'label_code', 'specific', 'CODIGO'),
(10762, 7, 'hint_code', 'specific', 'CODIGO'),
(10763, 7, 'label_symbol_left', 'specific', 'SIMBOLO IZQUIERDO'),
(10764, 7, 'hint_symbol_left', 'specific', 'SIMBOLO IZQUIERDO'),
(10765, 7, 'label_symbol_right', 'specific', 'SIMBOLO DERECHO'),
(10766, 7, 'hint_symbol_right', 'specific', 'SIMBOLO DERECHO'),
(10767, 7, 'label_decimal_place', 'specific', 'LUGAR DECIMAL'),
(10768, 7, 'hint_decimal_place', 'specific', 'LUGAR DECIMAL'),
(10769, 7, 'text_currency_list_title', 'specific', 'TITULO LISTA MONEDA'),
(10770, 7, 'text_enabled', 'specific', 'HABILITADA'),
(10771, 7, 'button_activate', 'specific', 'ACTIVAR'),
(10772, 7, 'title_taxrate', 'specific', 'TASA IMPUESTO'),
(10773, 7, 'text_taxrate_title', 'specific', 'TITULO TASA IMPUESTO'),
(10774, 7, 'text_new_taxrate_title', 'specific', 'NUEVO TITULO TASA IMPUESTO'),
(10775, 7, 'label_taxrate_name', 'specific', 'NOMBRE TASA IMPUESTO'),
(10776, 7, 'label_taxrate', 'specific', 'TASA IMPUESTO'),
(10777, 7, 'text_taxrate_list_title', 'specific', 'LISTA IMPUESTOS'),
(10778, 7, 'title_box', 'specific', 'CAJA'),
(10779, 7, 'text_box_title', 'specific', 'TITULO CAJA'),
(10780, 7, 'label_box_name', 'specific', 'NOMBRE CAJA'),
(10781, 7, 'label_box_details', 'specific', 'DETALLES CAJA'),
(10782, 7, 'text_box_list_title', 'specific', 'TITULO LISTA CAJAS'),
(10783, 7, 'title_printer', 'specific', 'IMPRESORA'),
(10784, 7, 'text_printer_title', 'specific', 'TITULO IMPRESORA'),
(10785, 7, 'text_new_printer_title', 'specific', 'NUEVA IMPRESORA'),
(10786, 7, 'label_char_per_line', 'specific', 'CARACTER POR LINEA'),
(10787, 7, 'label_path', 'specific', 'DIRECCION'),
(10788, 7, 'label_ip_address', 'specific', 'DIRECCION IP'),
(10789, 7, 'label_port', 'specific', 'PUERTO'),
(10790, 7, 'text_printer_list_title', 'specific', 'TITULO LISTA IMPRESORAS'),
(10791, 7, 'title_user', 'specific', 'USUARIO'),
(10792, 7, 'text_user_title', 'specific', 'TITULO USUARIO'),
(10793, 7, 'text_new_user_title', 'specific', 'NUEVO TITULO USUARIO'),
(10794, 7, 'label_password', 'specific', 'CONTRASEÑA'),
(10795, 7, 'label_password_retype', 'specific', 'REPETIR CONTRASEÑA'),
(10796, 7, 'label_group', 'specific', 'GRUPO'),
(10797, 7, 'hint_group', 'specific', 'GRUPO'),
(10798, 7, 'text_user_list_title', 'specific', 'LISTA USUARIO'),
(10799, 7, 'label_profile', 'specific', 'PERFIL'),
(10800, 7, 'title_user_group', 'specific', 'PERFILES DE USUARIO'),
(10801, 7, 'text_group_title', 'specific', 'PERFILES'),
(10802, 7, 'text_new_group_title', 'specific', 'NUEVO PERFIL'),
(10803, 7, 'label_slug', 'specific', 'SLUG'),
(10804, 7, 'text_group_list_title', 'specific', 'LISTA PERFILES'),
(10805, 7, 'label_total_user', 'specific', 'TOTAL USUARIO'),
(10806, 7, 'title_password', 'specific', 'CONTRASEÑA'),
(10807, 7, 'text_password_title', 'specific', 'CONTRASEÑA'),
(10808, 7, 'text_password_box_title', 'specific', 'CONTRASEÑA'),
(10809, 7, 'label_password_user', 'specific', 'CONTRASEÑA DE USUARIO'),
(10810, 7, 'label_password_new', 'specific', 'NUEVA CONTRASEÑA'),
(10811, 7, 'label_password_confirm', 'specific', 'CONFIRMAR CONTRASEÑA'),
(10812, 7, 'title_send_sms', 'specific', 'ENVIAR SMS'),
(10813, 7, 'text_sms_title', 'specific', 'TITULO  SMS'),
(10814, 7, 'text_send_sms', 'specific', 'ENVIAR SMS'),
(10815, 7, 'text_send_sms_title', 'specific', 'ENVIAR TITULO  SMS'),
(10816, 7, 'text_single', 'specific', 'INDIVIDUAL'),
(10817, 7, 'text_group', 'specific', 'GRUPO'),
(10818, 7, 'label_phone_number', 'specific', 'NUMERO CELULAR'),
(10819, 7, 'label_message', 'specific', 'MENSAJE'),
(10820, 7, 'button_send', 'specific', 'ENVIAR'),
(10821, 7, 'label_people_type', 'specific', 'TIPO PERSONA'),
(10822, 7, 'text_all_customer', 'specific', 'TODOS LOS CLIENTES'),
(10823, 7, 'text_all_user', 'specific', 'TODOS LOS USUARIOS'),
(10824, 7, 'label_people', 'specific', 'PERSONA'),
(10825, 7, 'title_sms_report', 'specific', 'INFORME SMS'),
(10826, 7, 'text_sms_report_title', 'specific', 'REPORTE SMS'),
(10827, 7, 'text_sms_history_title', 'specific', 'HISTORIAL SMS'),
(10828, 7, 'text_all', 'specific', 'TODOS'),
(10829, 7, 'button_delivered', 'specific', 'ENTREGADO'),
(10830, 7, 'button_failed', 'specific', 'HA FALLADO'),
(10831, 7, 'label_schedule_at', 'specific', 'PROGRAMAR A LAS'),
(10832, 7, 'label_campaign_name', 'specific', 'NOMBRE CAMPAÑA'),
(10833, 7, 'label_people_name', 'specific', 'NOMBRE PERSONA'),
(10834, 7, 'label_mobile_number', 'specific', 'NUMERO CELULAR'),
(10835, 7, 'label_process_status', 'specific', 'ESTADO PROCESO'),
(10836, 7, 'label_response_text', 'specific', 'TEXTO RESPUESTA'),
(10837, 7, 'label_delivered', 'specific', 'ENTREGADA'),
(10838, 7, 'label_resend', 'specific', 'REENVIAR'),
(10839, 7, 'title_sms_setting', 'specific', 'AJUSTES SMS'),
(10840, 7, 'text_sms_setting_title', 'specific', 'AJUSTES SMS'),
(10841, 7, 'text_sms_setting', 'specific', 'AJUSTES SMS'),
(10842, 7, 'text_clickatell', 'specific', 'clickatell'),
(10843, 7, 'text_twilio', 'specific', 'twilio'),
(10844, 7, 'text_msg91', 'specific', 'msg91'),
(10845, 7, 'text_mimsms', 'specific', 'mimsms'),
(10846, 7, 'text_onnorokomsms', 'specific', 'onnorokomsms'),
(10847, 7, 'label_username', 'specific', 'USUARIO'),
(10848, 7, 'label_api_key', 'specific', 'API KEY'),
(10849, 7, 'label_sender_id', 'specific', 'ID REMITENTE'),
(10850, 7, 'label_auth_key', 'specific', 'CLAVE AUTENTIFICACION'),
(10851, 7, 'label_contact', 'specific', 'CONTACTO'),
(10852, 7, 'label_country_code', 'specific', 'CODIGO PAIS'),
(10853, 7, 'label_api_token', 'specific', 'API TOKEN'),
(10854, 7, 'label_maskname', 'specific', 'NOMBRE MASCARA'),
(10855, 7, 'label_optional', 'specific', 'OPCIONAL'),
(10856, 7, 'label_campaignname', 'specific', 'NOMBRE CAMPAÑA'),
(10857, 7, 'title_analytics', 'specific', 'ANALITICA'),
(10858, 7, 'text_analytics_title', 'specific', 'ANALITICA'),
(10859, 7, 'text_top_products', 'specific', 'MEJORES PRODUCTOS'),
(10860, 7, 'text_top_customers', 'specific', 'MEJORES CLIENTES'),
(10861, 7, 'text_top_suppliers', 'specific', 'MEJORES PROVEEDORES'),
(10862, 7, 'text_top_brands', 'specific', 'MEJORES MARCAS'),
(10863, 7, 'title_customer_analytics', 'specific', 'ANALISIS DE CLIENTES'),
(10864, 7, 'text_birthday_today', 'specific', 'CUMPLEAÑOS HOY'),
(10865, 7, 'text_birthday_coming', 'specific', 'FIESTA CUMPLEAÑOS'),
(10866, 7, 'label_member_since', 'specific', 'MIEMBRO DESDE'),
(10867, 7, 'text_not_found', 'specific', 'NO ENCONTRADO'),
(10868, 7, 'text_best_customer', 'specific', 'MEJOR CLIENTE'),
(10869, 7, 'text_purchase', 'specific', 'COMPRA'),
(10870, 7, 'title_login_logs', 'specific', 'REGISTROS LOGIN'),
(10871, 7, 'label_ip', 'specific', 'IP'),
(10872, 7, 'label_logged_in', 'specific', 'CONECTADO'),
(10873, 7, 'title_overview', 'specific', 'VISION GENERAL'),
(10874, 7, 'text_overview_title', 'specific', 'VISION GENERAL'),
(10875, 7, 'text_sell_overview', 'specific', 'RESUMEN VENTAS'),
(10876, 7, 'text_purchase_overview', 'specific', 'RESUMEN COMPRAS'),
(10877, 7, 'text_title_sells_overview', 'specific', 'RESUMEN VENTAS'),
(10878, 7, 'text_invoice_amount', 'specific', 'IMPORTE FACTURA'),
(10879, 7, 'text_discount_amount', 'specific', 'IMPORTE DESCUENTO'),
(10880, 7, 'text_due_collection', 'specific', 'COBRO PEND. PAGAR'),
(10881, 7, 'text_shipping_charge', 'specific', 'COSTO ENVIO'),
(10882, 7, 'text_others_charge', 'specific', 'OTROS COBROS'),
(10883, 7, 'text_order_tax', 'specific', 'ORDEN IMPUESTOS'),
(10884, 7, 'text_item_tax', 'specific', 'ORDEN IMPUESTOS'),
(10885, 7, 'text_total_tax', 'specific', 'TOTAL IMPUESTOS'),
(10886, 7, 'text_title_purchase_overview', 'specific', 'RESUMEN COMPRA'),
(10887, 7, 'text_purchase_amount', 'specific', 'MONTO COMPRA'),
(10888, 7, 'text_due_taken', 'specific', 'PEND. PAGO'),
(10889, 7, 'text_due_paid', 'specific', 'DEUDA PAGADA'),
(10890, 7, 'text_total_paid', 'specific', 'TOTAL PAGADO'),
(10891, 7, 'text_return_amount', 'specific', 'IMPORTE DEVOLUCION'),
(10892, 7, 'title_collection_report', 'specific', 'INFORME RECOLECCION'),
(10893, 7, 'text_collection_report_title', 'specific', 'INFORME RECOLECCION'),
(10894, 7, 'text_collection_report', 'specific', 'INFORME RECOLECCION'),
(10895, 7, 'label_total_inv', 'specific', 'TOTAL INV'),
(10896, 7, 'label_net_amount', 'specific', 'IMPORTE NETO'),
(10897, 7, 'label_prev_due_collection', 'specific', 'RECOLECCIÓN PAGOS PEND.'),
(10898, 7, 'label_due_collection', 'specific', 'RECOLECCIÓN PAGOS PEND.'),
(10899, 7, 'label_due_given', 'specific', 'PEND. PAGO'),
(10900, 7, 'label_received', 'specific', 'RECIBIDA'),
(10901, 7, 'title_due_collection', 'specific', 'RECOLECCIÓN PAGOS PEND.'),
(10902, 7, 'text_due_collection_title', 'specific', 'RECOLECCIÓN PAGOS PEND.'),
(10903, 7, 'text_due_collection_sub_title', 'specific', 'RECOLECCIÓN PAGOS PEND.'),
(10904, 7, 'title_supplier_due_paid', 'specific', 'DEUDAS PAGADA PROVEEDOR'),
(10905, 7, 'text_supplier_due_paid_title', 'specific', 'DEUDAS PAGADAS PROVEEDOR'),
(10906, 7, 'text_supplier_due_paid_sub_title', 'specific', 'DEUDAS PAGADAS PROVEEDOR'),
(10907, 7, 'title_sell_report', 'specific', 'INFORME VENTA'),
(10908, 7, 'text_selling_report_title', 'specific', 'INFORME VENTA'),
(10909, 7, 'text_selling_report_sub_title', 'specific', 'SUB TITULO INFORME VENTA'),
(10910, 7, 'button_itemwise', 'specific', 'ARTICULO '),
(10911, 7, 'button_categorywise', 'specific', 'CATEGORIA'),
(10912, 7, 'button_supplierwise', 'specific', 'PROVEEDOR'),
(10913, 7, 'title_loan', 'specific', 'PRESTAMO'),
(10914, 7, 'text_loan_title', 'specific', 'PRESTAMO'),
(10915, 7, 'text_take_loan_title', 'specific', 'TITULO PRESTAMO'),
(10916, 7, 'label_loan_from', 'specific', 'PRESTAMO DE'),
(10917, 7, 'label_ref_no', 'specific', 'NRO REF'),
(10918, 7, 'label_interest', 'specific', 'INTERESAR'),
(10919, 7, 'label_payable', 'specific', 'A PAGAR'),
(10920, 7, 'label_loan_for', 'specific', 'PRESTAMO PARA'),
(10921, 7, 'text_loan_list_title', 'specific', 'LISTA PRESTAMO PARA'),
(10922, 7, 'button_paid', 'specific', 'PAGADA'),
(10923, 7, 'button_due', 'specific', 'PEND. PAGO'),
(10924, 7, 'label_basic_amount', 'specific', 'CANTIDAD BASICA'),
(10925, 7, 'label_paid', 'specific', 'PAGADA'),
(10926, 7, 'title_loan_summary', 'specific', 'RESUMEN PRESTAMO'),
(10927, 7, 'text_loan_summary_title', 'specific', 'RESUMEN PRESTAMO'),
(10928, 7, 'text_summary_title', 'specific', 'RESUMEN'),
(10929, 7, 'text_total_loan', 'specific', 'TOTAL PRESTAMO'),
(10930, 7, 'text_total_due', 'specific', 'TOTAL PEND. PAGO'),
(10931, 7, 'text_recent_payments', 'specific', 'PAGOS RECIENTES'),
(10932, 7, 'text_expense_title', 'specific', 'GASTOS'),
(10933, 7, 'text_new_expense_title', 'specific', 'NUEVO GASTOS'),
(10934, 7, 'label_what_for', 'specific', 'PARA QUE'),
(10935, 7, 'label_returnable', 'specific', 'RETORNABLE'),
(10936, 7, 'label_notes', 'specific', 'NOTAS'),
(10937, 7, 'text_expense_list_title', 'specific', 'LISTA GASTOS'),
(10938, 7, 'title_expense_category', 'specific', 'CATEGORIA GASTOS'),
(10939, 7, 'text_expense_category_title', 'specific', 'CATEGORIA GASTOS'),
(10940, 7, 'text_new_expense_category_title', 'specific', 'NUEVO CATEGORIA GASTOS'),
(10941, 7, 'title_expense_monthwise', 'specific', 'GASTO MENSUAL'),
(10942, 7, 'text_expense_monthwise_title', 'specific', 'GASTO MENSUAL'),
(10943, 7, 'label_summary', 'specific', 'RESUMEN'),
(10944, 7, 'label_grand_total', 'specific', 'GRAN TOTAL'),
(10945, 7, 'label_this_week', 'specific', 'ESTA SEMANA'),
(10946, 7, 'label_this_month', 'specific', 'ESTE MES'),
(10947, 7, 'label_this_year', 'specific', 'ESTE AÑO'),
(10948, 7, 'label_income_source', 'specific', 'FUENTE INGRESOS'),
(10949, 7, 'label_account', 'specific', 'CUENTA'),
(10950, 7, 'label_about', 'specific', 'ACERCA DE'),
(10951, 7, 'label_capital', 'specific', 'CAPITAL'),
(10952, 7, 'button_deposit_now', 'specific', 'DEPOSITAR AHORA'),
(10953, 7, 'label_exp_category', 'specific', 'CATEGORIA EXP'),
(10954, 7, 'button_withdraw_now', 'specific', 'RETIRAR AHORA'),
(10955, 7, 'title_bank_transactions', 'specific', 'TRANSACCIONES BANCARIAS'),
(10956, 7, 'text_bank_transaction_title', 'specific', 'TRANSACCION BANCARIA'),
(10957, 7, 'text_bank_transaction_list_title', 'specific', 'LISTA TRANSACCION BANCARIA'),
(10958, 7, 'button_filtering', 'specific', 'FILTRACION'),
(10959, 7, 'text_view_all_transactions', 'specific', 'VER TODAS LAS TRANSACCIONES '),
(10960, 7, 'button_transfer_now', 'specific', 'TRASLADAR AHORA'),
(10961, 7, 'title_bank_transfer', 'specific', 'TRANSFERENCIA BANCARIA'),
(10962, 7, 'text_bank_transfer_title', 'specific', 'TRANSFERENCIA BANCARIA'),
(10963, 7, 'text_banking_title', 'specific', 'BANCARIA'),
(10964, 7, 'text_list_bank_transfer_title', 'specific', 'LISTA TRANSFERENCIA BANCARIA'),
(10965, 7, 'label_from_account', 'specific', 'DE LA CUENTA'),
(10966, 7, 'label_to_account', 'specific', 'A LA CUENTA'),
(10967, 7, 'title_bank_account', 'specific', 'CUENTA BANCARIA'),
(10968, 7, 'text_new_bank_account_title', 'specific', 'NUEVA CUENTA BANCARIA'),
(10969, 7, 'label_account_details', 'specific', 'DETALLES CUENTA '),
(10970, 7, 'label_account_no', 'specific', 'NRO CUENTA'),
(10971, 7, 'label_contact_person', 'specific', 'PERSONA CONTACTO'),
(10972, 7, 'label_internal_banking_url', 'specific', 'URL BANCA INTERNA'),
(10973, 7, 'text_bank_account_list_title', 'specific', 'LISTA  CUENTA BANCARIA'),
(10974, 7, 'label_account_description', 'specific', 'DESCRIPCION CUENTA '),
(10975, 7, 'title_income_source', 'specific', 'FUENTE INGRESOS'),
(10976, 7, 'text_income_source_title', 'specific', 'FUENTE INGRESOS'),
(10977, 7, 'text_new_income_source_title', 'specific', 'NUEVA FUENTE INGRESOS'),
(10978, 7, 'label_source_name', 'specific', 'NOMBRE FUENTE'),
(10979, 7, 'label_source_slug', 'specific', 'SLUG FUENTE'),
(10980, 7, 'label_source_details', 'specific', 'DETALLES FUENTE'),
(10981, 7, 'text_income_source_sub_title', 'specific', 'SUB FUENTE INGRESOS'),
(10982, 7, 'title_income_monthwise', 'specific', 'INGRESO MENSUAL'),
(10983, 7, 'text_income_monthwise_title', 'specific', 'INGRESO MENSUAL'),
(10984, 7, 'label_profit', 'specific', 'GANANCIA'),
(10985, 7, 'title_income_and_expense', 'specific', 'INGRESOS Y GASTOS'),
(10986, 7, 'text_income_and_expense_title', 'specific', 'INGRESOS Y GASTOS'),
(10987, 7, 'text_date', 'specific', 'FECHA'),
(10988, 7, 'label_till_now', 'specific', 'HASTA AHORA'),
(10989, 7, 'title_profit_and_loss', 'specific', 'GANANCIA Y PERDIDA'),
(10990, 7, 'text_profit_and_loss_title', 'specific', 'GANANCIA Y PERDIDA'),
(10991, 7, 'text_profit_and_loss_details_title', 'specific', 'DETALLES GANANCIA Y PERDIDA'),
(10992, 7, 'text_loss_title', 'specific', 'PERDIDA'),
(10993, 7, 'text_profit_title', 'specific', 'GANANCIA '),
(10994, 7, 'title_profit', 'specific', 'GANANCIA '),
(10995, 7, 'label_total_profit', 'specific', 'TOTAL GANANCIA '),
(10996, 7, 'label_total_loss', 'specific', 'TOTAL PERDIDA'),
(10997, 7, 'label_net_profit', 'specific', 'BENEFICIO NETO'),
(10998, 7, 'text_supplier_list_title', 'specific', 'LISTA PROVEEDORES'),
(10999, 7, 'text_supplier_title', 'specific', 'PROVEEDORES'),
(11000, 7, 'text_new_supplier_title', 'specific', 'NUEVO PROVEEDOR'),
(11001, 7, 'text_customer_list_title', 'specific', 'LISTA CLIENTE'),
(11002, 7, 'text_customer_title', 'specific', 'CLIENTE'),
(11003, 7, 'text_new_customer_title', 'specific', 'NUEVO CLIENTE'),
(11004, 7, 'label_sell', 'specific', 'VENDER'),
(11005, 7, 'button_sell', 'specific', 'VENDER'),
(11006, 7, 'title_transfer', 'specific', 'TRASLADAR'),
(11007, 7, 'text_stock_transfer_title', 'specific', 'TRASLADO STOCK'),
(11008, 7, 'text_transfer_title', 'specific', 'TRASLADO'),
(11009, 7, 'text_add_transfer_title', 'specific', 'AGREGAR TRASLADO'),
(11010, 7, 'text_stock_list', 'specific', 'LISTA STOCK'),
(11011, 7, 'text_invoice_id', 'specific', 'ID FACTURA'),
(11012, 7, 'text_stock', 'specific', 'STOCK'),
(11013, 7, 'text_transfer_list', 'specific', 'LISTA TRASLADOS'),
(11014, 7, 'label_item_name', 'specific', 'NOMBRE ARTICULO'),
(11015, 7, 'label_transfer_qty', 'specific', 'CANTIDAD A TRASLADAR'),
(11016, 7, 'text_list__transfer__title', 'specific', 'LISTA TRASLADOS'),
(11017, 7, 'label_from_store', 'specific', 'DE LA TIENDA'),
(11018, 7, 'label_to_store', 'specific', 'A LA TIENDA'),
(11019, 7, 'label_total_quantity', 'specific', 'TOTAL CANTIDAD'),
(11020, 7, 'title_receive', 'specific', 'RECIBIR'),
(11021, 7, 'text_stock_receive_title', 'specific', 'RECIBIR STOCK'),
(11022, 7, 'text_receive_title', 'specific', 'RECIBIR '),
(11023, 7, 'text_list__receive__title', 'specific', 'LISTA RECIBIR'),
(11024, 7, 'title_installment', 'specific', 'ENTREGA'),
(11025, 7, 'text_installment_title', 'specific', 'ENTREGA'),
(11026, 7, 'text_installment_sub_title', 'specific', 'SUB PLAZOS'),
(11027, 7, 'button_all_installment', 'specific', 'TODA LA ENTREGA'),
(11028, 7, 'button_due_installment', 'specific', 'PEND. PAGO INSTALACIONES'),
(11029, 7, 'button_paid_installment', 'specific', 'PAGO ENTREGA'),
(11030, 7, 'label_total_ins', 'specific', 'TOTAL ENTREGA'),
(11031, 7, 'title_installment_payment', 'specific', 'PAGO ENTREGA'),
(11032, 7, 'text_installment_payment_title', 'specific', 'PAGO ENTREGA'),
(11033, 7, 'text_installment', 'specific', 'ENTREGA'),
(11034, 7, 'text_installment_payment_list_title', 'specific', 'LISTA PAGO ENTREGA'),
(11035, 7, 'text_all_payment', 'specific', 'TODOS LOS PAGOS'),
(11036, 7, 'button_all_payment', 'specific', 'TODOS LOS PAGOS'),
(11037, 7, 'button_todays_due_payment', 'specific', 'PAGO VENCIDO HOY'),
(11038, 7, 'button_all_due_payment', 'specific', 'TODAS LAS DEUDAS PAGADAS'),
(11039, 7, 'button_expired_due_payment', 'specific', 'DEUDAS PAGADAS EXPERIDAS'),
(11040, 7, 'label_payment_date', 'specific', 'FECHA PAGO'),
(11041, 7, 'button_payment', 'specific', 'PAGO'),
(11042, 7, 'text_todays_due_payment', 'specific', 'PAGOS DEUDAS HOY'),
(11043, 7, 'text_all_due_payment', 'specific', 'TOTAL PAGOS DEUDAS'),
(11044, 7, 'text_expired_due_payment', 'specific', 'PAGOS DEUDAS EXPIRADOS'),
(11045, 7, 'title_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(11046, 7, 'text_installment_overview_title', 'specific', 'RESUMEN ENTREGA'),
(11047, 7, 'text_installment_overview', 'specific', 'RESUMEN ENTREGA'),
(11048, 7, 'text_invoice_count', 'specific', 'CUENTA FACTURA'),
(11049, 7, 'text_sell_amount', 'specific', 'CANTIDAD VENTA'),
(11050, 7, 'text_interest_amount', 'specific', 'CANTIDAD INTERES'),
(11051, 7, 'text_amount_received', 'specific', 'CANTIDAD  RECIBIDA'),
(11052, 7, 'text_amount_due', 'specific', 'CANTIDAD  DEUDA'),
(11053, 7, 'title_giftcard', 'specific', 'TARJETA DE REGALO'),
(11054, 7, 'text_new_giftcard_title', 'specific', 'NUEVA TARJETA DE REGALO'),
(11055, 7, 'text_giftcard_list_title', 'specific', 'LISTA TARJETA DE REGALO'),
(11056, 7, 'label_expiry', 'specific', 'EXPIRACION'),
(11057, 7, 'label_topup', 'specific', 'REPOSICION'),
(11058, 7, 'title_purchase_report', 'specific', 'INFORME COMPRA'),
(11059, 7, 'text_purchase_report_title', 'specific', 'INFORME COMPRA'),
(11060, 7, 'text_purchase_report_sub_title', 'specific', 'SUB INFORME COMPRA'),
(11061, 7, 'title_backup_restore', 'specific', 'RESTAURAR BACKUP'),
(11062, 7, 'text_backup_restore_title', 'specific', 'RESTAURAR BACKUP'),
(11063, 7, 'text_backup', 'specific', 'BACKUP'),
(11064, 7, 'text_restore', 'specific', 'RESTAURAR '),
(11065, 7, 'label_databases', 'specific', 'BASE DE DATOS'),
(11066, 7, 'label_select_all', 'specific', 'SELECCIONAR TODO'),
(11067, 7, 'label_unselect_all', 'specific', 'DESELECCIONAR TODO'),
(11068, 7, 'button_export', 'specific', 'EXPORTAR'),
(11069, 7, 'label_progress', 'specific', 'PROGRESO'),
(11070, 7, 'button_select_sql_file', 'specific', 'SELECCIONAR ARCHIVO SQL'),
(11071, 7, 'text_male', 'specific', 'MASCULINO'),
(11072, 7, 'text_female', 'specific', 'FEMENINO'),
(11073, 7, 'title_tax_overview_report', 'specific', 'INFORME GENERAL IMPUESTO'),
(11074, 7, 'text_tax_overview_report_title', 'specific', 'INFORME GENERAL IMPUESTO'),
(11075, 7, 'text_sell_tax', 'specific', 'IMPUESTO VENTA'),
(11076, 7, 'text_purchase_tax', 'specific', 'IMPUESTO COMPRA'),
(11077, 7, 'label_tax_percent', 'specific', 'PORCENTAJE IMPUESTO '),
(11078, 7, 'label_count', 'specific', 'CONTAR'),
(11079, 7, 'text_login_title', 'specific', 'LOGIN'),
(11080, 7, 'title_user_profile', 'specific', 'USUARIOS'),
(11081, 7, 'text_profile_title', 'specific', 'PERFIL'),
(11082, 7, 'text_users', 'specific', 'USUARIOS'),
(11083, 7, 'text_since', 'specific', 'DESDE'),
(11084, 7, 'text_contact_information', 'specific', 'INFORMACIÓN DE CONTACTO'),
(11085, 7, 'label_collection', 'specific', 'RESUMEN'),
(11086, 7, 'text_sell_report', 'specific', 'VENTAS'),
(11087, 7, 'text_purchase_report', 'specific', 'COMPRAS'),
(11088, 7, 'text_payment_report', 'specific', NULL),
(11089, 7, 'text_login_log', 'specific', 'INICIAR SESIÓN'),
(11090, 7, 'button_collection_report', 'specific', 'REPORTE RESUMEN'),
(11091, 7, 'button_log', 'specific', 'REGISTRO'),
(11092, 7, 'text_invoice_list', 'specific', 'LISTA DE FACTURAS'),
(11093, 7, 'label_items', 'specific', NULL),
(11094, 7, 'label_time', 'specific', NULL),
(11095, 7, 'text_update_success', 'specific', 'Edición exitosa'),
(11096, 7, 'text_invoice_title', 'specific', 'FACTURA'),
(11097, 7, 'button_print', 'specific', 'Imprimir'),
(11098, 7, 'button_send_email', 'specific', NULL),
(11099, 7, 'button_back_to_pos', 'specific', 'Regresar a Ventas'),
(11100, 7, 'text_delete_success', 'specific', 'Eliminación exitosa'),
(11101, 7, 'label_source', 'specific', NULL),
(11102, 7, 'label_slip_no', 'specific', NULL),
(11103, 7, 'label_by', 'specific', NULL),
(11104, 7, 'error_active_or_sold', 'specific', NULL),
(11105, 7, 'label_gtin', 'specific', NULL),
(11106, 7, 'text_product_list', 'specific', 'LISTA DE PRODUCTOS'),
(11107, 7, 'label_sub_total', 'specific', NULL),
(11108, 7, 'label_purchase_note', 'specific', 'COMPRAS'),
(11109, 7, 'text_order_summary', 'specific', NULL),
(11110, 7, 'text_return_item', 'specific', NULL),
(11111, 7, 'label_return_quantity', 'specific', NULL),
(11112, 7, 'placeholder_type_any_note', 'specific', NULL),
(11113, 7, 'error_return_quantity_exceed', 'specific', NULL),
(11114, 7, 'error_select_at_least_one_item', 'specific', 'ERROR AL SELECCIONAR UN ITEM'),
(11115, 7, 'title_reset_your_system', 'specific', NULL),
(11116, 7, 'text_delete_title', 'specific', NULL),
(11117, 7, 'text_delete_instruction', 'specific', NULL),
(11118, 7, 'label_delete_the_product', 'specific', 'Eliminar Producto'),
(11119, 7, 'label_soft_delete_the_product', 'specific', 'Eliminar Producto'),
(11120, 7, 'text_delete', 'specific', NULL),
(11121, 1, 'error_username_or_password', 'specific', NULL),
(11122, 7, 'error_currency_code', 'specific', NULL),
(11123, 7, 'error_category_name', 'specific', NULL),
(11124, 7, 'text_barcode_print', 'specific', 'Imprimir Código'),
(11125, 7, 'error_product_name', 'specific', 'Error en Nombre de Producto'),
(11126, 7, 'text_stock_register', 'specific', 'REGISTRO STOCK'),
(11127, 7, 'text_chart', 'specific', 'GRÁFICO'),
(11128, 7, 'label_select', 'specific', 'SELECCIONAR / DESELECCIONAR'),
(11129, 7, 'label_sold', 'specific', NULL),
(11130, 7, 'text_payments', 'specific', NULL),
(11131, 7, 'text_return_success', 'specific', 'retorno exitoso'),
(11132, 7, 'text_returns', 'specific', NULL),
(11133, 7, 'label_sl', 'specific', NULL),
(11134, 7, 'label_returned_at', 'specific', 'Devuelto en'),
(11135, 7, 'label_change', 'specific', 'Modificar'),
(11136, 7, 'error_supplier_name', 'specific', 'Error en el nombre del proveedor.'),
(11137, 7, 'error_customer', 'specific', 'Ha habido un error en el proceso. Por favor intente nuevamente.'),
(11138, 7, 'text_quotation_create_success', 'specific', 'Creación exitosa.'),
(11139, 7, 'button_action', 'specific', 'Continuar'),
(11140, 7, 'button_create_sell', 'specific', 'Crear venta'),
(11141, 7, 'label_unit_price', 'specific', 'Precio unitario'),
(11142, 7, 'label_shipping', 'specific', 'Envío'),
(11143, 7, 'label_stamp_and_signature', 'specific', 'Firma y sello'),
(11144, 7, 'title_sell_tax_report', 'specific', 'Reporte impuesto IVA'),
(11145, 7, 'text_sell_tax_report_title', 'specific', 'Reporte Impuesto IVA'),
(11146, 7, 'text_product_tax_amount', 'specific', 'Monto impuesto de productos'),
(11147, 7, 'text_order_tax_amount', 'specific', 'Total impuestos'),
(11148, 7, 'text_tax_report_sub_title', 'specific', 'Impuestos'),
(11149, 7, 'label_total_amount', 'specific', 'Monto total'),
(11150, 7, 'title_stock_report', 'specific', 'Reporte de Inventario'),
(11151, 7, 'text_stock_report_title', 'specific', 'Reporte de Inventario'),
(11152, 7, 'text_stock_report', 'specific', 'REPORTE STOCK'),
(11153, 7, 'supplier_name', 'specific', 'PROVEEDOR'),
(11154, 7, 'error_reference_no', 'specific', NULL),
(11155, 7, 'error_sup_id', 'specific', NULL),
(11156, 7, 'label_previous_due_paid', 'specific', 'POR PAGAR'),
(11157, 7, 'label_customer_id', 'specific', NULL),
(11158, 7, 'label_returened_by', 'specific', NULL),
(11159, 7, 'text_return_products', 'specific', 'Devolución de productos'),
(11160, 7, 'error_quantity_exceed', 'specific', NULL),
(11161, 7, 'text_create_success', 'specific', 'Creación exitosa.'),
(11162, 7, 'text_meco', 'specific', NULL),
(11163, 7, 'text_unpaid', 'specific', 'ADEUDADO'),
(11164, 7, 'title_purchase_payment_report', 'specific', 'COMPRAS'),
(11165, 7, 'text_purchase_payment_report_title', 'specific', 'COMPRAS'),
(11166, 7, 'title_quotation_edit', 'specific', 'Cotizaciones'),
(11167, 7, 'text_quotation_edit_title', 'specific', 'Editar cotización'),
(11168, 7, 'text_quotation_update_success', 'specific', 'Edición de cotización exitosa'),
(11169, 7, 'error_insufficient_balance', 'specific', NULL),
(11170, 1, 'text_meco', 'specific', NULL),
(11173, 7, 'text_take_loan_success', 'specific', 'Transacción exitosa'),
(11174, 7, 'button_pay_now', 'specific', NULL),
(11175, 7, 'text_loan_paid_success', 'specific', 'PAGO EXITOSO'),
(11176, 7, 'title_customer_profile', 'specific', 'PERFIL DE CLIENTE'),
(11177, 7, 'text_total_purchase', 'specific', 'TOTAL COMPRA'),
(11178, 7, 'text_information', 'specific', NULL),
(11179, 7, 'label_mobile_phone', 'specific', NULL),
(11180, 7, 'label_giftcard_taken', 'specific', NULL),
(11181, 7, 'button_add_balance', 'specific', 'Agregar balance'),
(11182, 7, 'button_statement', 'specific', NULL),
(11183, 7, 'label_invoice_amount', 'specific', 'MONTO FACTURA'),
(11184, 7, 'label_prev_due', 'specific', 'REGRESAR'),
(11185, 7, 'button_view_details', 'specific', NULL),
(11186, 7, 'text_installment_details', 'specific', NULL),
(11187, 7, 'label_initial_payment', 'specific', NULL),
(11188, 7, 'label_interval_count', 'specific', NULL),
(11189, 7, 'label_installment_count', 'specific', NULL),
(11190, 7, 'label_last_installment_date', 'specific', 'INICIO INSTALACION'),
(11191, 7, 'label_installment_end_date', 'specific', 'FIN INSTALACIÓN'),
(11192, 7, 'text_update_installment_payment_success', 'specific', 'PAGO EXITOSO'),
(11193, 7, 'button_installment_payment', 'specific', NULL),
(11194, 7, 'title_sell_payment_report', 'specific', 'REPORTE PAGOS VENTAS'),
(11195, 7, 'text_sell_payment_report_title', 'specific', 'REPORTE PAGOS VENTAS'),
(11196, 7, 'text_soft_delete', 'specific', NULL),
(11197, 7, 'error_no_selected', 'specific', 'ERROR, NO SE HA SELEECIONADO NADA'),
(11198, 7, 'text_trash', 'specific', NULL),
(11199, 7, 'button_restore_all', 'specific', NULL),
(11200, 7, 'label_insert_content_to', 'specific', NULL),
(11201, 7, 'error_new_category_name', 'specific', NULL),
(11202, 7, 'label_insert_content_into', 'specific', NULL),
(11203, 7, 'error_customer_sex', 'specific', NULL),
(11204, 7, 'error_email_exist', 'specific', NULL),
(11205, 7, 'text_all_invoice', 'specific', 'TODAS LAS FACTURAS'),
(11206, 7, 'store_code store1 is not valid!', 'specific', NULL),
(11207, 7, 'text_all_due', 'specific', 'PEND. PAGAR'),
(11208, 7, 'error_unit_name', 'specific', NULL),
(11209, 7, 'title_supplier_profile', 'specific', 'NOMBRE PROVEEDOR'),
(11210, 7, 'text_supplier_profile_title', 'specific', 'PERFIL PROVEEDOR'),
(11211, 7, 'text_supplier_products', 'specific', 'PRODUCTOS PROVEEDOR'),
(11212, 7, 'button_products', 'specific', 'Productos'),
(11213, 7, 'text_balance', 'specific', NULL),
(11214, 7, 'text_sells', 'specific', 'VENTAS'),
(11215, 7, 'button_transaction_list', 'specific', NULL),
(11216, 7, 'text_purchase_invoice_list', 'specific', 'LISTA DE FACTURAS COMPRAS'),
(11217, 7, 'button_all_purchase', 'specific', 'TODAS LAS COMPRAS');
INSERT INTO `language_translations` (`id`, `lang_id`, `lang_key`, `key_type`, `lang_value`) VALUES
(11218, 7, 'button_due_purchase', 'specific', 'COMPRAS PENDIENTES DE PAGO'),
(11219, 7, 'button_paid_purchase', 'specific', 'PAGAR COMPRA'),
(11220, 7, 'button_stock_transfer', 'specific', 'TRASLADAR STOCK'),
(11221, 7, 'text_selling_invoice_list', 'specific', 'LISTA DE FACTURAS DE VENTAS'),
(11222, 7, 'label_sup_name', 'specific', NULL),
(11223, 1, 'error_access_permission', 'specific', NULL),
(11224, 7, 'error_customer_name', 'specific', NULL),
(11225, 7, 'error_cashier_name', 'specific', NULL),
(11226, 7, 'error_currency', 'specific', NULL),
(11227, 7, 'error_customer_email_or_mobile', 'specific', NULL),
(11228, 7, 'label_customer_mobile', 'specific', NULL),
(11229, 7, 'label_invoice_note', 'specific', 'NOTA DE FACTURA'),
(11230, 7, 'text_template_content_update_success', 'specific', 'ACTUALIZACIÓN EXITOSA'),
(11231, 1, 'error_user_not_found', 'specific', NULL),
(11232, 1, 'error_username', 'specific', NULL),
(11233, 7, 'error_invoice_product_quantity', 'specific', 'CANTIDAD'),
(11234, 7, 'text_success_sms_sent', 'specific', 'Mensaje enviado con éxito'),
(11235, 7, 'text_permission', 'specific', NULL),
(11236, 7, 'label_failed', 'specific', NULL),
(11284, 7, 'title_brand_profile', 'specific', 'PERFIL DE MARCA'),
(11285, 7, 'text_brand_profile_title', 'specific', 'PERFIL DE MARCA'),
(11286, 7, 'text_brands', 'specific', NULL),
(11287, 7, 'text_brand_products', 'specific', 'Productos por marca'),
(11288, 7, 'button_all_products', 'specific', 'TODOS LOS PRODUCTOS'),
(11289, 7, 'text_total_sell', 'specific', 'TOTAL VENDIDO'),
(11290, 7, 'label_brand_name', 'specific', NULL),
(11291, 7, 'error_currency_decimal_place', 'specific', NULL),
(11292, 7, 'text_expiry', 'specific', NULL),
(11293, 7, 'error_out_of_stock', 'specific', 'ERROR: SIN STOCK'),
(11747, 8, 'title_backup_restore', 'specific', NULL),
(11748, 8, 'text_english', 'specific', NULL),
(11749, 8, 'text_arabic', 'specific', NULL),
(11750, 8, 'text_bangla', 'specific', NULL),
(11751, 8, 'text_hindi', 'specific', NULL),
(11752, 8, 'text_french', 'specific', NULL),
(11753, 8, 'text_Germany', 'specific', NULL),
(11754, 8, 'text_spanish', 'specific', NULL),
(11755, 8, 'text_meco', 'specific', NULL),
(11756, 8, 'text_pos', 'specific', NULL),
(11757, 8, 'menu_pos', 'specific', NULL),
(11758, 8, 'text_cashbook_report', 'specific', NULL),
(11759, 8, 'menu_cashbook', 'specific', NULL),
(11760, 8, 'text_invoice', 'specific', NULL),
(11761, 8, 'menu_invoice', 'specific', NULL),
(11762, 8, 'text_user_preference', 'specific', NULL),
(11763, 8, 'text_settings', 'specific', NULL),
(11764, 8, 'text_stock_alert', 'specific', NULL),
(11765, 8, 'text_fullscreen', 'specific', NULL),
(11766, 8, 'text_reports', 'specific', NULL),
(11767, 8, 'text_lockscreen', 'specific', NULL),
(11768, 8, 'text_logout', 'specific', NULL),
(11769, 8, 'menu_dashboard', 'specific', NULL),
(11770, 8, 'menu_point_of_sell', 'specific', NULL),
(11771, 8, 'menu_sell', 'specific', NULL),
(11772, 8, 'menu_sell_list', 'specific', NULL),
(11773, 8, 'menu_return_list', 'specific', NULL),
(11774, 8, 'menu_sell_log', 'specific', NULL),
(11775, 8, 'menu_giftcard', 'specific', NULL),
(11776, 8, 'menu_add_giftcard', 'specific', NULL),
(11777, 8, 'menu_giftcard_list', 'specific', NULL),
(11778, 8, 'menu_giftcard_topup', 'specific', NULL),
(11779, 8, 'menu_quotation', 'specific', NULL),
(11780, 8, 'menu_add_quotation', 'specific', NULL),
(11781, 8, 'menu_quotation_list', 'specific', NULL),
(11782, 8, 'menu_installment', 'specific', NULL),
(11783, 8, 'menu_installment_list', 'specific', NULL),
(11784, 8, 'menu_payment_list', 'specific', NULL),
(11785, 8, 'menu_payment_due_today', 'specific', NULL),
(11786, 8, 'menu_payment_due_all', 'specific', NULL),
(11787, 8, 'menu_payment_due_expired', 'specific', NULL),
(11788, 8, 'menu_overview_report', 'specific', NULL),
(11789, 8, 'menu_purchase', 'specific', NULL),
(11790, 8, 'menu_add_purchase', 'specific', NULL),
(11791, 8, 'menu_purchase_list', 'specific', NULL),
(11792, 8, 'menu_due_invoice', 'specific', NULL),
(11793, 8, 'menu_purchase_logs', 'specific', NULL),
(11794, 8, 'menu_transfer', 'specific', NULL),
(11795, 8, 'menu_add_transfer', 'specific', NULL),
(11796, 8, 'menu_transfer_list', 'specific', NULL),
(11797, 8, 'menu_receive_list', 'specific', NULL),
(11798, 8, 'menu_product', 'specific', NULL),
(11799, 8, 'menu_product_list', 'specific', NULL),
(11800, 8, 'menu_add_product', 'specific', NULL),
(11801, 8, 'menu_barcode_print', 'specific', NULL),
(11802, 8, 'menu_category', 'specific', NULL),
(11803, 8, 'menu_add_category', 'specific', NULL),
(11804, 8, 'menu_product_import', 'specific', NULL),
(11805, 8, 'menu_stock_alert', 'specific', NULL),
(11806, 8, 'menu_customer', 'specific', NULL),
(11807, 8, 'menu_add_customer', 'specific', NULL),
(11808, 8, 'menu_customer_list', 'specific', NULL),
(11809, 8, 'menu_statements', 'specific', NULL),
(11810, 8, 'menu_supplier', 'specific', NULL),
(11811, 8, 'menu_add_supplier', 'specific', NULL),
(11812, 8, 'menu_supplier_list', 'specific', NULL),
(11813, 8, 'menu_accounting', 'specific', NULL),
(11814, 8, 'menu_new_deposit', 'specific', NULL),
(11815, 8, 'menu_new_withdraw', 'specific', NULL),
(11816, 8, 'menu_list_transactions', 'specific', NULL),
(11817, 8, 'menu_new_transfer', 'specific', NULL),
(11818, 8, 'menu_list_transfer', 'specific', NULL),
(11819, 8, 'menu_add_bank_account', 'specific', NULL),
(11820, 8, 'menu_bank_accounts', 'specific', NULL),
(11821, 8, 'menu_income_source', 'specific', NULL),
(11822, 8, 'menu_balance_sheet', 'specific', NULL),
(11823, 8, 'menu_income_monthwise', 'specific', NULL),
(11824, 8, 'menu_expense_monthwise', 'specific', NULL),
(11825, 8, 'menu_income_and_expense', 'specific', NULL),
(11826, 8, 'menu_profit_and_loss', 'specific', NULL),
(11827, 8, 'menu_expenditure', 'specific', NULL),
(11828, 8, 'menu_create_expense', 'specific', NULL),
(11829, 8, 'menu_expense_list', 'specific', NULL),
(11830, 8, 'menu_summary', 'specific', NULL),
(11831, 8, 'menu_loan_manager', 'specific', NULL),
(11832, 8, 'menu_loan_list', 'specific', NULL),
(11833, 8, 'menu_take_loan', 'specific', NULL),
(11834, 8, 'menu_loan_summary', 'specific', NULL),
(11835, 8, 'menu_reports', 'specific', NULL),
(11836, 8, 'menu_report_overview', 'specific', NULL),
(11837, 8, 'menu_report_collection', 'specific', NULL),
(11838, 8, 'menu_report_due_collection', 'specific', NULL),
(11839, 8, 'menu_report_due_paid', 'specific', NULL),
(11840, 8, 'menu_sell_report', 'specific', NULL),
(11841, 8, 'menu_purchase_report', 'specific', NULL),
(11842, 8, 'menu_sell_payment_report', 'specific', NULL),
(11843, 8, 'menu_purchase_payment_report', 'specific', NULL),
(11844, 8, 'menu_tax_report', 'specific', NULL),
(11845, 8, 'menu_purchase_tax_report', 'specific', NULL),
(11846, 8, 'menu_tax_overview_report', 'specific', NULL),
(11847, 8, 'menu_report_stock', 'specific', NULL),
(11848, 8, 'menu_analytics', 'specific', NULL),
(11849, 8, 'menu_sms', 'specific', NULL),
(11850, 8, 'menu_send_sms', 'specific', NULL),
(11851, 8, 'menu_sms_report', 'specific', NULL),
(11852, 8, 'menu_sms_setting', 'specific', NULL),
(11853, 8, 'menu_user', 'specific', NULL),
(11854, 8, 'menu_add_user', 'specific', NULL),
(11855, 8, 'menu_user_list', 'specific', NULL),
(11856, 8, 'menu_add_usergroup', 'specific', NULL),
(11857, 8, 'menu_usergroup_list', 'specific', NULL),
(11858, 8, 'menu_password', 'specific', NULL),
(11859, 8, 'menu_filemanager', 'specific', NULL),
(11860, 8, 'menu_system', 'specific', NULL),
(11861, 8, 'menu_store', 'specific', NULL),
(11862, 8, 'menu_create_store', 'specific', NULL),
(11863, 8, 'menu_store_list', 'specific', NULL),
(11864, 8, 'menu_store_setting', 'specific', NULL),
(11865, 8, 'menu_receipt_template', 'specific', NULL),
(11866, 8, 'menu_user_preference', 'specific', NULL),
(11867, 8, 'menu_brand', 'specific', NULL),
(11868, 8, 'menu_add_brand', 'specific', NULL),
(11869, 8, 'menu_brand_list', 'specific', NULL),
(11870, 8, 'menu_currency', 'specific', NULL),
(11871, 8, 'menu_pmethod', 'specific', NULL),
(11872, 8, 'menu_unit', 'specific', NULL),
(11873, 8, 'menu_taxrate', 'specific', NULL),
(11874, 8, 'menu_box', 'specific', NULL),
(11875, 8, 'menu_printer', 'specific', NULL),
(11876, 8, 'menu_language', 'specific', NULL),
(11877, 8, 'menu_backup_restore', 'specific', NULL),
(11878, 8, 'menu_data_reset', 'specific', NULL),
(11879, 8, 'menu_store_change', 'specific', NULL),
(11880, 8, 'text_backup_restore_title', 'specific', NULL),
(11881, 8, 'text_dashboard', 'specific', NULL),
(11882, 8, 'text_backup', 'specific', NULL),
(11883, 8, 'text_restore', 'specific', NULL),
(11884, 8, 'label_databases', 'specific', NULL),
(11885, 8, 'search', 'specific', NULL),
(11886, 8, 'label_select_all', 'specific', NULL),
(11887, 8, 'label_unselect_all', 'specific', NULL),
(11888, 8, 'button_export', 'specific', NULL),
(11889, 8, 'label_progress', 'specific', NULL),
(11890, 8, 'button_select_sql_file', 'specific', NULL),
(11891, 8, 'placeholder_search_here', 'specific', NULL),
(11892, 8, 'text_version', 'specific', NULL),
(11893, 8, 'button_today', 'specific', NULL),
(11894, 8, 'button_last_7_days', 'specific', NULL),
(11895, 8, 'button_last_30_days', 'specific', NULL),
(11896, 8, 'button_last_365_days', 'specific', NULL),
(11897, 8, 'button_filter', 'specific', NULL),
(11898, 8, 'title_currency', 'specific', NULL),
(11899, 8, 'text_currency_title', 'specific', NULL),
(11900, 8, 'text_new_currency_title', 'specific', NULL),
(11901, 8, 'label_title', 'specific', NULL),
(11902, 8, 'label_code', 'specific', NULL),
(11903, 8, 'hint_code', 'specific', NULL),
(11904, 8, 'label_symbol_left', 'specific', NULL),
(11905, 8, 'hint_symbol_left', 'specific', NULL),
(11906, 8, 'label_symbol_right', 'specific', NULL),
(11907, 8, 'hint_symbol_right', 'specific', NULL),
(11908, 8, 'label_decimal_place', 'specific', NULL),
(11909, 8, 'hint_decimal_place', 'specific', NULL),
(11910, 8, 'label_store', 'specific', NULL),
(11911, 8, 'label_status', 'specific', NULL),
(11912, 8, 'text_active', 'specific', NULL),
(11913, 8, 'text_in_active', 'specific', NULL),
(11914, 8, 'label_sort_order', 'specific', NULL),
(11915, 8, 'button_save', 'specific', NULL),
(11916, 8, 'button_reset', 'specific', NULL),
(11917, 8, 'text_currency_list_title', 'specific', NULL),
(11918, 8, 'label_id', 'specific', NULL),
(11919, 8, 'label_edit', 'specific', NULL),
(11920, 8, 'label_delete', 'specific', NULL),
(11921, 8, 'label_action', 'specific', NULL),
(11922, 8, 'text_enabled', 'specific', NULL),
(11923, 8, 'button_edit', 'specific', NULL),
(11924, 8, 'button_delete', 'specific', NULL),
(11925, 8, 'button_activate', 'specific', NULL),
(11926, 8, 'button_activated', 'specific', NULL),
(11927, 8, 'title_pmethod', 'specific', NULL),
(11928, 8, 'text_pmethod_title', 'specific', NULL),
(11929, 8, 'text_new_pmethod_title', 'specific', NULL),
(11930, 8, 'label_name', 'specific', NULL),
(11931, 8, 'label_code_name', 'specific', NULL),
(11932, 8, 'label_details', 'specific', NULL),
(11933, 8, 'text_pmethod_list_title', 'specific', NULL),
(11934, 8, 'text_update_title', 'specific', NULL),
(11935, 8, 'button_update', 'specific', NULL),
(11936, 8, 'text_supplier_list_title', 'specific', NULL),
(11937, 8, 'text_supplier_title', 'specific', NULL),
(11938, 8, 'text_new_supplier_title', 'specific', NULL),
(11939, 8, 'label_email', 'specific', NULL),
(11940, 8, 'label_mobile', 'specific', NULL),
(11941, 8, 'label_address', 'specific', NULL),
(11942, 8, 'label_city', 'specific', NULL),
(11943, 8, 'label_state', 'specific', NULL),
(11944, 8, 'label_country', 'specific', NULL),
(11945, 8, 'label_product', 'specific', NULL),
(11946, 8, 'label_created_at', 'specific', NULL),
(11947, 8, 'label_purchase', 'specific', NULL),
(11948, 8, 'label_view', 'specific', NULL),
(11949, 8, 'button_purchase_product', 'specific', NULL),
(11950, 8, 'button_view_profile', 'specific', NULL),
(11951, 8, 'text_customer_list_title', 'specific', NULL),
(11952, 8, 'text_customer_title', 'specific', NULL),
(11953, 8, 'text_new_customer_title', 'specific', NULL),
(11954, 8, 'label_credit_balance', 'specific', NULL),
(11955, 8, 'label_phone', 'specific', NULL),
(11956, 8, 'label_date_of_birth', 'specific', NULL),
(11957, 8, 'label_sex', 'specific', NULL),
(11958, 8, 'label_male', 'specific', NULL),
(11959, 8, 'label_female', 'specific', NULL),
(11960, 8, 'label_others', 'specific', NULL),
(11961, 8, 'label_age', 'specific', NULL),
(11962, 8, 'text_inactive', 'specific', NULL),
(11963, 8, 'label_balance', 'specific', NULL),
(11964, 8, 'label_sell', 'specific', NULL),
(11965, 8, 'button_sell', 'specific', NULL),
(11966, 8, 'text_select_store', 'specific', NULL),
(11967, 8, 'text_redirecting_to_dashbaord', 'specific', NULL),
(11968, 8, 'title_dashboard', 'specific', NULL),
(11969, 8, 'button_pos', 'specific', NULL),
(11970, 8, 'button_sell_list', 'specific', NULL),
(11971, 8, 'button_overview_report', 'specific', NULL),
(11972, 8, 'button_sell_report', 'specific', NULL),
(11973, 8, 'button_purchase_report', 'specific', NULL),
(11974, 8, 'button_stock_alert', 'specific', NULL),
(11975, 8, 'button_expired_alert', 'specific', NULL),
(11976, 8, 'button_backup_restore', 'specific', NULL),
(11977, 8, 'button_stores', 'specific', NULL),
(11978, 8, 'text_total_invoice', 'specific', NULL),
(11979, 8, 'text_total_invoice_today', 'specific', NULL),
(11980, 8, 'text_details', 'specific', NULL),
(11981, 8, 'text_total_customer', 'specific', NULL),
(11982, 8, 'text_total_customer_today', 'specific', NULL),
(11983, 8, 'text_total_supplier', 'specific', NULL),
(11984, 8, 'text_total_supplier_today', 'specific', NULL),
(11985, 8, 'text_total_product', 'specific', NULL),
(11986, 8, 'text_total_product_today', 'specific', NULL),
(11987, 8, 'text_recent_activities', 'specific', NULL),
(11988, 8, 'text_sales', 'specific', NULL),
(11989, 8, 'text_quotations', 'specific', NULL),
(11990, 8, 'text_purchases', 'specific', NULL),
(11991, 8, 'text_transfers', 'specific', NULL),
(11992, 8, 'text_customers', 'specific', NULL),
(11993, 8, 'text_suppliers', 'specific', NULL),
(11994, 8, 'label_invoice_id', 'specific', NULL),
(11995, 8, 'label_customer_name', 'specific', NULL),
(11996, 8, 'label_amount', 'specific', NULL),
(11997, 8, 'label_payment_status', 'specific', NULL),
(11998, 8, 'text_paid', 'specific', NULL),
(11999, 8, 'button_add_sales', 'specific', NULL),
(12000, 8, 'button_list_sales', 'specific', NULL),
(12001, 8, 'text_sales_amount', 'specific', NULL),
(12002, 8, 'text_discount_given', 'specific', NULL),
(12003, 8, 'text_due_given', 'specific', NULL),
(12004, 8, 'text_received_amount', 'specific', NULL),
(12005, 8, 'label_date', 'specific', NULL),
(12006, 8, 'label_reference_no', 'specific', NULL),
(12007, 8, 'label_customer', 'specific', NULL),
(12008, 8, 'button_add_quotations', 'specific', NULL),
(12009, 8, 'button_list_quotations', 'specific', NULL),
(12010, 8, 'label_supplier_name', 'specific', NULL),
(12011, 8, 'button_add_purchases', 'specific', NULL),
(12012, 8, 'button_list_purchases', 'specific', NULL),
(12013, 8, 'label_from', 'specific', NULL),
(12014, 8, 'label_to', 'specific', NULL),
(12015, 8, 'label_quantity', 'specific', NULL),
(12016, 8, 'button_add_transfers', 'specific', NULL),
(12017, 8, 'button_list_transfers', 'specific', NULL),
(12018, 8, 'button_add_customer', 'specific', NULL),
(12019, 8, 'button_list_customers', 'specific', NULL),
(12020, 8, 'button_add_supplier', 'specific', NULL),
(12021, 8, 'button_list_suppliers', 'specific', NULL),
(12022, 8, 'text_deposit_today', 'specific', NULL),
(12023, 8, 'text_withdraw_today', 'specific', NULL),
(12024, 8, 'text_recent_deposit', 'specific', NULL),
(12025, 8, 'label_description', 'specific', NULL),
(12026, 8, 'button_view_all', 'specific', NULL),
(12027, 8, 'text_recent_withdraw', 'specific', NULL),
(12028, 8, 'title_income_vs_expense', 'specific', NULL),
(12029, 8, 'text_download_as_jpg', 'specific', NULL),
(12030, 8, 'label_day', 'specific', NULL),
(12031, 8, 'text_income', 'specific', NULL),
(12032, 8, 'text_expense', 'specific', NULL),
(12033, 8, 'text_income_vs_expense', 'specific', NULL),
(12034, 8, 'title_pos', 'specific', NULL),
(12035, 8, 'text_gift_card', 'specific', NULL),
(12036, 8, 'button_sell_gift_card', 'specific', NULL),
(12037, 8, 'text_keyboard_shortcut', 'specific', NULL),
(12038, 8, 'text_holding_order', 'specific', NULL),
(12039, 8, 'text_search_product', 'specific', NULL),
(12040, 8, 'text_view_all', 'specific', NULL),
(12041, 8, 'button_add_product', 'specific', NULL),
(12042, 8, 'button_add_purchase', 'specific', NULL),
(12043, 8, 'label_add_to_cart', 'specific', NULL),
(12044, 8, 'text_add_note', 'specific', NULL),
(12045, 8, 'label_due', 'specific', NULL),
(12046, 8, 'label_price', 'specific', NULL),
(12047, 8, 'label_subtotal', 'specific', NULL),
(12048, 8, 'label_total_items', 'specific', NULL),
(12049, 8, 'label_total', 'specific', NULL),
(12050, 8, 'label_discount', 'specific', NULL),
(12051, 8, 'label_tax_amount', 'specific', NULL),
(12052, 8, 'label_shipping_charge', 'specific', NULL),
(12053, 8, 'label_others_charge', 'specific', NULL),
(12054, 8, 'label_total_payable', 'specific', NULL),
(12055, 8, 'button_pay', 'specific', NULL),
(12056, 8, 'button_hold', 'specific', NULL),
(12057, 8, 'text_pmethod', 'specific', NULL),
(12058, 8, 'button_full_payment', 'specific', NULL),
(12059, 8, 'button_full_due', 'specific', NULL),
(12060, 8, 'button_sell_with_installment', 'specific', NULL),
(12061, 8, 'text_pay_amount', 'specific', NULL),
(12062, 8, 'placeholder_input_an_amount', 'specific', NULL),
(12063, 8, 'placeholder_note_here', 'specific', NULL),
(12064, 8, 'title_installment_details', 'specific', NULL),
(12065, 8, 'label_duration', 'specific', NULL),
(12066, 8, 'text_days', 'specific', NULL),
(12067, 8, 'label_interval', 'specific', NULL),
(12068, 8, 'label_total_installment', 'specific', NULL),
(12069, 8, 'label_interest_percentage', 'specific', NULL),
(12070, 8, 'label_interest_amount', 'specific', NULL),
(12071, 8, 'text_order_details', 'specific', NULL),
(12072, 8, 'label_order_tax', 'specific', NULL),
(12073, 8, 'label_previous_due', 'specific', NULL),
(12074, 8, 'label_payable_amount', 'specific', NULL),
(12075, 8, 'label_paid_amount', 'specific', NULL),
(12076, 8, 'label_due_amount', 'specific', NULL),
(12077, 8, 'label_note', 'specific', NULL),
(12078, 8, 'title_invoice', 'specific', NULL),
(12079, 8, 'text_sell_list_title', 'specific', NULL),
(12080, 8, 'text_invoices', 'specific', NULL),
(12081, 8, 'text_select', 'specific', NULL),
(12082, 8, 'button_today_invoice', 'specific', NULL),
(12083, 8, 'button_all_invoice', 'specific', NULL),
(12084, 8, 'button_due_invoice', 'specific', NULL),
(12085, 8, 'button_all_due_invoice', 'specific', NULL),
(12086, 8, 'button_paid_invoice', 'specific', NULL),
(12087, 8, 'button_inactive_invoice', 'specific', NULL),
(12088, 8, 'label_datetime', 'specific', NULL),
(12089, 8, 'label_pay', 'specific', NULL),
(12090, 8, 'label_return', 'specific', NULL),
(12091, 8, 'title_user_profile', 'specific', NULL),
(12092, 8, 'text_profile_title', 'specific', NULL),
(12093, 8, 'text_users', 'specific', NULL),
(12094, 8, 'text_since', 'specific', NULL),
(12095, 8, 'text_contact_information', 'specific', NULL),
(12096, 8, 'label_collection', 'specific', NULL),
(12097, 8, 'text_sell_report', 'specific', NULL),
(12098, 8, 'text_purchase_report', 'specific', NULL),
(12099, 8, 'text_payment_report', 'specific', NULL),
(12100, 8, 'text_login_log', 'specific', NULL),
(12101, 8, 'button_collection_report', 'specific', NULL),
(12102, 8, 'button_log', 'specific', NULL),
(12103, 8, 'text_invoice_list', 'specific', NULL),
(12104, 8, 'label_items', 'specific', NULL),
(12105, 8, 'label_total_item', 'specific', NULL),
(12106, 8, 'label_payable', 'specific', NULL),
(12107, 8, 'label_serial_no', 'specific', NULL),
(12108, 8, 'label_username', 'specific', NULL),
(12109, 8, 'label_ip_address', 'specific', NULL),
(12110, 8, 'label_time', 'specific', NULL),
(12111, 8, 'label_image', 'specific', NULL),
(12112, 8, 'label_group', 'specific', NULL),
(12113, 8, 'hint_group', 'specific', NULL),
(12114, 8, 'title_filemanager', 'specific', NULL),
(12115, 8, 'title_analytics', 'specific', NULL),
(12116, 8, 'text_analytics_title', 'specific', NULL),
(12117, 8, 'text_top_products', 'specific', NULL),
(12118, 8, 'text_top_customers', 'specific', NULL),
(12119, 8, 'text_top_suppliers', 'specific', NULL),
(12120, 8, 'text_top_brands', 'specific', NULL),
(12121, 8, 'label_opening_balance', 'specific', NULL),
(12122, 8, 'button_details', 'specific', NULL),
(12123, 8, 'label_today_income', 'specific', NULL),
(12124, 8, 'label_total_income', 'specific', NULL),
(12125, 8, 'label_today_expense', 'specific', NULL),
(12126, 8, 'label_cash_in_hand', 'specific', NULL),
(12127, 8, 'label_today_closing_balance', 'specific', NULL),
(12128, 8, 'title_customer_analytics', 'specific', NULL),
(12129, 8, 'text_birthday_today', 'specific', NULL),
(12130, 8, 'text_birthday_coming', 'specific', NULL),
(12131, 8, 'label_member_since', 'specific', NULL),
(12132, 8, 'text_not_found', 'specific', NULL),
(12133, 8, 'text_best_customer', 'specific', NULL),
(12134, 8, 'text_purchase', 'specific', NULL),
(12135, 8, 'title_login_logs', 'specific', NULL),
(12136, 8, 'label_ip', 'specific', NULL),
(12137, 8, 'label_logged_in', 'specific', NULL),
(12138, 8, 'label_failed', 'specific', NULL),
(12139, 8, 'title_settings', 'specific', NULL),
(12140, 8, 'title_store', 'specific', NULL),
(12141, 8, 'text_general', 'specific', NULL),
(12142, 8, 'text_pos_setting', 'specific', NULL),
(12143, 8, 'text_email_setting', 'specific', NULL),
(12144, 8, 'text_ftp_setting', 'specific', NULL),
(12145, 8, 'text_cronjob', 'specific', NULL),
(12146, 8, 'label_deposit_account', 'specific', NULL),
(12147, 8, 'label_zip_code', 'specific', NULL),
(12148, 8, 'label_gst_reg_no', 'specific', NULL),
(12149, 8, 'label_vat_reg_no', 'specific', NULL),
(12150, 8, 'label_cashier_name', 'specific', NULL),
(12151, 8, 'label_timezone', 'specific', NULL),
(12152, 8, 'label_invoice_edit_lifespan', 'specific', NULL),
(12153, 8, 'hint_invoice_edit_lifespan', 'specific', NULL),
(12154, 8, 'text_minute', 'specific', NULL),
(12155, 8, 'text_second', 'specific', NULL),
(12156, 8, 'label_invoice_delete_lifespan', 'specific', NULL),
(12157, 8, 'hint_invoice_delete_lifespan', 'specific', NULL),
(12158, 8, 'label_tax', 'specific', NULL),
(12159, 8, 'hint_tax', 'specific', NULL),
(12160, 8, 'label_sms_gateway', 'specific', NULL),
(12161, 8, 'hint_sms_gateway', 'specific', NULL),
(12162, 8, 'label_sms_alert', 'specific', NULL),
(12163, 8, 'hint_sms_alert', 'specific', NULL),
(12164, 8, 'text_yes', 'specific', NULL),
(12165, 8, 'text_no', 'specific', NULL),
(12166, 8, 'label_auto_sms', 'specific', NULL),
(12167, 8, 'text_sms_after_creating_invoice', 'specific', NULL),
(12168, 8, 'label_expiration_system', 'specific', NULL),
(12169, 8, 'label_datatable_item_limit', 'specific', NULL),
(12170, 8, 'hint_datatable_item_limit', 'specific', NULL),
(12171, 8, 'label_reference_format', 'specific', NULL),
(12172, 8, 'label_sales_reference_prefix', 'specific', NULL),
(12173, 8, 'label_receipt_template', 'specific', NULL),
(12174, 8, 'label_pos_printing', 'specific', NULL),
(12175, 8, 'label_receipt_printer', 'specific', NULL),
(12176, 8, 'label_auto_print_receipt', 'specific', NULL),
(12177, 8, 'label_invoice_view', 'specific', NULL),
(12178, 8, 'hint_invoice_view', 'specific', NULL),
(12179, 8, 'text_standard', 'specific', NULL),
(12180, 8, 'text_tax_invoice', 'specific', NULL),
(12181, 8, 'text_indian_gst', 'specific', NULL),
(12182, 8, 'label_change_item_price_while_billing', 'specific', NULL),
(12183, 8, 'hint_change_item_price_while_billing', 'specific', NULL),
(12184, 8, 'label_pos_product_display_limit', 'specific', NULL),
(12185, 8, 'hint_pos_product_display_limit', 'specific', NULL),
(12186, 8, 'label_after_sell_page', 'specific', NULL),
(12187, 8, 'hint_after_sell_page', 'specific', NULL),
(12188, 8, 'label_invoice_footer_text', 'specific', NULL),
(12189, 8, 'hint_invoice_footer_text', 'specific', NULL),
(12190, 8, 'label_sound_effect', 'specific', NULL),
(12191, 8, 'label_email_from', 'specific', NULL),
(12192, 8, 'hint_email_from', 'specific', NULL),
(12193, 8, 'label_email_address', 'specific', NULL),
(12194, 8, 'hint_email_address', 'specific', NULL),
(12195, 8, 'label_email_driver', 'specific', NULL),
(12196, 8, 'hint_email_driver', 'specific', NULL),
(12197, 8, 'label_send_mail_path', 'specific', NULL),
(12198, 8, 'hint_send_mail_path', 'specific', NULL),
(12199, 8, 'label_smtp_host', 'specific', NULL),
(12200, 8, 'hint_smtp_host', 'specific', NULL),
(12201, 8, 'label_smtp_username', 'specific', NULL),
(12202, 8, 'hint_smtp_username', 'specific', NULL),
(12203, 8, 'label_smtp_password', 'specific', NULL),
(12204, 8, 'hint_smtp_password', 'specific', NULL),
(12205, 8, 'label_smtp_port', 'specific', NULL),
(12206, 8, 'hint_smtp_port', 'specific', NULL),
(12207, 8, 'label_ssl_tls', 'specific', NULL),
(12208, 8, 'hint_ssl_tls', 'specific', NULL),
(12209, 8, 'label_ftp_hostname', 'specific', NULL),
(12210, 8, 'label_ftp_username', 'specific', NULL),
(12211, 8, 'label_ftp_password', 'specific', NULL),
(12212, 8, 'button_back', 'specific', NULL),
(12213, 8, 'text_logo', 'specific', NULL),
(12214, 8, 'button_upload', 'specific', NULL),
(12215, 8, 'text_favicon', 'specific', NULL),
(12216, 8, 'title_quotation', 'specific', NULL),
(12217, 8, 'text_quotation_title', 'specific', NULL),
(12218, 8, 'text_add', 'specific', NULL),
(12219, 8, 'text_new_quotation_title', 'specific', NULL),
(12220, 8, 'text_sent', 'specific', NULL),
(12221, 8, 'text_pending', 'specific', NULL),
(12222, 8, 'text_complete', 'specific', NULL),
(12223, 8, 'label_supplier', 'specific', NULL),
(12224, 8, 'text_all_suppliers', 'specific', NULL),
(12225, 8, 'label_add_product', 'specific', NULL),
(12226, 8, 'placeholder_search_product', 'specific', NULL),
(12227, 8, 'label_available', 'specific', NULL),
(12228, 8, 'label_sell_price', 'specific', NULL),
(12229, 8, 'label_item_tax', 'specific', NULL),
(12230, 8, 'label_discount_amount', 'specific', NULL),
(12231, 8, 'text_quotation_list_title', 'specific', NULL),
(12232, 8, 'button_all', 'specific', NULL),
(12233, 8, 'button_sent', 'specific', NULL),
(12234, 8, 'button_pending', 'specific', NULL),
(12235, 8, 'button_complete', 'specific', NULL),
(12236, 8, 'label_biller', 'specific', NULL),
(12237, 8, 'title_user', 'specific', NULL),
(12238, 8, 'text_user_title', 'specific', NULL),
(12239, 8, 'text_new_user_title', 'specific', NULL),
(12240, 8, 'label_thumbnail', 'specific', NULL),
(12241, 8, 'label_password', 'specific', NULL),
(12242, 8, 'label_password_retype', 'specific', NULL),
(12243, 8, 'text_user_list_title', 'specific', NULL),
(12244, 8, 'label_profile', 'specific', NULL),
(12245, 8, 'error_walking_customer_can_not_craete_due', 'specific', NULL),
(12246, 8, 'title_language_translation', 'specific', NULL),
(12247, 8, 'text_language_translation_title', 'specific', NULL),
(12248, 8, 'text_translations', 'specific', NULL),
(12249, 8, 'button_add_new_language', 'specific', NULL),
(12250, 8, 'button_default', 'specific', NULL),
(12251, 8, 'button_dublicate_entry', 'specific', NULL),
(12252, 8, 'button_empty_value', 'specific', NULL),
(12253, 8, 'label_key', 'specific', NULL),
(12254, 8, 'label_value', 'specific', NULL),
(12255, 8, 'label_translate', 'specific', NULL),
(12256, 8, 'button_translate', 'specific', NULL),
(12257, 7, 'error_total_amount', 'specific', NULL),
(12258, 7, 'button_topup', 'specific', NULL),
(12259, 7, 'button_due_invoice_list', 'specific', 'LISTA DE FACT. PENDIENTES'),
(12260, 7, 'text_purchase_update_success', 'specific', 'ACTUALIZACIÓN EXITOSA'),
(12261, 1, 'error_update_permission', 'specific', NULL),
(12262, 7, 'text_transfer_success', 'specific', 'Traslado exitoso'),
(12263, 7, 'button_transfer_edit', 'specific', 'MODIFICAR TRASLADO'),
(12264, 7, 'label_transferred_from', 'specific', 'TRASLADADO DESDE'),
(12265, 7, 'label_transferred_to', 'specific', NULL),
(12266, 7, 'text_update_transfer_status_success', 'specific', 'TRANSFERENCIA EXITOSA'),
(12267, 7, 'success_delete_all', 'specific', 'Eliminación exitosa'),
(12268, 7, 'error_new_customer_name', 'specific', NULL),
(12269, 7, 'label_insert_store_content_into', 'specific', NULL),
(12270, 7, 'label_delete_all_content', 'specific', NULL),
(12271, 7, 'error_product_exist', 'specific', 'Producto ya existe'),
(12272, 7, 'button_viefw', 'specific', NULL),
(12273, 7, 'text_loan_details', 'specific', NULL),
(12274, 7, 'label_paid_by', 'specific', 'PAGADO POR'),
(12275, 7, 'error_invalid_gateway', 'specific', NULL),
(12276, 7, 'error_gateway', 'specific', NULL),
(12277, 7, 'text_due_incoice', 'specific', 'PEND. PAGO'),
(12278, 7, 'text_deposit_success', 'specific', 'Depósito exitoso'),
(12279, 7, 'text_withdraw_success', 'specific', 'Retiro exitoso'),
(12280, 7, 'label_invoice_to', 'specific', 'PARA'),
(12281, 7, 'error_amount', 'specific', NULL),
(12282, 7, 'error_reference_no_exist', 'specific', NULL),
(12283, 7, 'error_items', 'specific', NULL),
(12284, 7, 'title_purchase_tax_report', 'specific', 'REPORTE IMPUESTOS'),
(12285, 7, 'text_purchase_tax_report_title', 'specific', 'REPORTE IMPUESTOS'),
(12286, 7, 'text_total_tax_amount', 'specific', NULL),
(12287, 7, 'text_purchase_tax_report_sub_title', 'specific', 'REPORTE IMPUESTOS'),
(12288, 7, 'error_product_price', 'specific', 'Error en precio de producto'),
(12289, 7, 'placeholder_input_discount_amount', 'specific', NULL),
(12290, 7, 'text_billing_details', 'specific', NULL),
(12291, 7, 'error_paid_amount', 'specific', 'MONTO'),
(12292, 7, 'text_sell_due_paid_success', 'specific', 'PAGO EXITOSO'),
(12293, 7, 'text_expired', 'specific', NULL),
(12294, 7, 'menu_expired', 'specific', NULL),
(12295, 7, 'error_product_code', 'specific', 'Error en código de producto'),
(12296, 7, 'error_product_tax', 'specific', 'Error en Impuestos de producto'),
(12297, 7, 'error_title', 'specific', NULL),
(12298, 7, 'title_expired', 'specific', NULL),
(12299, 7, 'text_expired_title', 'specific', NULL),
(12300, 7, 'text_expired_listing_title', 'specific', NULL),
(12301, 7, 'button_expired', 'specific', NULL),
(12302, 7, 'button_expiring_soon', 'specific', NULL),
(12303, 7, 'error_not_found_or_insufficient_balance', 'specific', NULL),
(12304, 7, 'error_printer_path', 'specific', 'Error en la ruta a la impresora'),
(12551, 7, 'text_installment_delete_success', 'specific', 'Eliminación exitosa'),
(12552, 7, 'error_delete_duration_expired', 'specific', NULL),
(12553, 1, 'error_password', 'specific', NULL),
(12554, 7, 'error_password_mismatch', 'specific', 'CONTRASEÑA DIFERENTE'),
(12555, 7, 'text_balance_added', 'specific', NULL),
(12556, 7, 'button_substract_balance', 'specific', NULL),
(12557, 7, 'button_send_sms', 'specific', NULL),
(12558, 7, 'invoice_sms_text', 'specific', 'MENSAJE SMS'),
(12559, 7, 'error_email_address', 'specific', NULL),
(12560, 7, 'button_topup_now', 'specific', NULL),
(12561, 7, 'error_expiry_date', 'specific', 'EXPIRA EN'),
(12562, 7, 'text_topup_success', 'specific', 'Exitoso'),
(12563, 7, 'text_topup_delete_success', 'specific', 'Eliminación exitosa'),
(12564, 7, 'error_store_id', 'specific', NULL),
(12565, 8, 'text_expired', 'specific', NULL),
(12566, 8, 'menu_expired', 'specific', NULL),
(12567, 7, 'menu_stock_import', 'specific', 'IMPORTAR STOCK'),
(12568, 7, 'text_total_people', 'specific', NULL),
(12569, 7, 'text_max_160_ch', 'specific', NULL),
(12570, 7, 'text_sms_info', 'specific', NULL),
(12571, 1, 'text_footer_link', 'specific', NULL),
(12572, 1, 'text_footer_link_text', 'specific', NULL),
(12573, 7, 'text_add_product', 'specific', 'Agregar producto'),
(12574, 1, 'menu_stock_import', 'specific', NULL),
(12575, 7, 'text_select_range', 'specific', 'SELECCIONAR RANGO'),
(12576, 7, 'text_this_month', 'specific', NULL),
(12577, 7, 'text_last_week', 'specific', NULL),
(12578, 7, 'text_last_6_months', 'specific', NULL),
(12579, 7, 'text_last_year', 'specific', NULL),
(12580, 7, 'label_month', 'specific', NULL),
(12581, 7, 'text_toggle_dropdown', 'specific', NULL),
(12582, 7, 'button_add_stock', 'specific', 'AGREGAR'),
(12583, 7, 'button_stock_adjustment', 'specific', 'AJUSTE DE STOCK'),
(12584, 7, 'button_pay_all', 'specific', NULL),
(12585, 7, 'label_qty', 'specific', NULL),
(12586, 1, 'text_site_maintainance', 'specific', NULL),
(12587, 1, 'text_resetting', 'specific', NULL),
(12588, 1, 'text_resetting_info', 'specific', NULL),
(12589, 1, 'error_email_address_not_found', 'specific', NULL),
(12590, 7, 'label_select_deselect', 'specific', 'Seleccionar / Deseleccionar'),
(12591, 1, 'measurement_type_name', 'specific', 'MEASUREMENT TYPE'),
(12592, 7, 'measurement_type_name', 'specific', 'TIPO MEDICIÓN'),
(12593, 1, 'acronym_name', 'specific', 'ACRONYM'),
(12594, 7, 'acronym_name', 'specific', 'ABREVIATURA'),
(12595, 1, 'text_prices', 'specific', 'PRICES'),
(12596, 7, 'text_prices', 'specific', 'PRECIOS'),
(12597, 1, 'label_p_date', 'specific', 'DISCHARGE DATE'),
(12598, 1, 'label_e_date', 'specific', 'EXPIRATION DATE'),
(12599, 7, 'label_p_date', 'specific', 'FECHA DE ALTA'),
(12600, 7, 'label_e_date', 'specific', 'FECHA EXPIRACIÓN'),
(12601, 1, 'document_register', 'specific', 'DOCUMENT REGISTER'),
(12602, 7, 'document_register', 'specific', 'REGISTRO DOCUMENTOS'),
(12603, 1, 'title_invoice', 'specific', 'INVOICE'),
(12604, 1, 'title_credit_note', 'specific', 'CREDIT NOTE '),
(12605, 1, 'title_discount_credit', 'specific', 'DISCOUNT CREDIT NOTE'),
(12606, 1, 'title_return_credit', 'specific', 'RETURN CREDIT NOTE'),
(12607, 1, 'title_debit_note', 'specific', 'DEBIT NOTE'),
(12608, 1, 'title_shipping_document', 'specific', 'SHIPPING DOCUMENT'),
(12609, 1, 'title_receipt', 'specific', 'RECEIPT'),
(12610, 7, 'title_invoice', 'specific', 'FACTURA'),
(12611, 7, 'title_credit_note', 'specific', 'RECIBO ABONO'),
(12612, 7, 'title_discount_credit', 'specific', 'NOTA DE CREDITO DESCUENTO'),
(12613, 7, 'title_return_credit', 'specific', 'NOTA RECIBO DE DEVOLUCIÓN'),
(12614, 7, 'title_debit_note', 'specific', 'NOTA DE DÉBITO'),
(12615, 7, 'title_shipping_document', 'specific', 'ENVÍO'),
(12616, 7, 'title_receipt', 'specific', 'RECIBO'),
(12617, 7, 'label_store_name', 'specific', NULL),
(12618, 7, 'label_actions', 'specific', NULL),
(12619, 7, 'error_mobile_exist', 'specific', NULL),
(12628, 7, 'cancel', 'specific', 'Cancelar'),
(12629, 7, 'text_footer_link', 'specific', NULL),
(12630, 7, 'text_footer_link_text', 'specific', NULL),
(12631, 7, 'text_installation_info', 'specific', NULL),
(12632, 7, 'timezone_not_change_in_init.php', 'specific', NULL),
(12633, 7, 'error_pmethod_name', 'specific', NULL),
(12634, 7, 'error_read_permission', 'specific', NULL),
(12635, 7, 'text_purchase_due_paid_success', 'specific', 'PAGO EXITOSO'),
(12636, 7, 'error_pmethod', 'specific', NULL),
(12637, 7, 'error_store_exist', 'specific', NULL),
(12638, 7, 'label_cancel', 'specific', 'Cancelar'),
(12639, 7, 'error_date_of_birth', 'specific', NULL),
(12640, 7, 'button_cancel', 'specific', 'Cancelar'),
(12641, 7, 'text_retrieve_session', 'specific', NULL),
(12642, 7, 'text_sign_as_different', 'specific', NULL),
(12643, 7, 'text_signed_in_as', 'specific', NULL),
(12644, 7, 'text_profile', 'specific', 'PERFIL'),
(12645, 7, 'text_user_profile', 'specific', 'USUARIOS'),
(12646, 1, 'text_user_profile', 'specific', NULL),
(12647, 7, 'text_login', 'specific', 'Inicio de Sesión'),
(12648, 1, 'text_login', 'specific', NULL),
(12649, 7, 'text_windows_instruction', 'specific', NULL),
(12650, 7, 'text_printer_port', 'specific', 'Error en el puerto de impresora'),
(12651, 7, 'error_printer_ip_address_or_port', 'specific', 'error en la dirección IP'),
(12652, 1, 'document_type_label', 'specific', 'DOCUMENT TYPE'),
(12653, 7, 'document_type_label', 'specific', 'TIPO DE DOCUMENTO'),
(12654, 7, 'label_retainer', 'specific', NULL),
(12655, 1, 'label_select_deselect', 'specific', NULL),
(12656, 1, 'text_installation_info', 'specific', NULL),
(12657, 7, 'error_pos_backgorund_pattern', 'specific', NULL),
(12658, 1, 'text_password_reset', 'specific', NULL),
(12659, 1, 'text_password_reset_body_text', 'specific', NULL),
(12660, 1, 'text_to_reset_password_follow_this_link', 'specific', NULL),
(12661, 1, 'success_reset_code_sent', 'specific', NULL),
(12662, 1, 'title_reset_your_password', 'specific', NULL),
(12663, 1, 'label_new_password', 'specific', NULL),
(12664, 1, 'label_confirm_new_password', 'specific', NULL),
(12665, 1, 'button_password_reset', 'specific', NULL),
(12666, 1, 'password_reset_success', 'specific', NULL),
(12667, 7, 'error_zip_code', 'specific', NULL),
(12668, 1, 'text_select_range', 'specific', NULL),
(12669, 1, 'text_this_month', 'specific', NULL),
(12670, 1, 'text_last_week', 'specific', NULL),
(12671, 1, 'text_last_6_months', 'specific', NULL),
(12672, 1, 'text_last_year', 'specific', NULL),
(12673, 7, 'document_registe', 'specific', NULL),
(12674, 1, 'label_retainer', 'specific', NULL),
(12675, 7, 'unit_alert', 'specific', NULL),
(12681, 1, 'text_add_product', 'specific', NULL),
(12682, 1, 'button_stock_adjustment', 'specific', NULL),
(12685, 7, 'error_invoice_sub_total', 'specific', NULL),
(12686, 7, 'label_old_invoice_id', 'specific', NULL),
(12687, 7, 'label_purchase_invoice_id', 'specific', NULL),
(12688, 7, 'label_return_note', 'specific', NULL),
(12689, 7, 'label_return_items', 'specific', NULL),
(12690, 7, 'label_returned_by', 'specific', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `loan_id` int UNSIGNED NOT NULL,
  `ref_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `loan_from` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(25,4) UNSIGNED NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payable` decimal(25,4) UNSIGNED NOT NULL,
  `paid` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `attachment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int UNSIGNED NOT NULL,
  `lloan_id` int UNSIGNED NOT NULL,
  `ref_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('success','error') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `username`, `ip`, `status`, `created_at`) VALUES
(163, 1, 'prueba@agrotactic.com.gt', '::1', 'success', '2025-08-25 08:59:09'),
(164, 1, 'prueba@agrotactic.com.gt', '181.209.201.166', 'success', '2025-08-25 09:59:43'),
(165, 1, 'prueba@agrotactic.com.gt', '::1', 'success', '2025-08-25 17:19:14'),
(166, 1, 'prueba@agrotactic.com.gt', '::1', 'success', '2025-08-25 18:48:17'),
(167, 1, 'prueba@agrotactic.com.gt', '::1', 'success', '2025-08-26 08:20:32'),
(168, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-26 15:14:46'),
(169, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-26 16:16:20'),
(170, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-26 17:58:15'),
(171, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-26 18:03:26'),
(172, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-27 13:38:33'),
(173, 1, 'prueba@agrotactic.com.gt', '181.209.201.166', 'success', '2025-08-27 13:39:29'),
(174, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-27 13:41:23'),
(175, 1, 'prueba@agrotactic.com.gt', '181.209.201.166', 'success', '2025-08-27 13:49:22'),
(176, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-27 13:50:40'),
(177, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-27 13:51:38'),
(178, 1, 'prueba@agrotactic.com.gt', '::1', 'success', '2025-08-27 13:56:22'),
(179, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-27 14:05:16'),
(183, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-27 14:11:39'),
(184, 6, 'test@bideadigital.com', '190.149.120.112', 'success', '2025-08-27 14:24:18'),
(185, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-27 16:14:36'),
(186, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-27 17:50:49'),
(187, 1, 'prueba@agrotactic.com.gt', '181.209.201.166', 'success', '2025-08-27 20:14:28'),
(188, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-28 09:00:02'),
(190, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-28 09:17:33'),
(191, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-08-29 12:15:54'),
(192, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-02 11:27:02'),
(195, 1, 'prueba@agrotactic.com.gt', '190.56.117.230', 'success', '2025-09-03 12:21:53'),
(199, 1, 'prueba@agrotactic.com.gt', '190.56.117.230', 'success', '2025-09-08 03:59:47'),
(200, 8, 'contactodirecto@bideadigital.com', '190.56.117.230', 'success', '2025-09-08 04:04:03'),
(201, 1, 'prueba@agrotactic.com.gt', '181.174.74.145', 'success', '2025-09-08 09:59:30'),
(202, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-08 10:31:23'),
(203, 8, 'contactodirecto@bideadigital.com', '190.149.120.112', 'success', '2025-09-08 10:32:11'),
(204, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-08 11:00:20'),
(205, 1, 'Prueba@agrotactic.com.gt', '181.174.74.145', 'success', '2025-09-08 11:10:03'),
(206, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-08 12:54:51'),
(207, 8, 'contactodirecto@bideadigital.com', '190.149.120.112', 'success', '2025-09-08 16:50:35'),
(208, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-08 16:50:54'),
(209, 8, 'contactodirecto@bideadigital.com', '190.149.120.112', 'success', '2025-09-08 16:51:56'),
(210, 1, 'prueba@agrotactic.com.gt', '190.56.117.230', 'success', '2025-09-08 23:52:03'),
(211, 8, 'contactodirecto@bideadigital.com', '181.174.74.145', 'success', '2025-09-09 09:46:29'),
(212, 1, 'prueba@agrotactic.com.gt', '181.174.74.145', 'success', '2025-09-09 11:06:24'),
(214, 8, 'contactodirecto@bideadigital.com', '181.174.74.145', 'success', '2025-09-09 11:07:50'),
(221, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:10:44'),
(222, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:10:48'),
(223, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:10:50'),
(230, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:14:20'),
(231, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:14:39'),
(232, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:14:56'),
(234, NULL, NULL, '190.148.158.175', 'error', '2025-09-11 23:15:31'),
(236, 7, 'ar.mollinedo@gmail.com ', '186.151.73.111', 'success', '2025-09-11 17:21:43'),
(237, 7, 'ar.mollinedo@gmail.com ', '186.151.73.111', 'success', '2025-09-11 18:12:29'),
(240, 1, 'prueba@agrotactic.com.gt', '181.174.75.136', 'success', '2025-09-11 20:10:32'),
(241, 1, 'prueba@agrotactic.com.gt', '181.174.75.136', 'success', '2025-09-12 09:09:46'),
(243, 8, 'contactodirecto@bideadigital.com', '181.174.75.136', 'success', '2025-09-12 09:12:06'),
(244, 1, 'prueba@agrotactic.com.gt', '181.174.75.136', 'success', '2025-09-12 09:12:41'),
(245, 8, 'contactodirecto@bideadigital.com', '181.174.75.136', 'success', '2025-09-12 09:13:33'),
(246, 8, 'contactodirecto@bideadigital.com', '181.209.186.29', 'success', '2025-09-12 09:16:47'),
(247, 7, 'ar.mollinedo@gmail.com', '181.209.186.29', 'success', '2025-09-12 09:18:30'),
(248, 7, 'ar.mollinedo@gmail.com ', '186.151.73.111', 'success', '2025-09-12 14:08:24'),
(249, 8, 'contactodirecto@bideadigital.com', '181.209.186.29', 'success', '2025-09-12 16:19:02'),
(250, NULL, NULL, '190.148.158.175', 'error', '2025-09-12 22:58:59'),
(251, NULL, NULL, '190.148.158.175', 'error', '2025-09-12 22:59:08'),
(252, 7, 'ar.mollinedo@gmail.com', '186.151.73.111', 'success', '2025-09-12 16:59:20'),
(253, 8, 'contactodirecto@bideadigital.com', '190.149.120.112', 'success', '2025-09-12 17:30:23'),
(255, 8, 'contactodirecto@bideadigital.com', '::1', 'success', '2025-09-16 08:28:03'),
(256, 8, 'contactodirecto@bideadigital.com', '181.209.195.70', 'success', '2025-09-16 08:38:03'),
(257, NULL, NULL, '186.151.49.73', 'error', '2025-09-16 15:55:51'),
(258, 7, 'ar.mollinedo@gmail.com ', '190.143.236.105', 'success', '2025-09-16 09:57:21'),
(259, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-16 16:13:30'),
(260, 1, 'prueba@agrotactic.com.gt', '181.209.195.70', 'success', '2025-09-16 16:23:46'),
(261, 1, 'prueba@agrotactic.com.gt', '181.209.195.70', 'success', '2025-09-16 17:27:35'),
(262, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-17 10:10:06'),
(263, 1, 'prueba@agrotactic.com.gt', '181.209.195.70', 'success', '2025-09-17 10:25:52'),
(265, 1, 'prueba@agrotactic.com.gt', '190.149.42.172', 'success', '2025-09-17 17:30:38'),
(266, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-17 18:15:52'),
(268, 8, 'contactodirecto@bideadigital.com', '190.149.42.172', 'success', '2025-09-17 18:35:11'),
(269, 1, 'prueba@agrotactic.com.gt', '190.14.141.242', 'success', '2025-09-17 20:02:39'),
(270, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-18 09:53:25'),
(271, 8, 'contactodirecto@bideadigital.com', '190.149.120.112', 'success', '2025-09-18 09:53:48'),
(272, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-18 09:56:03'),
(273, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-18 11:18:57'),
(274, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-18 13:06:06'),
(276, 1, 'prueba@agrotactic.com.gt', '190.56.117.12', 'success', '2025-09-18 13:37:11'),
(277, 7, 'ar.mollinedo@gmail.com ', '181.174.90.96', 'success', '2025-09-22 15:32:30'),
(278, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-22 17:05:04'),
(279, 1, 'prueba@agrotactic.com.gt', '190.148.209.198', 'success', '2025-09-23 00:16:00'),
(280, 1, 'prueba@agrotactic.com.gt', '190.149.120.112', 'success', '2025-09-23 17:45:55'),
(281, 1, 'prueba@agrotactic.com.gt', '172.18.0.1', 'success', '2025-09-23 21:38:16'),
(282, 1, 'prueba@agrotactic.com.gt', '172.18.0.1', 'success', '2025-09-23 21:48:04'),
(283, 1, 'prueba@agrotactic.com.gt', '172.18.0.1', 'success', '2025-09-23 21:54:34'),
(284, 1, 'prueba@agrotactic.com.gt', '172.18.0.1', 'success', '2025-09-23 22:07:39'),
(285, 1, 'prueba@agrotactic.com.gt', '172.18.0.1', 'success', '2025-09-23 22:11:54'),
(286, 1, 'prueba@agrotactic.com.gt', '190.148.209.198', 'success', '2025-09-24 00:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `log_stock`
--

CREATE TABLE `log_stock` (
  `id_log_stock` int NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `product_to_store_id` int UNSIGNED NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mail_sms_tag`
--

CREATE TABLE `mail_sms_tag` (
  `tag_id` int UNSIGNED NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tagname` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `mail_sms_tag`
--

INSERT INTO `mail_sms_tag` (`tag_id`, `type`, `tagname`, `created_at`) VALUES
(1, 'invoice', '[customer_name]', '2024-03-30 02:07:34'),
(2, 'invoice', '[payable_amount]', '2024-03-30 02:07:34'),
(3, 'invoice', '[paid_amount]', '2024-03-30 02:07:34'),
(4, 'invoice', '[due]', '2024-03-30 02:07:34'),
(5, 'invoice', '[store_name]', '2024-03-30 02:07:34'),
(6, 'invoice', '[payment_status]', '2024-03-30 02:07:34'),
(7, 'invoice', '[customer_mobile]', '2024-03-30 02:07:34'),
(8, 'invoice', '[payment_method]', '2024-03-30 02:07:34'),
(9, 'invoice', '[date_time]', '2024-03-30 02:07:34'),
(10, 'invoice', '[date]', '2024-03-30 02:07:34'),
(11, 'invoice', '[tax]', '2024-03-30 02:07:34'),
(12, 'invoice', '[discount]', '2024-03-30 02:07:34'),
(13, 'invoice', '[address]', '2024-03-30 02:07:34'),
(14, 'invoice', '[invoice_id]', '2024-03-30 02:07:34'),
(15, 'invoice', '[invoice_id]', '2024-03-30 02:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `measurement_type`
--

CREATE TABLE `measurement_type` (
  `id_measurement_type` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `measurement_type`
--

INSERT INTO `measurement_type` (`id_measurement_type`, `name`, `description`, `is_active`, `created_at`) VALUES
(1, 'Peso', 'Gramos, Libras, etc.', 1, '2025-08-06'),
(2, 'Volumen', 'Litros, Mililitros, etc.', 1, '2025-08-06'),
(3, 'Unidad', 'Pieza, Unidad, etc.', 1, '2025-08-06'),
(4, 'Caja', 'Empaque, Presentación, etc', 1, '2025-08-06');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'sell',
  `is_profit` tinyint(1) NOT NULL DEFAULT '1',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` int UNSIGNED NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pmethod_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `capital` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `attachment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `total_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pmethods`
--

CREATE TABLE `pmethods` (
  `pmethod_id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pmethods`
--

INSERT INTO `pmethods` (`pmethod_id`, `name`, `code_name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Pago en Efectivo', 'cod', 'Pago en efectivo', '2024-03-30 02:07:34', '2025-08-07 17:35:40'),
(2, 'Transferencia bancaria', 'banco', 'Pago con depósito o transferencia bancaria.', '2024-03-30 02:07:34', '2025-08-07 18:30:54'),
(3, 'Crédito (pago a crédito en cuotas)', 'gift_card', 'El cliente paga mediante abonos, créditos, cupones u otro mecanismo.', '2024-03-30 02:07:34', '2025-08-07 18:30:41'),
(4, 'Tarjeta de crédito o débito', 'credit', 'Pagos realizados desde POS, neonet o credomatic.', '2024-03-30 02:07:34', '2025-08-07 17:43:43'),
(5, 'Cheque', 'cheque', 'Pago con cheque del sistema bancario', '2025-08-07 12:31:12', '2025-08-07 18:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `pmethod_to_store`
--

CREATE TABLE `pmethod_to_store` (
  `p2s_id` int NOT NULL,
  `ppmethod_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pmethod_to_store`
--

INSERT INTO `pmethod_to_store` (`p2s_id`, `ppmethod_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1),
(4, 4, 1, 1, 4),
(5, 3, 1, 1, 3),
(9, 5, 1, 1, 0),
(10, 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pos_register`
--

CREATE TABLE `pos_register` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `opening_balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `closing_balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos_templates`
--

CREATE TABLE `pos_templates` (
  `template_id` int NOT NULL,
  `template_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `template_content` longtext CHARACTER SET ucs2 COLLATE ucs2_general_ci NOT NULL,
  `template_css` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pos_templates`
--

INSERT INTO `pos_templates` (`template_id`, `template_name`, `template_content`, `template_css`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Default', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{ logo_url }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Invoice ID:&lt;/td&gt;\n                    &lt;td&gt;{{ invoice_id }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;VAT-Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ vat_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td&gt;{{ date_time }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;&lt;span&gt;GST Reg:&lt;/td&gt;\n                    &lt;td&gt;{{ gst_reg }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Customer Name:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_name }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Phone:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_phone }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;Address:&lt;/td&gt;\n                    &lt;td&gt;{{ customer_address }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-30&quot;&gt;GTIN:&lt;/td&gt;\n                    &lt;td&gt;{{ gtin }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;h4 class=&quot;main-title&quot;&gt;INVOICE&lt;/h4&gt;\n        \n        {{ if items }}\n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;Name&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ item_name }} \n                                {{ if invoice_view == indian_gst }} \n                                    &lt;small&gt;[HSN-{{ hsn_code }}]&lt;/small&gt;\n                                {{ endif }}\n                            &lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }} {{ unitName }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Amt:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Order Tax:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ if invoice_view == \'indian_gst\' }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;CGST:&lt;/td&gt;\n                    &lt;td&gt;{{ cgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;SGST:&lt;/td&gt;\n                    &lt;td&gt;{{ sgst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;IGST:&lt;/td&gt;\n                    &lt;td&gt;{{ igst }}&lt;/td&gt;\n                &lt;/tr&gt;\n                {{ endif }}\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Discount:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Shipping Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Others Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Total Due:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Prev. Due Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ prev_due_paid }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area italic&quot;&gt;\n            &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;In Text:&lt;/b&gt; {{ amount_in_text }}&lt;/span&gt;&lt;br&gt;\n            {{ if invoice_note }}\n                &lt;span class=&quot;text-small&quot;&gt;&lt;b&gt;Note:&lt;/b&gt; {{ invoice_note }}&lt;/span&gt;\n            {{ endif }}\n        &lt;/section&gt;\n\n        {{ if return_items }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Returns&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-5 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Returned at&lt;/td&gt;\n                    &lt;td class=&quot;w-30 text-center&quot;&gt;Item Name&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amt&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{return_items}}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{/return_items}}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        \n        {{ if payments }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Payments&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-10 text-center&quot;&gt;Sl.&lt;/td&gt;\n                    &lt;td class=&quot;w-50 text-center&quot;&gt;Payment Method&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Amount&lt;/td&gt;\n                    &lt;td class=&quot;w-20 text-right&quot;&gt;Balance&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ payments }}\n                        &lt;tr&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ sl }}&lt;/td&gt;\n                            &lt;td&gt;{{ name }} by {{ by }} on {{ created_at }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ amount }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ pos_balance }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /payments }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n           \n        {{ if invoice_view != \'standard\' }}\n        {{ if taxes }}\n        &lt;section class=&quot;listing-area payment-list&quot;&gt;\n            &lt;div class=&quot;heading&quot;&gt;\n                &lt;h2 class=&quot;sub-title&quot;&gt;Tax Information&lt;/h2&gt;\n            &lt;/div&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;td class=&quot;w-25&quot;&gt;Name&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-center&quot;&gt;Code&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Qty&lt;/td&gt;\n                    &lt;td class=&quot;w-25 text-right&quot;&gt;Tax Amt.&lt;/td&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ taxes }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ taxrate_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ code_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ qty }}&lt;/td&gt; \n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_tax }}&lt;/td&gt; \n                        &lt;/tr&gt;\n                    {{ /taxes }}\n                    {{ if invoice_view == \'indian_gst\' }}\n                        &lt;tr class=&quot;bg-gray&quot;&gt;\n                            &lt;td&gt;Order Tax: {{ order_tax }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;CGST: {{ cgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;SGST: {{ sgst }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;IGST: {{ igst }}&lt;/td&gt;\n                        &lt;/tr&gt;\n                     {{ endif }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        {{ endif }}\n        {{ endif }}\n        \n        {{ if barcode }}\n        &lt;section class=&quot;info-area barcode-area&quot;&gt;\n            {{ barcode }}\n        &lt;/section&gt;\n        {{ endif }}\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt;\n            &lt;span class=&quot;block bold&quot;&gt;{{ footer_text }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .main-title {\n            font-size: 14px;\n            font-weight: 700;\n            text-align: center;\n            margin: 10px 0 5px 0;\n            padding: 0;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:12px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n    \n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 24px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Customer Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n        font-weight: bold;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}', '2024-03-30 02:07:34', '2024-03-30 02:07:34', 1),
(2, 'Minimal', '&lt;section class=&quot;receipt-template&quot;&gt;\n\n        &lt;header class=&quot;receipt-header&quot;&gt;\n            &lt;div class=&quot;logo-area&quot;&gt;\n                &lt;img class=&quot;logo&quot; src=&quot;{{  logo_url  }}&quot;&gt;\n            &lt;/div&gt;\n            &lt;h2 class=&quot;store-name&quot;&gt;{{ store_name }}&lt;/h2&gt;\n            &lt;div class=&quot;address-area&quot;&gt;\n                &lt;span class=&quot;info address&quot;&gt;{{ store_address }}&lt;/span&gt;\n                &lt;div class=&quot;block&quot;&gt;\n                    &lt;span class=&quot;info phone&quot;&gt;Mobile: {{ store_phone }}&lt;/span&gt;, &lt;span class=&quot;info email&quot;&gt;Email: {{ store_email }}&lt;/span&gt;\n                &lt;/div&gt;\n            &lt;/div&gt;\n        &lt;/header&gt;\n        \n        &lt;div class=&quot;heading&quot;&gt;\n            &lt;h2 class=&quot;title text-center zero-around title-lg&quot;&gt;INVOICE&lt;/h2&gt;\n        &lt;/div&gt;\n        \n        &lt;section class=&quot;info-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;&lt;span&gt;Bill #:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo billno&quot;&gt;&lt;span&gt;{{ invoice_id }}&lt;/span&gt;&lt;/td&gt;\n                    &lt;td class=&quot;w-10 text-right&quot;&gt;&lt;span&gt;Date:&lt;/td&gt;\n                    &lt;td class=&quot;w-40 text-center sinfo date&quot;&gt;&lt;span&gt;{{ date_time }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-10&quot;&gt;M/S:&lt;/td&gt;\n                    &lt;td class=&quot;w-90&quot; colspan=&quot;3&quot;&gt;&lt;span class=&quot;text-lg&quot;&gt;{{ customer_name }}&lt;/span&gt;&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;listing-area item-list&quot;&gt;\n            &lt;table&gt;\n                &lt;thead&gt;\n                    &lt;tr&gt;\n                        &lt;td class=&quot;w-40 text-center&quot;&gt;DESC.&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-center&quot;&gt;Qty&lt;/td&gt;\n                        &lt;td class=&quot;w-15 text-right&quot;&gt;Price&lt;/td&gt;\n                        &lt;td class=&quot;w-20 text-right&quot;&gt;AMT&lt;/td&gt;\n                    &lt;/tr&gt;\n                &lt;/thead&gt;\n                &lt;tbody&gt;\n                    {{ items }}\n                        &lt;tr&gt;\n                            &lt;td&gt;{{ item_name }}&lt;/td&gt;\n                            &lt;td class=&quot;text-center&quot;&gt;{{ item_quantity }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_price }}&lt;/td&gt;\n                            &lt;td class=&quot;text-right&quot;&gt;{{ item_total }}&lt;/td&gt;   \n                        &lt;/tr&gt;\n                    {{ /items }}\n                &lt;/tbody&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area calculation-area&quot;&gt;\n            &lt;table&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Subtotal:&lt;/td&gt;\n                    &lt;td&gt;{{ subtotal }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Order Tax:&lt;/td&gt;\n                    &lt;td&gt;{{ order_tax }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Discount:&lt;/td&gt;\n                    &lt;td&gt;{{ discount_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Shipping Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ shipping_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Others Chrg:&lt;/td&gt;\n                    &lt;td&gt;{{ others_charge }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Previous Due:&lt;/td&gt;\n                    &lt;td&gt;{{ previous_due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Total:&lt;/td&gt;\n                    &lt;td&gt;{{ payable_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Amount Paid:&lt;/td&gt;\n                    &lt;td&gt;{{ paid_amount }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Due:&lt;/td&gt;\n                    &lt;td&gt;{{ due }}&lt;/td&gt;\n                &lt;/tr&gt;\n                &lt;tr&gt;\n                    &lt;td class=&quot;w-70&quot;&gt;Change:&lt;/td&gt;\n                    &lt;td&gt;{{ change }}&lt;/td&gt;\n                &lt;/tr&gt;\n            &lt;/table&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;stylish-footer text-center&quot;&gt;\n            &lt;span&gt;Printed On: {{ printed_on }}&lt;/span&gt;\n        &lt;/section&gt;\n        \n        &lt;section class=&quot;info-area align-center footer-area&quot;&gt;\n            &lt;span class=&quot;block&quot;&gt;Sold product No Claim. No Change, New product One Month Warranty.&lt;/span&gt;\n            &lt;span class=&quot;block bold&quot;&gt;Thank You for Choosing Us.&lt;/span&gt;\n        &lt;/section&gt;\n        \n &lt;/section&gt;', '/*Common CSS*/\n        .receipt-template {\n            width:302px;\n            margin:0 auto;\n        }\n        .receipt-template .text-small {\n            font-size: 10px;\n        }\n        .receipt-template .block {\n            display: block;\n        }\n        .receipt-template .inline-block {\n            display: inline-block;\n        }\n        .receipt-template .bold {\n            font-weight: 700;\n        }\n        .receipt-template .italic {\n            font-style: italic;\n        }\n        .receipt-template .align-right {\n            text-align: right;\n        }\n        .receipt-template .align-center {\n            text-align: center;\n        }\n        .receipt-template .heading {\n            position: relation;\n        }\n        .receipt-template .title {\n            font-size: 16px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template .sub-title {\n            font-size: 12px;\n            font-weight: 700;\n            margin: 10px 0 5px 0;\n        }\n        .receipt-template table {\n            width: 100%;\n        }\n        .receipt-template td,\n        .receipt-template th {\n            font-size:10px;\n        }\n        .receipt-template .info-area {\n            font-size: 12px;      \n            line-height: 1.222;  \n        }\n        .receipt-template .listing-area {\n            line-height: 1.222;\n        }\n        .receipt-template .listing-area table {}\n        .receipt-template .listing-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n            font-weight: 700;\n        }\n        .receipt-template .listing-area table tbody tr {\n            border-top: 1px dashed #000;\n            border-bottom: 1px dashed #000;\n        }\n        .receipt-template .listing-area table tbody tr:last-child {\n            border-bottom: none;\n        }\n        .receipt-template .listing-area table td {\n            vertical-align: top;\n        }\n        .receipt-template .info-area table {}\n        .receipt-template .info-area table thead tr {\n            border-top: 1px solid #000;\n            border-bottom: 1px solid #000;\n        }\n\n /*Receipt Heading*/\n        .receipt-template .receipt-header {\n            text-align: center;\n        }\n        .receipt-template .receipt-header .logo-area {\n            width: 80px;\n            height: 80px;\n            margin: 0 auto;\n        }\n        .receipt-template .receipt-header .logo-area img.logo {\n            display: inline-block;\n            max-width: 100%;\n            max-height: 100%;\n        }\n        .receipt-template .receipt-header .address-area {\n            margin-bottom: 5px;\n            line-height: 1;\n        }\n        .receipt-template .receipt-header .info {\n            font-size: 12px;\n        }\n        .receipt-template .receipt-header .store-name {\n            font-size: 28px;\n            font-weight: 700;\n            margin: 0;\n            padding: 0;\n        }\n        \n        \n/*Invoice Info Area*/ \n    .receipt-template .invoice-info-area {}\n    \n/*Customer Info Area*/\n    .receipt-template .customer-area {\n        margin-top:10px;\n    }\n\n/*Calculation Area*/\n    .receipt-template .calculation-area {\n        border-top: 2px solid #000;\n    }\n    .receipt-template .calculation-area table td {\n        text-align: right;\n    }\n    .receipt-template .calculation-area table td:nth-child(2) {\n        border-bottom: 1px dashed #000;\n    }\n\n/*Item Listing*/\n    .receipt-template .item-list table tr {\n    }\n    \n/*Barcode Area*/\n    .receipt-template .barcode-area {\n        margin-top: 10px;\n        text-align: center;\n    }\n    .receipt-template .barcode-area img {\n        max-width: 100%;\n        display: inline-block;\n    }\n    \n/*Footer Area*/\n    .receipt-template .footer-area {\n        line-height: 1.222;\n        font-size: 10px;\n    }\n \n/*Media Query*/\n    @media print {\n        .receipt-template {\n            width: 100%;\n        }\n    }\n    @media all and (max-width: 215px) {}\n    \n    \n/* Additional */\n        .receipt-template .zero-around {\n            margin:0;\n            padding: 0;\n        }\n        .receipt-template .title-lg {\n            font-size: 18px!important;\n            margin-bottom: 5px;\n         }\n         .receipt-template .text-lg {\n             font-size: 18px;\n             font-weight: 700;\n         }\n         .receipt-template .info-area td {\n             vertical-align: center;\n         }\n         .receipt-template .info-area td.sinfo {\n             padding: 1px!important;\n         }\n         .receipt-template .info-area td.sinfo span {\n             display: block;\n             font-weight: 700;\n             border: 1px solid #000;\n             padding: 2px;\n         }\n         .receipt-template .listing-area td, .receipt-template .listing-area th, .receipt-template .calculation-area table td {\n             font-size: 13px;\n             font-weight: 700;\n         }\n         .receipt-template .item-list table thead td {\n             text-align: center;\n             padding: 3px;\n             border: 2px solid #000;\n          }\n          .receipt-template .stylish-footer {\n              margin: 10px 0 5px 0;\n          }\n          .receipt-template .stylish-footer span {\n              display: inline-block;\n              font-size: 12px;\n              border-top: 1px dashed #000;\n              border-bottom: 1px dashed #000; \n          }\n', '2024-03-30 02:07:34', '2024-03-30 02:07:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_template_to_store`
--

CREATE TABLE `pos_template_to_store` (
  `pt2s` int NOT NULL,
  `store_id` int NOT NULL,
  `ttemplate_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pos_template_to_store`
--

INSERT INTO `pos_template_to_store` (`pt2s`, `store_id`, `ttemplate_id`, `is_active`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `printer_id` int NOT NULL,
  `title` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `profile` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `char_per_line` tinyint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`printer_id`, `title`, `type`, `profile`, `char_per_line`, `created_at`) VALUES
(1, 'Impresora A1234', 'network', '', 200, '2024-03-30 02:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `printer_to_store`
--

CREATE TABLE `printer_to_store` (
  `p2s_id` int NOT NULL,
  `pprinter_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `port` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `printer_to_store`
--

INSERT INTO `printer_to_store` (`p2s_id`, `pprinter_id`, `store_id`, `path`, `ip_address`, `port`, `status`, `sort_order`) VALUES
(1, 1, 1, '', '127.0.0.1', '9101', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int UNSIGNED NOT NULL,
  `p_type` enum('standard','service') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'standard',
  `p_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hsn_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `barcode_symbology` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `p_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int UNSIGNED NOT NULL DEFAULT '0',
  `unit_id` int UNSIGNED NOT NULL,
  `p_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `components` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_type`, `p_code`, `hsn_code`, `barcode_symbology`, `p_name`, `category_id`, `unit_id`, `p_image`, `description`, `components`) VALUES
(11, 'standard', '5543', NULL, 'code128', 'Comida para perros', 3, 3, '/imagenes/espensa.jpg', 'Sin descripción', 'pollo, carnes, vitamias'),
(12, 'standard', '34534534', NULL, 'code128', 'Comida para Gatos', 3, 3, '/imagenes/italian.jpg', 'sin descripción', 'pollo, carnes, vitamias'),
(15, 'standard', '45020', NULL, 'code128', 'PARAFOS FORTE 48 EC 125 CC', 4, 7, '/61389852_1384494688384532_5071485391568109568_n.jpg', '', ''),
(16, 'standard', '490104', NULL, 'code128', 'GROW MORE 20-20-20/ 1 KILO', 5, 3, '/grow.jpg', '', ''),
(17, 'standard', '313101', NULL, 'code128', 'INCIPIO 20 SC 500 ML', 4, 7, '/images.jpg', '', ''),
(18, 'standard', '1258004', NULL, 'code128', 'Ultra K Litro', 5, 7, '/ultra-k.jpg', 'Fertilizante hidrosoluble con alto contenido de Potasio, para uso en cultivo de tomate', 'nitrogeno, fosforo, potasio'),
(19, 'standard', '448898', NULL, 'code128', 'producto prueba', 5, 7, '', 'producto prueba', 'materiales para el pelo brilloso'),
(20, 'standard', '59257', NULL, 'code128', 'MF-G SUPER 15 (15-10-10) 45.36KG', 5, 3, '/15.png', 'El nitrógeno es fundamental en las fases de activo crecimiento vegetativo, permitiendo al cultivo desarrollarse de buena manera. El fósforo es importante en la etapa de establecimiento del cultivo y en todos los procesos que requieran de energía. El potasio participa en la regulación hídrica e la planta, además favorece el llenado de frutos y órganos de cosecha.', 'concentración con un balance 1.5:1 de nitrógeno y potasio'),
(21, 'standard', '59258', NULL, 'code128', 'MF-SUPER 20 (20-13.5-0) 45.36KG', 5, 3, '/-20-.png', 'El nitrógeno es fundamental en las fases de activo crecimiento vegetativo, permitiendo al cultivo desarrollarse de buena manera. El fósforo es importante en la etapa de establecimiento del cultivo y en todos los procesos que requieran de energía.\r\nSe recomienda utilizar en etapas tempranas de establecimiento del cultivo donde se necesita generar biomasa.', '20% Nitrógeno (N) 13.5% Fósforo (P2O5) '),
(22, 'standard', '59252', NULL, 'code128', 'MF-G 15-15-15 45.36 KG', 5, 18, '', '', ''),
(23, 'standard', '485801', NULL, 'code128', 'TOXIPET 50G', 6, 1, '', 'CARBON ACTIVADO PARA TRATAR INTOXICACION EN ANIMALES ', 'CARBON ACTIVADO'),
(24, 'standard', '123', NULL, 'code128', 'BOLSAS PARA ALMACIGO 4X8X2 PAQUETE DE 500 UNIDADES', 1, 9, '', 'BOLSAS PARA ALMACIGO DE CAFE', ''),
(25, 'standard', '456', NULL, 'code128', 'PAQUETE DE 500 UNIDADES DE BOLSAS PARA ALMACIGO 5X8X2 ', 1, 9, '', '', ''),
(26, 'standard', '789', NULL, 'code128', 'PAQUETE DE 500 BOLSAS PARA ALMACIGO DE 6X8X2 ', 1, 9, '', 'BOLSAS PARA ALMACIGO DE CAFÉ\r\n', ''),
(27, 'standard', '12345678910', NULL, 'ean5', 'PRUEBA PRODUCTO 23092025', 7, 7, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int NOT NULL,
  `product_id` int NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `url`, `sort_order`) VALUES
(9, 16, '/grow.jpg', 1),
(10, 16, '/frr.jpg', 2),
(11, 15, '/arfos-48--1024x1024.png', 1),
(12, 15, '/61389852_1384494688384532_5071485391568109568_n.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_store_presentation`
--

CREATE TABLE `product_store_presentation` (
  `id` int NOT NULL,
  `id_product_store` int UNSIGNED NOT NULL,
  `unit_id` int DEFAULT NULL,
  `price_no_tax` decimal(25,2) NOT NULL,
  `tax` decimal(25,2) NOT NULL,
  `price_with_tax` decimal(25,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `product_store_presentation`
--

INSERT INTO `product_store_presentation` (`id`, `id_product_store`, `unit_id`, `price_no_tax`, `tax`, `price_with_tax`) VALUES
(42, 17, 3, '0.00', '0.12', '0.00'),
(43, 17, 4, '0.00', '0.12', '0.00'),
(44, 17, 5, '0.00', '0.12', '0.00'),
(45, 17, 6, '0.00', '0.12', '0.00'),
(46, 18, 3, '0.00', '0.12', '0.00'),
(47, 18, 4, '0.00', '0.12', '0.00'),
(48, 18, 5, '0.00', '0.12', '0.00'),
(49, 18, 6, '0.00', '0.12', '0.00'),
(50, 19, 3, '0.00', '0.12', '0.00'),
(51, 19, 4, '0.00', '0.12', '0.00'),
(52, 19, 5, '0.00', '0.12', '0.00'),
(53, 19, 6, '0.00', '0.12', '0.00'),
(54, 20, 3, '0.00', '0.12', '0.00'),
(55, 20, 4, '0.00', '0.12', '0.00'),
(56, 20, 5, '0.00', '0.12', '0.00'),
(57, 20, 6, '0.00', '0.12', '0.00'),
(75, 25, 7, '0.00', '0.12', '0.00'),
(76, 25, 8, '0.00', '0.12', '0.00'),
(77, 25, 11, '0.00', '0.12', '0.00'),
(78, 25, 12, '0.00', '0.12', '0.00'),
(79, 25, 13, '0.00', '0.12', '0.00'),
(80, 25, 14, '0.00', '0.12', '0.00'),
(81, 25, 15, '0.00', '0.12', '0.00'),
(82, 25, 16, '0.00', '0.12', '0.00'),
(83, 25, 17, '0.00', '0.12', '0.00'),
(84, 26, 3, '0.00', '0.12', '0.00'),
(85, 26, 4, '0.00', '0.12', '0.00'),
(86, 26, 5, '0.00', '0.12', '0.00'),
(87, 26, 6, '0.00', '0.12', '0.00'),
(88, 27, 7, '10.00', '0.12', '11.20'),
(89, 27, 8, '10.00', '0.12', '11.20'),
(90, 27, 11, '10.00', '0.12', '11.20'),
(91, 27, 12, '10.00', '0.12', '11.20'),
(92, 27, 13, '10.00', '0.12', '11.20'),
(93, 27, 14, '10.00', '0.12', '11.20'),
(94, 27, 15, '10.00', '0.12', '11.20'),
(95, 27, 16, '10.00', '0.12', '11.20'),
(96, 27, 17, '10.00', '0.12', '11.20'),
(97, 28, 7, '0.00', '0.12', '0.00'),
(98, 28, 8, '0.00', '0.12', '0.00'),
(99, 28, 11, '0.00', '0.12', '0.00'),
(100, 28, 12, '0.00', '0.12', '0.00'),
(101, 28, 13, '0.00', '0.12', '0.00'),
(102, 28, 14, '0.00', '0.12', '0.00'),
(103, 28, 15, '0.00', '0.12', '0.00'),
(104, 28, 16, '0.00', '0.12', '0.00'),
(105, 28, 17, '0.00', '0.12', '0.00'),
(106, 29, 7, '0.00', '0.12', '0.00'),
(107, 29, 8, '0.00', '0.12', '0.00'),
(108, 29, 11, '0.00', '0.12', '0.00'),
(109, 29, 12, '0.00', '0.12', '0.00'),
(110, 29, 13, '0.00', '0.12', '0.00'),
(111, 29, 14, '0.00', '0.12', '0.00'),
(112, 29, 15, '0.00', '0.12', '0.00'),
(113, 29, 16, '0.00', '0.12', '0.00'),
(114, 29, 17, '0.00', '0.12', '0.00'),
(115, 30, 7, '0.00', '0.12', '0.00'),
(116, 30, 8, '0.00', '0.12', '0.00'),
(117, 30, 11, '0.00', '0.12', '0.00'),
(118, 30, 12, '0.00', '0.12', '0.00'),
(119, 30, 13, '0.00', '0.12', '0.00'),
(120, 30, 14, '0.00', '0.12', '0.00'),
(121, 30, 15, '0.00', '0.12', '0.00'),
(122, 30, 16, '0.00', '0.12', '0.00'),
(123, 30, 17, '0.00', '0.12', '0.00'),
(124, 31, 3, '0.00', '0.12', '0.00'),
(125, 31, 4, '0.00', '0.12', '0.00'),
(126, 31, 5, '0.00', '0.12', '0.00'),
(127, 31, 6, '0.00', '0.12', '0.00'),
(128, 31, 18, '0.00', '0.12', '0.00'),
(129, 31, 19, '0.00', '0.12', '0.00'),
(130, 32, 3, '0.00', '0.12', '0.00'),
(131, 32, 4, '0.00', '0.12', '0.00'),
(132, 32, 5, '0.00', '0.12', '0.00'),
(133, 32, 6, '0.00', '0.12', '0.00'),
(134, 32, 18, '0.00', '0.12', '0.00'),
(135, 32, 19, '0.00', '0.12', '0.00'),
(136, 33, 3, '0.00', '0.12', '0.00'),
(137, 33, 4, '0.00', '0.12', '0.00'),
(138, 33, 5, '0.00', '0.12', '0.00'),
(139, 33, 6, '0.00', '0.12', '0.00'),
(140, 33, 18, '0.00', '0.12', '0.00'),
(141, 33, 19, '0.00', '0.12', '0.00'),
(142, 34, 1, '0.00', '0.12', '0.00'),
(143, 35, 9, '0.00', '0.12', '0.00'),
(144, 36, 9, '0.00', '0.12', '0.00'),
(145, 37, 9, '0.00', '0.12', '0.00'),
(146, 38, 7, '10.00', '0.12', '11.20'),
(147, 38, 8, '10.00', '0.12', '11.20'),
(148, 38, 11, '10.00', '0.12', '11.20'),
(149, 38, 12, '10.00', '0.12', '11.20'),
(150, 38, 13, '10.00', '0.12', '11.20'),
(151, 38, 14, '10.00', '0.12', '11.20'),
(152, 38, 15, '10.00', '0.12', '11.20'),
(153, 38, 16, '10.00', '0.12', '11.20'),
(154, 38, 17, '10.00', '0.12', '11.20');

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

CREATE TABLE `product_to_store` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `purchase_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `sell_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `quantity_in_stock` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `alert_quantity` decimal(25,4) NOT NULL DEFAULT '10.0000',
  `sup_id` int UNSIGNED NOT NULL,
  `brand_id` int DEFAULT '0',
  `box_id` int UNSIGNED DEFAULT '0',
  `taxrate_id` int UNSIGNED DEFAULT NULL,
  `tax_method` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'inclusive',
  `preference` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `e_date` date DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `alert_unit` int DEFAULT NULL,
  `average_cost` float DEFAULT NULL,
  `item_purchase_without_tax` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `product_to_store`
--

INSERT INTO `product_to_store` (`id`, `product_id`, `store_id`, `purchase_price`, `sell_price`, `quantity_in_stock`, `alert_quantity`, `sup_id`, `brand_id`, `box_id`, `taxrate_id`, `tax_method`, `preference`, `e_date`, `p_date`, `status`, `sort_order`, `alert_unit`, `average_cost`, `item_purchase_without_tax`) VALUES
(17, 11, 1, '50.0000', '0.0000', '30000.0000', '3000.0000', 5, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-08', '2025-09-08', 1, 0, 3, 44.64, '44.64'),
(18, 11, 2, '50.0000', '0.0000', '0.0000', '3000.0000', 5, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-08', '2025-09-08', 1, 0, 3, NULL, NULL),
(19, 12, 1, '44.0000', '0.0000', '90040.0000', '2267.9600', 5, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-08', '2025-09-08', 1, 0, 5, 40.78, '39.29'),
(20, 12, 2, '44.0000', '0.0000', '0.0000', '2267.9600', 5, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-08', '2025-09-08', 1, 0, 5, NULL, NULL),
(25, 15, 1, '0.0000', '0.0000', '7500.0000', '10.0000', 12, NULL, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-12', '2025-09-12', 1, 1, 8, 16.52, '0.00'),
(26, 16, 1, '48.0000', '0.0000', '80000.0000', '10000.0000', 13, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-12', '2025-09-12', 1, 0, 3, 42.86, '42.86'),
(27, 17, 1, '1259.0000', '0.0000', '24000.0000', '10.0000', 14, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-12', '2025-09-12', 1, 1, 8, 1124.11, '1124.11'),
(28, 18, 1, '57.5000', '0.0000', '520000.0000', '20000.0000', 15, 1, 0, NULL, 'inclusive', 'a:0:{}', '2028-09-12', '2025-09-12', 1, 10, 7, 25.67, '51.34'),
(29, 19, 1, '0.0000', '0.0000', '0.0000', '10000.0000', 12, NULL, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-16', '2025-09-16', 1, 0, 7, NULL, NULL),
(30, 19, 2, '0.0000', '0.0000', '0.0000', '10000.0000', 12, NULL, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-16', '2025-09-16', 1, 0, 7, NULL, NULL),
(31, 20, 1, '192.5056', '0.0000', '525000.0000', '907184.0000', 16, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-22', '2025-09-22', 1, 1, 18, 171.88, '171.88'),
(32, 21, 1, '196.9408', '0.0000', '525000.0000', '907184.0000', 16, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-22', '2025-09-22', 1, 1, 18, 175.84, '175.84'),
(33, 22, 1, '239.2992', '0.0000', '6803880.0000', '453592.0000', 16, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-22', '2025-09-22', 1, 0, 18, 213.66, '213.66'),
(34, 23, 1, '30.0000', '0.0000', '0.0000', '0.0000', 17, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-22', '2025-09-22', 1, 50, 1, 26.79, '26.79'),
(35, 24, 1, '0.0000', '0.0000', '0.0000', '10.0000', 18, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-15', '2025-09-22', 1, 15, 9, NULL, NULL),
(36, 25, 1, '0.0000', '0.0000', '0.0000', '10.0000', 18, NULL, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-15', '2025-09-22', 1, 15, 9, NULL, NULL),
(37, 26, 1, '0.0000', '0.0000', '0.0000', '10.0000', 18, 1, 0, NULL, 'inclusive', 'a:0:{}', '2026-09-15', '2025-09-22', 1, 15, 9, NULL, NULL),
(38, 27, 1, '10.0000', '10.0000', '0.0000', '100000.0000', 5, 1, 0, NULL, 'inclusive', 'a:0:{}', '2029-11-29', '2025-09-23', 1, 5, 7, 8.93, '8.93');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_documents`
--

CREATE TABLE `purchase_documents` (
  `id_purchase_document` int NOT NULL,
  `id_purchase_info` int UNSIGNED NOT NULL,
  `id_document_type` int NOT NULL,
  `document_number` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `date` date NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `document_value` double(10,2) NOT NULL DEFAULT '0.00',
  `entry_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `purchase_documents`
--
-- --------------------------------------------------------

--
-- Table structure for table `purchase_info`
--

CREATE TABLE `purchase_info` (
  `info_id` int UNSIGNED NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `inv_type` enum('purchase','transfer') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'purchase',
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `sup_id` int UNSIGNED DEFAULT NULL,
  `total_item` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` enum('stock','active','sold') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'stock',
  `total_sell` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `purchase_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `attachment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_visible` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `payment_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'due',
  `checkout_status` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_status` enum('received','pending','ordered') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'received',
  `created_by` int NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_document_type` int DEFAULT NULL,
  `document_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `number_correlativo` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type_purchase_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `purchase_info`
--


-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `item_id` int UNSIGNED NOT NULL DEFAULT '0',
  `category_id` int NOT NULL DEFAULT '0',
  `brand_id` int DEFAULT '0',
  `item_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_purchase_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_selling_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_sell` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` enum('stock','active','sold','cancel') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'stock',
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `tax_method` enum('exclusive','inclusive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'exclusive',
  `tax` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gst` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `return_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `installment_quantity` int NOT NULL DEFAULT '0',
  `conversion_to_base` decimal(25,4) DEFAULT NULL,
  `item_purchase_without_tax` decimal(10,2) DEFAULT NULL,
  `discount_item` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `purchase_item`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchase_logs`
--

CREATE TABLE `purchase_logs` (
  `id` int UNSIGNED NOT NULL,
  `sup_id` int UNSIGNED NOT NULL,
  `reference_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_invoice_id` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pmethod_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `store_id` int UNSIGNED NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `purchase_logs`
--
-- --------------------------------------------------------

--
-- Table structure for table `purchase_log_item_price`
--

CREATE TABLE `purchase_log_item_price` (
  `id_purchase_log_item_price` int NOT NULL,
  `id_purchase_document` int NOT NULL,
  `id_purchase_item` int NOT NULL,
  `item_purchase_price` decimal(10,2) DEFAULT '0.00',
  `item_quantity` decimal(10,2) DEFAULT '0.00',
  `item_total` decimal(10,2) DEFAULT '0.00',
  `return_quantity` decimal(10,2) DEFAULT '0.00',
  `item_purchase_without_tax` decimal(10,2) DEFAULT '0.00',
  `discount_item` decimal(10,2) DEFAULT '0.00',
  `item_total_tax` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `purchase_log_item_price`
--
-- --------------------------------------------------------

--
-- Table structure for table `purchase_log_price`
--

CREATE TABLE `purchase_log_price` (
  `id_purchase_log_price` int NOT NULL,
  `id_purchase_documents` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `others_charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payable_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `import_neto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pmethod_id` int DEFAULT NULL,
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `change_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `retencion` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `purchase_log_price`
--
-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'purchase',
  `is_hide` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` int UNSIGNED NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pmethod_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `attachment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_paid` decimal(25,4) DEFAULT '0.0000',
  `balance` decimal(25,4) DEFAULT '0.0000',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `purchase_price`
--

CREATE TABLE `purchase_price` (
  `price_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('percentage','plain') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `shipping_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `others_charge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `order_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payable_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `paid_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `due_paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `due` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `import_neto` decimal(10,2) NOT NULL DEFAULT '0.00',
  `retencion` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `purchase_price`

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `reference_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sup_id` int NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_item` int DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `attachment` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_quantity` decimal(15,4) NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_info`
--

CREATE TABLE `quotation_info` (
  `info_id` int NOT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `customer_mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` enum('sent','pending','complete','canceled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'sent',
  `payment_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quotation_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_installment` tinyint(1) NOT NULL DEFAULT '0',
  `is_order` tinyint(1) NOT NULL DEFAULT '0',
  `total_items` int NOT NULL DEFAULT '0',
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pmethod_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `quotation_info`
--

INSERT INTO `quotation_info` (`info_id`, `reference_no`, `invoice_id`, `store_id`, `customer_id`, `customer_mobile`, `status`, `payment_status`, `quotation_note`, `is_installment`, `is_order`, `total_items`, `address`, `pmethod_details`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '123456', NULL, 1, 3, '', 'sent', 'due', 'prueba', 0, 0, 1, NULL, NULL, 1, '2025-09-23 02:27:56', '2025-09-23 08:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_item`
--

CREATE TABLE `quotation_item` (
  `id` int NOT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `sup_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `brand_id` int DEFAULT '0',
  `item_id` int UNSIGNED NOT NULL,
  `item_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_discount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `tax_method` enum('exclusive','inclusive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int UNSIGNED DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gst` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `purchase_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `quotation_item`
--

INSERT INTO `quotation_item` (`id`, `reference_no`, `store_id`, `sup_id`, `category_id`, `brand_id`, `item_id`, `item_name`, `item_price`, `item_discount`, `item_tax`, `tax_method`, `taxrate_id`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `item_quantity`, `item_purchase_price`, `item_total`, `purchase_invoice_id`) VALUES
(3, '123456', 1, 5, 7, 1, 27, 'PRUEBA PRODUCTO 23092025', '10.0000', '0.0000', '0.0000', 'exclusive', NULL, '0', '0', '0.0000', '0.0000', '0.0000', '2.0000', '0.0000', '20.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_price`
--

CREATE TABLE `quotation_price` (
  `price_id` int NOT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT '0.0000',
  `interest_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `interest_percentage` int NOT NULL DEFAULT '0',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `shipping_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT '0.0000',
  `others_charge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payable_amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `quotation_price`
--

INSERT INTO `quotation_price` (`price_id`, `reference_no`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `interest_amount`, `interest_percentage`, `item_tax`, `order_tax`, `cgst`, `sgst`, `igst`, `total_purchase_price`, `shipping_type`, `shipping_amount`, `others_charge`, `payable_amount`) VALUES
(1, '123456', 1, '20.0000', 'plain', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '0.0000', '20.0000');

-- --------------------------------------------------------

--
-- Table structure for table `regiment_supplier`
--

CREATE TABLE `regiment_supplier` (
  `id_regiment_supplier` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tax` decimal(2,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `porcent` varchar(3) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `regiment_supplier`
--

INSERT INTO `regiment_supplier` (`id_regiment_supplier`, `name`, `tax`, `amount`, `porcent`) VALUES
(1, 'General', '0.15', '2500.00', '15%'),
(2, 'Pequeño  Contribuyente', '0.05', '2500.01', '5%'),
(3, 'Especial de Contribuyente Agropecuario', '0.05', '0.01', '5%');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `reference_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchase_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` int NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `total_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `profit` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_items`
--

CREATE TABLE `return_items` (
  `id` int NOT NULL,
  `store_id` int NOT NULL,
  `reference_no` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `item_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_info`
--

CREATE TABLE `selling_info` (
  `info_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `edit_counter` int UNSIGNED NOT NULL DEFAULT '0',
  `inv_type` enum('sell') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'sell',
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `customer_id` int UNSIGNED NOT NULL DEFAULT '0',
  `customer_mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `invoice_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `total_items` smallint DEFAULT NULL,
  `is_installment` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `pmethod_id` int DEFAULT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `checkout_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_item`
--

CREATE TABLE `selling_item` (
  `id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `brand_id` int DEFAULT '0',
  `sup_id` int UNSIGNED NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `item_id` int UNSIGNED NOT NULL,
  `item_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `item_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_discount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `tax_method` enum('inclusive','exclusive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'exclusive',
  `taxrate_id` int UNSIGNED DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gst` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `item_purchase_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `purchase_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `print_counter` int UNSIGNED DEFAULT '0',
  `print_counter_time` datetime DEFAULT NULL,
  `printed_by` int DEFAULT NULL,
  `return_quantity` decimal(25,4) DEFAULT '0.0000',
  `installment_quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `selling_price`
--

CREATE TABLE `selling_price` (
  `price_id` int NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `store_id` int UNSIGNED NOT NULL DEFAULT '1',
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT '0.0000',
  `interest_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `interest_percentage` int NOT NULL DEFAULT '0',
  `item_tax` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `total_purchase_price` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `shipping_type` enum('plain','percentage') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT '0.0000',
  `others_charge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `payable_amount` decimal(25,4) DEFAULT NULL,
  `paid_amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `due_paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_amount` decimal(25,4) UNSIGNED NOT NULL DEFAULT '0.0000',
  `balance` decimal(25,4) DEFAULT '0.0000',
  `profit` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `previous_due` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `prev_due_paid` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_logs`
--

CREATE TABLE `sell_logs` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `reference_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_invoice_id` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pmethod_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `amount` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `store_id` int UNSIGNED NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `version` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_update_available` tinyint(1) NOT NULL DEFAULT '0',
  `update_version` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `update_link` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `version`, `is_update_available`, `update_version`, `update_link`, `created_at`, `updated_at`) VALUES
(1, '3.4', 0, '', '', '2024-03-30 02:07:34', '2024-03-30 02:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_links`
--

CREATE TABLE `shortcut_links` (
  `id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `href` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `target` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '_self',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `thumbnail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `permission_slug` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `shortcut_links`
--

INSERT INTO `shortcut_links` (`id`, `type`, `href`, `target`, `title`, `icon`, `thumbnail`, `permission_slug`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'report', '/admin/report_overview.php', '', 'Overview Report', 'fa-angle-right', '', 'read_overview_report', 1, 1, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(2, 'report', '/admin/report_collection.php', '', 'Collection Report', 'fa-angle-right', '', 'read_collection_report', 1, 2, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(3, 'report', '/admin/report_customer_due_collection.php', '', 'Due Collection Report', 'fa-angle-right', '', 'read_customer_due_collection_report', 1, 3, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(4, 'report', '/admin/report_supplier_due_paid.php', '', 'Supplier Due Paid Report', 'fa-angle-right', '', 'read_supplier_due_paid_report', 1, 4, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(5, 'report', '/admin/report_sell_itemwise.php', '', 'Sell Report', 'fa-angle-right', '', 'read_sell_report', 1, 5, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(6, 'report', '/admin/report_purchase_supplierwise.php', '', 'Purchase Report', 'fa-angle-right', '', 'read_purchase_report', 1, 6, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(7, 'report', '/admin/report_sell_payment.php', '', 'Sell Payment Report', 'fa-angle-right', '', 'read_sell_payment_report', 1, 7, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(8, 'report', '/admin/report_purchase_payment.php', '', 'Purchase Payment Report', 'fa-angle-right', '', 'read_purchase_payment_report', 1, 8, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(9, 'report', '/admin/report_sell_tax.php', '', 'Sell Tax Report', 'fa-angle-right', '', 'read_sell_tax_report', 1, 9, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(10, 'report', '/admin/report_purchase_tax.php', '', 'Purchase Tax Report', 'fa-angle-right', '', 'read_purchase_tax_report', 1, 10, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(11, 'report', '/admin/report_tax_overview.php', '', 'Tax Overview Report', 'fa-angle-right', '', 'read_tax_overview_report', 1, 11, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(12, 'report', '/admin/report_stock.php', '', 'Stock Report', 'fa-angle-right', '', 'read_stock_report', 1, 12, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(13, 'report', '/admin/bank_transactions.php', '', 'Bank Transaction', 'fa-angle-right', '', 'read_bank_transactions', 1, 13, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(14, 'report', '/admin/bank_account_sheet.php', '', 'Balance Sheet', 'fa-angle-right', '', 'read_bank_account_sheet', 1, 14, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(15, 'report', '/admin/income_monthwise.php', '', 'Income Monthwise Report', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(16, 'report', '/admin/report_income_and_expense.php', '', 'Income vs Expense Report', 'fa-angle-right', '', 'read_income_and_expense_report', 1, 16, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(17, 'report', '/admin/report_profit_and_loss.php', '', 'Profit vs Loss Report', 'fa-angle-right', '', 'read_profit_and_loss_report', 1, 17, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(18, 'report', '/admin/report_cashbook.php', '', 'Cashbook', 'fa-angle-right', '', 'read_cashbook_report', 1, 18, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(19, 'report', '/admin/expense_monthwise.php', '', 'Expense Monthwise Report', 'fa-angle-right', '', 'read_income_monthwise', 1, 15, '2024-03-30 02:07:34', '2024-03-30 02:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `sms_schedule`
--

CREATE TABLE `sms_schedule` (
  `id` int UNSIGNED NOT NULL,
  `schedule_datetime` datetime DEFAULT NULL,
  `store_id` int UNSIGNED NOT NULL,
  `people_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `people_sms_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `people_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sms_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `sms_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'TEXT',
  `campaign_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `process_status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `total_try` int NOT NULL DEFAULT '0',
  `response_text` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `api_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auth_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `contact` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `maskname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `campaignname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unicode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `type`, `api_id`, `auth_key`, `sender_id`, `contact`, `username`, `password`, `maskname`, `campaignname`, `unicode`, `country_code`, `url`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', '', '', '', '', '', '', '', '', '', '', '', 1, 0, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(2, 'Msg91', '', '', '', '', '', '', '', '', '', '', 'http://api.msg91.com/api/v2/', 1, 0, '2024-03-30 02:07:34', '2024-03-30 02:07:34'),
(3, 'Mimsms', '', '', '', '', '', '', '', '', '', '', 'https://www.mimsms.com.bd/smsAPI?', 1, 0, '2024-03-30 02:07:34', '2024-03-30 02:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'USD',
  `vat_reg_no` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cashier_id` int UNSIGNED NOT NULL,
  `address` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `receipt_printer` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cash_drawer_codes` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `char_per_line` tinyint NOT NULL DEFAULT '42',
  `remote_printing` tinyint(1) NOT NULL DEFAULT '1',
  `printer` int DEFAULT NULL,
  `order_printers` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `auto_print` tinyint(1) NOT NULL DEFAULT '0',
  `is_store` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Tienda, 0 = Camión',
  `local_printers` tinyint(1) DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `favicon` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `preference` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sound_effect` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `feedback_status` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'ready',
  `feedback_at` datetime DEFAULT NULL,
  `deposit_account_id` int DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `code_name`, `mobile`, `email`, `country`, `zip_code`, `currency`, `vat_reg_no`, `cashier_id`, `address`, `receipt_printer`, `cash_drawer_codes`, `char_per_line`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `is_store`, `local_printers`, `logo`, `favicon`, `preference`, `sound_effect`, `sort_order`, `feedback_status`, `feedback_at`, `deposit_account_id`, `thumbnail`, `status`, `created_at`) VALUES
(1, 'Agrotactic - Central', 'Central', '1234567890', 'info@agrotactic.com.gt', 'GT', '16004', 'USD', '', 2, '5-56 Zona 1 Tactic, Alta Verapaz, Guatemala', '1', NULL, 42, 0, 1, '[\"1\"]', 0, 1, 1, '1_logo.jpg', '1_favicon.png', 'a:18:{s:8:\"timezone\";s:19:\"America/Mexico_City\";s:21:\"invoice_edit_lifespan\";i:1440;s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";i:1440;s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:3:\"tax\";i:0;s:20:\"stock_alert_quantity\";i:10;s:20:\"datatable_item_limit\";i:25;s:15:\"after_sell_page\";s:3:\"pos\";s:19:\"invoice_footer_text\";s:26:\"Thank you for choosing us!\";s:10:\"email_from\";s:8:\"Admin360\";s:13:\"email_address\";s:2:\"US\";s:12:\"email_driver\";s:11:\"smtp_server\";s:9:\"smtp_host\";s:14:\"smtp.gmail.com\";s:13:\"smtp_username\";s:25:\"albertcasti0919@gmail.com\";s:13:\"smtp_password\";s:16:\"twjljbkdefrsbgpr\";s:9:\"smtp_port\";i:465;s:7:\"ssl_tls\";s:3:\"ssl\";}', 0, 0, 'ready', '2019-03-01 14:29:18', 0, NULL, 1, '2024-03-30 02:07:34'),
(2, 'AGROTACSA', 'agrotacsa', '42180802', 'agrotactic@gmail.com', 'GT', '160004', 'USD', '', 2, '4ta CALLE Y 6TA AVENIDA 5-56 BARRIO SAN JACINTO TACTIC, A.V.', '1', NULL, 42, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 1, 0, 'ready', NULL, NULL, NULL, 1, '2025-08-07 16:52:45'),
(5, 'Camion Agro', 'camion_agro', '364571892', 'camion@agro.com.gt', 'AD', '', 'USD', '', 2, '23 avenida 234-23 zona 12', '', NULL, 42, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 'a:1:{s:3:\"tax\";s:1:\"0\";}', 1, 0, 'ready', NULL, 1, NULL, 1, '2025-08-29 11:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int UNSIGNED NOT NULL,
  `sup_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_mobile` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gtin` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sup_city` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_state` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_country` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sup_details` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_retainer` tinyint(1) NOT NULL DEFAULT '0',
  `iden_supplier` int NOT NULL,
  `nit` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_type_supplier` int DEFAULT NULL,
  `pmethod_id` int UNSIGNED DEFAULT NULL,
  `bussines_license_path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality_certificate_path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bank_details_path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_regiment_supplier` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `code_name`, `sup_mobile`, `sup_email`, `gtin`, `sup_address`, `sup_city`, `sup_state`, `sup_country`, `sup_details`, `created_at`, `is_retainer`, `iden_supplier`, `nit`, `id_type_supplier`, `pmethod_id`, `bussines_license_path`, `quality_certificate_path`, `bank_details_path`, `id_regiment_supplier`) VALUES
(5, 'Alimentos S.A', 'alimentos_s.a', '78767876', 'jonatan@yopmail.com', '', 'Guatemala', 'Guatemala', 'Guatemala', 'GT', 'sin detalles', '2025-09-08 04:05:56', 0, 553, '47686787', 2, 3, NULL, NULL, NULL, 1),
(11, 'Test supplier', 'credit', '4839843', 'ts@gmail.com', '', 'guatemala', 'guateamal', 'sin departamento', 'GT', '', '2025-09-09 10:51:23', 1, 439843, '234538479', 1, 4, '/storage/documents/suppliers/Test supplier-11/bussines_license_20250909_105948.pdf', NULL, NULL, NULL),
(12, 'CORPORACION AGRILIFE SOCIEDAD ANONIMA', 'cheque', '53394526', 'nehemiascal@gmail.com', '', '3 CALLE 5-27 ZONA 9 ', 'GUATEMALA', 'GUATEMALA', 'GT', '', '2025-09-12 14:30:07', 0, 1, '3437831-6', 1, 5, NULL, NULL, NULL, 1),
(13, 'SOLUCROP', 'CESAR AUGUSTO CALDERON LEMUS', '', 'nehemiacal@gmail.com', '', '2 CALLE ZONA 1', 'JUTIAPA', ' EL PROGRESO', 'GT', '', '2025-09-12 16:08:20', 1, 4, '27240045', 1, 5, NULL, NULL, NULL, NULL),
(14, 'VIDAGRO, SOCIEDAD ANONIMA', 'cheque', '5339452', 'agrotacticsa@gmail.com', '', '4TA. AVENIDA 2-65, ZONA 3, COBÁN, A.V.', 'COBÁN, A.V.', '', 'GT', '', '2025-09-12 17:14:23', 0, 17, '3535489-5', 1, 5, NULL, NULL, NULL, 3),
(15, 'SERVICIOS Y DISTRIBUCIONES AGROINDUSTRIALES', 'cheque', '30403088', 'mollinedoliz13@gmail.com', '', 'km 0.2 camino aldea El Rejón lote 1, zona 0.\r\n', 'Sumpango', 'Sacatepéquez', 'GT', 'Empresa distribuidora de UltraK Lt', '2025-09-12 17:23:14', 1, 50, '857457k', 1, 5, NULL, NULL, NULL, NULL),
(16, 'DISAGRO DE GUATEMALA, S.A.', 'DISAGRO', '45692164', 'agrotactiC1@gmail.com', '', 'KM.124 RUTA AL ATLANTICO ', 'TECULUTAN ', 'ZACAPA ', 'GT', '', '2025-09-22 15:45:49', 1, 3, '26702827', 1, 5, NULL, NULL, NULL, NULL),
(17, 'ROBIN RODRIGO, VARGAS ROSSAL ', 'VITASNACCKS', '41526398', 'agrotacsa2@gmail.com', '', 'ALDEA AGUA BLANCA ', 'ZACAPA', 'ZACAPA', 'GT', '', '2025-09-22 16:45:29', 0, 5, '97872016', 1, 5, NULL, NULL, NULL, 2),
(18, 'SUPLASTICO ', 'JAIME ROLANDO, GARRIDO CRUZ', '78945612', 'agrotac3@gmail.com', '', 'ALDEA AGUA SALOBREGA 1-1 SANARATE', 'EL PROGRESO ', 'GUASTATOYA', 'GT', '', '2025-09-22 17:14:55', 0, 6, '7144946', 1, 5, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_to_store`
--

CREATE TABLE `supplier_to_store` (
  `s2s_id` int NOT NULL,
  `sup_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `balance` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `supplier_to_store`
--

INSERT INTO `supplier_to_store` (`s2s_id`, `sup_id`, `store_id`, `balance`, `status`, `sort_order`) VALUES
(19, 5, 1, '7970.0000', 1, 0),
(20, 5, 2, '0.0000', 1, 0),
(21, 5, 1, '7970.0000', 1, 0),
(22, 5, 2, '0.0000', 1, 0),
(23, 5, 1, '7970.0000', 1, 0),
(24, 5, 2, '0.0000', 1, 0),
(38, 5, 5, '10.0000', 1, 0),
(39, 11, 1, '0.0000', 1, 0),
(40, 11, 1, '0.0000', 1, 0),
(41, 11, 2, '0.0000', 1, 0),
(42, 11, 5, '0.0000', 1, 0),
(43, 12, 1, '1110.0000', 1, 1),
(44, 12, 1, '1110.0000', 1, 1),
(45, 12, 1, '1110.0000', 1, 1),
(46, 13, 1, '3840.0000', 1, 0),
(47, 13, 1, '3840.0000', 1, 0),
(48, 5, 1, '2200.0000', 1, 0),
(49, 14, 1, '30216.0000', 1, 1),
(50, 15, 1, '13800.0000', 1, 50),
(51, 15, 1, '13800.0000', 1, 50),
(52, 12, 1, '0.0000', 1, 1),
(53, 12, 2, '0.0000', 1, 0),
(54, 16, 1, '240354.2400', 1, 1),
(55, 16, 1, '240354.2400', 1, 0),
(56, 16, 1, '240354.2400', 1, 0),
(57, 16, 1, '240354.2400', 1, 0),
(58, 17, 1, '210.0000', 1, 40),
(59, 17, 1, '210.0000', 1, 0),
(60, 18, 1, '0.0000', 1, 25),
(61, 18, 1, '0.0000', 1, 0),
(62, 18, 1, '0.0000', 1, 0),
(63, 18, 1, '0.0000', 1, 0),
(64, 5, 1, '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxrates`
--

CREATE TABLE `taxrates` (
  `taxrate_id` int NOT NULL,
  `taxrate_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `taxrate` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `taxrates`
--

INSERT INTO `taxrates` (`taxrate_id`, `taxrate_name`, `code_name`, `taxrate`, `status`, `sort_order`) VALUES
(1, 'GST @0%', 'GG0', '0.0000', 1, 4),
(2, 'GST @18%', 'GGX', '18.0000', 1, 5),
(3, 'No Tax', 'no_tax', '0.0000', 1, 1),
(4, 'VAT @10%', 'VVX', '10.0000', 1, 2),
(5, 'Tax @20%', 'TTX', '20.0000', 1, 3),
(6, 'Tax@5%', 'tax@5%', '5.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int NOT NULL,
  `ref_no` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ref_invoice_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_store_id` int NOT NULL,
  `to_store_id` int NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `total_item` decimal(25,4) DEFAULT NULL,
  `total_quantity` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `received_by` int DEFAULT NULL,
  `cancelled_by` int DEFAULT NULL,
  `status` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `attachment` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `ref_no`, `invoice_id`, `ref_invoice_id`, `from_store_id`, `to_store_id`, `note`, `total_item`, `total_quantity`, `created_by`, `received_by`, `cancelled_by`, `status`, `attachment`, `created_at`) VALUES
(1, '', '959502-', 'B53689009', 1, 2, '', '1.0000', '20.0000', '1', NULL, NULL, 'sent', '', '2025-08-08 18:04:21'),
(2, '', '778002-', 'B3639db21', 1, 5, '', '1.0000', '1.0000', '1', 1, NULL, 'complete', '', '2025-09-23 18:27:28');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` int NOT NULL,
  `store_id` int DEFAULT NULL,
  `transfer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `transfer_items`
--

INSERT INTO `transfer_items` (`id`, `store_id`, `transfer_id`, `product_id`, `product_name`, `quantity`) VALUES
(1, 2, 1, 2, 'test', '20.0000'),
(2, 5, 2, 38, 'PRUEBA PRODUCTO 23092025', '1.0000');

-- --------------------------------------------------------

--
-- Table structure for table `type_purchase`
--

CREATE TABLE `type_purchase` (
  `id_type_purchase` int NOT NULL,
  `name_type_purchase` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `type_purchase`
--

INSERT INTO `type_purchase` (`id_type_purchase`, `name_type_purchase`, `created_at`) VALUES
(1, 'Agroquímicos', '2025-09-08 09:51:32'),
(2, 'Veterinaria', '2025-09-08 09:51:32'),
(3, 'Semilla', '2025-09-08 09:51:32'),
(4, 'Agroquímicos y Veterinaria', '2025-09-08 09:51:32'),
(5, 'Agroquímicos y Semillas', '2025-09-08 09:51:32'),
(6, 'Semillas y Veterinaria', '2025-09-08 09:51:32'),
(7, 'Agroquímicos, Semillas y Veterinaria', '2025-09-08 09:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `type_supplier`
--

CREATE TABLE `type_supplier` (
  `id_type_supplier` int NOT NULL,
  `name_type_supplier` varchar(200) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `type_supplier`
--

INSERT INTO `type_supplier` (`id_type_supplier`, `name_type_supplier`, `created_at`) VALUES
(1, 'Distribuidor', '2025-09-09 15:46:15'),
(2, 'Fabricante', '2025-09-09 15:46:15'),
(3, 'Intermediario', '2025-09-09 15:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int NOT NULL,
  `unit_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `code_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `unit_details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `acronym` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `measurement_type_id` int NOT NULL,
  `conversion_to_base` decimal(25,4) NOT NULL,
  `is_base` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `code_name`, `unit_details`, `acronym`, `measurement_type_id`, `conversion_to_base`, `is_base`) VALUES
(1, 'Piezas', 'piezas', '', 'pzs', 0, '0.0000', 0),
(2, 'Unidades', 'unidades', 'Unidades de Cajas', 'UN', 4, '1.0000', 0),
(3, 'Kilogramo', 'kilogramo', NULL, 'KG', 1, '1000.0000', 0),
(4, 'Gramo', 'gramo', NULL, 'G', 1, '1.0000', 1),
(5, 'Libra', 'libra', NULL, 'LB', 1, '453.5920', 0),
(6, 'Onza', 'onza', '', 'oz', 1, '28.3495', 0),
(7, 'Litro', 'litro', '', 'Lt', 2, '1000.0000', 0),
(8, 'Mililitro', 'mililitro', 'La abreviatura mL o cc', 'ml', 2, '1.0000', 1),
(9, 'Unidad', 'unidad', 'Caja de 10 unidades', 'U', 3, '1.0000', 1),
(10, 'Caja', 'caja', NULL, 'caja', 4, '10.0000', 0),
(11, 'Galón', 'galon', NULL, 'GAL', 2, '3785.4100', 0),
(12, '250 ML', '250', '', 'ML', 2, '250.0000', 0),
(13, '500 ML', '500_ml', '', '500', 2, '500.0000', 0),
(14, '125 ML', '125', '', 'ML', 2, '125.0000', 0),
(15, '100 ML', '100_ml', '', 'ML', 2, '100000.0000', 0),
(16, '5 LITROS', '5_litros', '', 'GALON', 2, '7570.8200', 0),
(17, '20 LITROS', '20_litros', '', 'CANECA', 2, '75708.2000', 0),
(18, 'QUINTAL', 'quintal', 'Contenido de 100 libras', 'qq', 1, '45359.2000', 0),
(19, '50 GRAMOS', '50_gramos', 'GRAMOS', 'GR', 1, '50.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `unit_to_store`
--

CREATE TABLE `unit_to_store` (
  `unit2s_id` int UNSIGNED NOT NULL,
  `uunit_id` int UNSIGNED NOT NULL DEFAULT '0',
  `store_id` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `unit_to_store`
--

INSERT INTO `unit_to_store` (`unit2s_id`, `uunit_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 0, 1, 1, 0),
(3, 2, 1, 1, 0),
(4, 3, 1, 1, 0),
(5, 4, 1, 1, 0),
(6, 5, 1, 1, 0),
(7, 6, 1, 1, 1),
(8, 7, 1, 1, 1),
(9, 8, 1, 1, 1),
(10, 9, 1, 1, 0),
(11, 10, 1, 1, 0),
(12, 3, 1, 1, 0),
(13, 10, 1, 1, 0),
(14, 3, 1, 1, 0),
(15, 3, 1, 1, 0),
(16, 7, 1, 1, 1),
(17, 3, 2, 1, 0),
(19, 3, 1, 1, 0),
(20, 3, 2, 1, 0),
(21, 3, 5, 1, 0),
(22, 3, 1, 1, 0),
(23, 3, 2, 1, 0),
(24, 3, 5, 1, 0),
(25, 3, 1, 1, 0),
(26, 3, 2, 1, 0),
(27, 5, 1, 1, 0),
(28, 5, 2, 1, 0),
(29, 1, 2, 1, 0),
(30, 1, 5, 1, 0),
(31, 4, 1, 1, 0),
(32, 4, 2, 1, 0),
(33, 4, 5, 1, 0),
(34, 12, 1, 1, 1),
(35, 13, 1, 1, 1),
(36, 12, 1, 1, 0),
(37, 14, 1, 1, 1),
(38, 15, 1, 1, 1),
(39, 16, 1, 1, 1),
(40, 17, 1, 1, 1),
(41, 14, 1, 1, 0),
(42, 3, 1, 1, 0),
(43, 18, 1, 1, 1),
(44, 13, 1, 1, 0),
(45, 7, 1, 1, 0),
(46, 13, 1, 1, 0),
(47, 13, 2, 1, 0),
(48, 7, 2, 1, 0),
(49, 19, 1, 1, 0),
(50, 18, 1, 1, 0),
(51, 18, 1, 1, 0),
(52, 18, 1, 1, 0),
(53, 1, 1, 1, 0),
(54, 9, 1, 1, 0),
(55, 9, 1, 1, 0),
(56, 9, 1, 1, 0),
(57, 16, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `group_id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'M',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pass_reset_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reset_code_time` datetime DEFAULT NULL,
  `login_try` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `ip` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `preference` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `user_image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `group_id`, `username`, `email`, `mobile`, `dob`, `sex`, `password`, `pass_reset_code`, `reset_code_time`, `login_try`, `last_login`, `ip`, `address`, `preference`, `user_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Soporte técnico', 'prueba@agrotactic.com.gt', '1234567890', '1990-01-01', 'M', '$2y$10$TWjdQZK2O.WnAL4wwfGNx.P8Y1cTkv9WiZgL9T8EA7FS0lQKNr47C', '', NULL, 0, '2025-09-24 00:05:30', '190.148.209.198', NULL, 'a:4:{s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";s:8:\"language\";s:2:\"es\";}', '/solution24-logo.jpg', '2024-03-30 09:08:33', '2025-09-24 06:05:30'),
(3, 3, 'Ventas', 'ventas@agrotactic.com.gt', '0113743700', '1990-01-01', 'M', '$2y$10$TWjdQZK2O.WnAL4wwfGNx.P8Y1cTkv9WiZgL9T8EA7FS0lQKNr47C', '', NULL, 0, '2020-08-29 10:12:31', '::1', NULL, 'a:4:{s:10:\"base_color\";s:5:\"black\";s:14:\"pos_side_panel\";s:4:\"left\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";s:8:\"language\";s:2:\"en\";}', '', '2024-03-30 09:08:33', '2025-08-07 13:53:03'),
(4, 4, 'jonatan', 'jonatan@gmail.com', '324234', NULL, 'M', '$2y$10$TWjdQZK2O.WnAL4wwfGNx.P8Y1cTkv9WiZgL9T8EA7FS0lQKNr47C', NULL, NULL, 0, '2025-07-14 15:23:02', NULL, NULL, NULL, NULL, '2025-07-14 21:22:38', '2025-08-29 19:12:52'),
(5, 12, 'Nery Mollinedo', 'agrotactic@gmail.com', '12341234', '1980-01-01', 'M', '$2y$10$uBKVuEBW9svvcRlmDSlQ2.IRryynmFhku5It2yx4Z5zKjuC9lWAhm', NULL, NULL, 0, NULL, NULL, NULL, NULL, '', '2025-08-06 17:46:09', '2025-08-28 15:06:51'),
(6, 9, 'test Bidea', 'test@bideadigital.com', '43214321', '1980-01-01', 'M', '$2y$10$QXeRXxCY/LKhzwkLYAQBx.dUOmHMv08ZzHVyoTnqG662rp6VyLWMO', NULL, NULL, 0, '2025-08-27 14:24:18', '190.149.120.112', NULL, 'a:4:{s:8:\"language\";s:2:\"es\";s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '', '2025-08-07 07:48:36', '2025-08-29 19:13:09'),
(7, 12, 'Romulo Mollinedo', 'ar.mollinedo@gmail.com', '42180802', '1988-05-17', 'M', '$2y$10$RzAbFcNSzQqPhWmCO9SeVuL4wMT1p1aimvg9134wrgyWe9KDoNRzW', '', '2025-09-11 17:18:29', 0, '2025-09-22 15:32:30', '186.151.49.71', NULL, 'a:4:{s:8:\"language\";s:2:\"es\";s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '', '2025-08-07 08:21:28', '2025-09-22 23:35:26'),
(8, 12, 'Soporte Técnico', 'contactodirecto@bideadigital.com', '57876787', '2025-05-12', 'M', '$2y$10$C.tVoq8E6hLHK1vZNX5V6.a.3WtSAKtwLLyzcA2ep.Of.uZXqugaC', NULL, NULL, 0, '2025-09-18 09:53:48', '190.149.120.112', NULL, 'a:4:{s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";s:8:\"language\";s:2:\"es\";}', '', '2025-09-08 04:01:19', '2025-09-18 15:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `permission` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`group_id`, `name`, `slug`, `sort_order`, `status`, `permission`) VALUES
(1, 'Admin', 'admin', 1, 1, 'a:1:{s:6:\"access\";a:122:{s:16:\"read_sell_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:21:\"read_sell_transaction\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:8:\"loan_pay\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(2, 'soporte-tecnico', 'cashier', 2, 1, 'a:1:{s:6:\"access\";a:90:{s:32:\"read_dashboard_accounting_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:19:\"create_purchase_due\";s:4:\"true\";s:22:\"create_purchase_return\";s:4:\"true\";s:20:\"read_purchase_return\";s:4:\"true\";s:22:\"update_purchase_return\";s:4:\"true\";s:22:\"delete_purchase_return\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"import_stock\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:15:\"cancel_transfer\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:20:\"add_customer_balance\";s:4:\"true\";s:26:\"substract_customer_balance\";s:4:\"true\";s:25:\"read_customer_transaction\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:22:\"updadte_pmethod_status\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:13:\"read_language\";s:4:\"true\";s:15:\"create_language\";s:4:\"true\";s:15:\"update_language\";s:4:\"true\";s:15:\"delete_language\";s:4:\"true\";s:20:\"language_translation\";s:4:\"true\";s:19:\"delete_language_key\";s:4:\"true\";s:16:\"receipt_template\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:5:\"reset\";s:4:\"true\";s:19:\"show_purchase_price\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(3, 'Vendedor', 'vendedor', 3, 1, 'a:1:{s:6:\"access\";a:3:{s:16:\"read_sell_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";}}'),
(4, 'Camionero', 'camionero', 0, 1, 'a:0:{}'),
(5, 'Cajero', 'cajero', 0, 1, 'a:1:{s:6:\"access\";a:8:{s:16:\"read_sell_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";}}'),
(6, 'Bodeguero', 'bodeguero', 0, 1, 'a:1:{s:6:\"access\";a:16:{s:17:\"read_stock_report\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";}}'),
(7, 'Promotor', 'promotor', 0, 1, 'a:0:{}'),
(8, 'Encargado Compras', 'enc_compras', 0, 1, 'a:1:{s:6:\"access\";a:42:{s:20:\"read_purchase_report\";s:4:\"true\";s:28:\"read_purchase_payment_report\";s:4:\"true\";s:24:\"read_purchase_tax_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:19:\"create_purchase_due\";s:4:\"true\";s:22:\"create_purchase_return\";s:4:\"true\";s:20:\"read_purchase_return\";s:4:\"true\";s:22:\"update_purchase_return\";s:4:\"true\";s:22:\"delete_purchase_return\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"import_stock\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";}}'),
(9, 'Gerente Ventas', 'gerente_ventas', 0, 1, 'a:1:{s:6:\"access\";a:31:{s:16:\"read_sell_report\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:20:\"add_customer_balance\";s:4:\"true\";s:26:\"substract_customer_balance\";s:4:\"true\";s:25:\"read_customer_transaction\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:22:\"updadte_pmethod_status\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";}}'),
(10, 'Contador', 'contador', 0, 1, 'a:1:{s:6:\"access\";a:14:{s:16:\"read_sell_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:20:\"read_purchase_report\";s:4:\"true\";s:28:\"read_purchase_payment_report\";s:4:\"true\";s:24:\"read_purchase_tax_report\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";}}'),
(11, 'RRHH', 'rrhh', 0, 1, 'a:1:{s:6:\"access\";a:1:{s:9:\"read_user\";s:4:\"true\";}}'),
(12, 'Gerente Admin', 'gerente_admin', 0, 1, 'a:1:{s:6:\"access\";a:71:{s:32:\"read_dashboard_accounting_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:19:\"create_purchase_due\";s:4:\"true\";s:22:\"create_purchase_return\";s:4:\"true\";s:20:\"read_purchase_return\";s:4:\"true\";s:22:\"update_purchase_return\";s:4:\"true\";s:22:\"delete_purchase_return\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"import_stock\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:15:\"cancel_transfer\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:22:\"updadte_pmethod_status\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";}}'),
(13, 'Gerente General', 'gerente_general', 0, 1, 'a:1:{s:6:\"access\";a:63:{s:32:\"read_dashboard_accounting_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:20:\"read_purchase_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:14:\"read_quotation\";s:4:\"true\";s:16:\"create_quotation\";s:4:\"true\";s:16:\"update_quotation\";s:4:\"true\";s:16:\"delete_quotation\";s:4:\"true\";s:17:\"read_sell_invoice\";s:4:\"true\";s:14:\"read_sell_list\";s:4:\"true\";s:19:\"create_sell_invoice\";s:4:\"true\";s:24:\"update_sell_invoice_info\";s:4:\"true\";s:19:\"delete_sell_invoice\";s:4:\"true\";s:12:\"sell_payment\";s:4:\"true\";s:15:\"create_sell_due\";s:4:\"true\";s:18:\"create_sell_return\";s:4:\"true\";s:16:\"read_sell_return\";s:4:\"true\";s:18:\"update_sell_return\";s:4:\"true\";s:18:\"delete_sell_return\";s:4:\"true\";s:16:\"sms_sell_invoice\";s:4:\"true\";s:18:\"email_sell_invoice\";s:4:\"true\";s:13:\"read_sell_log\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:19:\"create_purchase_due\";s:4:\"true\";s:22:\"create_purchase_return\";s:4:\"true\";s:20:\"read_purchase_return\";s:4:\"true\";s:22:\"update_purchase_return\";s:4:\"true\";s:22:\"delete_purchase_return\";s:4:\"true\";s:17:\"read_purchase_log\";s:4:\"true\";s:12:\"import_stock\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:15:\"cancel_transfer\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"barcode_print\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:10:\"read_brand\";s:4:\"true\";s:12:\"create_brand\";s:4:\"true\";s:12:\"update_brand\";s:4:\"true\";s:12:\"delete_brand\";s:4:\"true\";s:18:\"read_brand_profile\";s:4:\"true\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `user_to_store`
--

CREATE TABLE `user_to_store` (
  `u2s_id` int NOT NULL,
  `user_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user_to_store`
--

INSERT INTO `user_to_store` (`u2s_id`, `user_id`, `store_id`, `status`, `sort_order`) VALUES
(8, 2, 1, 1, 2),
(15, 3, 2, 1, 0),
(19, 7, 1, 1, 0),
(20, 7, 2, 1, 0),
(22, 6, 1, 1, 0),
(23, 6, 2, 1, 0),
(25, 5, 1, 1, 0),
(26, 5, 2, 1, 0),
(31, 1, 1, 1, 1),
(32, 1, 2, 1, 0),
(34, 2, 4, 1, 0),
(35, 1, 4, 1, 0),
(36, 1, 4, 1, 0),
(37, 2, 5, 1, 0),
(38, 1, 5, 1, 0),
(39, 1, 5, 1, 0),
(40, 6, 4, 1, 0),
(41, 6, 5, 1, 0),
(45, 8, 1, 1, 2),
(46, 8, 2, 1, 0),
(47, 8, 5, 1, 0),
(48, 8, 5, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  ADD PRIMARY KEY (`ba2s`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `box_to_store`
--
ALTER TABLE `box_to_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `brand_to_store`
--
ALTER TABLE `brand_to_store`
  ADD PRIMARY KEY (`b2s_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_to_store`
--
ALTER TABLE `category_to_store`
  ADD PRIMARY KEY (`c2s_id`),
  ADD KEY `ccategory_id` (`ccategory_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `currency_to_store`
--
ALTER TABLE `currency_to_store`
  ADD PRIMARY KEY (`ca2s_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_to_store`
--
ALTER TABLE `customer_to_store`
  ADD PRIMARY KEY (`c2s_id`);

--
-- Indexes for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id_document_type`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categorys`
--
ALTER TABLE `expense_categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `holding_info`
--
ALTER TABLE `holding_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `holding_item`
--
ALTER TABLE `holding_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `holding_price`
--
ALTER TABLE `holding_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `income_sources`
--
ALTER TABLE `income_sources`
  ADD PRIMARY KEY (`source_id`);

--
-- Indexes for table `installment_orders`
--
ALTER TABLE `installment_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `installment_payments`
--
ALTER TABLE `installment_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id_movement`),
  ADD KEY `idx_movements_product_store` (`id_product_to_store`),
  ADD KEY `idx_movements_product_store_date` (`id_product_to_store`,`date_register`),
  ADD KEY `idx_movements_date` (`date_register`),
  ADD KEY `idx_movements_type` (`type`),
  ADD KEY `idx_movements_reference` (`reference_type`,`reference_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_translations`
--
ALTER TABLE `language_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lloan_id` (`lloan_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `log_stock`
--
ALTER TABLE `log_stock`
  ADD PRIMARY KEY (`id_log_stock`),
  ADD KEY `pts_fk` (`product_to_store_id`);

--
-- Indexes for table `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `measurement_type`
--
ALTER TABLE `measurement_type`
  ADD PRIMARY KEY (`id_measurement_type`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `pmethods`
--
ALTER TABLE `pmethods`
  ADD PRIMARY KEY (`pmethod_id`);

--
-- Indexes for table `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `ppmethod_id` (`ppmethod_id`);

--
-- Indexes for table `pos_register`
--
ALTER TABLE `pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_templates`
--
ALTER TABLE `pos_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  ADD PRIMARY KEY (`pt2s`),
  ADD KEY `ttemplate_id` (`ttemplate_id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`printer_id`);

--
-- Indexes for table `printer_to_store`
--
ALTER TABLE `printer_to_store`
  ADD PRIMARY KEY (`p2s_id`),
  ADD KEY `pprinter_id` (`pprinter_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_code` (`p_code`) USING BTREE;

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_store_presentation`
--
ALTER TABLE `product_store_presentation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_product_store` (`id_product_store`),
  ADD KEY `fk_unit_id` (`unit_id`);

--
-- Indexes for table `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `p_date` (`p_date`),
  ADD KEY `fk_alert_unit` (`alert_unit`);

--
-- Indexes for table `purchase_documents`
--
ALTER TABLE `purchase_documents`
  ADD PRIMARY KEY (`id_purchase_document`),
  ADD KEY `idx_purchase_documents_type` (`id_document_type`),
  ADD KEY `idx_purchase_documents_number` (`document_number`),
  ADD KEY `idx_purchase_documents_date` (`date`),
  ADD KEY `purchase_documents_ibfk_1` (`id_purchase_info`);

--
-- Indexes for table `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD PRIMARY KEY (`info_id`),
  ADD UNIQUE KEY `unique_invoice` (`invoice_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `fk_purchase_document_type` (`id_document_type`),
  ADD KEY `idx_number_correlativo_reference` (`number_correlativo`),
  ADD KEY `fk_purchase_info_type_purchase` (`type_purchase_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_invoice_item` (`invoice_id`,`item_id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sup_id` (`sup_id`),
  ADD KEY `reference_no` (`reference_no`),
  ADD KEY `ref_invoice_id` (`ref_invoice_id`);

--
-- Indexes for table `purchase_log_item_price`
--
ALTER TABLE `purchase_log_item_price`
  ADD PRIMARY KEY (`id_purchase_log_item_price`),
  ADD UNIQUE KEY `uk_document_item` (`id_purchase_document`,`id_purchase_item`),
  ADD KEY `idx_purchase_document` (`id_purchase_document`),
  ADD KEY `idx_purchase_item` (`id_purchase_item`);

--
-- Indexes for table `purchase_log_price`
--
ALTER TABLE `purchase_log_price`
  ADD PRIMARY KEY (`id_purchase_log_price`),
  ADD KEY `idx_id_purchase_documents` (`id_purchase_documents`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_price`
--
ALTER TABLE `purchase_price`
  ADD PRIMARY KEY (`price_id`),
  ADD UNIQUE KEY `invoice_id_price` (`invoice_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `quotation_info`
--
ALTER TABLE `quotation_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `quotation_item`
--
ALTER TABLE `quotation_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indexes for table `quotation_price`
--
ALTER TABLE `quotation_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `reference_no` (`reference_no`);

--
-- Indexes for table `regiment_supplier`
--
ALTER TABLE `regiment_supplier`
  ADD PRIMARY KEY (`id_regiment_supplier`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`reference_no`),
  ADD KEY `product_id` (`item_id`);

--
-- Indexes for table `selling_info`
--
ALTER TABLE `selling_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `selling_item`
--
ALTER TABLE `selling_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `selling_price`
--
ALTER TABLE `selling_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `sell_logs`
--
ALTER TABLE `sell_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortcut_links`
--
ALTER TABLE `shortcut_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `people_type` (`people_type`);

--
-- Indexes for table `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`),
  ADD KEY `fk_type_supplier` (`id_type_supplier`),
  ADD KEY `fk_pmethod` (`pmethod_id`),
  ADD KEY `fk_suppliers_regiment` (`id_regiment_supplier`);

--
-- Indexes for table `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  ADD PRIMARY KEY (`s2s_id`),
  ADD KEY `sup_id` (`sup_id`);

--
-- Indexes for table `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`taxrate_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `type_purchase`
--
ALTER TABLE `type_purchase`
  ADD PRIMARY KEY (`id_type_purchase`);

--
-- Indexes for table `type_supplier`
--
ALTER TABLE `type_supplier`
  ADD PRIMARY KEY (`id_type_supplier`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `unit_to_store`
--
ALTER TABLE `unit_to_store`
  ADD PRIMARY KEY (`unit2s_id`),
  ADD KEY `uunit_id` (`uunit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_to_store`
--
ALTER TABLE `user_to_store`
  ADD PRIMARY KEY (`u2s_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  MODIFY `ba2s` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  MODIFY `info_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  MODIFY `price_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `boxes`
--
ALTER TABLE `boxes`
  MODIFY `box_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `box_to_store`
--
ALTER TABLE `box_to_store`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand_to_store`
--
ALTER TABLE `brand_to_store`
  MODIFY `b2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_to_store`
--
ALTER TABLE `category_to_store`
  MODIFY `c2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `currency_to_store`
--
ALTER TABLE `currency_to_store`
  MODIFY `ca2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_to_store`
--
ALTER TABLE `customer_to_store`
  MODIFY `c2s_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_transactions`
--
ALTER TABLE `customer_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id_document_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_categorys`
--
ALTER TABLE `expense_categorys`
  MODIFY `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_info`
--
ALTER TABLE `holding_info`
  MODIFY `info_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_item`
--
ALTER TABLE `holding_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holding_price`
--
ALTER TABLE `holding_price`
  MODIFY `price_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `income_sources`
--
ALTER TABLE `income_sources`
  MODIFY `source_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `installment_orders`
--
ALTER TABLE `installment_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment_payments`
--
ALTER TABLE `installment_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id_movement` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `language_translations`
--
ALTER TABLE `language_translations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12691;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `log_stock`
--
ALTER TABLE `log_stock`
  MODIFY `id_log_stock` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_sms_tag`
--
ALTER TABLE `mail_sms_tag`
  MODIFY `tag_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `measurement_type`
--
ALTER TABLE `measurement_type`
  MODIFY `id_measurement_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pmethods`
--
ALTER TABLE `pmethods`
  MODIFY `pmethod_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  MODIFY `p2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pos_register`
--
ALTER TABLE `pos_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_templates`
--
ALTER TABLE `pos_templates`
  MODIFY `template_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pos_template_to_store`
--
ALTER TABLE `pos_template_to_store`
  MODIFY `pt2s` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `printer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `printer_to_store`
--
ALTER TABLE `printer_to_store`
  MODIFY `p2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_store_presentation`
--
ALTER TABLE `product_store_presentation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `product_to_store`
--
ALTER TABLE `product_to_store`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `purchase_documents`
--
ALTER TABLE `purchase_documents`
  MODIFY `id_purchase_document` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `purchase_info`
--
ALTER TABLE `purchase_info`
  MODIFY `info_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `purchase_logs`
--
ALTER TABLE `purchase_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `purchase_log_item_price`
--
ALTER TABLE `purchase_log_item_price`
  MODIFY `id_purchase_log_item_price` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `purchase_log_price`
--
ALTER TABLE `purchase_log_price`
  MODIFY `id_purchase_log_price` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchase_price`
--
ALTER TABLE `purchase_price`
  MODIFY `price_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_info`
--
ALTER TABLE `quotation_info`
  MODIFY `info_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_item`
--
ALTER TABLE `quotation_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotation_price`
--
ALTER TABLE `quotation_price`
  MODIFY `price_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `regiment_supplier`
--
ALTER TABLE `regiment_supplier`
  MODIFY `id_regiment_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_info`
--
ALTER TABLE `selling_info`
  MODIFY `info_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_item`
--
ALTER TABLE `selling_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `selling_price`
--
ALTER TABLE `selling_price`
  MODIFY `price_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_logs`
--
ALTER TABLE `sell_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shortcut_links`
--
ALTER TABLE `shortcut_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sms_schedule`
--
ALTER TABLE `sms_schedule`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  MODIFY `s2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `taxrate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_purchase`
--
ALTER TABLE `type_purchase`
  MODIFY `id_type_purchase` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type_supplier`
--
ALTER TABLE `type_supplier`
  MODIFY `id_type_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `unit_to_store`
--
ALTER TABLE `unit_to_store`
  MODIFY `unit2s_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_to_store`
--
ALTER TABLE `user_to_store`
  MODIFY `u2s_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `inventory_movements_ibfk_1` FOREIGN KEY (`id_product_to_store`) REFERENCES `product_to_store` (`id`);

--
-- Constraints for table `log_stock`
--
ALTER TABLE `log_stock`
  ADD CONSTRAINT `pts_fk` FOREIGN KEY (`product_to_store_id`) REFERENCES `product_to_store` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_store_presentation`
--
ALTER TABLE `product_store_presentation`
  ADD CONSTRAINT `fk_id_product_store` FOREIGN KEY (`id_product_store`) REFERENCES `product_to_store` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`);

--
-- Constraints for table `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD CONSTRAINT `fk_alert_unit` FOREIGN KEY (`alert_unit`) REFERENCES `units` (`unit_id`);

--
-- Constraints for table `purchase_documents`
--
ALTER TABLE `purchase_documents`
  ADD CONSTRAINT `purchase_documents_ibfk_1` FOREIGN KEY (`id_purchase_info`) REFERENCES `purchase_info` (`info_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_documents_ibfk_2` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id_document_type`);

--
-- Constraints for table `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD CONSTRAINT `fk_purchase_document_type` FOREIGN KEY (`id_document_type`) REFERENCES `document_type` (`id_document_type`),
  ADD CONSTRAINT `fk_purchase_info_type_purchase` FOREIGN KEY (`type_purchase_id`) REFERENCES `type_purchase` (`id_type_purchase`);

--
-- Constraints for table `purchase_log_item_price`
--
ALTER TABLE `purchase_log_item_price`
  ADD CONSTRAINT `fk_purchase_document` FOREIGN KEY (`id_purchase_document`) REFERENCES `purchase_documents` (`id_purchase_document`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_purchase_item` FOREIGN KEY (`id_purchase_item`) REFERENCES `purchase_item` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_log_price`
--
ALTER TABLE `purchase_log_price`
  ADD CONSTRAINT `fk_id_purchase_document` FOREIGN KEY (`id_purchase_documents`) REFERENCES `purchase_documents` (`id_purchase_document`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `fk_pmethod` FOREIGN KEY (`pmethod_id`) REFERENCES `pmethods` (`pmethod_id`),
  ADD CONSTRAINT `fk_suppliers_regiment` FOREIGN KEY (`id_regiment_supplier`) REFERENCES `regiment_supplier` (`id_regiment_supplier`),
  ADD CONSTRAINT `fk_type_supplier` FOREIGN KEY (`id_type_supplier`) REFERENCES `type_supplier` (`id_type_supplier`);

ALTER TABLE purchase_info 
MODIFY COLUMN shipping_status ENUM('received', 'pending', 'ordered', 'consignment') NOT NULL;

update product_to_store set quantity_in_stock = 0.0000 where id > 1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;








