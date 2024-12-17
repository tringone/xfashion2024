-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.0
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `id` int(9) NOT NULL,
  `id_order` int(9) NOT NULL,
  `id_pro` int(9) NOT NULL,
  `quantity` int(9) NOT NULL DEFAULT 0,
  `prices` double(10,2) NOT NULL DEFAULT 0.00,
  `size` varchar(5) NOT NULL,
  `name_pro` varchar(50) DEFAULT NULL,
  `img_pro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_cart`
--
/*
INSERT INTO `tbl_cart` (`id`, `id_order`, `id_pro`, `quantity`, `prices`, `size`, `name_pro`, `img_pro`) VALUES
(201, 141, 90, 2, 1500000, 'L', 'Bitis White', 'bitis1.jpg'),
(202, 142, 90, 1, 1400000, 'L', 'Bitis Black', 'bitis2.jpg'),
(203, 142, 91, 1, 500000, 'XL', 'Coolmate White', 'coolmate1.jpg'),
(204, 143, 95, 1, 600000, 'L', 'Coolmate Black', 'coolmate2.jpg'),
(206, 145, 90, 1, 700000, 'L', 'Coolmate Pants', 'coolmate3.jpg');
*/
-- --------------------------------------------------------

--
-- Table structure for table `tbl_catalog`
--

CREATE TABLE `tbl_catalog` (
  `id_catalog_k` int(4) NOT NULL,
  `catalog_name` varchar(50) NOT NULL,
  `prioritize` int(4) NOT NULL DEFAULT 0,
  `display_ctl` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_catalog`
--

INSERT INTO `tbl_catalog` (`id_catalog_k`, `catalog_name`, `prioritize`, `display_ctl`) VALUES
(94, 'Shoes', 1, 1),
(95, 'Shirt', 1, 1),
(96, 'Pants', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ban` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`id`, `fname`, `lname`, `sex`, `address`, `email`, `phone`, `user`, `password`, `ban`) VALUES
(01, 'Tri', 'Ngo', 1, 'KTX Khu B, Dong Hoa, Di An, Binh Duong', '21522705@gm.uit.edu.vn', '0898438493', 'tringo', 'tringo', 0);
-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(9) NOT NULL,
  `invoice_id` varchar(20) NOT NULL,
  `total_prices` double(10,0) NOT NULL DEFAULT 0,
  `payment` tinyint(1) NOT NULL DEFAULT 1,
  `id_user` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `notes` varchar(255) NOT NULL DEFAULT 'Not note',
  `due_date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `employee_pr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_order`
--
/*
INSERT INTO `tbl_order` (`id`, `invoice_id`, `total_prices`, `payment`, `id_user`, `fname`, `lname`, `phone`, `email`, `address`, `notes`, `due_date`, `status`, `employee_pr`) VALUES
(141, 'XFN00001', 1000000, 2, 02, 'Du', 'Nguyen', '0898438493', 'tringo@gmail.com', '1', '', '2024-12-15', 'Cancel', 1),
(142, 'XFN00002', 500000, 2, 02, 'Trai', 'Nguyen', '0898438493', 'tringo@gmail.com', '1', 'hhi', '2024-12-14', 'Ordered', 9),
(143, 'XFN00003', 600000, 2, 02, 'Binh', 'Nguyen', '0898438493', 'tringo@gmail.com', '1', '', '2024-12-15', 'Pending', NULL),
(144, 'XFN00004', 900000, 2, 02, 'Dung', 'Nguyen', '0898438493', 'tringo@gmail.com', '1', '', '2024-12-15', 'Pending', NULL),
(145, 'XFN00005', 2000000, 2, 02, 'Hau', 'Nguyen', '0898438493', 'tringo@gmail.com', '1', '', '2024-12-14', 'Pending', NULL);
*/
-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id_product` int(6) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `product_img` varchar(50) NOT NULL,
  `product_prices` int(10) NOT NULL DEFAULT 0,
  `catalog_id` int(4) NOT NULL,
  `employee_entry` int(11) NOT NULL,
  `entry_date` date NOT NULL DEFAULT current_timestamp(),
  `sup_id` int(11) NOT NULL,
  `view` tinyint(4) NOT NULL DEFAULT 0,
  `special` tinyint(4) NOT NULL DEFAULT 0,
  `old_prices` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL,
  `size` varchar(5) NOT NULL DEFAULT 'L'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`id_product`, `product_name`, `quantity`, `product_img`, `product_prices`, `catalog_id`, `employee_entry`, `entry_date`, `sup_id`, `view`, `special`, `old_prices`, `description`, `size`) VALUES
(90, 'Bitis White', 148, 'bitis1.jpg', 2000000, 94, 1, '2024-16-12', 16, 1, 1, 2000000, '6 month warranty 1 for 1 exchange , th', 'L'),
(91, 'Bitis Black', 149, 'bitis2.png', 1999000, 95, 1, '2024-16-12', 16, 1, 1, 1999000, '6 month warranty 1 for 1 exchange , th', 'XL'),
(92, 'Coolmate Shirt White', 273, 'coolmate1.jpg', 500000, 96, 1, '2024-16-12', 16, 1, 1, 500000, '6 month warranty 1 for 1 exchange , th', 'XXL'),
(93, 'Coolmate Shirt Black', 10, 'coolmate2.jpg', 600000, 96, 1, '2024-16-12', 14, 1, 1, 6000000, '6 month warranty 1 for 1 exchange , th', 'M'),
(94, 'Coolmate Pants', 150, 'coolmate3.jpg', 7000000, 95, 1, '2024-16-12', 14, 1, 1, 7000000, '6 month warranty 1 for 1 exchange , th', 'L'),
(95, 'Coolmate Ripstrop Pants', 122, 'coolmate5.jpg', 400000, 94, 1, '2024-16-12', 14, 1, 1, 4000000, '6 month warranty 1 for 1 exchange , th', 'L'),
(96, 'Coolmate Warp', 123, 'coolmate4.jpg', 900000, 94, 1, '2024-16-12', 14, 1, 1, 9000000, '6 month warranty 1 for 1 exchange , th', 'XXL'),
(97, 'Bitis Blue', 123, 'bitis3.jpg', 5000000, 94, 1, '2024-16-12', 16, 1, 1, 5000000, '6 month warranty 1 for 1 exchange , th', 'XXXL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(255) NOT NULL,
  `sup_address` varchar(255) NOT NULL,
  `sup_bank` int(11) NOT NULL,
  `sup_tax_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_name`, `sup_address`, `sup_bank`, `sup_tax_code`) VALUES
(14, 'Bitis', 'VN', 11111, 11111),
(16, 'Coolmate', 'VN', 22222, 22222);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `name_us` varchar(50) DEFAULT NULL,
  `address_us` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password_us` varchar(20) NOT NULL,
  `role_us` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `name_us`, `address_us`, `email`, `user`, `password_us`, `role_us`) VALUES
(02, 'Tri Ngo', 'KTX Khu B', '21522705@gm.uit.edu.vn', 'tringo', 'tringo', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order` (`id_order`),
  ADD KEY `FK_product` (`id_pro`);

--
-- Indexes for table `tbl_catalog`
--
ALTER TABLE `tbl_catalog`
  ADD PRIMARY KEY (`id_catalog_k`);

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_employee` (`employee_pr`),
  ADD KEY `FK_client_check` (`id_user`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `fk_product_catalog` (`catalog_id`),
  ADD KEY `fk_employee_entry` (`employee_entry`),
  ADD KEY `fk_supplier` (`sup_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `tbl_catalog`
--
ALTER TABLE `tbl_catalog`
  MODIFY `id_catalog_k` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id_product` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `FK_order` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id`),
  ADD CONSTRAINT `FK_product` FOREIGN KEY (`id_pro`) REFERENCES `tbl_product` (`id_product`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `FK_client_check` FOREIGN KEY (`id_user`) REFERENCES `tbl_client` (`ID`),
  ADD CONSTRAINT `FK_employee` FOREIGN KEY (`employee_pr`) REFERENCES `tbl_user` (`id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `fk_employee_entry` FOREIGN KEY (`employee_entry`) REFERENCES `tbl_user` (`id`),
  ADD CONSTRAINT `fk_product_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `tbl_catalog` (`id_catalog_k`),
  ADD CONSTRAINT `fk_supplier` FOREIGN KEY (`sup_id`) REFERENCES `tbl_supplier` (`sup_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
