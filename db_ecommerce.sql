-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 19, 2024 at 10:02 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `foto` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `harga`, `qty`, `foto`, `created_at`, `update_at`) VALUES
(4, 'izzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 2147483647, 0, 'Facebook-icon.png', '2024-07-05 07:14:06', '2024-07-05 07:14:06'),
(9, 'mas faiz mas faiz', 1690000, 0, 'petanipadi.jpg', '2024-07-05 07:49:11', '2024-07-05 07:49:11'),
(10, '123', 4444, 0, '1.jpg', '2024-07-05 07:50:29', '2024-07-05 07:50:29'),
(11, 'ROKO ', 111, 0, '1.jpg', '2024-07-08 01:23:20', '2024-07-08 01:23:36'),
(12, 'PISANG', 17, 0, '1.jpg', '2024-07-18 04:35:06', '2024-07-18 04:53:13');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `keterangan`, `create_at`, `updated_at`) VALUES
(8, 'ADMIN', '            saya suka indomie', '2024-06-28 06:19:34', '2024-07-12 07:03:17'),
(16, 'USER', '                                    12', '2024-07-12 07:03:22', '2024-07-12 08:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='4';

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `nama_lengkap`, `email`, `password`, `alamat`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'raka argya cindaga', 'rargyacindaga@gmail.com', 'Raka Argya Cindaga', 'Jatimakmur', 0, '2024-07-18 04:06:24', '2024-07-18 04:07:20'),
(2, 'Bobby Cindaga', 'Bobbycindaga@gmail.com', '1234567890', 'jatimakmur', 0, '2024-07-18 04:06:24', '2024-07-18 04:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_member`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 0, '2024-07-19 07:05:37', '2024-07-19 07:05:37', 0),
(2, 2, 0, '2024-07-19 07:05:39', '2024-07-19 07:05:39', 0),
(3, 2, 0, '2024-07-19 07:15:07', '2024-07-19 07:15:07', 0),
(4, 2, 0, '2024-07-19 07:15:10', '2024-07-19 07:15:10', 0),
(5, 2, 0, '2024-07-19 07:15:12', '2024-07-19 07:15:12', 0),
(6, 2, 0, '2024-07-19 07:17:07', '2024-07-19 07:17:07', 0),
(7, 2, 0, '2024-07-19 07:17:10', '2024-07-19 07:17:10', 0),
(8, 2, 0, '2024-07-19 07:17:14', '2024-07-19 07:17:14', 0),
(9, 2, 0, '2024-07-19 07:17:16', '2024-07-19 07:17:16', 0),
(10, 2, 0, '2024-07-19 07:19:35', '2024-07-19 07:19:35', 0),
(11, 2, 0, '2024-07-19 07:19:39', '2024-07-19 07:19:39', 0),
(12, 2, 0, '2024-07-19 07:19:42', '2024-07-19 07:19:42', 0),
(13, 2, 0, '2024-07-19 07:19:43', '2024-07-19 07:19:43', 0),
(14, 2, 0, '2024-07-19 07:19:45', '2024-07-19 07:19:45', 0),
(15, 2, 0, '2024-07-19 07:19:46', '2024-07-19 07:19:46', 0),
(16, 2, 0, '2024-07-19 07:19:48', '2024-07-19 07:19:48', 0),
(17, 2, 0, '2024-07-19 07:19:50', '2024-07-19 07:19:50', 0),
(18, 2, 0, '2024-07-19 07:19:52', '2024-07-19 07:19:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `email_website` varchar(50) NOT NULL,
  `no_tlpn_website` varchar(15) NOT NULL,
  `alamat_website` text NOT NULL,
  `ig` varchar(100) NOT NULL,
  `twitter` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `linkedin` varchar(225) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `email_website`, `no_tlpn_website`, `alamat_website`, `ig`, `twitter`, `fb`, `linkedin`, `logo`, `create_at`, `update_at`) VALUES
(1, 'rargyacindaga@gmail.com', '0895383140377', 'jatimakmur, pomdok gede', 'https://www.google.com/search?q=facebok&oq=facebok&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIVCAEQLhgKGIMBGMcBG', 'http://localhost/php/ecommerce/admin/index.php?pg=setting', 'https://www.google.com/search?q=facebok&oq=facebok&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIVCAEQLhgKGIMBGMcBG', 'https://www.google.com/search?q=facebok&oq=facebok&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIVCAEQLhgKGIMBGMcBGLEDGNEDGIAEMg8IAhAAGAoYgwEYsQMYgAQyDwgDEAAYChiDARixAxiABDIMCAQQABgKGLEDGIAEMg8IBRAAGAoYgwEYsQMYgAQyBggGEEUYPDIGCAcQBRhA0gEIMz', NULL, '2024-07-17 08:23:14', '2024-07-18 02:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimoni`
--

INSERT INTO `testimoni` (`id`, `nama`, `jabatan`, `deskripsi`, `create_at`, `update_at`) VALUES
(4, 'bobby cindaga', 'hrd', '12354656', '2024-07-01 03:21:37', '2024-07-01 03:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) DEFAULT NULL,
  `nama_lengkap` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama_lengkap`, `email`, `password`, `create_at`, `update_at`) VALUES
(24, 8, 'raka argya cindaga', '111@cindaga', '9adcb29710e807607b683f62e555c22dc5659713', '2024-06-28 06:08:08', '2024-07-17 01:44:55'),
(25, 14, 'r', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2024-06-28 06:08:31', '2024-07-12 06:05:02'),
(26, 8, 'rargyacindaaga', 'rargyacindaga@gmail.com', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', '2024-07-12 07:04:01', '2024-07-12 07:04:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
