-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2023 at 07:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pm_poshan_aahar`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(20) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `school_id` varchar(20) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `complaint`, `school_id`, `supplier_id`, `status`) VALUES
(1, 'bad quality meal', '55555', '11111', 'pending'),
(2, 'bad quality rice', '55555', '11111', 'approved'),
(4, 'abc', '55555', '555555', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `height`
--

CREATE TABLE `height` (
  `id` int(20) NOT NULL,
  `sid` varchar(20) NOT NULL,
  `height` int(20) NOT NULL,
  `weight` int(20) NOT NULL,
  `S_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `height`
--

INSERT INTO `height` (`id`, `sid`, `height`, `weight`, `S_id`) VALUES
(1, '567', 7, 69, '55555'),
(2, '765', 6, 70, '55555'),
(3, '777', 7, 75, '55555');

-- --------------------------------------------------------

--
-- Table structure for table `meal`
--

CREATE TABLE `meal` (
  `id` int(20) NOT NULL,
  `rice` int(20) NOT NULL,
  `dal` int(20) NOT NULL,
  `spices` int(20) NOT NULL,
  `salt` int(20) NOT NULL,
  `oil` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meal`
--

INSERT INTO `meal` (`id`, `rice`, `dal`, `spices`, `salt`, `oil`) VALUES
(1, 15, 5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `id` int(20) NOT NULL,
  `rice` int(20) NOT NULL,
  `dal` int(20) NOT NULL,
  `spices` int(20) NOT NULL,
  `salt` int(20) NOT NULL,
  `oil` int(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `school_id` varchar(20) NOT NULL,
  `supplier_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`id`, `rice`, `dal`, `spices`, `salt`, `oil`, `status`, `school_id`, `supplier_id`) VALUES
(2, 100, 25, 20, 20, 30, 'pending', '55555', '0'),
(3, 100, 25, 10, 20, 20, 'approved', '55555', '0'),
(4, 100, 30, 20, 20, 20, 'approved', '55555', '0');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(20) NOT NULL,
  `Sid` varchar(20) NOT NULL,
  `Sname` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `Sid`, `Sname`, `password`, `location`, `admin`) VALUES
(1, '55555', 'maharana pratap vidhyalay', '12345', 'Bhusawal', 'admin@gmail.com'),
(7, '44444', 'rcpit', '00000', '52423', 'admin@gmail.com'),
(8, '33333', 'svkm', '99999', '425202', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(20) NOT NULL,
  `Sid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `class` varchar(30) NOT NULL,
  `height` int(30) NOT NULL,
  `weight` int(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `S_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `Sid`, `name`, `contact`, `class`, `height`, `weight`, `date`, `S_id`) VALUES
(7, '567', 'jayesh', '45454534', '6', 5, 6, '11-11-2020', '55555'),
(8, '765', 'Bhole', '455645', '5', 6, 70, '11-11-2020', '55555'),
(9, '777', 'hritik roshan', '8888888888', '5', 7, 75, '12-7-2022', '55555');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `Sid` varchar(20) NOT NULL,
  `Sname` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `Sid`, `Sname`, `password`, `location`, `admin`) VALUES
(2, '11111', 'Ram Supplier', '12345', '425201', 'admin@gmail.com'),
(3, '22222', 'rohit supplier', '12345', '425211', 'admin@gmail.com'),
(4, '45454', 'tom cruise', '90909', '55554', 'admin@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `height`
--
ALTER TABLE `height`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `height`
--
ALTER TABLE `height`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meal`
--
ALTER TABLE `meal`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
