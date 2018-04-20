-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2018 at 12:46 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` char(36) NOT NULL,
  `category` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` text,
  `picture` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `slug`, `description`, `picture`, `status`, `deleted`, `created_by`, `modified_by`, `date_entered`, `date_modified`) VALUES
('4580f97e-c946-d6bd-e653-5ad5d64291d0', 'Beverages', 'beverages', '', '', 1, 0, '1', '1', '2018-04-17 13:11:19', '2018-04-17 13:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` char(36) NOT NULL,
  `to_name` varchar(512) NOT NULL,
  `address_line_1` varchar(128) NOT NULL,
  `address_line_2` varchar(128) DEFAULT NULL,
  `landmark` varchar(128) NOT NULL,
  `city` varchar(64) NOT NULL,
  `state` varchar(64) NOT NULL,
  `country` varchar(64) NOT NULL,
  `zip` varchar(16) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `address_type` enum('billing','shipping') NOT NULL,
  `user` char(36) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1523910908),
('m130524_201442_init', 1523910912);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` char(36) NOT NULL,
  `customer` char(36) NOT NULL,
  `order_number` varchar(32) NOT NULL,
  `order_amount` varchar(16) NOT NULL,
  `payment_method` enum('cod','netbanking','cc','dc','paypal') NOT NULL,
  `transaction_id` varchar(64) NOT NULL,
  `payment_status` enum('success','review','pending','failed') NOT NULL,
  `order_date` datetime NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `freight` varchar(16) NOT NULL,
  `note` varchar(512) DEFAULT NULL,
  `shipping_method` varchar(256) DEFAULT NULL,
  `is_shipped` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_tracking` varchar(512) DEFAULT NULL,
  `shipping_address` char(36) NOT NULL,
  `billing_address` char(36) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `updated_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` char(36) NOT NULL,
  `order` char(36) NOT NULL,
  `product` char(36) NOT NULL,
  `product_price` varchar(16) NOT NULL,
  `purchased_price` varchar(16) NOT NULL,
  `quantity` int(16) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` char(36) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `category` char(36) NOT NULL,
  `units_in_stock` int(16) NOT NULL,
  `unit_price` varchar(16) NOT NULL,
  `offer_price` varchar(16) DEFAULT NULL,
  `variation` text,
  `size` text,
  `colors` text,
  `weight_type` enum('pound','gram','kg','ounce') NOT NULL,
  `weight` varchar(16) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `main_image` varchar(264) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id` char(36) NOT NULL,
  `product` char(36) NOT NULL,
  `type` enum('gallery','thumbnail') NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `date_entered` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('admin','general') COLLATE utf8_unicode_ci NOT NULL,
  `last_visit` datetime DEFAULT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `auth_key`, `password`, `first_name`, `last_name`, `type`, `last_visit`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'JLjvYICqQajbAgTkuT-1RPojqWwenxo5', '$2y$13$2mit125ENE8m6IUHesQd3u7l1CUrpJMUTHqXwgIi3nNQidzv3A0r2', 'Neeraj', 'Kumar', 'admin', '2018-04-19 20:54:12', NULL, 'neeraj24a@gmail.com', 1, 2018, 2018);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
