-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2020 at 06:00 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills_9999999999`
--

CREATE TABLE `bills_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_number` text COLLATE utf8_unicode_ci NOT NULL,
  `bill_date` date NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `bill_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `total_discount` double NOT NULL,
  `adjustment_type` tinyint(4) DEFAULT NULL,
  `total_adjustment` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `total_vat` double DEFAULT NULL,
  `vat_type` tinyint(4) DEFAULT NULL,
  `adjustment_note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_entries_9999999999`
--

CREATE TABLE `bill_entries_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `discount_amount` double NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories_9999999999`
--

CREATE TABLE `categories_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers_9999999999`
--

CREATE TABLE `customers_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nid_number` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_contact` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_9999999999`
--

CREATE TABLE `expenses_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `expense_date` date NOT NULL,
  `expense_number` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories_9999999999`
--

CREATE TABLE `expense_categories_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `invoices_9999999999`
--

CREATE TABLE `invoices_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` text COLLATE utf8_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_amount` double NOT NULL,
  `due_amount` double NOT NULL,
  `total_buy_price` double NOT NULL,
  `total_discount` double NOT NULL,
  `adjustment_type` tinyint(4) DEFAULT NULL,
  `total_adjustment` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `total_vat` double DEFAULT NULL,
  `vat_type` tinyint(4) DEFAULT NULL,
  `adjustment_note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_entries_9999999999`
--

CREATE TABLE `invoice_entries_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_entry_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `buy_price` double NOT NULL,
  `rate` double NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `total_amount` double NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `discount_amount` double NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items_9999999999`
--

CREATE TABLE `items_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_9999999999`
--

CREATE TABLE `payments_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_number` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` date NOT NULL,
  `amount` double NOT NULL,
  `paid_through` tinyint(4) NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL COMMENT '0=invoice\r\n1=bill',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_entries_9999999999`
--

CREATE TABLE `payment_entries_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_9999999999`
--

CREATE TABLE `products_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_in_hand` double DEFAULT NULL,
  `total_sold` double DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `total_purchase_return` double DEFAULT NULL,
  `total_sales_return` double DEFAULT NULL,
  `total_damage` double DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_entries_9999999999`
--

CREATE TABLE `product_entries_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `stock_in_hand` double DEFAULT NULL,
  `buy_price` double NOT NULL,
  `sell_price` double NOT NULL,
  `total_sold` double DEFAULT NULL,
  `total_purchase_return` double DEFAULT NULL,
  `total_sales_return` double DEFAULT NULL,
  `total_damage` double DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------


CREATE TABLE `sub_categories_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions_9999999999`
--

CREATE TABLE `transactions_9999999999` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `paid_through` tinyint(4) NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0=invoice\r\n1=bill\r\n2=expense',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) NOT NULL COMMENT '1=Admin\r\n0=Employee',
  `associative_contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1=Active\r\n0=Inactive',
  `service_type` tinyint(4) NOT NULL COMMENT '1=Electronics Showroom\r\n2=Pos',
  `organization_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identification_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `bkash_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` tinyint(4) DEFAULT NULL COMMENT '1=free \r\n2=silver\r\n3=gold\r\n4=platinam',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `remember_token`, `role`, `associative_contact_id`, `status`, `service_type`, `organization_name`, `address`, `contact_number`, `contact_email`, `website`, `header_image`, `footer_image`, `identification_number`, `billing_date`, `bkash_number`, `package_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'K B M Zahid Hasan', 'admin@mail.com', NULL, '$2y$10$J1IMqOVzAF/lxr.8oY1xB.5c77h3Irq7nWEt50UCMYlJFO/XFLFJ2', NULL, NULL, 1, 1, 1, 0, 'Root Soft Bangladesh', 'Shamoli, Dhaka, Bangladesh', '01718937082', 'info@rootsoftbd.com', 'www.rootsoftbd.com', NULL, NULL, '1', '2020-01-01', '01718937082', 1, 1, 1, '2020-04-23 02:06:17', '2020-07-24 13:17:52');

--
-- Indexes for table `bills_9999999999`
--
ALTER TABLE `bills_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_ibfk_3` (`vendor_id`),
  ADD KEY `invoices_ibfk_1` (`created_by`),
  ADD KEY `invoices_ibfk_2` (`updated_by`);

--
-- Indexes for table `bill_entries_9999999999`
--
ALTER TABLE `bill_entries_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_entries_ibfk_1` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `invoice_id` (`bill_id`),
  ADD KEY `customer_id` (`vendor_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_entry_id` (`product_entry_id`);

--
-- Indexes for table `categories_9999999999`
--
ALTER TABLE `categories_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `customers_9999999999`
--
ALTER TABLE `customers_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `expenses_9999999999`
--
ALTER TABLE `expenses_9999999999`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories_9999999999`
--
ALTER TABLE `expense_categories_9999999999`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_9999999999`
--
ALTER TABLE `invoices_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_ibfk_3` (`customer_id`),
  ADD KEY `invoices_ibfk_1` (`created_by`),
  ADD KEY `invoices_ibfk_2` (`updated_by`);

--
-- Indexes for table `invoice_entries_9999999999`
--
ALTER TABLE `invoice_entries_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_entries_ibfk_1` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_entry_id` (`product_entry_id`);

--
-- Indexes for table `items_9999999999`
--
ALTER TABLE `items_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments_9999999999`
--
ALTER TABLE `payments_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment_entries_9999999999`
--
ALTER TABLE `payment_entries_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Indexes for table `products_9999999999`
--
ALTER TABLE `products_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `product_entries_9999999999`
--
ALTER TABLE `product_entries_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sub_categories_9999999999`
--
ALTER TABLE `sub_categories_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `transactions_9999999999`
--
ALTER TABLE `transactions_9999999999`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `transactions_ibfk_3` (`invoice_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for table `bills_9999999999`
--
ALTER TABLE `bills_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_entries_9999999999`
--
ALTER TABLE `bill_entries_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories_9999999999`
--
ALTER TABLE `categories_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customers_9999999999`
--
ALTER TABLE `customers_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_9999999999`
--
ALTER TABLE `expenses_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `expense_categories_9999999999`
--
ALTER TABLE `expense_categories_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices_9999999999`
--
ALTER TABLE `invoices_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_entries_9999999999`
--
ALTER TABLE `invoice_entries_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items_9999999999`
--
ALTER TABLE `items_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments_9999999999`
--
ALTER TABLE `payments_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_entries_9999999999`
--
ALTER TABLE `payment_entries_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_9999999999`
--
ALTER TABLE `products_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_entries_9999999999`
--
ALTER TABLE `product_entries_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories_9999999999`
--
ALTER TABLE `sub_categories_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions_9999999999`
--
ALTER TABLE `transactions_9999999999`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for table `bills_9999999999`
--
ALTER TABLE `bills_9999999999`
  ADD CONSTRAINT `bills_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bills_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bills_9999999999_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_entries_9999999999`
--
ALTER TABLE `bill_entries_9999999999`
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_3` FOREIGN KEY (`bill_id`) REFERENCES `bills_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_5` FOREIGN KEY (`vendor_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_entries_9999999999_ibfk_6` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories_9999999999`
--
ALTER TABLE `categories_9999999999`
  ADD CONSTRAINT `categories_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers_9999999999`
--
ALTER TABLE `customers_9999999999`
  ADD CONSTRAINT `customers_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices_9999999999`
--
ALTER TABLE `invoices_9999999999`
  ADD CONSTRAINT `invoices_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_9999999999_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_entries_9999999999`
--
ALTER TABLE `invoice_entries_9999999999`
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_4` FOREIGN KEY (`customer_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `products_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_entries_9999999999_ibfk_6` FOREIGN KEY (`product_entry_id`) REFERENCES `product_entries_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items_9999999999`
--
ALTER TABLE `items_9999999999`
  ADD CONSTRAINT `items_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_9999999999_ibfk_4` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments_9999999999`
--
ALTER TABLE `payments_9999999999`
  ADD CONSTRAINT `payments_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_9999999999_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_entries_9999999999`
--
ALTER TABLE `payment_entries_9999999999`
  ADD CONSTRAINT `payment_entries_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_9999999999_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_9999999999_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payments_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_entries_9999999999_ibfk_5` FOREIGN KEY (`bill_id`) REFERENCES `bills_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_9999999999`
--
ALTER TABLE `products_9999999999`
  ADD CONSTRAINT `products_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_9999999999_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_9999999999_ibfk_4` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_9999999999_ibfk_5` FOREIGN KEY (`item_id`) REFERENCES `items_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_entries_9999999999`
--
ALTER TABLE `product_entries_9999999999`
  ADD CONSTRAINT `product_entries_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_entries_9999999999_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_categories_9999999999`
--
ALTER TABLE `sub_categories_9999999999`
  ADD CONSTRAINT `sub_categories_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_categories_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_categories_9999999999_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions_9999999999`
--
ALTER TABLE `transactions_9999999999`
  ADD CONSTRAINT `transactions_9999999999_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_9999999999_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_9999999999_ibfk_3` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_9999999999_ibfk_4` FOREIGN KEY (`bill_id`) REFERENCES `bills_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_9999999999_ibfk_5` FOREIGN KEY (`payment_id`) REFERENCES `payments_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_9999999999_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customers_9999999999` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;