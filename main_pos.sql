-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2021 at 02:19 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

CREATE TABLE `backup` (
  `id` bigint(20) NOT NULL,
  `file_url` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_date` date NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `bill_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `return_amount` double DEFAULT NULL,
  `total_discount` double NOT NULL,
  `adjustment_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `total_adjustment` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `vat_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `total_vat` double DEFAULT NULL,
  `adjustment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_discount_type` tinyint(4) DEFAULT NULL,
  `total_discount_amount` double DEFAULT NULL,
  `total_discount_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cash_given` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `bill_number`, `bill_date`, `vendor_id`, `bill_amount`, `due_amount`, `return_amount`, `total_discount`, `adjustment_type`, `total_adjustment`, `total_tax`, `tax_type`, `vat_type`, `total_vat`, `adjustment_note`, `bill_note`, `total_discount_type`, `total_discount_amount`, `total_discount_note`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `cash_given`, `change_amount`) VALUES
(16, '1', '2021-01-25', 2, 928225, 926725, 0, 0, NULL, NULL, NULL, NULL, 0, 15, NULL, NULL, 1, 5000, NULL, NULL, 1, 1, '2021-01-25 07:18:08', '2021-01-30 12:34:01', NULL, 0),
(17, '2', '2021-01-26', 2, 9332.25, 8532.25, NULL, 0, NULL, NULL, NULL, NULL, 0, 15, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 07:50:24', '2021-01-26 07:50:24', NULL, 0),
(18, '3', '2021-01-27', 2, 9332.25, 9332.25, NULL, 0, NULL, NULL, NULL, NULL, 0, 15, NULL, NULL, 1, 0, NULL, NULL, 1, 1, '2021-01-27 04:50:40', '2021-01-27 04:50:55', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_entries`
--

CREATE TABLE `bill_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `discount_type` tinyint(4) NOT NULL COMMENT '0= % 1= BDT',
  `discount_amount` double NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_entries`
--

INSERT INTO `bill_entries` (`id`, `bill_id`, `product_id`, `product_entry_id`, `vendor_id`, `rate`, `quantity`, `total_amount`, `discount_type`, `discount_amount`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(71, 16, 21, 264, 2, 8115, 100, 811500, 0, 0, NULL, 1, NULL, '2021-01-25 07:18:32', NULL),
(72, 17, 21, 263, 2, 8115, 1, 8115, 0, 0, NULL, 1, NULL, '2021-01-26 07:50:24', NULL),
(74, 18, 21, 263, 2, 8115, 1, 8115, 0, 0, NULL, 1, NULL, '2021-01-27 04:50:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active 0=inactive',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(8, 'Satar', 1, NULL, 1, NULL, '2021-01-01 01:01:25', '2021-01-01 01:01:25'),
(9, 'R.A.K', 1, NULL, 1, NULL, '2021-01-01 01:01:43', '2021-01-01 01:01:43'),
(10, 'Stella', 1, NULL, 1, NULL, '2021-01-01 01:02:07', '2021-01-01 01:02:07'),
(11, 'Glory', 1, NULL, 1, NULL, '2021-01-01 01:02:27', '2021-01-01 01:02:27'),
(12, 'BISF', 1, NULL, 1, NULL, '2021-01-01 01:02:56', '2021-01-01 01:02:56'),
(13, 'N/A', 1, NULL, 1, NULL, '2021-01-11 18:25:15', '2021-01-11 18:25:15'),
(16, 'NPoly', 1, NULL, 1, NULL, '2021-01-11 18:35:55', '2021-01-11 18:35:55');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_contact` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_type` tinyint(4) NOT NULL COMMENT '0= customer 1= Supplier 2= Employee 3= Reference',
  `joining_date` date DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `opening_balance` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `nid_number`, `image`, `alternative_contact`, `contact_type`, `joining_date`, `designation`, `salary`, `user_id`, `branch_id`, `opening_balance`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-03', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-03 07:38:36', '2021-01-03 07:38:36'),
(2, 'Walk-In Supplier', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-03', NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-03 07:38:49', '2021-01-03 07:38:49'),
(21, 'Alif Mia', '01718937082', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 10:26:36', '2021-01-25 10:26:36'),
(22, 'Suity Sarker', '01905111957', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 10:26:50', '2021-01-25 10:26:50'),
(23, 'Reza', '01854785825', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:26:22', '2021-01-25 11:26:22'),
(24, 'Sultan', '017586985', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:26:34', '2021-01-25 11:26:34'),
(25, 'Md. Mehedi', '01458785825', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:27:08', '2021-01-25 11:27:08'),
(26, 'Md. Obaidul', '01785254512', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:27:24', '2021-01-25 11:27:24'),
(27, 'Md. Nurunnobi', '01715658545', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:27:56', '2021-01-25 11:27:56'),
(28, 'Alifian Shopping', '01722947428', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:28:16', '2021-01-25 11:28:16'),
(29, 'Md. Akther', '01778548589', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:28:49', '2021-01-25 11:28:49'),
(30, 'Md. Habib', '01785254569', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:29:02', '2021-01-25 11:29:02'),
(31, 'Mis. Rina Khan', '01785698958', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-25 11:29:20', '2021-01-25 11:29:20'),
(32, 'Asraful', '01452857858', NULL, 'Dimla', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-26 06:17:31', '2021-01-26 06:17:31'),
(33, 'R', '01452854587', NULL, 'WE', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-26 06:18:13', '2021-01-26 06:18:13'),
(34, 'RTR', '01458589658', NULL, 'ass', NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-26 06:23:25', '2021-01-26 06:23:25'),
(35, 'Vision TV Supplier', '01', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 05:43:31', '2021-01-28 05:43:31'),
(36, 'Aslam Mia', '01', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 05:44:06', '2021-01-28 05:44:06'),
(37, 'Moynul Hossain', '01', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 05:44:16', '2021-01-28 05:44:16'),
(38, 'fd', '323', NULL, 'ddf', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 07:20:08', '2021-01-28 07:20:08'),
(39, 'weew', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 07:21:43', '2021-01-28 07:21:43'),
(40, 'dsdsadsdad', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-28 07:21:52', '2021-01-28 07:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0=coupons 1=membership',
  `coupon_code` bigint(20) DEFAULT NULL,
  `card_number` double DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `discount_type` tinyint(4) NOT NULL COMMENT '0= % 1= BDT',
  `discount_amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0=inactive 1=active',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_products`
--

CREATE TABLE `discount_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `expense_date` date NOT NULL,
  `expense_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `salary_type` tinyint(4) DEFAULT NULL COMMENT '0=Salary 1=Service Charge',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_through_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_category_id`, `expense_date`, `expense_number`, `amount`, `note`, `user_id`, `salary_type`, `branch_id`, `paid_through_id`, `account_information`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(15, 4, '2021-01-24', '1', 50000, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2021-01-24 06:43:57', '2021-01-24 06:43:57'),
(16, 2, '2021-01-26', '2', 500, 'ps1', NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL),
(17, 2, '2021-01-26', '3', 300, 'ps2', NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL),
(18, 4, '2021-01-26', '2', 5000, NULL, NULL, NULL, NULL, 2, '1221', 1, 1, '2021-01-26 08:32:29', '2021-01-26 09:04:24');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Employee Salary', NULL, 1, NULL, '2021-01-03 07:43:18', '2021-01-03 07:43:18'),
(2, 'Product Purchase', NULL, 1, NULL, '2021-01-03 07:43:30', '2021-01-03 07:43:30'),
(4, 'House Rent', NULL, 1, NULL, '2021-01-24 06:43:20', '2021-01-24 06:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `income_category_id` bigint(20) UNSIGNED NOT NULL,
  `income_date` date NOT NULL,
  `income_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `paid_through_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_information` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_categories`
--

CREATE TABLE `income_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `return_amount` double DEFAULT NULL,
  `total_buy_price` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_adjustment` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `vat_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `total_vat` double DEFAULT NULL,
  `adjustment_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `adjustment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_code` double DEFAULT NULL,
  `total_discount_type` tinyint(4) DEFAULT NULL,
  `total_discount_amount` double DEFAULT NULL,
  `total_discount_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cash_given` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `invoice_date`, `customer_id`, `reference_id`, `customer_name`, `customer_phone`, `invoice_amount`, `due_amount`, `return_amount`, `total_buy_price`, `total_discount`, `total_adjustment`, `total_tax`, `tax_type`, `vat_type`, `total_vat`, `adjustment_type`, `adjustment_note`, `invoice_note`, `discount_code`, `total_discount_type`, `total_discount_amount`, `total_discount_note`, `branch_id`, `cash_given`, `change_amount`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(53, '1', '2021-01-25', 1, NULL, NULL, NULL, 27422.25, 0, NULL, 24715, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 1000, NULL, NULL, NULL, 0, 1, 1, '2021-01-25 07:03:59', '2021-01-26 10:48:57'),
(54, '2', '2021-01-26', 1, NULL, NULL, NULL, 9332.25, 0, NULL, 8115, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-26 06:06:51', '2021-01-26 10:48:57'),
(55, '3', '2021-01-26', 1, NULL, NULL, NULL, 9257.5, 0, NULL, 8050, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-26 06:07:09', '2021-01-26 10:48:57'),
(56, '4', '2021-01-26', 1, NULL, NULL, NULL, 8078.75, 0, NULL, 7025, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-26 06:07:29', '2021-01-26 10:50:14'),
(57, '5', '2021-01-26', 1, NULL, NULL, NULL, 13984, 11574.75, NULL, 12160, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-26 06:11:33', '2021-01-26 10:53:18'),
(58, '6', '2021-01-26', 1, NULL, NULL, NULL, 13984, 13984, NULL, 12160, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-26 06:11:51', '2021-01-26 06:11:51'),
(59, '7', '2021-01-26', 1, NULL, NULL, NULL, 7187.5, 7187.5, NULL, 6250, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, 1, '2021-01-26 06:12:33', '2021-01-26 06:25:00'),
(60, '8', '2021-01-26', 1, NULL, NULL, NULL, 21781, 17700, NULL, 18940, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1781, 0, 1, NULL, '2021-01-26 07:28:41', '2021-01-26 07:43:44'),
(61, '9', '2021-01-30', 1, NULL, NULL, NULL, 9332.25, 7632.25, NULL, 8115, 0, NULL, NULL, NULL, 0, 15, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, 0, 1, NULL, '2021-01-30 04:09:23', '2021-01-30 12:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_entries`
--

CREATE TABLE `invoice_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `buy_price` double NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `discount_type` tinyint(4) NOT NULL COMMENT '0= % 1= BDT',
  `discount_amount` double NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_entries`
--

INSERT INTO `invoice_entries` (`id`, `invoice_id`, `product_id`, `product_entry_id`, `customer_id`, `reference_id`, `buy_price`, `rate`, `quantity`, `total_amount`, `discount_type`, `discount_amount`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(126, 53, 21, 263, 1, NULL, 8115, 8115, 1, 8115, 0, 0, NULL, 1, NULL, NULL, NULL),
(127, 53, 21, 265, 1, NULL, 8300, 8300, 2, 16600, 0, 0, NULL, 1, NULL, NULL, NULL),
(128, 54, 21, 264, 1, NULL, 8115, 8115, 1, 8115, 0, 0, NULL, 1, NULL, '2021-01-26 06:06:51', NULL),
(129, 55, 21, 268, 1, NULL, 8050, 8050, 1, 8050, 0, 0, NULL, 1, NULL, '2021-01-26 06:07:09', NULL),
(130, 56, 21, 266, 1, NULL, 7025, 7025, 1, 7025, 0, 0, NULL, 1, NULL, '2021-01-26 06:07:29', NULL),
(131, 57, 21, 267, 1, NULL, 12160, 12160, 1, 12160, 0, 0, NULL, 1, NULL, '2021-01-26 06:11:33', NULL),
(132, 58, 21, 267, 1, NULL, 12160, 12160, 1, 12160, 0, 0, NULL, 1, NULL, '2021-01-26 06:11:51', NULL),
(135, 59, 21, 272, 1, NULL, 6250, 6250, 1, 6250, 0, 0, NULL, 1, NULL, NULL, NULL),
(136, 60, 21, 267, 1, NULL, 12160, 12160, 1, 12160, 0, 0, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(137, 60, 21, 270, 1, NULL, 6780, 6780, 1, 6780, 0, 0, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(138, 61, 21, 264, 1, NULL, 8115, 8115, 1, 8115, 0, 0, NULL, 1, NULL, '2021-01-30 04:09:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active 0=inactive',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_deliveries`
--

CREATE TABLE `message_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone_book_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_deliveries`
--

INSERT INTO `message_deliveries` (`id`, `message_id`, `customer_id`, `phone_book_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(12, 1, 23, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(13, 1, 24, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(14, 1, 25, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(15, 1, 26, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(16, 1, 27, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(17, 1, 28, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(18, 1, 29, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(19, 1, 30, NULL, 1, NULL, '2021-01-25 12:57:43', NULL),
(20, 1, 31, NULL, 1, NULL, '2021-01-25 12:57:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_lists`
--

CREATE TABLE `message_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_lists`
--

INSERT INTO `message_lists` (`id`, `title`, `body`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Big Sales', 'রুই ১.৫+, টাকা ২৬৫/কেজি \r\nমার্ক্স্ মিল্ক ৫০০ গ্রাম, টাকা ৫০ ছাড় ', 1, 1, '2021-01-25 10:03:42', '2021-01-25 13:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Product Categories', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Products', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Orders', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Purchases', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Sales Return', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Purchase Return', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Expenses', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Payments', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Contacts', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Paid Through Accounts', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Units', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Employee Salary', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Bar Code Print', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Discounts', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Reports', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Users', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Access Level', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `modules_access`
--

CREATE TABLE `modules_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `display` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules_access`
--

INSERT INTO `modules_access` (`id`, `module_id`, `user_id`, `display`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(2, 2, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(3, 3, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(4, 4, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(5, 5, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(6, 6, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(7, 7, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(8, 8, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(9, 9, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(10, 10, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(11, 11, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(12, 12, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(13, 13, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(14, 14, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(15, 15, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(16, 16, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(17, 17, 1, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(18, 1, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(19, 2, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(20, 3, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(21, 4, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(22, 5, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(23, 6, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(24, 7, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(25, 8, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(26, 9, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(27, 10, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(28, 11, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(29, 12, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(30, 13, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(31, 14, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(32, 15, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(33, 16, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(34, 17, 2, 1, 1, NULL, '2021-01-20 10:59:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `paid_through_accounts`
--

CREATE TABLE `paid_through_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paid_through_accounts`
--

INSERT INTO `paid_through_accounts` (`id`, `name`, `description`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'CASH', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'BKash/01718937082', NULL, NULL, 1, NULL, '2021-01-26 06:46:03', '2021-01-26 06:46:03'),
(3, 'Rocket/01718937082', NULL, NULL, 1, NULL, '2021-01-26 06:46:19', '2021-01-26 06:46:19'),
(4, 'Nogod/01718937082', NULL, NULL, 1, NULL, '2021-01-26 06:46:33', '2021-01-26 06:46:33'),
(5, 'Check', NULL, NULL, 1, 1, '2021-01-26 06:48:10', '2021-01-26 06:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `amount` double NOT NULL,
  `paid_through` bigint(20) UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0= invoice 1= bill 2= sales return 3= purchase return',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_number`, `payment_date`, `amount`, `paid_through`, `note`, `account_information`, `customer_id`, `type`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(98, '2', '2021-01-26', 1781, 1, 'n1', NULL, 1, 0, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(99, '3', '2021-01-26', 2000, 2, 'n2', '01718937082', 1, 0, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(100, '4', '2021-01-26', 100, 1, 'ns1', NULL, 1, 0, NULL, 1, NULL, '2021-01-26 07:43:44', NULL),
(101, '5', '2021-01-26', 200, 2, 'ns2', '01718937082', 1, 0, NULL, 1, NULL, '2021-01-26 07:43:44', NULL),
(102, '6', '2021-01-26', 500, 1, 'ps1', NULL, 2, 1, NULL, 1, NULL, '2021-01-26 07:50:24', NULL),
(103, '7', '2021-01-26', 300, 4, 'ps2', '01718937082', 2, 1, NULL, 1, NULL, '2021-01-26 07:50:24', NULL),
(104, '7', '2021-01-26', 50000, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-26 10:48:57', '2021-01-26 10:48:57'),
(105, '8', '2021-01-26', 6000, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-26 10:50:14', '2021-01-26 10:50:14'),
(106, '9', '2021-01-26', 500, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-26 10:53:18', '2021-01-26 10:53:18'),
(107, '10', '2021-01-30', 500, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-30 09:26:49', NULL),
(108, '11', '2021-01-30', 500, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-30 11:17:45', NULL),
(109, '12', '2021-01-30', 500, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-30 12:12:27', NULL),
(110, '13', '2021-01-30', 200, 1, NULL, NULL, 1, 0, NULL, 1, NULL, '2021-01-30 12:16:47', NULL),
(111, '10', '2021-01-30', 500, 1, NULL, NULL, 2, 1, NULL, 1, NULL, '2021-01-30 12:28:27', '2021-01-30 12:28:27'),
(112, '11', '2021-01-30', 700, 1, NULL, NULL, 2, 1, NULL, 1, NULL, '2021-01-30 12:31:14', '2021-01-30 12:31:14'),
(114, '12', '2021-01-30', 300, 1, NULL, NULL, 2, 1, NULL, 1, NULL, '2021-01-30 12:34:01', '2021-01-30 12:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment_entries`
--

CREATE TABLE `payment_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sales_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_entries`
--

INSERT INTO `payment_entries` (`id`, `payment_id`, `invoice_id`, `bill_id`, `sales_return_id`, `purchase_return_id`, `amount`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(98, 98, 60, NULL, NULL, NULL, 1781, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(99, 99, 60, NULL, NULL, NULL, 2000, NULL, 1, NULL, '2021-01-26 07:28:41', NULL),
(100, 100, 60, NULL, NULL, NULL, 100, NULL, 1, NULL, '2021-01-26 07:43:44', NULL),
(101, 101, 60, NULL, NULL, NULL, 200, NULL, 1, NULL, '2021-01-26 07:43:44', NULL),
(102, 102, NULL, 17, NULL, NULL, 500, NULL, 1, NULL, '2021-01-26 07:50:24', NULL),
(103, 103, NULL, 17, NULL, NULL, 300, NULL, 1, NULL, '2021-01-26 07:50:24', NULL),
(104, 104, 53, NULL, NULL, NULL, 27422.25, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(105, 104, 54, NULL, NULL, NULL, 9332.25, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(106, 104, 55, NULL, NULL, NULL, 9257.5, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(107, 104, 56, NULL, NULL, NULL, 3988, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(108, 105, 56, NULL, NULL, NULL, 4090.75, NULL, 1, NULL, '2021-01-26 10:50:14', NULL),
(109, 105, 57, NULL, NULL, NULL, 1909.25, NULL, 1, NULL, '2021-01-26 10:50:14', NULL),
(110, 106, 57, NULL, NULL, NULL, 500, NULL, 1, NULL, '2021-01-26 10:53:18', NULL),
(111, 107, 61, NULL, NULL, NULL, 500, NULL, 1, NULL, '2021-01-30 09:26:49', NULL),
(112, 108, 61, NULL, NULL, NULL, 500, NULL, 1, NULL, '2021-01-30 11:17:45', NULL),
(113, 109, 61, NULL, NULL, NULL, 500, NULL, 1, NULL, '2021-01-30 12:12:27', NULL),
(114, 110, 61, NULL, NULL, NULL, 200, NULL, 1, NULL, '2021-01-30 12:16:47', NULL),
(115, 111, NULL, 16, NULL, NULL, 500, NULL, 1, NULL, '2021-01-30 12:28:27', NULL),
(116, 112, NULL, 16, NULL, NULL, 700, NULL, 1, NULL, '2021-01-30 12:31:14', NULL),
(117, 114, NULL, 16, NULL, NULL, 300, NULL, 1, NULL, '2021-01-30 12:34:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `url_id` bigint(20) UNSIGNED NOT NULL,
  `access_level` tinyint(4) NOT NULL COMMENT '0= Not Allowed 1= Allowed',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `url_id`, `access_level`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 85, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(2, 1, 86, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(3, 1, 87, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(4, 1, 88, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(5, 1, 89, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(6, 1, 90, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(7, 1, 91, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(8, 1, 92, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(9, 1, 93, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(10, 1, 94, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(11, 1, 95, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(12, 1, 96, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(13, 1, 97, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(14, 1, 98, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(15, 1, 99, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(16, 1, 100, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(17, 1, 101, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(18, 1, 102, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(19, 1, 103, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(20, 1, 104, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(21, 1, 105, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(22, 1, 106, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(23, 1, 107, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(24, 1, 108, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(25, 1, 109, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(26, 1, 110, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(27, 1, 111, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(28, 1, 112, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(29, 1, 113, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(30, 1, 114, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(31, 1, 115, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(32, 1, 116, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(33, 1, 117, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(34, 1, 118, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(35, 1, 119, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(36, 1, 120, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(37, 1, 121, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(38, 1, 122, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(39, 1, 123, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(40, 1, 124, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(41, 1, 125, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(42, 1, 126, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(43, 1, 127, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(44, 1, 128, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(45, 1, 129, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(46, 1, 130, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(47, 1, 131, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(48, 1, 132, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(49, 1, 133, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(50, 1, 134, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(51, 1, 135, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(52, 1, 136, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(53, 1, 137, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(54, 1, 138, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(55, 1, 139, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(56, 1, 140, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(57, 1, 141, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(58, 1, 142, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(59, 1, 143, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(60, 1, 144, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(61, 1, 145, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(62, 1, 146, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(63, 1, 147, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(64, 1, 148, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(65, 1, 149, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(66, 1, 150, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(67, 1, 151, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(68, 1, 152, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(69, 1, 153, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(70, 1, 154, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(71, 1, 155, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(72, 1, 156, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(73, 1, 157, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(74, 1, 158, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(75, 1, 159, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(76, 1, 160, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(77, 1, 161, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(78, 1, 162, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(79, 1, 163, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(80, 1, 164, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(81, 1, 165, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(82, 1, 166, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(83, 1, 167, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(84, 1, 168, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(85, 1, 169, 1, 1, NULL, '2021-01-03 07:38:07', NULL),
(86, 2, 85, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(87, 2, 86, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(88, 2, 87, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(89, 2, 88, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(90, 2, 89, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(91, 2, 90, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(92, 2, 91, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(93, 2, 92, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(94, 2, 93, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(95, 2, 94, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(96, 2, 95, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(97, 2, 96, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(98, 2, 97, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(99, 2, 98, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(100, 2, 99, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(101, 2, 100, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(102, 2, 101, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(103, 2, 102, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(104, 2, 103, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(105, 2, 104, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(106, 2, 105, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(107, 2, 106, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(108, 2, 107, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(109, 2, 108, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(110, 2, 109, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(111, 2, 110, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(112, 2, 111, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(113, 2, 112, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(114, 2, 113, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(115, 2, 114, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(116, 2, 115, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(117, 2, 116, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(118, 2, 117, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(119, 2, 118, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(120, 2, 119, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(121, 2, 120, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(122, 2, 121, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(123, 2, 122, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(124, 2, 123, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(125, 2, 124, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(126, 2, 125, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(127, 2, 126, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(128, 2, 127, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(129, 2, 128, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(130, 2, 129, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(131, 2, 130, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(132, 2, 131, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(133, 2, 132, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(134, 2, 133, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(135, 2, 134, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(136, 2, 135, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(137, 2, 136, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(138, 2, 137, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(139, 2, 138, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(140, 2, 139, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(141, 2, 140, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(142, 2, 141, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(143, 2, 142, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(144, 2, 143, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(145, 2, 144, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(146, 2, 145, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(147, 2, 146, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(148, 2, 147, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(149, 2, 148, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(150, 2, 149, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(151, 2, 150, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(152, 2, 151, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(153, 2, 152, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(154, 2, 153, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(155, 2, 154, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(156, 2, 155, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(157, 2, 156, 0, 1, NULL, '2021-01-20 10:59:35', '2021-01-20 11:03:20'),
(158, 2, 157, 0, 1, NULL, '2021-01-20 10:59:35', '2021-01-20 11:03:20'),
(159, 2, 158, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(160, 2, 159, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(161, 2, 160, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(162, 2, 161, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(163, 2, 162, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(164, 2, 163, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(165, 2, 164, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(166, 2, 165, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(167, 2, 166, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(168, 2, 167, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(169, 2, 168, 1, 1, NULL, '2021-01-20 10:59:35', NULL),
(170, 2, 169, 1, 1, NULL, '2021-01-20 10:59:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phone_book`
--

CREATE TABLE `phone_book` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_in_hand` double DEFAULT NULL,
  `total_sold` double DEFAULT NULL,
  `unit` bigint(20) UNSIGNED DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `total_purchase_return` double DEFAULT NULL,
  `total_sales_return` double DEFAULT NULL,
  `total_damage` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active 0=inactive',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `item_id`, `name`, `product_code`, `stock_in_hand`, `total_sold`, `unit`, `buy_price`, `sell_price`, `total_purchase_return`, `total_sales_return`, `total_damage`, `image`, `status`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'Opening Balance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-03 01:39:13', '2021-01-03 01:39:13'),
(21, NULL, NULL, NULL, 'High Comod', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-01 01:19:30', '2021-01-01 01:19:30'),
(22, NULL, NULL, NULL, 'Low Pan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-01 02:30:47', '2021-01-01 02:30:47'),
(23, NULL, NULL, NULL, 'Wash Basin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-01 02:50:24', '2021-01-01 02:50:24'),
(24, NULL, NULL, NULL, 'Corner Basin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-01 03:01:12', '2021-01-01 03:01:12'),
(25, NULL, NULL, NULL, 'Cabinet Basin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, '2021-01-11 18:24:27', '2021-01-11 18:24:27'),
(26, NULL, NULL, NULL, 'door', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, '2021-01-11 18:35:14', '2021-01-26 09:42:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_customers`
--

CREATE TABLE `product_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `whole_sale_price` double DEFAULT NULL,
  `retail_price` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_entries`
--

CREATE TABLE `product_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_in_hand` double DEFAULT NULL,
  `opening_stock` double DEFAULT NULL,
  `total_sold` double DEFAULT 0,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `total_purchase_return` double DEFAULT NULL,
  `total_sales_return` double DEFAULT NULL,
  `total_damage` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL COMMENT '1=Inclusive 2=Exclusive',
  `selling_price_exclusive_tax` double DEFAULT NULL,
  `vat_percentage` double DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active 0=inactive',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_type` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_entries`
--

INSERT INTO `product_entries` (`id`, `product_id`, `sub_category_id`, `brand_id`, `supplier_id`, `product_code`, `name`, `stock_in_hand`, `opening_stock`, `total_sold`, `buy_price`, `sell_price`, `total_purchase_return`, `total_sales_return`, `total_damage`, `image`, `unit_id`, `alert_quantity`, `tax_type`, `selling_price_exclusive_tax`, `vat_percentage`, `service_charge`, `status`, `branch_id`, `product_type`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, '1', 'Opening Balance', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-03 01:39:32', '2021-01-03 01:39:32'),
(263, 21, NULL, 8, NULL, '1', 'Sara', 2, 1, 4, 8115, 8115, NULL, NULL, NULL, NULL, 1, 2, 1, 8115, NULL, NULL, 1, NULL, 2, 1, NULL, '2021-01-01 01:19:51', '2021-01-27 04:50:55'),
(264, 21, NULL, 8, NULL, '2', 'Sara', 201, 2, 2, 8115, 8115, NULL, NULL, NULL, NULL, 1, 2, 2, 8115, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 01:33:34', '2021-01-30 04:09:23'),
(265, 21, NULL, 9, NULL, '3', 'Orient', 0, 1, 2, 8300, 8300, NULL, NULL, NULL, NULL, 1, 10, 1, 8300, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 01:38:23', '2021-01-25 07:08:32'),
(266, 21, NULL, 9, NULL, '4', 'Karla', 0, 1, 1, 7025, 7025, NULL, NULL, NULL, NULL, 1, 2, 2, 7025, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:03:10', '2021-01-26 06:07:29'),
(267, 21, NULL, 9, NULL, '5', 'Amanda', 0, 1, 3, 12160, 12160, NULL, NULL, NULL, NULL, 1, 2, 1, 12160, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:05:05', '2021-01-26 07:28:41'),
(268, 21, NULL, 10, NULL, '6', 'Verso', 0, 1, 1, 8050, 8050, NULL, NULL, NULL, NULL, NULL, 2, 1, 8050, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:06:24', '2021-01-26 06:07:09'),
(269, 21, NULL, 10, NULL, '7', 'Verso', 1, 1, 0, 8050, 8050, NULL, NULL, NULL, NULL, 1, NULL, 1, 8050, NULL, NULL, 0, NULL, 1, 1, NULL, '2021-01-01 02:11:04', '2021-01-03 00:26:35'),
(270, 21, NULL, 10, NULL, '8', 'Marcella', 0, 1, 1, 6780, 6780, NULL, NULL, NULL, NULL, 1, NULL, 1, 6780, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:13:09', '2021-01-26 07:28:41'),
(271, 21, NULL, 10, NULL, '9', 'Marcella', NULL, NULL, 0, 6780, 6780, NULL, NULL, NULL, NULL, NULL, 2, 1, 6780, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:17:16', '2021-01-01 02:17:16'),
(272, 21, NULL, 10, NULL, '10', 'Victoria', 1, 2, 1, 6250, 6250, NULL, NULL, NULL, NULL, NULL, 2, 1, 6250, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:18:57', '2021-01-26 06:25:11'),
(273, 21, NULL, 10, NULL, '11', 'Victoria', 2, 2, 0, 6250, 6250, NULL, NULL, NULL, NULL, NULL, 2, 1, 6250, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:20:23', '2021-01-03 00:28:22'),
(274, 21, NULL, 10, NULL, '12', 'Imola', 1, 1, 0, 5750, 5750, NULL, NULL, NULL, NULL, 1, 2, 1, 5750, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:21:56', '2021-01-03 00:29:29'),
(275, 21, NULL, 10, NULL, '13', 'Isabella', 1, 1, 0, 11875, 11875, NULL, NULL, NULL, NULL, 1, 2, 1, 11875, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:23:21', '2021-01-03 00:30:07'),
(276, 21, NULL, 10, NULL, '14', 'Isabella', 1, 1, 0, 11875, 11875, NULL, NULL, NULL, NULL, NULL, 2, 1, 11875, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:24:22', '2021-01-03 00:31:05'),
(277, 21, NULL, 11, NULL, '15', 'Glory', 2, 2, 0, 5500, 5500, NULL, NULL, NULL, NULL, 1, 2, 1, 5500, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:25:30', '2021-01-03 00:31:47'),
(278, 21, NULL, 11, NULL, '16', 'Glory', 2, 2, 0, 5500, 5500, NULL, NULL, NULL, NULL, 1, 2, 1, 5500, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:27:01', '2021-01-03 00:32:20'),
(279, 22, NULL, 8, NULL, '17', 'Asian Pan', 2, NULL, 0, 1200, 1200, NULL, NULL, NULL, NULL, 1, 2, 1, 1200, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:31:42', '2021-01-03 00:32:56'),
(280, 22, NULL, 8, NULL, '18', 'Asian Pan', 3, NULL, 0, 1200, 1200, NULL, NULL, NULL, NULL, 1, 2, 1, 1200, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:32:40', '2021-01-03 00:33:26'),
(281, 22, NULL, 9, NULL, '19', 'R.A.K Pan', 1, NULL, 0, 920, 920, NULL, NULL, NULL, NULL, NULL, 2, 1, 920, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:34:00', '2021-01-03 00:33:56'),
(282, 22, NULL, 9, NULL, '20', 'R.A.K Pan', 2, NULL, 0, 920, 920, NULL, NULL, NULL, NULL, 1, 2, 1, 920, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:35:55', '2021-01-03 00:34:49'),
(283, 22, NULL, 9, NULL, '21', 'R.A.K Pan', 1, NULL, 0, 920, 920, NULL, NULL, NULL, NULL, 1, 2, 1, 920, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:38:49', '2021-01-03 00:36:30'),
(284, 22, NULL, 9, NULL, '22', 'R.A.K Pan', 5, NULL, 0, 1600, 1600, NULL, NULL, NULL, NULL, 1, 2, 1, 1600, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:39:44', '2021-01-03 00:37:42'),
(285, 22, NULL, 11, NULL, '23', 'Glory Pan', 1, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, 1, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:43:03', '2021-01-03 00:43:49'),
(286, 22, NULL, 11, NULL, '24', 'Glory Pan', 11, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, NULL, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:43:49', '2021-01-03 00:46:28'),
(287, 22, NULL, 11, NULL, '25', 'Glory Pan', NULL, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, NULL, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:44:34', '2021-01-01 02:44:34'),
(288, 22, NULL, 11, NULL, '26', 'Glory Pan', 1, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, NULL, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:47:13', '2021-01-03 00:47:37'),
(289, 22, NULL, 11, NULL, '27', 'Glory Pan', NULL, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, 1, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:48:05', '2021-01-01 02:48:05'),
(290, 22, NULL, 11, NULL, '28', 'Glory Pan', 2, NULL, 0, 800, 800, NULL, NULL, NULL, NULL, 1, 2, 1, 800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:48:57', '2021-01-03 00:48:50'),
(291, 22, NULL, 12, NULL, '29', 'BISF Pan', 1, NULL, 0, 1700, 1700, NULL, NULL, NULL, NULL, NULL, 2, 1, 1700, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:49:56', '2021-01-03 00:53:08'),
(292, 23, NULL, 10, NULL, '30', 'Silvana', NULL, NULL, 0, 2230, 2230, NULL, NULL, NULL, NULL, NULL, 2, 1, 2230, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:51:01', '2021-01-01 02:51:01'),
(293, 23, NULL, 10, NULL, '31', 'Silvana', NULL, NULL, 0, 2230, 2230, NULL, NULL, NULL, NULL, NULL, 2, 1, 2230, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:51:47', '2021-01-01 02:51:47'),
(294, 23, NULL, 10, NULL, '32', 'Silvana', NULL, NULL, 0, 2230, 2230, NULL, NULL, NULL, NULL, NULL, 2, 1, 2230, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:52:28', '2021-01-01 02:52:28'),
(295, 23, NULL, 10, NULL, '33', 'Crown', NULL, NULL, 0, 2080, 2080, NULL, NULL, NULL, NULL, NULL, 2, 1, 2080, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:53:14', '2021-01-01 02:53:14'),
(296, 23, NULL, 10, NULL, '34', 'Crown', NULL, NULL, 0, 2080, 2080, NULL, NULL, NULL, NULL, NULL, 2, 1, 2080, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:53:58', '2021-01-01 02:53:58'),
(297, 23, NULL, 10, NULL, '35', 'Crown', NULL, NULL, 0, 2080, 2080, NULL, NULL, NULL, NULL, NULL, 2, 1, 2080, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:55:06', '2021-01-01 02:55:06'),
(298, 23, NULL, 10, NULL, '36', 'Adriana', NULL, NULL, 0, 1870, 1870, NULL, NULL, NULL, NULL, 1, 2, 1, 1870, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:57:51', '2021-01-01 02:57:51'),
(299, 23, NULL, 10, NULL, '37', 'Adriana', NULL, NULL, 0, 1870, 1870, NULL, NULL, NULL, NULL, 1, 2, 1, 1870, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 02:58:56', '2021-01-01 02:58:56'),
(300, 23, NULL, 10, NULL, '38', 'Adriana', NULL, NULL, 0, 1870, 1870, NULL, NULL, NULL, NULL, 1, 2, 1, 1870, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:00:37', '2021-01-01 03:00:37'),
(301, 24, NULL, 10, NULL, '39', 'Elana', NULL, NULL, 0, 2250, 2250, NULL, NULL, NULL, NULL, 1, 2, 1, 2250, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:01:59', '2021-01-01 03:01:59'),
(302, 24, NULL, 10, NULL, '40', 'Elana', NULL, NULL, 0, 2250, 2250, NULL, NULL, NULL, NULL, 1, 2, 1, 2250, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:02:48', '2021-01-01 03:02:48'),
(303, 24, NULL, 10, NULL, '41', 'Elana', NULL, NULL, 0, 2250, 2250, NULL, NULL, NULL, NULL, 1, 2, 1, 2250, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:03:34', '2021-01-01 03:03:34'),
(304, 24, NULL, 11, NULL, '42', 'Glory', 1, NULL, 0, 1400, 1400, NULL, NULL, NULL, NULL, 1, 2, 1, 1400, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:04:25', '2021-01-03 00:55:41'),
(305, 23, NULL, 11, NULL, '43', 'Glory 3 Dot', 1, NULL, 0, 4800, 4800, NULL, NULL, NULL, NULL, 1, 2, 1, 4800, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:05:19', '2021-01-03 00:56:55'),
(306, 23, NULL, 11, NULL, '44', 'Glory 3 Dot', 1, NULL, 0, 5500, 5500, NULL, NULL, NULL, NULL, 1, 2, 1, 5500, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:06:28', '2021-01-03 00:57:33'),
(307, 23, NULL, 11, NULL, '45', 'Glory SQ Basin', 1, NULL, 0, 4600, 4600, NULL, NULL, NULL, NULL, 1, 2, 1, 4600, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:07:46', '2021-01-03 00:58:26'),
(308, 23, NULL, 11, NULL, '46', 'Glory SQ Basin', 1, NULL, 0, 4500, 4500, NULL, NULL, NULL, NULL, 1, 2, 1, 4500, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-01 03:08:45', '2021-01-03 00:59:17'),
(310, 22, NULL, 9, NULL, '47', 'R.A.K Pan', 5, 5, 0, 1600, 1600, NULL, NULL, NULL, NULL, 1, 2, 1, 1600, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-03 00:40:37', '2021-01-03 00:40:37'),
(311, 22, NULL, 11, NULL, '48', 'Glory Pan', 1, 1, 0, 1300, 1300, NULL, NULL, NULL, NULL, NULL, 2, 1, 1300, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-03 00:52:21', '2021-01-03 00:52:21'),
(312, 21, NULL, 9, NULL, '49', 'R.A.K Pan', 1, 1, 0, 7025, 7025, NULL, NULL, NULL, NULL, NULL, 2, 1, 7025, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-03 01:08:39', '2021-01-03 01:08:39'),
(314, 25, NULL, 15, NULL, '50', 'Wash Basin', 1, 1, 0, 16500, 20000, NULL, NULL, NULL, NULL, 1, 1, 1, 20000, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-11 18:26:45', '2021-01-11 18:26:45'),
(315, 25, NULL, 13, NULL, '51', 'Wash Basin', 1, 1, 0, 20000, 25000, NULL, NULL, NULL, NULL, 1, 1, 1, 25000, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-11 18:33:24', '2021-01-11 18:33:24'),
(316, 22, NULL, 15, NULL, '52', 'dfdsff', NULL, NULL, 0, 1, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2021-01-27 12:38:01', '2021-01-27 12:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `whole_sale_price` double DEFAULT NULL,
  `retail_price` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_suppliers`
--

INSERT INTO `product_suppliers` (`id`, `product_entry_id`, `supplier_id`, `whole_sale_price`, `retail_price`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(22, 263, 37, 120, 240, 1, NULL, '2021-01-30 06:47:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(10, 'Color', NULL, 1, NULL, '2021-01-21 04:40:47', '2021-01-21 04:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_entries`
--

CREATE TABLE `product_variation_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `variation_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variation_entries`
--

INSERT INTO `product_variation_entries` (`id`, `product_entry_id`, `variation_id`, `variation_value_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(47, 263, 10, 51, 1, NULL, '2021-01-30 06:10:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_values`
--

CREATE TABLE `product_variation_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variation_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variation_values`
--

INSERT INTO `product_variation_values` (`id`, `product_variation_id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(51, 10, 'Red', NULL, 1, NULL, '2021-01-21 04:40:47', NULL),
(52, 10, 'White', NULL, 1, NULL, '2021-01-21 04:40:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return`
--

CREATE TABLE `purchase_return` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_return_date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total_amount` double NOT NULL,
  `return_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `vat_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `total_vat` double DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_discount_type` tinyint(4) DEFAULT NULL,
  `total_discount_amount` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_entries`
--

CREATE TABLE `purchase_return_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return`
--

CREATE TABLE `sales_return` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `sales_return_number` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_return_date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `sub_total_amount` double NOT NULL,
  `return_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `vat_type` tinyint(4) DEFAULT NULL COMMENT '0= % 1= BDT',
  `total_vat` double DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_discount_type` tinyint(4) DEFAULT NULL,
  `total_discount_amount` double DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_entries`
--

CREATE TABLE `sales_return_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_return_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `buy_price` double NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=active 0=inactive',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sales_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `income_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `paid_through` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_date`, `invoice_id`, `bill_id`, `sales_return_id`, `purchase_return_id`, `expense_id`, `income_id`, `payment_id`, `customer_id`, `amount`, `paid_through`, `type`, `note`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(38, '2021-01-24', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1000, 1, 2, NULL, NULL, 1, NULL, NULL, NULL),
(39, '2021-01-24', NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 50000, 1, 2, NULL, NULL, 1, NULL, NULL, NULL),
(40, '2021-01-24', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 15000, 1, 2, NULL, NULL, 1, NULL, NULL, NULL),
(42, '2021-01-22', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1800, 1, 2, 'Test Note', NULL, 1, NULL, NULL, NULL),
(44, '2021-01-26', 53, NULL, NULL, NULL, NULL, NULL, 104, 1, 27422.25, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(45, '2021-01-26', 54, NULL, NULL, NULL, NULL, NULL, 104, 1, 9332.25, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(46, '2021-01-26', 55, NULL, NULL, NULL, NULL, NULL, 104, 1, 9257.5, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(47, '2021-01-26', 56, NULL, NULL, NULL, NULL, NULL, 104, 1, 3988, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:48:57', NULL),
(48, '2021-01-26', 56, NULL, NULL, NULL, NULL, NULL, 105, 1, 4090.75, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:50:14', NULL),
(49, '2021-01-26', 57, NULL, NULL, NULL, NULL, NULL, 105, 1, 1909.25, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:50:14', NULL),
(50, '2021-01-26', 57, NULL, NULL, NULL, NULL, NULL, 106, 1, 500, 1, 0, NULL, NULL, 1, NULL, '2021-01-26 10:53:18', NULL),
(51, '2021-01-30', NULL, 16, NULL, NULL, NULL, NULL, 111, 2, 500, 1, 1, NULL, NULL, 1, NULL, '2021-01-30 12:28:27', NULL),
(52, '2021-01-30', NULL, 16, NULL, NULL, NULL, NULL, 112, 2, 700, 1, 1, NULL, NULL, 1, NULL, '2021-01-30 12:31:14', NULL),
(53, '2021-01-30', NULL, 16, NULL, NULL, NULL, NULL, 114, 2, 300, 1, 1, NULL, NULL, 1, NULL, '2021-01-30 12:34:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `branch_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'pcs', NULL, 1, NULL, '2021-01-03 07:40:36', '2021-01-03 07:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

CREATE TABLE `urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urls`
--

INSERT INTO `urls` (`id`, `name`, `url`, `module_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(85, 'Product Categories Create', 'products_category_index', 1, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(86, 'Product Categories Store', 'products_category_store', 1, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(87, 'Product Categories Edit', 'products_category_edit', 1, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(88, 'Product Categories Update', 'products_category_update', 1, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(89, 'Product Create', 'products_index', 2, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(90, 'Product Store', 'products_store', 2, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(91, 'Product Edit', 'products_edit', 2, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(92, 'Product Update', 'products_update', 2, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(93, 'All Orders', 'invoices_all_sales', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(94, 'Order Create', 'invoices_index', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(95, 'Order Store', 'invoices_store', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(96, 'Order Edit', 'invoices_edit', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(97, 'Order Update', 'invoices_update', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(98, 'Order Show A4 Size', 'invoices_show', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(99, 'Order Show Pos Printer', 'invoices_show_pos', 3, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(100, 'All Purchases', 'bills_all_bills', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(101, 'Purchase Create', 'bills_index', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(102, 'Purchase Store', 'bills_edit', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(103, 'Purchase Edit', 'bills_store', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(104, 'Purchase Update', 'bills_update', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(105, 'Purchase Show', 'bills_show', 4, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(106, 'Sales Return Create', 'sales_return_index', 5, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(107, 'Sales Return Store', 'sales_return_store', 5, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(108, 'Sales Return Show', 'sales_return_show', 5, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(109, 'Sales Return Delete', 'sales_return_delete', 5, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(110, 'Purchase Return Create', 'purchase_return_index', 6, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(111, 'Purchase Return Store', 'purchase_return_store', 6, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(112, 'Purchase Return Show', 'purchase_return_show', 6, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(113, 'Purchase Return Delete', 'purchase_return_delete', 6, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(114, 'Expense Categories Store', 'expenses_categories_store', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(115, 'Expense Categories Edit', 'expenses_categories_edit', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(116, 'Expense Categories Update', 'expenses_categories_update', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(117, 'Expenses Create', 'expenses_index', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(118, 'Expenses Store', 'expenses_store', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(119, 'Expenses Edit', 'expenses_edit', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(120, 'Expenses Update', 'expenses_update', 7, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(121, 'Payments Create', 'payments_create', 8, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(122, 'Payments Store', 'payments_store', 8, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(123, 'Payments Show', 'payments_print', 8, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(124, 'Payments Delete', 'payments_delete', 8, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(125, 'Contacts Create', 'customers_index', 9, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(126, 'Contacts Store', 'customers_store', 9, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(127, 'Contacts Edit', 'customers_edit', 9, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(128, 'Contacts Update', 'customers_update', 9, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(129, 'Paid Through Accounts Create', 'paid_through_accounts_index', 10, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(130, 'Paid Through Accounts Store', 'paid_through_accounts_store', 10, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(131, 'Paid Through Accounts Edit', 'paid_through_accounts_edit', 10, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(132, 'Paid Through Accounts Update', 'paid_through_accounts_update', 10, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(133, 'Units Create', 'products_units_index', 11, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(134, 'Units Store', 'products_units_store', 11, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(135, 'Units Edit', 'products_units_edit', 11, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(136, 'Units Update', 'products_units_update', 11, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(137, 'Employee Salary Create', 'expenses_employee_salary_index', 12, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(138, 'Employee Salary Store', 'expenses_employee_salary_store', 12, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(139, 'Employee Salary Edit', 'expenses_employee_salary_edit', 12, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(140, 'Employee Salary Update', 'expenses_employee_salary_update', 12, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(141, 'Bar Code Generate', 'products_barcode_print', 13, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(142, 'Bar Code Print', 'products_barcode_print_print', 13, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(143, 'Discounts Create', 'discounts_index', 14, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(144, 'Discounts Store', 'discounts_store', 14, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(145, 'Discounts Edit', 'discounts_edit', 14, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(146, 'Discounts Update', 'discounts_update', 14, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(147, 'Users Create', 'users_index', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(148, 'Users Store', 'users_store', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(149, 'Users Edit', 'users_edit', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(150, 'Users Update', 'users_update', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(151, 'Users Delete', 'users_destroy', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(152, 'Users Profile Edit', 'users_edit_profile', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(153, 'Users Profile Update', 'users_update_profile', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(154, 'Users Settings Edit', 'users_edit_settings', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(155, 'Users Settings Update', 'users_update_settings', 16, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(156, 'Access Level Create', 'set_access_index', 17, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(157, 'Access Level Update', 'set_access_update', 17, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(158, 'Stock Report', 'stock_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(159, 'Profit Loss Report', 'profit_loss_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(160, 'Sales Report', 'sales_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(161, 'Sales Summary Report', 'sales_summary_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(162, 'Purchase Report', 'purchase_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(163, 'Purchase Summary Report', 'purchase_summary_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(164, 'Customer Due Report', 'due_report_customer_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(165, 'Supplier Due Report', 'due_report_supplier_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(166, 'Payment Report', 'payment_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(167, 'Expense Rerport', 'expense_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(168, 'Collection Report', 'collection_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00'),
(169, 'SalaryReport', 'salary_report_index', 15, 1, 0, '2020-11-05 01:49:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) NOT NULL COMMENT '1=Super Admin 2=Admin 3=Employee 4=cutomer',
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=Active\r\n0=Inactive',
  `organization_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_show` double DEFAULT NULL,
  `vat_reg_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mushak` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_type` tinyint(4) DEFAULT NULL,
  `vat_amount` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `pos_printer` tinyint(4) DEFAULT 1 COMMENT '0= 58 mm Label Size 1 = 80 mm Label Size 2 = A4 3 = letter',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `logo`, `remember_token`, `role`, `branch_id`, `status`, `organization_name`, `address`, `contact_number`, `contact_email`, `website`, `header_image`, `footer_image`, `sales_show`, `vat_reg_number`, `mushak`, `vat_type`, `vat_amount`, `tax_type`, `tax_amount`, `pos_printer`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Cyberdyne Technology Ltd.', 'superadmin', '0000-00-00 00:00:00', '$2y$10$e4t28BJ6.DSK1gmQ/IO3qOB0WqszhEzUvr0HGEypWGuHLuBY9zC3S', 'company-profile-images/1611226529.png', 'company-profile-images/1611663314.png', '', 1, 1, 1, 'Cyberdyne Technology Ltd', 'House # 1/6/1 (GF, 2 nd &4 th floor), Road # 1', '01715317133', 'info@cyberdynetechnologyltd.com', 'www.cyberdynetechnologyltd.com', '', '', 0, '12-23-34-21', '1001', 0, 15, 0, 0, 3, 1, 1, '2020-04-23 15:06:17', '2021-01-26 12:15:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_78_vendor_id_foreign` (`vendor_id`),
  ADD KEY `bills_78_created_by_foreign` (`created_by`),
  ADD KEY `bills_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `bill_entries`
--
ALTER TABLE `bill_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_entries_78_bill_id_foreign` (`bill_id`),
  ADD KEY `bill_entries_78_product_id_foreign` (`product_id`),
  ADD KEY `bill_entries_78_product_entry_id_foreign` (`product_entry_id`),
  ADD KEY `bill_entries_78_vendor_id_foreign` (`vendor_id`),
  ADD KEY `bill_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `bill_entries_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categories_78_created_by_foreign` (`created_by`),
  ADD KEY `categories_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_78_created_by_foreign` (`created_by`),
  ADD KEY `discounts_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_products_78_product_id_foreign` (`product_id`),
  ADD KEY `discount_products_78_discount_id_foreign` (`discount_id`),
  ADD KEY `discount_products_78_created_by_foreign` (`created_by`),
  ADD KEY `discount_products_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_78_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_78_user_id_foreign` (`user_id`),
  ADD KEY `expenses_78_created_by_foreign` (`created_by`),
  ADD KEY `expenses_78_updated_by_foreign` (`updated_by`),
  ADD KEY `paid_through_id` (`paid_through_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_78_created_by_foreign` (`created_by`),
  ADD KEY `expense_categories_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `income_category_id` (`income_category_id`),
  ADD KEY `paid_through_id` (`paid_through_id`);

--
-- Indexes for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_78_customer_id_foreign` (`customer_id`),
  ADD KEY `invoices_78_created_by_foreign` (`created_by`),
  ADD KEY `invoices_78_updated_by_foreign` (`updated_by`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `invoice_entries`
--
ALTER TABLE `invoice_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_entries_78_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_entries_78_product_id_foreign` (`product_id`),
  ADD KEY `invoice_entries_78_product_entry_id_foreign` (`product_entry_id`),
  ADD KEY `invoice_entries_78_customer_id_foreign` (`customer_id`),
  ADD KEY `invoice_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `invoice_entries_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_78_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `items_78_created_by_foreign` (`created_by`),
  ADD KEY `items_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `message_deliveries`
--
ALTER TABLE `message_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `phone_book_id` (`phone_book_id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `message_lists`
--
ALTER TABLE `message_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_78_created_by_foreign` (`created_by`),
  ADD KEY `modules_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `modules_access`
--
ALTER TABLE `modules_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_access_78_module_id_foreign` (`module_id`),
  ADD KEY `modules_access_78_user_id_foreign` (`user_id`),
  ADD KEY `modules_access_78_created_by_foreign` (`created_by`),
  ADD KEY `modules_access_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `paid_through_accounts`
--
ALTER TABLE `paid_through_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paid_through_accounts_78_created_by_foreign` (`created_by`),
  ADD KEY `paid_through_accounts_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_78_customer_id_foreign` (`customer_id`),
  ADD KEY `payments_78_paid_through_foreign` (`paid_through`),
  ADD KEY `payments_78_created_by_foreign` (`created_by`),
  ADD KEY `payments_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `payment_entries`
--
ALTER TABLE `payment_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_entries_78_payment_id_foreign` (`payment_id`),
  ADD KEY `payment_entries_78_invoice_id_foreign` (`invoice_id`),
  ADD KEY `payment_entries_78_bill_id_foreign` (`bill_id`),
  ADD KEY `payment_entries_78_sales_return_id_foreign` (`sales_return_id`),
  ADD KEY `payment_entries_78_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `payment_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `payment_entries_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_78_url_id_foreign` (`url_id`),
  ADD KEY `permissions_78_user_id_foreign` (`user_id`),
  ADD KEY `permissions_78_created_by_foreign` (`created_by`),
  ADD KEY `permissions_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `phone_book`
--
ALTER TABLE `phone_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_78_category_id_foreign` (`category_id`),
  ADD KEY `products_78_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_78_item_id_foreign` (`item_id`),
  ADD KEY `products_78_unit_foreign` (`unit`),
  ADD KEY `products_78_created_by_foreign` (`created_by`),
  ADD KEY `products_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `product_customers`
--
ALTER TABLE `product_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `supplier_id` (`customer_id`),
  ADD KEY `product_entry_id` (`product_entry_id`);

--
-- Indexes for table `product_entries`
--
ALTER TABLE `product_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_entries_78_product_id_foreign` (`product_id`),
  ADD KEY `product_entries_78_unit_id_foreign` (`unit_id`),
  ADD KEY `product_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `product_entries_78_updated_by_foreign` (`updated_by`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_entry_id` (`product_entry_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `product_variation_entries`
--
ALTER TABLE `product_variation_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `product_entry_id` (`product_entry_id`),
  ADD KEY `variation_id` (`variation_id`),
  ADD KEY `variation_value_id` (`variation_value_id`);

--
-- Indexes for table `product_variation_values`
--
ALTER TABLE `product_variation_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `product_variation_id` (`product_variation_id`);

--
-- Indexes for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_78_bill_id_foreign` (`bill_id`),
  ADD KEY `purchase_return_78_customer_id_foreign` (`customer_id`),
  ADD KEY `purchase_return_78_created_by_foreign` (`created_by`),
  ADD KEY `purchase_return_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `purchase_return_entries`
--
ALTER TABLE `purchase_return_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_entries_78_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_entries_78_bill_id_foreign` (`bill_id`),
  ADD KEY `purchase_return_entries_78_product_id_foreign` (`product_id`),
  ADD KEY `purchase_return_entries_78_product_entry_id_foreign` (`product_entry_id`),
  ADD KEY `purchase_return_entries_78_customer_id_foreign` (`customer_id`),
  ADD KEY `purchase_return_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `purchase_return_entries_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_78_invoice_id_foreign` (`invoice_id`),
  ADD KEY `sales_return_78_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_return_78_created_by_foreign` (`created_by`),
  ADD KEY `sales_return_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sales_return_entries`
--
ALTER TABLE `sales_return_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_entries_78_sales_return_id_foreign` (`sales_return_id`),
  ADD KEY `sales_return_entries_78_invoice_id_foreign` (`invoice_id`),
  ADD KEY `sales_return_entries_78_product_id_foreign` (`product_id`),
  ADD KEY `sales_return_entries_78_product_entry_id_foreign` (`product_entry_id`),
  ADD KEY `sales_return_entries_78_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_return_entries_78_created_by_foreign` (`created_by`),
  ADD KEY `sales_return_entries_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_78_category_id_foreign` (`category_id`),
  ADD KEY `sub_categories_78_created_by_foreign` (`created_by`),
  ADD KEY `sub_categories_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_78_invoice_id_foreign` (`invoice_id`),
  ADD KEY `transactions_78_bill_id_foreign` (`bill_id`),
  ADD KEY `transactions_78_sales_return_id_foreign` (`sales_return_id`),
  ADD KEY `transactions_78_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `transactions_78_expense_id_foreign` (`expense_id`),
  ADD KEY `transactions_78_payment_id_foreign` (`payment_id`),
  ADD KEY `transactions_78_customer_id_foreign` (`customer_id`),
  ADD KEY `transactions_78_paid_through_foreign` (`paid_through`),
  ADD KEY `transactions_78_created_by_foreign` (`created_by`),
  ADD KEY `transactions_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_78_created_by_foreign` (`created_by`),
  ADD KEY `units_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `urls_78_module_id_foreign` (`module_id`),
  ADD KEY `urls_78_created_by_foreign` (`created_by`),
  ADD KEY `urls_78_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `branch_id` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backup`
--
ALTER TABLE `backup`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bill_entries`
--
ALTER TABLE `bill_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_products`
--
ALTER TABLE `discount_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `income_categories`
--
ALTER TABLE `income_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `invoice_entries`
--
ALTER TABLE `invoice_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_deliveries`
--
ALTER TABLE `message_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `message_lists`
--
ALTER TABLE `message_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `modules_access`
--
ALTER TABLE `modules_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `paid_through_accounts`
--
ALTER TABLE `paid_through_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `payment_entries`
--
ALTER TABLE `payment_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `phone_book`
--
ALTER TABLE `phone_book`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_customers`
--
ALTER TABLE `product_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_entries`
--
ALTER TABLE `product_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_variation_entries`
--
ALTER TABLE `product_variation_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `product_variation_values`
--
ALTER TABLE `product_variation_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `purchase_return`
--
ALTER TABLE `purchase_return`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `purchase_return_entries`
--
ALTER TABLE `purchase_return_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sales_return`
--
ALTER TABLE `sales_return`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sales_return_entries`
--
ALTER TABLE `sales_return_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `urls`
--
ALTER TABLE `urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `backup`
--
ALTER TABLE `backup`
  ADD CONSTRAINT `backup_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `backup_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bills_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bills_78_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_entries`
--
ALTER TABLE `bill_entries`
  ADD CONSTRAINT `bill_entries_78_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_78_product_entry_id_foreign` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_78_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discounts_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discount_products`
--
ALTER TABLE `discount_products`
  ADD CONSTRAINT `discount_products_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discount_products_78_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discount_products_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discount_products_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_78_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_78_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`paid_through_id`) REFERENCES `paid_through_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_categories_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incomes_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incomes_ibfk_3` FOREIGN KEY (`income_category_id`) REFERENCES `income_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `incomes_ibfk_4` FOREIGN KEY (`paid_through_id`) REFERENCES `paid_through_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income_categories`
--
ALTER TABLE `income_categories`
  ADD CONSTRAINT `income_categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `income_categories_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_entries`
--
ALTER TABLE `invoice_entries`
  ADD CONSTRAINT `invoice_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_78_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_78_product_entry_id_foreign` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_78_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_deliveries`
--
ALTER TABLE `message_deliveries`
  ADD CONSTRAINT `message_deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_deliveries_ibfk_2` FOREIGN KEY (`phone_book_id`) REFERENCES `phone_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_deliveries_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `message_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_lists`
--
ALTER TABLE `message_lists`
  ADD CONSTRAINT `message_lists_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_lists_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modules_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules_access`
--
ALTER TABLE `modules_access`
  ADD CONSTRAINT `modules_access_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modules_access_78_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modules_access_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `modules_access_78_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paid_through_accounts`
--
ALTER TABLE `paid_through_accounts`
  ADD CONSTRAINT `paid_through_accounts_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paid_through_accounts_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_78_paid_through_foreign` FOREIGN KEY (`paid_through`) REFERENCES `paid_through_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_entries`
--
ALTER TABLE `payment_entries`
  ADD CONSTRAINT `payment_entries_78_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permissions_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permissions_78_url_id_foreign` FOREIGN KEY (`url_id`) REFERENCES `urls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permissions_78_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_78_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_78_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_78_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_78_unit_foreign` FOREIGN KEY (`unit`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_entries`
--
ALTER TABLE `product_entries`
  ADD CONSTRAINT `product_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_78_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD CONSTRAINT `product_suppliers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_suppliers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_suppliers_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_suppliers_ibfk_4` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variations_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_variation_entries`
--
ALTER TABLE `product_variation_entries`
  ADD CONSTRAINT `product_variation_entries_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_entries_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_entries_ibfk_3` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_entries_ibfk_4` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_entries_ibfk_5` FOREIGN KEY (`variation_value_id`) REFERENCES `product_variation_values` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_variation_values`
--
ALTER TABLE `product_variation_values`
  ADD CONSTRAINT `product_variation_values_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_values_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_variation_values_ibfk_3` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_return`
--
ALTER TABLE `purchase_return`
  ADD CONSTRAINT `purchase_return_78_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_return_entries`
--
ALTER TABLE `purchase_return_entries`
  ADD CONSTRAINT `purchase_return_entries_78_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_product_entry_id_foreign` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_return_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_return`
--
ALTER TABLE `sales_return`
  ADD CONSTRAINT `sales_return_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_78_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_return_entries`
--
ALTER TABLE `sales_return_entries`
  ADD CONSTRAINT `sales_return_entries_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_product_entry_id_foreign` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_return_entries_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_78_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_categories_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_categories_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_78_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_paid_through_foreign` FOREIGN KEY (`paid_through`) REFERENCES `paid_through_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_return` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `units_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `urls`
--
ALTER TABLE `urls`
  ADD CONSTRAINT `urls_78_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `urls_78_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `urls_78_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
