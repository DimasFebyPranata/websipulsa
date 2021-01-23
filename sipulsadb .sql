-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 02:24 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipulsadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `password`, `nama`, `role`) VALUES
(1, 'admin', '$2y$10$/I7laWi1mlNFxYSv54EUPOH8MuZhmRWxhE.LaddTK9TSmVe.IHP2C', 'Admin', '1'),
(4, 'pegawai', '$2y$10$ZpkZ4P9Jp7RTOicXR9VqkOCdXBi3ajwufsS/xTi8zrGtGzVsVJ036', 'pegawai', '2'),
(5, 'dimass', '$2y$10$TyM9xdanYA3y8fdgIDmjkeKSCmmW9LmqtBuTte4K04EDOOFsiKdVa', 'dimas', ''),
(6, 'dimasss', '$2y$10$z2C4mOSepw12Twvycq64W.h6N7MVMsJ6PWS47czXFvrvfdQJvfzl2', 'dimas', ''),
(12, 'addd', '$2y$10$wT5vojZYkUccq3uh5nsNle1Llrgknoeg0ZHRgeBqspzEy1cgrwPp6', 'admin', ''),
(13, 'akkk', '$2y$10$YIImilz7zIDXWRLQWnLTLe.R7Bjp1NpOGeBxUZL5zJaMONhjxl/OG', 'aku', '');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` int(11) NOT NULL,
  `pulsa` int(11) NOT NULL,
  `harga` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `terjual` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `barcode`, `nama_produk`, `provider`, `pulsa`, `harga`, `stok`, `terjual`) VALUES
(1, 'TELKOMSEL 5k\r\n', 'PULSA TELKOMSEL 5000', 1, 1, '6500', 44, '1'),
(2, 'TELKOMSEL 10k\r\n', 'PULSA TELKOMSEL 10.000', 1, 2, '12000', 50, ''),
(3, 'TELKOMSEL 20k\r\n', 'PULSA TELKOMSEL 20.000', 1, 3, '21000', 48, '1'),
(4, 'TELKOMSEL 50k\r\n', 'PULSA TELKOMSEL 50.000', 1, 4, '51000', 49, '1'),
(5, 'TELKOMSEL 100k\r\n', 'PULSA TELKOMSEL 100.000', 1, 5, '101000', 48, '2'),
(6, 'TELKOMSEL 200k\r\n', 'PULSA TELKOMSEL 200.000', 1, 6, '201000', 50, ''),
(7, 'INDOSAT 5k', 'PULSA INDOSAT 5000', 2, 1, '6500', 50, ''),
(8, 'INDOSAT 10k', 'PULSA INDOSAT 10000', 2, 2, '11500', 50, ''),
(9, 'INDOSAT 20k', 'PULSA INDOSAT 20000', 2, 3, '21000', 50, ''),
(10, 'INDOSAT 50k\r\n', 'PULSA INDOSAT 50000', 2, 4, '51000', 50, ''),
(11, 'INDOSAT 100k\r\n', 'PULSA INDOSAT 100.000', 2, 5, '101000', 50, ''),
(12, 'INDOSAT 200k', 'PULSA INDOSAT 200.000', 2, 10, '201000', 50, ''),
(14, 'AXIS 5K', 'PULSA AXIS 5000', 4, 3, '6500', 50, '');

-- --------------------------------------------------------

--
-- Table structure for table `provider_produk`
--

CREATE TABLE `provider_produk` (
  `id` int(11) NOT NULL,
  `provider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_produk`
--

INSERT INTO `provider_produk` (`id`, `provider`) VALUES
(1, 'Telkomsel'),
(2, 'Indosat Oreodo'),
(3, 'By.u'),
(4, 'Axis'),
(5, 'XL Axiata'),
(6, '3'),
(7, 'Smartfren'),
(9, 'byyy'),
(10, 'bnnn');

-- --------------------------------------------------------

--
-- Table structure for table `pulsa_produk`
--

CREATE TABLE `pulsa_produk` (
  `id` int(11) NOT NULL,
  `pulsa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pulsa_produk`
--

INSERT INTO `pulsa_produk` (`id`, `pulsa`) VALUES
(3, '5000'),
(4, '10000'),
(6, '20000'),
(8, '50000'),
(9, '100000'),
(10, '200000'),
(12, '400000'),
(13, '100');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `nama`, `alamat`) VALUES
(1, 'SIPULSA', 'Jln. KH Ali Sekarputih Bondowoso');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `barcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_bayar` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_uang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskon` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan` int(11) DEFAULT NULL,
  `nota` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kasir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `tanggal`, `barcode`, `qty`, `total_bayar`, `jumlah_uang`, `diskon`, `pelanggan`, `nota`, `kasir`) VALUES
(1, '2020-02-21 13:42:54', '1', '2', '110000', '120000', '', 0, '7OROKLOEZ4041IQ', 1),
(2, '2020-02-21 13:43:25', '2,1', '5,1', '145000', '150000', '1500', 1, 'YKFNJAAKDMI0GC4', 1),
(3, '2020-02-21 13:43:25', '2,1', '5,1', '145000', '150000', '1500', 1, 'YKFNJAAKDMI0GC4', 1),
(4, '2020-02-21 13:43:42', '1', '1', '55000', '60000', '', 2, 'GKV673Z3MC4A02V', 1),
(5, '2020-02-21 13:49:44', '1', '2', '110000', '200000', '10000', 0, '108A992MRZ3PYME', 2),
(6, '2020-12-28 11:43:56', '3', '1', '15000', '15000', '', 1, 'E6PF940PPZQFZWW', 1),
(7, '2020-12-28 11:57:14', '1', '1', '55000', '100000', '', NULL, 'JONPA3TLUQE6ZUH', 1),
(8, '2020-12-28 11:58:56', '1', '1', '55000', '100000', '', NULL, '1QP7MWK3L285NHP', 1),
(9, '2020-12-28 12:34:17', '2', '1', '18000', '20000', '', NULL, '2L36Y4YLRVHD0XA', 1),
(10, '2021-01-04 11:18:06', '1', '1', '55000', '150000', '', NULL, 'FTPQIW2RGDKC4TN', 1),
(11, '2021-01-04 11:23:51', '1', '1', '55000', '100000', '', NULL, 'G2GU89K6LZ9O4PI', 3),
(12, '2021-01-04 12:39:22', '3', '1', '11500', '20000', '', NULL, 'XF0QIR1KIPIO4K9', 1),
(13, '2021-01-04 12:39:52', '3', '1', '11500', '20000', '', NULL, 'T6HT23LX9JJG41A', 1),
(14, '2021-01-04 13:19:53', '3', '1', '21000', '50000', '', NULL, '8TRSARA40TM8GUD', 1),
(15, '2021-01-04 13:21:15', '3', '1', '21000', '40000', '', NULL, 'IW7S9QUIZJKDOPL', 1),
(16, '2021-01-04 13:37:35', '1', '1', '6500', '15000', '', NULL, 'ZB1HQPC4ZL21KH5', 3),
(17, '2021-01-04 13:48:26', '5', '2', '202000', '210000', '', NULL, 'I50YX89ROBD0J0P', 1),
(18, '2021-01-04 13:52:51', '4', '1', '51000', '60000', '', NULL, '2FW5TFNJYK1A32Y', 1),
(19, '2021-01-06 00:55:02', '1', '1', '6500', '10000', '', NULL, 'DP62YIO34EBHFHK', 1),
(20, '2021-01-06 01:19:19', '1', '1', '6500', '10000', '', NULL, 'MFLYU150Q6ILDE8', 4),
(21, '2021-01-21 14:47:54', '1', '1', '6500', '10000', '', NULL, 'CE592PA8WX5Q4N6', 1),
(22, '2021-01-23 14:22:09', '1', '1', '6500', '10000', '', NULL, '6FW9T7G1QB6WXY8', 1),
(23, '2021-01-23 14:24:42', '1', '1', '6500', '10000', '', NULL, 'QJK0TUH51MSQR15', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_produk`
--
ALTER TABLE `provider_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pulsa_produk`
--
ALTER TABLE `pulsa_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `provider_produk`
--
ALTER TABLE `provider_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pulsa_produk`
--
ALTER TABLE `pulsa_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
