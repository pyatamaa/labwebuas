-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2021 at 09:19 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app_rt`
--

-- --------------------------------------------------------

--
-- Table structure for table `iuran`
--

CREATE TABLE `iuran` (
  `id` int(11) NOT NULL,
  `keterangan` tinytext DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `bulan` int(2) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `warga_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iuran`
--

INSERT INTO `iuran` (`id`, `keterangan`, `tanggal`, `bulan`, `tahun`, `jumlah`, `warga_id`) VALUES
(1, 'Kas Masuk', '2021-07-19', 7, 2021, '100000.00', 1),
(3, 'Kas Masuk', '2021-07-21', 7, 2021, '210000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `useremail` varchar(200) DEFAULT NULL,
  `userpassword` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `useremail`, `userpassword`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$0XJ6r2uiwc.2av28ZMMwnuHUifnRyQJnr2xj9XaoBcbyhE5SDKGCC');

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `warga_id` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `kelamin` enum('L','P') NOT NULL,
  `alamat` tinytext NOT NULL,
  `no_rumah` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`warga_id`, `nik`, `nama`, `kelamin`, `alamat`, `no_rumah`, `status`) VALUES
(1, '3275010804010007', 'Veno Setyoaji Wiratama', 'L', 'Cikarang', '29', NULL),
(2, '3275010804010008', 'vsw', 'L', 'Cikarang', '20', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iuran`
--
ALTER TABLE `iuran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warga_id` (`warga_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`warga_id`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iuran`
--
ALTER TABLE `iuran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `warga_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `iuran`
--
ALTER TABLE `iuran`
  ADD CONSTRAINT `iuran_ibfk_1` FOREIGN KEY (`warga_id`) REFERENCES `warga` (`warga_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
