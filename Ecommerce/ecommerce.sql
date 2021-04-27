-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 02:54 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `sno` int(11) NOT NULL,
  `img` text NOT NULL,
  `name` varchar(100) NOT NULL,
  `ratings` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `ships` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`sno`, `img`, `name`, `ratings`, `price`, `ships`) VALUES
(40, 'Mast&Harbour.jpg', 'Men Blue Printed Regular Fit Shorts', 5, 500, 'Ships to India'),
(41, 't-shirt.jpg', 'Black 2 pack t-shirts', 3, 300, 'Ships to India'),
(45, 'LG-Smart-LED-TV.jpg', 'LG 108 cm (43 inches) 4K Ultra HD Smart LED TV 43UM7290PTF (Ceramic Black)', 5, 34999, 'Ships to India'),
(56, 'Boat-Airdopes.jpg', 'Boat Airdopes 621 Bluetooth Truly Wireless Earbuds with Mic(White Frost), one Size', 5, 2499, 'Ships to India'),
(58, 'Samsung-Galaxy-Tab-S7.jpg', 'Samsung Galaxy Tab S7 27.81 cm (11 inch) 120 Hz Display, S-Pen in Box, Quad Speakers, 6 GB RAM, 12', 5, 65999, 'Ships to India');

-- --------------------------------------------------------

--
-- Table structure for table `electronics`
--

CREATE TABLE `electronics` (
  `sno` int(5) NOT NULL,
  `img` text NOT NULL,
  `name` varchar(100) NOT NULL,
  `ratings` int(5) NOT NULL,
  `price` int(8) NOT NULL,
  `ships` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `electronics`
--

INSERT INTO `electronics` (`sno`, `img`, `name`, `ratings`, `price`, `ships`) VALUES
(1, 'Redmi-Band.jpg', 'Redmi Smart Band', 5, 1598, 'Ships to India'),
(2, 'Boat-Airdopes.jpg', 'Boat Airdopes 621 Bluetooth Truly Wireless Earbuds with Mic(White Frost), one Size', 5, 2499, 'Ships to India'),
(3, 'LG-Smart-LED-TV.jpg', 'LG 108 cm (43 inches) 4K Ultra HD Smart LED TV 43UM7290PTF (Ceramic Black)', 5, 34999, 'Ships to India'),
(4, 'OnePlus-8T-5G.jpg', 'OnePlus 8T 5G (Aquamarine Green, 8GB RAM, 128GB Storage)', 5, 38999, 'Ships to India'),
(5, 'mi10i.jpg', 'Mi 10i 5G (Midnight Black, 6GB RAM, 128GB Storage) - 108MP Quad Camera | Snapdragon 750G Processor', 5, 21999, 'Ships to India'),
(6, 'Samsung-Galaxy-Tab-S7.jpg', 'Samsung Galaxy Tab S7 27.81 cm (11 inch) 120 Hz Display, S-Pen in Box, Quad Speakers, 6 GB RAM, 12', 5, 65999, 'Ships to India');

-- --------------------------------------------------------

--
-- Table structure for table `fashionf`
--

CREATE TABLE `fashionf` (
  `sno` int(5) NOT NULL,
  `img` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ratings` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `ships` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fashionf`
--

INSERT INTO `fashionf` (`sno`, `img`, `name`, `ratings`, `price`, `ships`) VALUES
(1, 't-shirt.jpg', 'Men Black Shirt', 5, 700, 'Ships to India');

-- --------------------------------------------------------

--
-- Table structure for table `fashionm`
--

CREATE TABLE `fashionm` (
  `sno` int(10) NOT NULL,
  `img` text NOT NULL,
  `name` text NOT NULL,
  `ratings` int(10) NOT NULL,
  `price` int(8) NOT NULL,
  `ships` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fashionm`
--

INSERT INTO `fashionm` (`sno`, `img`, `name`, `ratings`, `price`, `ships`) VALUES
(1, 'Black-shirt.jpg', 'Black shirt ', 5, 800, 'Ships to India'),
(3, 't-shirt.jpg', 'Black 2 pack t-shirts', 3, 300, 'Ships to India'),
(4, 'Mast&Harbour.jpg', 'Men Blue Printed Regular Fit Shorts', 5, 500, 'Ships to India'),
(5, 't-shirt.jpg', 'something', 3, 200, 'only to india'),
(6, 't-shirt.jpg', 'something1', 4, 400, 'only to india'),
(7, 't-shirt.jpg', 'something22', 5, 1200, 'only to india');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `electronics`
--
ALTER TABLE `electronics`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `fashionf`
--
ALTER TABLE `fashionf`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `fashionm`
--
ALTER TABLE `fashionm`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `electronics`
--
ALTER TABLE `electronics`
  MODIFY `sno` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fashionf`
--
ALTER TABLE `fashionf`
  MODIFY `sno` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fashionm`
--
ALTER TABLE `fashionm`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
