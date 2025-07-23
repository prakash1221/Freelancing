-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2025 at 09:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exchange`
--

-- --------------------------------------------------------

--
-- Table structure for table `accepted_requests`
--

CREATE TABLE `accepted_requests` (
  `id` int(11) NOT NULL,
  `seller_mail_id` varchar(255) NOT NULL,
  `requested_mail_id` varchar(255) NOT NULL,
  `unique_id` varchar(100) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `note` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `seller_mail_id` varchar(255) NOT NULL,
  `requested_mail_id` varchar(255) NOT NULL,
  `unique_id` varchar(100) NOT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_items_list`
--

CREATE TABLE `exchange_items_list` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `category` enum('electronics','vehicles') NOT NULL,
  `price` int(11) NOT NULL,
  `imei_number` varchar(50) NOT NULL,
  `description` text NOT NULL CHECK (char_length(`description`) <= 300),
  `mail_id` varchar(255) NOT NULL,
  `unique_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_items_list`
--

INSERT INTO `exchange_items_list` (`id`, `image`, `item_name`, `category`, `price`, `imei_number`, `description`, `mail_id`, `unique_id`) VALUES
(2, 'uploads/1738221539_arrow.png', 'iPhone 12', 'vehicles', 15000, 'AB1234XYZ567', 'max 300 words', 'happy@boy.com', 'VE318'),
(3, 'uploads/1738222192_back_button.jpg', 'samsung S23', 'electronics', 150000, 'PB9254SYZ39', 'Bied on 1/01/2025 and no damage', 'hemaprakash@gmail.com', 'EL599');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `mail_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `mail_id`, `password`) VALUES
(1, 'happy@boy.com', '123h'),
(2, 'hemaprakash@gmail.com', 'happy@Prekash');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `chat_id` int(10) UNSIGNED NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `receiver_email` varchar(255) NOT NULL,
  `message` text NOT NULL CHECK (char_length(`message`) <= 300),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rejected_requests`
--

CREATE TABLE `rejected_requests` (
  `id` int(11) NOT NULL,
  `seller_mail_id` varchar(255) NOT NULL,
  `requested_mail_id` varchar(255) NOT NULL,
  `unique_id` varchar(100) NOT NULL,
  `note` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rejected_requests`
--

INSERT INTO `rejected_requests` (`id`, `seller_mail_id`, `requested_mail_id`, `unique_id`, `note`, `created_at`) VALUES
(2, 'hemaprakash@gmail.com', 'happy@boy.com', 'EL599', 'i was accepting the request for 13000 ampunt.', '2025-02-10 07:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(10) UNSIGNED NOT NULL,
  `requested_mail_id` varchar(255) NOT NULL,
  `seller_mail_id` varchar(255) NOT NULL,
  `unique_id` varchar(10) NOT NULL,
  `messages` text DEFAULT NULL CHECK (char_length(`messages`) <= 300),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `my_item` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `requested_mail_id`, `seller_mail_id`, `unique_id`, `messages`, `created_at`, `my_item`) VALUES
(9, 'happy@boy.com', 'hemaprakash@gmail.com', 'EL599', 'I am interested in buying this item. Please contact me.', '2025-02-09 09:50:09', 'AB1234XYZ567');

-- --------------------------------------------------------

--
-- Table structure for table `sign_up`
--

CREATE TABLE `sign_up` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mail_id` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sign_up`
--

INSERT INTO `sign_up` (`id`, `name`, `mail_id`, `phone_number`, `password`, `location`) VALUES
(1, 'happy Boy', 'happy@boy.com', '9346364220', '123h', NULL),
(2, 'Hemaprakash P', 'hemaprakash@gmail.com', '9884373559', 'happy@Prekash', '12.9715987,77.594566');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_requests`
--
ALTER TABLE `accepted_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_items_list`
--
ALTER TABLE `exchange_items_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_unique_id` (`unique_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_id` (`mail_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_ibfk_1` (`chat_id`);

--
-- Indexes for table `rejected_requests`
--
ALTER TABLE `rejected_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_requested_mail` (`requested_mail_id`),
  ADD KEY `idx_seller_mail` (`seller_mail_id`),
  ADD KEY `idx_unique_id` (`unique_id`);

--
-- Indexes for table `sign_up`
--
ALTER TABLE `sign_up`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_id` (`mail_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accepted_requests`
--
ALTER TABLE `accepted_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_items_list`
--
ALTER TABLE `exchange_items_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rejected_requests`
--
ALTER TABLE `rejected_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sign_up`
--
ALTER TABLE `sign_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `sign_up` (`mail_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `request` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`unique_id`) REFERENCES `exchange_items_list` (`unique_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
