-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2026 at 05:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodbridge_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `Donation_ID` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `collected_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`Donation_ID`, `request_id`, `status`, `collected_at`, `completed_at`) VALUES
(1, 2, 'Collected', '2026-07-24 18:45:00', NULL),
(2, 4, 'Completed', '2026-07-24 19:45:00', '2026-07-24 20:30:00'),
(3, 5, 'Completed', '2026-07-24 20:45:00', '2026-07-24 21:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `food_listing`
--

CREATE TABLE `food_listing` (
  `listing_ID` int(11) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `Food_Name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL,
  `expiry_time` datetime NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_listing`
--

INSERT INTO `food_listing` (`listing_ID`, `donor_id`, `Food_Name`, `description`, `quantity`, `unit`, `location`, `expiry_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chicken Biryani', 'Freshly cooked biryani', 50, 'plates', 'Dhanmondi, Dhaka', '2026-07-24 22:00:00', 'Available', '2026-07-24 17:00:00', '2026-07-24 17:00:00'),
(2, 1, 'Vegetable Curry', 'Mixed vegetable curry', 20, 'packs', 'Dhanmondi, Dhaka', '2026-07-24 21:30:00', 'Requested', '2026-07-24 16:30:00', '2026-07-24 18:15:00'),
(3, 2, 'Bread', 'Fresh bakery bread', 40, 'packs', 'Banani, Dhaka', '2026-07-25 08:00:00', 'Available', '2026-07-24 15:00:00', '2026-07-24 15:00:00'),
(4, 2, 'Fruit Juice', 'Mixed fruit juice bottles', 25, 'bottles', 'Banani, Dhaka', '2026-07-24 23:30:00', 'Collected', '2026-07-24 14:00:00', '2026-07-24 20:00:00'),
(5, 1, 'Rice and Beef', 'Cooked rice with beef', 30, 'plates', 'Dhanmondi, Dhaka', '2026-07-24 22:30:00', 'Completed', '2026-07-24 13:00:00', '2026-07-24 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `Request_ID` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `Requested_Quantity` int(11) NOT NULL,
  `request_status` varchar(30) NOT NULL,
  `requested_at` datetime NOT NULL,
  `responded_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`Request_ID`, `listing_id`, `requester_id`, `Requested_Quantity`, `request_status`, `requested_at`, `responded_at`) VALUES
(1, 1, 3, 20, 'Pending', '2026-07-24 17:30:00', NULL),
(2, 2, 4, 10, 'Approved', '2026-07-24 18:00:00', '2026-07-24 18:15:00'),
(3, 3, 3, 15, 'Pending', '2026-07-24 18:30:00', NULL),
(4, 4, 4, 15, 'Approved', '2026-07-24 19:00:00', '2026-07-24 19:20:00'),
(5, 5, 3, 25, 'Approved', '2026-07-24 20:00:00', '2026-07-24 20:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(8) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`, `phone`, `role`, `address`, `created_at`) VALUES
(1, 'Green Garden Restaurant', 'greengarden@gmail.com', 'pass123', '01711111111', 'Donor', 'Dhanmondi, Dhaka', '2026-07-20 09:00:00'),
(2, 'Fresh Bite Cafeteria', 'freshbite@gmail.com', 'pass456', '01822222222', 'Donor', 'Banani, Dhaka', '2026-07-20 10:15:00'),
(3, 'Helping Hands NGO', 'helpinghands@gmail.com', 'ngo12345', '01933333333', 'NGO', 'Mirpur, Dhaka', '2026-07-20 11:30:00'),
(4, 'Hope Foundation', 'hopefoundation@gmail.com', 'hope2026', '01644444444', 'Recipient', 'Uttara, Dhaka', '2026-07-20 12:00:00'),
(5, 'AdminUser', 'admin@foodbridge.com', 'admin123', '01555555555', 'Admin', 'NSU Campus, Bashundhara', '2026-07-20 08:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`Donation_ID`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `food_listing`
--
ALTER TABLE `food_listing`
  ADD PRIMARY KEY (`listing_ID`),
  ADD KEY `donor_id` (`donor_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`Request_ID`),
  ADD KEY `listing_id` (`listing_id`),
  ADD KEY `requester_id` (`requester_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `Donation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `food_listing`
--
ALTER TABLE `food_listing`
  MODIFY `listing_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `Request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`Request_ID`);

--
-- Constraints for table `food_listing`
--
ALTER TABLE `food_listing`
  ADD CONSTRAINT `food_listing_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `food_listing` (`listing_ID`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`requester_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
