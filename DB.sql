-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 04:50 PM
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
-- Database: `momo`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` int(11) NOT NULL,
  `agent_code` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `pin_hash` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `balance` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `agent_code`, `phone_number`, `full_name`, `pin_hash`, `approved`, `balance`, `created_at`) VALUES
(5, 'Gikundiro', '+250781549923', 'Gikundiro', '$2y$10$8ZtrADWgB1hrHqi9OSp1p.K5eO.uMl8p.rVMyXTm6CF06sv1wpW9K', 1, 10750.00, '2025-05-12 14:11:01'),
(6, 'URUJENI', '+250792524901', 'URUJENI', '$2y$10$RE6vQmBL9gEww/f8vhdMCel84HQO3U271KJgKW1cNBKHUEsFHbObi', 1, 10000.00, '2025-05-12 14:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `menu_state` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `phone_number`, `menu_state`, `created_at`) VALUES
('', '', '', '2025-05-12 09:02:07'),
('1', '0790222440', '', '2025-04-30 21:29:42'),
('1d', '+250790222440', '1', '2025-05-03 19:46:22'),
('345677654', '+250727400696', '2*100', '2025-05-12 11:47:38'),
('A1', '0790222440', '', '2025-04-30 21:29:26'),
('ATUid_03849b09b6468e63fa0ff0c2747737f2', '+250790222449', '', '2025-04-30 21:36:43'),
('ATUid_05d2a833c8090ddd0df08ed4a11e9e87', '+250790222441', '3*1234', '2025-05-03 19:51:17'),
('ATUid_09d9bd31c4ec5d9b56a4ee671423ff2c', '+250727400696', '1*+250792359800*1000*1212*1', '2025-05-12 11:50:14'),
('ATUid_09f14011f52465df129707ef84a81b0b', '+250790222441', '1*+250792359800*200*1234*1', '2025-05-03 19:51:33'),
('ATUid_09f7adc64086b7a8ca67444d2793ea6e', '+250790222440', '', '2025-04-30 21:35:59'),
('ATUid_0cf93ba08fdeb7333f852c5fc2b194e6', '+250781549923', '1', '2025-05-12 14:20:54'),
('ATUid_12b8bca66a19c40f2512304224765124', '+250727400696', '1*+250790222441', '2025-05-12 09:37:41'),
('ATUid_12d559dd4e83f5eca26bdc6eb631f7e6', '+250793341420', '2*1234', '2025-04-30 22:03:51'),
('ATUid_176aa3a328e649cdb1d111ff8fe1dc7f', '+250792524900', '', '2025-05-12 09:29:25'),
('ATUid_270e7731866b6456730f8747bd229995', '+250781549992', '2', '2025-05-12 14:24:29'),
('ATUid_2a3a87a66df0ab6d34a7576015903100', '+250793341420', '2*1234', '2025-04-30 22:06:16'),
('ATUid_2e0c4e461ab03722d539b18ae0cedc97', '+250781549992', '1*+250792524900*100*1212', '2025-05-12 14:07:33'),
('ATUid_377fd8989b5798d38763eb838e7e189d', '+250793341420', '2*1234', '2025-04-30 22:03:36'),
('ATUid_4380af0527aa5a1444191b262ae43fa3', '+250727400696', '1*+250790222441*300*1212', '2025-05-12 09:36:50'),
('ATUid_45dca39e710feaf6729535b9db8d0c5f', '+250790222441', '1*+250790222440', '2025-05-03 19:48:33'),
('ATUid_4d30eb2da6309e2aa83cf289a2b337ad', '+250727400696', '1*+250792359800*100*1212*1', '2025-05-12 11:36:42'),
('ATUid_59603f2886e3c341fbc48aa552a1d476', '+250727400696', '1*+250790222441*100*1212*1', '2025-05-12 09:35:28'),
('ATUid_5d4ddadc720a5e7a03b351ab9c86cfed', '+250793341420', '', '2025-04-30 22:00:14'),
('ATUid_5e3cb22cc6b6e2ba87d965d58aebd328', '+250727400696', '1*+250790222441*300*1212', '2025-05-12 09:36:06'),
('ATUid_6b8c4c0e8cee76401fc9b2acef31c5a0', '+250781549992', '', '2025-05-12 14:15:34'),
('ATUid_6fdeeef83e1deb3cc6a91739088ea8ad', '+250727400696', '1*+250790222441', '2025-05-12 09:32:13'),
('ATUid_71b5b65aae4620125516785ed458e13b', '+250792524900', '', '2025-05-12 13:59:25'),
('ATUid_779d7b9d375a583f7bdb786ea262a9cf', '+250792524900', '1', '2025-05-12 13:57:41'),
('ATUid_79ca2a59a3ca09a493565654f5d0bdb5', '+250781549992', '', '2025-05-12 14:19:05'),
('ATUid_81bd78c5c9f3d380902f278e157f8048', '+250793341420', '', '2025-04-30 21:59:22'),
('ATUid_8424113e605db977d80050414ea274bb', '+250781549992', '2*100*Gikundiro*2222', '2025-05-12 14:25:17'),
('ATUid_937b109c4529bd924cc2ab0e9a5c9605', '+250792524900', '', '2025-05-12 13:58:26'),
('ATUid_977b8b9e8693f26bdd5d30ddd5533f7b', '+250793341420', '4', '2025-04-30 22:30:28'),
('ATUid_9a0ed852b0dc5148bc32d0996897b82f', '+250727400696', '1*+250792359800*100*1212*1', '2025-05-12 11:33:43'),
('ATUid_9b018e84adcbd815586f1437c0e45dfa', '+250793341420', '1', '2025-04-30 22:06:05'),
('ATUid_9c71f576cb5bf86817eae31879df72b0', '+250793341420', '1*98*2*1234', '2025-04-30 22:29:40'),
('ATUid_9e0cea13ba50c797abbdce48d32938eb', '+250781549923', '1*TX-682204e36d77c*1', '2025-05-12 14:26:46'),
('ATUid_9e10c54af020e5ccbd376ef235dc2c97', '+250781549992', '2*100', '2025-05-12 14:09:28'),
('ATUid_b155d474e745727b8747a9370d158d83', '+250792524900', '1*SHALLON*2222*2222', '2025-05-12 14:00:14'),
('ATUid_c11f55900bbd2bc37dedf0c525828155', '+250781549992', '1*+250792524900*100*2222*1', '2025-05-12 14:03:05'),
('ATUid_c6a5364b508dd8adf1c04e6da3d454ba', '+250727400696', '1*+250792359800', '2025-05-12 11:32:09'),
('ATUid_db2c643e3670e70e371c6912cd5329e2', '+250781549923', '1', '2025-05-12 14:20:35'),
('ATUid_e929de2e111637dcc56b6a10dd875578', '+250793341420', '1*TX-68129cecdb4d0*1', '2025-04-30 22:01:08'),
('ATUid_e92ce76d93917555cc2c35aab0a986d8', '+250727400696', '1*MBONIMPA ISHIMWE Theogene*12123*12123', '2025-05-12 09:30:37'),
('ATUid_eea93b57537711de091605092916672e', '+250781549992', '1*+250792524900*100*2222*1', '2025-05-12 14:07:59'),
('ATUid_f20ba689e1e02c81eb680f3aafcb76ef', '+250727400696', '1*MBONIMPA ISHIMWE Theogene*1212*1212', '2025-05-12 09:31:06'),
('ATUid_f21b702c6078bec7e6f6ccb42781b6af', '+250793341420', '3', '2025-04-30 22:03:27'),
('ATUid_f3376dcdc3af6938adf5d293e2a14dd5', '+250781549992', '', '2025-05-12 14:11:29'),
('ATUid_f98efb653dfc13483a4915d0b6c2904a', '+250727400696', '1*+250790222441*100*1212*1', '2025-05-12 09:39:04'),
('ATUid_fb968591a7eeedca844e2ac43ed64727', '+250792524900', '', '2025-05-12 14:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `agent_code` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` enum('send','withdraw') DEFAULT NULL,
  `status` enum('pending','completed','failed') DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT 100.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `reference`, `user_phone`, `agent_code`, `amount`, `type`, `status`, `fee`, `created_at`) VALUES
(1, 'TX-681298dac28fd', '+250792359800', NULL, 200.00, 'send', 'completed', 100.00, '2025-04-30 21:40:42'),
(2, 'TX-68129cecdb4d0', '+250790222440', 'Cris', 200.00, 'withdraw', 'completed', 100.00, '2025-04-30 21:58:04'),
(3, 'TX-681673ebe44a7', '+250790222441', NULL, 200.00, 'send', 'completed', 100.00, '2025-05-03 19:52:11'),
(4, 'TX-6821c0fcaaecf', '+250727400696', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 09:35:56'),
(5, 'TX-6821c1d519fa8', '+250727400696', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 09:39:33'),
(6, 'TX-6821dcb52685d', '+250727400696', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 11:34:13'),
(7, 'TX-6821dd69cb1d5', '+250727400696', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 11:37:13'),
(8, 'TX-6821dfda15876', '+250727400696', NULL, 300.00, 'send', 'completed', 100.00, '2025-05-12 11:47:38'),
(9, 'TX-6821e09c96e8f', '+250727400696', NULL, 1000.00, 'send', 'completed', 100.00, '2025-05-12 11:50:52'),
(10, 'TX-6821fdbf1b75e', '+250727400696', NULL, 300.00, 'send', 'completed', 100.00, '2025-05-12 13:55:11'),
(11, 'TX-6821ffbb89e60', '+250781549992', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 14:03:39'),
(12, 'TX-682200dbc6f15', '+250781549992', NULL, 100.00, 'send', 'completed', 100.00, '2025-05-12 14:08:27'),
(13, 'TX-682204e36d77c', '+250781549992', 'Gikundiro', 100.00, 'withdraw', 'completed', 100.00, '2025-05-12 14:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `pin_hash` varchar(255) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT 400.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `phone_number`, `full_name`, `pin_hash`, `balance`, `created_at`) VALUES
(5, '+250792524900', 'SHALLON', '$2y$10$ft11lYFRorZJY3qID6aqZOMzsjaAzZ2vJazbmj5.5Abd39REBvuua', 600.00, '2025-05-12 14:00:47'),
(6, '+250781549992', 'Ghislaine', '$2y$10$Z1Ox3H7GeQS7Bvk3OEhOCeTIpvvw8ogBtIfwAPM2Jp77upFCoSNiG', 800.00, '2025-05-12 14:02:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agent_code` (`agent_code`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
