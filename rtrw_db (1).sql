-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2025 at 05:04 AM
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
-- Database: `rtrw_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_items`
--

CREATE TABLE `addon_items` (
  `id` int(11) NOT NULL,
  `customerId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `itemType` enum('one_time','monthly') NOT NULL DEFAULT 'monthly',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `isPaid` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Untuk one_time items, track apakah sudah dibayar',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(2, 'latansa-api', '', '2025-07-09 13:05:30', '2025-07-09 13:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customerNumber` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `idNumber` varchar(255) DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `package` varchar(255) NOT NULL,
  `packagePrice` int(11) NOT NULL,
  `addonPrice` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `pppSecret` varchar(255) DEFAULT NULL,
  `pppSecretType` enum('existing','new','none') DEFAULT 'none',
  `odpSlot` varchar(255) DEFAULT NULL,
  `billingType` enum('prepaid','postpaid') DEFAULT 'prepaid',
  `activePeriod` int(11) DEFAULT 1,
  `activePeriodUnit` enum('days','months') DEFAULT 'months',
  `installationStatus` enum('not_installed','installed') DEFAULT 'not_installed',
  `serviceStatus` enum('active','inactive') DEFAULT 'inactive',
  `activeDate` datetime NOT NULL,
  `expireDate` datetime NOT NULL,
  `paymentDueDate` datetime NOT NULL,
  `status` enum('active','suspended','terminated','pending') DEFAULT 'pending',
  `isIsolated` tinyint(1) DEFAULT 0,
  `routerName` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `routerId` int(11) DEFAULT NULL,
  `billingStatus` enum('belum_lunas','lunas','suspend') NOT NULL DEFAULT 'belum_lunas',
  `lastBillingDate` datetime DEFAULT NULL,
  `nextBillingDate` datetime DEFAULT NULL,
  `mikrotikStatus` enum('active','disabled') NOT NULL DEFAULT 'active',
  `lastSuspendDate` datetime DEFAULT NULL,
  `isProRataApplied` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Apakah prorata sudah diterapkan untuk bulan pertama',
  `proRataAmount` decimal(10,2) DEFAULT NULL COMMENT 'Jumlah prorata untuk bulan pertama',
  `odpId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customerNumber`, `name`, `email`, `phone`, `address`, `idNumber`, `area`, `package`, `packagePrice`, `addonPrice`, `discount`, `pppSecret`, `pppSecretType`, `odpSlot`, `billingType`, `activePeriod`, `activePeriodUnit`, `installationStatus`, `serviceStatus`, `activeDate`, `expireDate`, `paymentDueDate`, `status`, `isIsolated`, `routerName`, `notes`, `createdAt`, `updatedAt`, `routerId`, `billingStatus`, `lastBillingDate`, `nextBillingDate`, `mikrotikStatus`, `lastSuspendDate`, `isProRataApplied`, `proRataAmount`, `odpId`) VALUES
('31dbbe8d-2091-45bf-85b3-e35958c04a2e', 'LTS0002', 'Fujifilm', NULL, '081266655925', NULL, NULL, 'latansa-api', 'Paket 150.000', 150000, 0.00, 0.00, 'kotabaru', 'existing', '', 'prepaid', 1, 'months', 'installed', 'active', '2025-07-01 00:00:00', '2025-08-01 00:00:00', '2025-08-05 00:00:00', 'active', 0, NULL, NULL, '2025-07-10 14:27:40', '2025-07-11 05:20:27', 2, 'lunas', NULL, '2025-08-05 00:00:00', 'active', NULL, 0, NULL, 2),
('7ec44ea7-949b-4b78-bc05-76e102b21413', 'LTS0003', 'latansa-api', NULL, '081266655925', NULL, NULL, 'latansa-api', 'Paket 150.000', 150000, 0.00, 0.00, 'mgmandi', 'existing', '', 'prepaid', 1, 'months', 'installed', 'active', '2025-06-01 00:00:00', '2025-07-01 00:00:00', '2025-07-05 00:00:00', 'active', 0, NULL, NULL, '2025-07-10 16:56:49', '2025-07-11 05:30:02', 2, 'lunas', NULL, '2025-08-05 00:00:00', 'active', NULL, 0, NULL, 2),
('c028de18-bba4-4e3a-be09-26ed394a2636', 'LTS0001', 'Dzawin', NULL, '081266655925', 'sdfsf', NULL, 'latansa-api', 'Paket 150.000', 150000, 0.00, 0.00, 'dz', 'existing', '', 'prepaid', 1, 'months', 'not_installed', 'active', '2025-10-10 00:00:00', '2025-11-10 00:00:00', '2025-11-05 00:00:00', 'active', 0, NULL, NULL, '2025-07-10 14:25:16', '2025-07-11 05:04:33', 2, 'lunas', '2025-07-10 16:30:47', '2025-11-05 00:00:00', 'active', NULL, 0, NULL, 2),
('d45ed865-21f2-4a20-84fb-f1660f7772e0', 'LTS0004', 'koko', NULL, '081266655925', NULL, NULL, 'latansa-api', 'Paket 150.000', 150000, 0.00, 0.00, 'lblatansa', 'existing', '', 'prepaid', 1, 'months', 'installed', 'active', '2025-06-01 00:00:00', '2025-07-01 00:00:00', '2025-07-05 00:00:00', 'active', 0, NULL, NULL, '2025-07-11 05:31:51', '2025-07-11 05:31:51', 2, 'lunas', NULL, NULL, 'active', NULL, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `odps`
--

CREATE TABLE `odps` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `totalSlots` int(11) NOT NULL DEFAULT 8,
  `usedSlots` int(11) NOT NULL DEFAULT 0,
  `availableSlots` int(11) NOT NULL DEFAULT 8,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` enum('active','maintenance','inactive') NOT NULL DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `odps`
--

INSERT INTO `odps` (`id`, `name`, `location`, `area`, `totalSlots`, `usedSlots`, `availableSlots`, `latitude`, `longitude`, `status`, `createdAt`, `updatedAt`) VALUES
(2, 'latansa-api', 'Depan Rumah Saya', 'Dzawinnuha', 8, 4, 4, NULL, NULL, 'active', '2025-07-09 13:11:55', '2025-07-11 05:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `downloadSpeed` int(11) NOT NULL COMMENT 'Download speed in Mbps',
  `uploadSpeed` int(11) NOT NULL COMMENT 'Upload speed in Mbps',
  `price` int(11) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 30 COMMENT 'Duration in days',
  `mikrotikProfile` varchar(255) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `allowUpgradeDowngrade` tinyint(1) NOT NULL DEFAULT 1,
  `onlineRegistration` tinyint(1) NOT NULL DEFAULT 1,
  `taxPercentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `agentCommission` int(11) NOT NULL DEFAULT 0,
  `routerName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `downloadSpeed`, `uploadSpeed`, `price`, `duration`, `mikrotikProfile`, `isActive`, `allowUpgradeDowngrade`, `onlineRegistration`, `taxPercentage`, `agentCommission`, `routerName`, `createdAt`, `updatedAt`) VALUES
(1, 'Paket 150.000', '', 3, 3, 150000, 30, 'default-encryption', 1, 1, 1, 0.00, 0, 'Dzawinnuha', '2025-07-09 13:19:58', '2025-07-09 13:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `routers`
--

CREATE TABLE `routers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `lastSeen` datetime DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `firmware` varchar(255) DEFAULT NULL,
  `uptime` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routers`
--

INSERT INTO `routers` (`id`, `name`, `ipAddress`, `port`, `username`, `password`, `status`, `lastSeen`, `area`, `model`, `firmware`, `uptime`, `createdAt`, `updatedAt`) VALUES
(2, 'Dzawinnuha', '198.167.141.152', 8728, 'admin', 'latansa12', 'online', '2025-07-09 13:02:16', NULL, NULL, NULL, NULL, '2025-07-09 13:01:09', '2025-07-09 13:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('[timestamp]-add-router-field-to-customers.js'),
('[timestamp]-change-package-price-to-integer.js'),
('[timestamp]-create-odp.js'),
('[timestamp]-fix-idnumber-nullable.js'),
('[timestamp]-remove-duplicate-router-column.js'),
('20250115000000-add-odp-relation-to-customers.js'),
('20250708113059-create-area.js'),
('20250708115246-create-router.js'),
('20250708123906-create-odp.js'),
('20250708130000-create-package.js'),
('20250708140000-create-customer.js'),
('20250708151814-add-router-field-to-customers.js'),
('20250708173625-create-transaction.js'),
('20250708173634-create-transaction.js'),
('20250708180000-add-billing-fields.js'),
('20250708190000-add-prorata-addon-fields.js'),
('20250709112350-change-package-price-to-integer.js'),
('20250709172523-add-foreign-keys-to-customers.js'),
('20250709173254-fix-idnumber-nullable.js'),
('20250709173306-remove-duplicate-router-column.js');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `customerId` varchar(255) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('payment','penalty','discount','refund') NOT NULL DEFAULT 'payment',
  `method` enum('cash','transfer','digital_wallet','other') NOT NULL DEFAULT 'cash',
  `description` varchar(255) NOT NULL,
  `periodFrom` datetime NOT NULL,
  `periodTo` datetime NOT NULL,
  `status` enum('paid','pending','overdue','cancelled') NOT NULL DEFAULT 'pending',
  `paidAt` datetime DEFAULT NULL,
  `dueDate` datetime NOT NULL,
  `receiptNumber` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `breakdown` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Detail breakdown tagihan (package, addons, one-time items)' CHECK (json_valid(`breakdown`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customerId`, `customerName`, `amount`, `type`, `method`, `description`, `periodFrom`, `periodTo`, `status`, `paidAt`, `dueDate`, `receiptNumber`, `notes`, `createdAt`, `updatedAt`, `breakdown`) VALUES
(23, 'c028de18-bba4-4e3a-be09-26ed394a2636', 'Dzawin', 150000, 'payment', 'cash', 'Pembayaran Paket 150.000 - Oktober 2025', '2025-10-10 00:00:00', '2025-11-10 00:00:00', 'paid', '2025-07-11 00:00:00', '2025-11-05 00:00:00', 'LTS001', '', '2025-07-11 05:04:33', '2025-07-11 05:04:33', NULL),
(24, '7ec44ea7-949b-4b78-bc05-76e102b21413', 'latansa-api', 150000, 'payment', 'cash', 'Pembayaran Paket 150.000 - Juni 2025', '2025-06-30 00:00:00', '2025-07-31 00:00:00', 'paid', '2025-07-11 00:00:00', '2025-07-05 00:00:00', 'LTS002', '', '2025-07-11 05:05:32', '2025-07-11 05:05:32', NULL),
(25, '7ec44ea7-949b-4b78-bc05-76e102b21413', 'latansa-api', 150000, 'payment', 'cash', 'Pembayaran Paket 150.000 - Juli 2025', '2025-07-01 00:00:00', '2025-08-01 00:00:00', 'paid', '2025-07-11 00:00:00', '2025-08-05 00:00:00', 'LTS003', '', '2025-07-11 05:06:49', '2025-07-11 05:06:49', NULL),
(26, '31dbbe8d-2091-45bf-85b3-e35958c04a2e', 'Fujifilm', 150000, 'payment', 'cash', 'Pembayaran Paket 150.000 - Juni 2025', '2025-06-30 00:00:00', '2025-07-31 00:00:00', 'paid', '2025-07-11 00:00:00', '2025-07-05 00:00:00', 'LTS004', '', '2025-07-11 05:16:52', '2025-07-11 05:16:52', NULL),
(27, '31dbbe8d-2091-45bf-85b3-e35958c04a2e', 'Fujifilm', 150000, 'payment', 'cash', 'Pembayaran Paket 150.000 - Juli 2025', '2025-07-01 00:00:00', '2025-08-01 00:00:00', 'paid', '2025-07-11 00:00:00', '2025-08-05 00:00:00', 'LTS005', '', '2025-07-11 05:20:27', '2025-07-11 05:20:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_items`
--
ALTER TABLE `addon_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customerNumber` (`customerNumber`),
  ADD KEY `customers_router_id` (`routerId`),
  ADD KEY `customers_odpId_foreign_idx` (`odpId`);

--
-- Indexes for table `odps`
--
ALTER TABLE `odps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routers`
--
ALTER TABLE `routers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `receiptNumber` (`receiptNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_items`
--
ALTER TABLE `addon_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `odps`
--
ALTER TABLE `odps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `routers`
--
ALTER TABLE `routers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addon_items`
--
ALTER TABLE `addon_items`
  ADD CONSTRAINT `addon_items_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_odpId_foreign_idx` FOREIGN KEY (`odpId`) REFERENCES `odps` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_routerId_foreign_idx` FOREIGN KEY (`routerId`) REFERENCES `routers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
