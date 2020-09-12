-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2020 at 08:54 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `nis` varchar(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jk` varchar(2) DEFAULT NULL,
  `ttl` date DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`nis`, `nama`, `jk`, `ttl`, `kelas`, `image`) VALUES
('1100', 'Cici Lifia', 'P', '2020-08-01', 'XII', 'cici-lifia.jpg'),
('1122', 'Michael', 'L', '2020-08-01', 'XI', 'michael.jpg'),
('3080', 'Nana ', 'P', '2020-06-11', 'XII', 'nana-.jpg'),
('4000', 'nurdin', 'L', '2020-09-12', 'X', 'nurdin.jpg'),
('6000', 'Faturohman', 'L', '2020-04-21', 'XI', 'faturohman.jpg'),
('80000', 'abdul ajis', 'L', '1998-04-09', 'XII', 'abdul-ajis.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(5) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `klasifikasi` int(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `stock` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `judul`, `pengarang`, `klasifikasi`, `image`, `stock`) VALUES
('27000', 'Sistem informasi teknologi', 'Affandi', 1, 'sistem-informasi-teknologi.JPG', '21'),
('4000', 'Buku bahasa inggris', 'george al bee', 2, 'buku-bahasa-inggris.jpg', '20'),
('5000', 'Teknik Informasi', 'Andi', 1, 'teknik-informasi.jpg', '200'),
('59000', 'Buku Analisis Data', 'Habibi', 1, 'buku-analisis-data.JPG', '20'),
('7000', 'Buku Teknik Jaringan Komputer', 'David Smith', 1, 'buku-teknik-jaringan-komputer.JPG', '20');

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi`
--

CREATE TABLE `klasifikasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klasifikasi`
--

INSERT INTO `klasifikasi` (`id`, `nama`) VALUES
(1, 'Fiksi'),
(2, 'Non-Fiksi');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_transaksi` varchar(12) DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` varchar(2) DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `kode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_transaksi`, `tgl_pengembalian`, `denda`, `nominal`, `id_petugas`, `kode`) VALUES
('20200728001', '2020-07-28', 'N', 0, 8, NULL),
('20200728002', '2020-07-28', 'N', 0, 8, NULL),
('20200728003', '2020-07-28', 'N', 0, 8, NULL),
('20200812005', '2020-08-12', 'N', 0, 8, NULL),
('20200812006', '2020-08-12', 'N', 0, 8, NULL),
('20200813007', '2020-08-13', 'N', 0, 8, NULL),
('20200813008', '2020-08-13', 'N', 0, 8, NULL),
('20200820009', '2020-08-20', 'N', 0, 8, NULL),
('20200820010', '2020-08-22', 'N', 0, 8, NULL),
('20200822011', '2020-08-22', 'N', 0, 8, NULL),
('20200822012', '2020-08-22', 'N', 0, 8, NULL),
('20200824013', '2020-08-24', 'N', 0, 8, NULL),
('20200827014', '2020-08-27', 'N', 0, 8, NULL),
('20200828016', '2020-08-28', 'N', 1000, 8, NULL),
('20200906017', '2020-09-06', 'N', 4000, 8, NULL),
('20200908018', '2020-09-08', 'N', 2000, 8, NULL),
('20200908019', '2020-09-08', 'N', 0, 8, NULL),
('20200910020', '2020-09-10', 'N', 0, 8, NULL),
('20200910021', '2020-09-10', 'N', 0, 8, NULL),
('20200910022', '2020-09-10', 'N', 0, 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `role` enum('admin','anggota','kepsek') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `full_name`, `password`, `role`) VALUES
(8, 'admin', 'Admin Perpus', '$2y$05$0RfFGKdD.I9/9SRZd9../.kIQg7pwgDxhICT0t1aPZh29Ia2oRA3u', 'admin'),
(11, 'nurdin73', 'Nurdin Kepsek', '$2y$05$bQybZiZt5/Z0DyQZA7pVROyCZTzHs0Cr/AVNvs6fuGoFhXv0dW0uW', 'kepsek'),
(12, '4000', 'nurdin anggota', '$2y$05$l19drzFpEgmQ5YTToiMw8u7vSkPu1iuNTaC1kgwK65e8T/pcI8FYK', 'anggota');

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE `tmp` (
  `kode_buku` varchar(5) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `pengarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(12) DEFAULT NULL,
  `nis` varchar(10) DEFAULT NULL,
  `kode_buku` varchar(5) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `stok` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nis`, `kode_buku`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `id_petugas`, `stok`) VALUES
('20200728001', '112233', '7745', '2020-07-28', '2020-08-04', 'Y', 8, NULL),
('20200728002', '112233', '7712', '2020-07-28', '2020-08-04', 'Y', 8, NULL),
('20200728002', '112233', '7745', '2020-07-28', '2020-08-04', 'Y', 8, NULL),
('20200728003', '121217', '7745', '2020-07-28', '2020-08-04', 'Y', 8, NULL),
('20200728004', '112233', '7745', '2020-07-28', '2020-08-04', 'N', 8, NULL),
('20200812005', '121217', '7745', '2020-08-12', '2020-08-19', 'Y', 8, NULL),
('20200812006', '123450', '1900', '2020-08-12', '2020-08-19', 'Y', 8, NULL),
('20200813007', '123700', '8000', '2020-08-13', '2020-08-20', 'Y', 8, NULL),
('20200813008', '123450', '1900', '2020-08-13', '2020-08-20', 'Y', 8, NULL),
('20200820009', '111555', '1200', '2020-08-20', '2020-08-27', 'Y', 8, NULL),
('20200820010', '111555', '1900', '2020-08-20', '2020-08-27', 'Y', 8, NULL),
('20200822011', '111555', '1500', '2020-08-22', '2020-08-29', 'Y', 8, NULL),
('20200822012', '123700', '1200', '2020-08-22', '2020-08-29', 'Y', 8, NULL),
('20200824013', '12349', '4000', '2020-08-24', '2020-08-31', 'Y', 8, NULL),
('20200827014', '80000', '1500', '2020-08-27', '2020-09-03', 'Y', 8, NULL),
('20200827014', '80000', '4000', '2020-08-27', '2020-09-03', 'Y', 8, NULL),
('20200828015', '9000', '4000', '2020-08-28', '2020-09-04', 'N', 8, NULL),
('20200828016', '5000', '4000', '2020-08-28', '2020-09-04', 'Y', 8, NULL),
('20200906017', '28000', '27000', '2020-09-06', '2020-09-13', 'Y', 8, NULL),
('20200908018', '6000', '5000', '2020-09-08', '2020-09-15', 'Y', 8, NULL),
('20200908019', '80000', '1200', '2020-09-08', '2020-09-15', 'Y', 8, NULL),
('20200910020', '1100', '7000', '2020-09-10', '2020-09-17', 'Y', 8, NULL),
('20200910021', '1122', '4000', '2020-09-10', '2020-09-17', 'Y', 8, NULL),
('20200910022', '3080', '59000', '2020-09-10', '2020-09-17', 'Y', 8, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
