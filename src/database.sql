-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 01:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyperx`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_session`
--

CREATE TABLE `cart_session` (
  `id` int(11) NOT NULL,
  `subtotal` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 0, 'Laptop', '2023-06-05 10:25:22', '2023-06-05 10:25:22', 0, 0),
(3, 0, 'Gear', '2023-06-05 10:25:22', '2023-06-05 10:25:22', 0, 0),
(5, 0, 'Accessories', '2023-06-05 10:25:22', '2023-06-05 10:25:22', 0, 0),
(6, 1, 'Workstation', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(7, 1, 'Gaming', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(8, 1, 'Office', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(9, 1, 'Student', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(10, NULL, 'Full', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(11, NULL, 'CPU', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(12, NULL, 'RAM', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(13, NULL, 'GPU', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(14, NULL, 'HDD', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(15, NULL, 'SSD', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(16, NULL, 'Mainboard', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(17, 3, 'Mouse', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(18, 3, 'Keyboard', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(19, 3, 'Monitor', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(20, 3, 'Headphone', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(21, 5, 'Earsphone', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(22, 5, 'Router', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(23, 5, 'Cable', '2023-06-05 10:45:06', '2023-06-05 10:45:06', NULL, NULL),
(24, 0, 'phone', '2023-06-07 10:23:58', '2023-06-07 10:23:58', NULL, NULL),
(25, 5, 'chair', '2023-06-07 10:29:10', '2023-06-07 10:29:10', NULL, NULL),
(26, 5, 'fan', '2023-06-08 03:45:25', '2023-06-08 03:45:25', NULL, NULL),
(27, 0, 'hardwareeeeeee', '2023-06-08 10:41:41', '2023-06-09 09:07:04', NULL, NULL),
(28, 6, '6.1 son of 6', '2023-06-09 09:26:31', '2023-06-09 09:26:31', NULL, NULL),
(29, 6, '6.2 son of 6', '2023-06-09 09:28:20', '2023-06-09 09:28:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` int(11) NOT NULL,
  `discount` float DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `discount`, `name`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 70, 'sales off 70%', '2023-06-11 06:05:58', '2023-06-11 13:33:26', NULL, NULL),
(2, 70, 'sales off 70%', '2023-06-11 06:25:41', '2023-06-11 13:33:33', NULL, NULL),
(4, 25, 'sale off 25%', '2023-06-11 06:26:30', '2023-06-11 06:26:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `supplied` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `image_public_id` varchar(255) DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `long_desc` text DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `sku`, `name`, `price`, `image_url`, `image_public_id`, `short_desc`, `long_desc`, `discount_id`, `promotion_id`, `category_id`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, '1111', 'product 1 updated', 20000, 'product 1', 'asdasda', 'asdada', 'asdasdasdasdasd', 1, 2, 28, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(2, 'p2', 'product2', 20000, NULL, NULL, 'asd', 'asdadasdasdasdasasdadd', NULL, NULL, 7, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(3, 'p3', 'product3', 30000, NULL, NULL, 'asd', 'dfgdfgdgfg', NULL, NULL, 17, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(4, 'p4', 'product4', 40000, NULL, NULL, 'asd', 'etyty', NULL, NULL, 18, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(5, 'p5', 'product5', 50000, NULL, NULL, 'asd', 'asdadasdasdadgfhdghsdasd', NULL, NULL, 25, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(6, 'p6', 'product6', 60000, NULL, NULL, 'asd', 'asdadasdasdzvcasdasd', NULL, NULL, 26, '2023-06-07 05:15:10', '0000-00-00 00:00:00', NULL, NULL),
(10, '1', 'product 111', 20000, 'asdadasd', 'asdasda', 'asdada', 'asdasdasdasdasd', 1, 2, 28, '2023-06-12 05:32:45', '2023-06-12 05:32:45', NULL, NULL),
(11, '282', 'product 282', 20000, 'asdadasd', 'asdasda', 'asdada', 'asdasdasdasdasd', 1, 2, 28, '2023-06-14 03:38:06', '2023-06-14 03:38:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `info` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`id`, `product_id`, `title`, `info`) VALUES
(1, 1, 'title 1', 'info 1'),
(2, 1, 'title 2', 'info 2'),
(3, 1, 'title 3', 'info 3'),
(4, 2, 'title 4', 'info 4'),
(5, 2, 'title 5', 'info 5'),
(6, 2, 'title 6', 'info 6'),
(7, 3, 'title 7', 'info 7'),
(8, 3, 'title 8', 'info 8'),
(9, 4, 'title 9', 'info 9'),
(10, 4, 'title 10', 'info 10'),
(11, 5, 'title 11', 'info 11'),
(12, 5, 'title 12', 'info 12'),
(13, 6, 'title 13', 'info 13');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `image_url` varchar(512) DEFAULT NULL,
  `image_public_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `name`, `code`, `description`, `discount_id`, `image_url`, `image_public_id`, `type`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'promotion 1', 'pm1', 'asdasd', 1, 'asdasdasd', 'asdasdasd', 'asdasdsd', '2023-06-12 05:30:02', '2023-06-12 05:30:02', NULL, NULL),
(2, 'promotion 2', 'pm2', 'ghjghjghjghjghj', 1, 'asdasdasd', 'asdasdasd', 'asdasdsd', '2023-06-12 05:30:31', '2023-06-12 05:30:31', NULL, NULL),
(3, 'promotion 3', 'pm3', 'ghjghjghjghjghj', 2, 'asdasdasd', 'asdasdasd', 'asdasdsdasdasdasd', '2023-06-12 05:30:52', '2023-06-12 05:30:52', NULL, NULL),
(4, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, 'asdasdasd', 'asdasdasd', 'asdasdsdasdasdasd', '2023-06-12 05:31:16', '2023-06-12 05:31:16', NULL, NULL),
(5, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, 'asdasdasd', 'asdasdasd', 'asdasdsdasdasdasd', '2023-06-13 12:34:45', '2023-06-13 12:34:45', NULL, NULL),
(6, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, 'asdasdasd', 'asdasdasd', NULL, '2023-06-13 13:02:46', '2023-06-13 13:02:46', NULL, NULL),
(7, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, 'asdasdasd', 'asdasdasd', NULL, '2023-06-13 13:03:06', '2023-06-13 13:03:06', NULL, NULL),
(8, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, 'asdasdasd', 'asdasdasd', '', '2023-06-13 13:03:14', '2023-06-13 13:03:14', NULL, NULL),
(9, NULL, 'pm4', 'qweqweqweqwe', 2, NULL, NULL, '', '2023-06-13 13:04:27', '2023-06-13 13:04:27', NULL, NULL),
(10, NULL, 'pm4', 'qweqweqweqwe', 2, NULL, NULL, '', '2023-06-13 13:05:10', '2023-06-13 13:05:10', NULL, NULL),
(11, NULL, 'pm4', 'qweqweqweqwe', 2, NULL, NULL, '', '2023-06-13 13:06:20', '2023-06-13 13:06:20', NULL, NULL),
(12, NULL, 'pm4', 'qweqweqweqwe', 2, NULL, NULL, '', '2023-06-13 13:07:15', '2023-06-13 13:07:15', NULL, NULL),
(13, 'promotion 4', 'pm4', 'qweqweqweqwe', 2, NULL, NULL, 'asdadsa', '2023-06-13 13:56:15', '2023-06-13 13:56:15', NULL, NULL),
(14, 'promotion 4', 'pm4', 'updated', 1, NULL, NULL, 'banner', '2023-06-13 14:03:12', '2023-06-13 21:15:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `register_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_item_index_23` (`cart_id`),
  ADD KEY `cart_item_index_24` (`product_id`);

--
-- Indexes for table `cart_session`
--
ALTER TABLE `cart_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_session_index_22` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_index_13` (`parent_id`),
  ADD KEY `category_index_14` (`created_by`),
  ADD KEY `category_index_15` (`modified_by`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_index_19` (`created_by`),
  ADD KEY `discount_index_20` (`modified_by`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_index_21` (`product_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_index_25` (`user_id`),
  ADD KEY `order_index_26` (`promotion_id`),
  ADD KEY `order_index_27` (`payment_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_index_28` (`order_id`),
  ADD KEY `order_detail_index_29` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_index_3` (`created_by`),
  ADD KEY `permission_index_4` (`modified_by`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_index_7` (`discount_id`),
  ADD KEY `product_index_8` (`promotion_id`),
  ADD KEY `product_index_9` (`category_id`),
  ADD KEY `product_index_10` (`created_by`),
  ADD KEY `product_index_11` (`modified_by`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_detail_index_12` (`product_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_index_16` (`discount_id`),
  ADD KEY `promotion_index_17` (`created_by`),
  ADD KEY `promotion_index_18` (`modified_by`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_index_1` (`created_by`),
  ADD KEY `role_index_2` (`modified_by`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_index_5` (`role_id`),
  ADD KEY `role_permission_index_6` (`permission_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_index_0` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_session`
--
ALTER TABLE `cart_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart_session` (`id`),
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `cart_session`
--
ALTER TABLE `cart_session`
  ADD CONSTRAINT `cart_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`id`) REFERENCES `role_permission` (`permission_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`);

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`role_id`),
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`id`) REFERENCES `role_permission` (`role_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id`) REFERENCES `role` (`created_by`),
  ADD CONSTRAINT `user_ibfk_10` FOREIGN KEY (`id`) REFERENCES `promotion` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_11` FOREIGN KEY (`id`) REFERENCES `discount` (`created_by`),
  ADD CONSTRAINT `user_ibfk_12` FOREIGN KEY (`id`) REFERENCES `discount` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id`) REFERENCES `role` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`id`) REFERENCES `permission` (`created_by`),
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id`) REFERENCES `permission` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_5` FOREIGN KEY (`id`) REFERENCES `product` (`created_by`),
  ADD CONSTRAINT `user_ibfk_6` FOREIGN KEY (`id`) REFERENCES `product` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_7` FOREIGN KEY (`id`) REFERENCES `category` (`created_by`),
  ADD CONSTRAINT `user_ibfk_8` FOREIGN KEY (`id`) REFERENCES `category` (`modified_by`),
  ADD CONSTRAINT `user_ibfk_9` FOREIGN KEY (`id`) REFERENCES `promotion` (`created_by`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
