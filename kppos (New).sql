-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2020 at 11:32 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kppos`
--
CREATE DATABASE IF NOT EXISTS `kppos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kppos`;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_03_24_054642_create_item_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mitem`
--

DROP TABLE IF EXISTS `mitem`;
CREATE TABLE `mitem` (
  `IDItem` int(11) NOT NULL,
  `Kode` varchar(20) DEFAULT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Singkatan` varchar(20) DEFAULT NULL,
  `Suffix` varchar(5) DEFAULT NULL,
  `Barcode` varchar(20) DEFAULT NULL,
  `IDItemTree` int(11) DEFAULT NULL,
  `Satuan` varchar(10) DEFAULT NULL,
  `HargaJual` double DEFAULT NULL,
  `HargaBeli` double DEFAULT NULL,
  `StokMin` double DEFAULT NULL,
  `Keterangan` text DEFAULT NULL,
  `Aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `InsertUser` varchar(32) DEFAULT NULL,
  `InsertTime` datetime DEFAULT NULL,
  `UpdateUser` varchar(32) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mitem`
--

INSERT INTO `mitem` (`IDItem`, `Kode`, `Nama`, `Singkatan`, `Suffix`, `Barcode`, `IDItemTree`, `Satuan`, `HargaJual`, `HargaBeli`, `StokMin`, `Keterangan`, `Aktif`, `InsertUser`, `InsertTime`, `UpdateUser`, `UpdateTime`) VALUES
(1, '200090', 'S.COCK INDO MERAH (50)', '*S.COCK INDO MERAH (', '', '89879898989', 19, 'LUSIN', 70000, 63500, 20, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-30 17:24:59'),
(2, '200092', 'B.BOTOL MINUM BESAR', '*B.BOTOL MINUM BESAR', NULL, NULL, 109, 'LUSIN', 675000, 54000, 40, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-30 17:27:47'),
(3, '200093', 'B.BOTOL MINUM KECIL', '*B.BOTOL MINUM KECIL', NULL, NULL, 91, 'LUSIN', 52500, 42000, 26, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-30 17:01:04'),
(4, '200044', 'B.CANARY EBOD (20)', '*B.CANARY EBOD (20)', NULL, NULL, 22, 'CRT', 200000, 160000, 60, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-14 02:51:12'),
(5, '200089', 'B.CANARY EXCLUSIVE (CEDE)', '*B.CANARY EXCLUSIVE ', NULL, NULL, 22, 'RTG', 25000, 20000, 35, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-30 16:41:17'),
(6, '200088', 'S.COCK INDO HITAM (50)', '*S.COCK INDO HITAM (', '', NULL, 14, 'LUSIN', 69000, 66000, 9, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-16 15:19:08'),
(7, '200022', 'B.CANARY SEED (1KARUNG=20KG)', '*B.CANARY SEED (1KAR', NULL, NULL, 15, 'KARUNG', 350000, 285000, 15, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:17:44'),
(8, '200072', 'B.CANTELAN B', '*B.CANTELAN B', NULL, NULL, 97, 'PCS', 5500, 5000, 90, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:24:42'),
(9, '200075', 'B.CANTELAN K', '*B.CANTELAN K', NULL, NULL, 97, 'PCS', 4000, 3000, 76, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:22:42'),
(10, '200076', 'B.CANTELAN KAWAT', '*B.CANTELAN KAWAT', NULL, NULL, 97, 'PCS', 2000, 1500, 21, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:25:01'),
(11, '200074', 'B.EGG FOOD CD SUPER CANARY 6\'S', '*B.EGG FOOD CD SUPER', NULL, NULL, 109, 'RTG', 18000, 14000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:14:15'),
(12, '200002', 'B.FANCY GOOD FOOD BESAR 450GR (1CRT=20PAK)', '*B.FANCY GOOD FOOD B', NULL, NULL, 108, 'CRT', 225000, 190000, 21, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:27:22'),
(13, '200003', 'B.FANCY GOOD FOOD KECIL 250GR (1CRT=50PAK)', '*B.FANCY GOOD FOOD K', NULL, NULL, 108, 'CRT', 310000, 245000, 55, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:24:30'),
(14, '200015', 'B.FANCY LOVE & CARE KICAU 360GR', '*B.FANCY LOVE & CARE', NULL, NULL, 67, 'CRT', 215000, 175000, 20, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:29:00'),
(15, '200091', 'B.GELAS D (SETENGAH BULAT)', '*B.GELAS D (SETENGAH', NULL, NULL, 84, 'BAL', 120000, 95000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:14:55'),
(16, '200071', 'B.GOLD COIN ROYAL (ISI=20)', '*B.GOLD COIN ROYAL (', NULL, NULL, 105, 'CRT', 185000, 135000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:03'),
(17, '200070', 'B.KROTO KRISTAL HARTONO HIJAU (20)', '*B.KROTO KRISTAL HAR', NULL, NULL, 93, 'CRT', 112500, 90000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:18'),
(18, '200001', 'B.KROTO KRISTAL HARTONO MERAH (50)', '*B.KROTO KRISTAL HAR', NULL, NULL, 93, 'CRT', 240000, 200000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:26'),
(19, '200073', 'B.LARASATI', '*B.LARASATI', NULL, NULL, 19, 'PCS', 62500, 50000, 2, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 18:25:36'),
(20, '200004', 'B.MADURA KOONG (60)', '*B.MADURA KOONG (60)', NULL, NULL, 64, 'CRT', 475000, 375000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:41'),
(21, '200021', 'B.MILET CAMPUR 30 KG', '*B.MILET CAMPUR 30KG', NULL, NULL, 9, 'SAK', 390000, 255000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:49'),
(22, '200069', 'B.MILET CAMPUR 60 KG', '*B.MILET MERAH', NULL, NULL, 9, 'SAK', 780000, 510000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:15:55'),
(23, '200096', 'B.PUR BURUNG 521', '*B.PUR BURUNG 521', NULL, NULL, 84, 'SAK', 250000, 200000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:16:03'),
(24, '200035', 'B.SANGKAR KOSAN ISI 3', '*B.SANGKAR KOSAN ISI', NULL, NULL, 80, 'SET', 235000, 200000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:16:15'),
(25, '200036', 'B.SANGKAR KOSAN ISI 3 KECIL', '*B.SANGKAR KOSAN ISI', NULL, NULL, 40, 'SET', 210000, 180000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:19:51'),
(26, '200066', 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', '*B.SANGKAR PARKIT 80', NULL, NULL, 40, 'PCS', 80000, 62500, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:16:35'),
(27, '200068', 'B.SANGKAR PARKIT BB-35 BULAT PENDEK (10)', '*B.SANGKAR PARKIT BB', NULL, NULL, 40, 'PCS', 90000, 70000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:16:45'),
(28, '200077', 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', '*B.SANGKAR PARKIT BB', NULL, NULL, 40, 'PCS', 92500, 75000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:02'),
(29, '200039', 'B.SANGKAR PARKIT BB-39 BULAT KECIL (10)', '*B.SANGKAR PARKIT BB', NULL, NULL, 40, 'PCS', 65000, 47000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:13'),
(30, '200065', 'B.SANGKAR PARKIT BB-41 BULAT BESAR (6)', '*B.SANGKAR PARKIT BB', NULL, NULL, 40, 'PCS', 155000, 130000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:25'),
(31, '200095', 'S.COCK INDO HTM DIAMOND (50)', '*S.COCK INDO HTM DIA', '', NULL, 20, 'LUSIN', 72000, 68500, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:32'),
(32, '200034', 'B.SANGKAR PERKUTUT KERANG POLOS', '*B.SANGKAR PERKUTUT ', NULL, NULL, 15, 'PASANG', 230000, 175000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:46'),
(33, '200064', 'B.SANGKAR PERKUTUT MAHKOTA BIASA', '*B.SANGKAR PERKUTUT ', NULL, NULL, 12, 'PASANG', 280000, 225000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:17:57'),
(34, '200037', 'S.BAD P/P DHS 1832', '*B.SANGKAR PERNIS IS', NULL, NULL, 19, 'SET', 39500, 35750, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:18:47'),
(35, '200038', 'S.BAD P/P PRASIDA L/K', '*B.SANGKAR PERNIS IS', NULL, NULL, 21, 'SET', 8500, 7500, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:19:09'),
(36, '200005', 'S.BAD P/P BUTERFLY L/K', '*B.SARIMADU PERKUTUT', NULL, NULL, 21, 'SET', 8500, 7500, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:19:15'),
(95, '200040', 'S.COVER GITAR PARASIT', '*S COCK INDO MRH DIA', NULL, NULL, 67, 'PCS', 40000, 35000, 0, 'Inject Program', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 16:19:22'),
(6785, '200097', 'S.REBANA KECIL KOTEK', '*S.REBANA KECIL KOTE', '', NULL, 67, 'PCS', 21000, 17000, 0, NULL, 'Ya', NULL, '2017-08-07 20:28:38', NULL, '2017-08-07 20:29:01'),
(6786, '200098', 'S.REBANA BESAR', '*S.REBANA BESAR', '', NULL, 67, 'PCS', 75000, 60000, 0, NULL, 'Ya', NULL, '2017-08-07 20:29:48', NULL, NULL),
(6830, '200100', 'S.LAKEN BILYARD HJU TOSCA', '*S.LAKEN BILYARD HJU', '', NULL, 63, 'METER', 195000, 160000, 0, NULL, 'Ya', NULL, '2017-08-19 18:07:10', NULL, NULL),
(6831, NULL, 'Lagu Cover', NULL, NULL, NULL, 2, 'CRT', 120000, 100000, 20, NULL, 'Ya', 'christopher@gmail.com', '2019-05-13 16:04:58', NULL, NULL),
(6894, NULL, 'MAKANAN', NULL, NULL, NULL, 2, 'PCS', 66700, 63500, 15, NULL, 'Ya', 'christopher@gmail.com', '2019-05-30 17:27:26', NULL, NULL),
(6895, NULL, 'BARANG BARU', NULL, NULL, NULL, 121, 'LUSIN', 12000, 10000, 20, NULL, 'Ya', 'christopher@gmail.com', '2019-05-31 04:32:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mitemtipe`
--

DROP TABLE IF EXISTS `mitemtipe`;
CREATE TABLE `mitemtipe` (
  `IDTipeItem` int(11) NOT NULL,
  `Kode` varchar(10) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Keterangan` text DEFAULT NULL,
  `Aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `InsertUser` varchar(16) DEFAULT NULL,
  `InsertTime` datetime DEFAULT NULL,
  `UpdateUser` varchar(16) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mitemtree`
--

DROP TABLE IF EXISTS `mitemtree`;
CREATE TABLE `mitemtree` (
  `IDItemTree` int(11) NOT NULL,
  `Kode` varchar(20) DEFAULT NULL,
  `Nama` varchar(50) NOT NULL,
  `Keterangan` text DEFAULT NULL,
  `Selectable` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `Aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `InsertUser` varchar(50) DEFAULT NULL,
  `InsertTime` datetime DEFAULT NULL,
  `UpdateUser` varchar(50) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mitemtree`
--

INSERT INTO `mitemtree` (`IDItemTree`, `Kode`, `Nama`, `Keterangan`, `Selectable`, `Aktif`, `InsertUser`, `InsertTime`, `UpdateUser`, `UpdateTime`) VALUES
(2, 'ALBM', 'ALBUM', NULL, 'Ya', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-30 17:35:34'),
(3, 'AMP', 'AMPLOP', NULL, 'Ya', 'Ya', NULL, NULL, 'christopher@gmail.com', '2019-05-13 15:56:10'),
(7, 'BKEN', 'BOOK END', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(8, 'BKU', 'BUKU', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(9, 'BKAG', 'AGENDA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(10, 'BKAS', 'BUKU KAS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(11, 'BKGR', 'BK GAMBAR', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(12, 'BKHC', 'BK HARDCOVER', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(14, 'BKML', 'BK MILIMETER', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(15, 'BKNT', 'BK NOTES', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(16, 'BKTL', 'BK TULIS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(17, 'BKTM', 'BK TAMU', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(18, 'BPEN', 'BOLPEN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(19, 'BXFL', 'BOX FILE', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(20, 'CALC', 'CALCULATOR', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(21, 'CAT', 'CAT', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(22, 'CF', 'CONTINUOUS FORM', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(23, 'CLBD', 'CLIPBOARD', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(24, 'BDCL', 'BINDER CLIP', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(25, 'TRCL', 'TRI CLIP', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(26, 'CMPS', 'COMPASS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(27, 'COMP', 'COMPUTER', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(28, 'CORL', 'CORR LIQUID', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(29, 'CORT', 'CORR TAPE', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(30, 'CRYN', 'CRAYON', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(31, 'CUTT', 'CUTTER', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(32, 'DISTP', 'DISP TAPE', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(33, 'DST', 'DESK SET', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(34, 'GRS', 'PENGGARIS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(35, 'GTG', 'GUNTING', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(36, 'HVSP', 'HVS PUTIH', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(37, 'HVSW', 'HVS WARNA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(38, 'INDX', 'INDEX', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(39, 'INK', 'TINTA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(40, 'ISO', 'ISOLASI', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(41, 'JKG', 'JANGKA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(42, 'JRP', 'JARUM / PENITI', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(43, 'KACA', 'KACA PEMBESAR', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(44, 'KANT', 'KANT NAMA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(45, 'KEY', 'KEY', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(46, 'KKF', 'KIKY FANCY', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(47, 'KNVS', 'KANVAS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(48, 'KRTS', 'KERTAS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(49, 'KBON', 'KARBON', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(50, 'KRBF', 'K.BUFALO', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(51, 'KRCR', 'K.CREPE', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(52, 'KRDF', 'K.DOUBLE FOLIO', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(53, 'KRFX', 'K.FAX', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(54, 'KRKD', 'K.KADO', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(55, 'KRKF', 'K.FLUORECENT', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(56, 'KRLP', 'K.LIPAT', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(57, 'KRMN', 'K.MANILA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(58, 'KRMT', 'K.METALIK', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(59, 'KRMY', 'K.MINYAK', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(60, 'KRSK', 'K.SUKONG', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(61, 'KRTL', 'K.TELSTROOK', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(62, 'KUAS', 'KUAS', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(63, 'LAIN', 'LAIN-LAIN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(64, 'LBL', 'LABEL', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(65, 'LEM', 'LEM', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(66, 'LLF', 'LOOSE LEAF', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(67, 'MAIN', 'MAINAN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(68, 'MAP', 'MAP', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(69, 'NOTA', 'NOTA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(72, 'PKY', 'PCL KAYU', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(75, 'PWRN', 'PCL WARNA', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(76, 'PLST', 'PLASTIK', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(79, 'PLT', 'PALET', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(80, 'POS', 'POS IT', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(82, 'PPN', 'PAPAN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(83, 'PGHPS', 'PGHPS WBD', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(84, 'PWBD', 'PAPAN WBD', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(87, 'PUNC', 'PUNCH', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(88, 'RAUT', 'RAUTAN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(89, 'REF', 'REFILL BPEN', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(90, 'RPAD', 'REPORT PAD', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(91, 'SMPL', 'SAMPUL', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(92, 'SPDL', 'SPIDOL', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(93, 'SPRL', 'SPIRAL', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(94, 'SPRT', 'SPORT', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(95, 'STAB', 'STABILO', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(96, 'STAM1', 'STAM PAD', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(97, 'STAM2', 'STEMPEL', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(98, 'STIP', 'STIP', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(103, 'ZIP', 'ZIP FILE', NULL, 'Ya', 'Ya', NULL, NULL, NULL, NULL),
(104, 'CLIP', 'CLIP', NULL, 'Ya', 'Ya', 'YUDI', '2017-05-11 14:42:00', NULL, NULL),
(105, 'PCL', 'PENCIL', NULL, 'Ya', 'Ya', 'YUDI', '2017-05-11 17:33:03', NULL, NULL),
(106, 'STAM', 'STAMP', NULL, 'Ya', 'Ya', 'YUDI', '2017-05-11 18:25:19', NULL, NULL),
(107, 'HVS', 'HVS', NULL, 'Ya', 'Ya', 'YUDI', '2017-05-13 12:03:05', NULL, NULL),
(108, NULL, 'MAKANAN', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-13 16:07:12', 'christopher@gmail.com', '2019-05-13 16:07:34'),
(109, NULL, 'MINUMAN', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-13 16:07:21', NULL, NULL),
(110, NULL, 'KAT1', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-16 15:50:26', NULL, NULL),
(111, NULL, 'KAT2', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-16 15:51:59', NULL, NULL),
(112, NULL, 'KAT3', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-16 15:52:43', NULL, NULL),
(113, NULL, 'Kategori 1', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-29 08:49:23', NULL, NULL),
(114, NULL, 'Barang 1', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-29 08:49:55', NULL, NULL),
(115, NULL, 'BARANG 2', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-29 08:54:33', NULL, NULL),
(116, NULL, 'MAKANAN', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-30 16:29:03', NULL, NULL),
(117, NULL, 'MINUMAN', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-30 16:31:47', NULL, NULL),
(119, NULL, 'KATEGORITES', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-30 17:34:20', NULL, NULL),
(120, NULL, 'KATEGORITES2', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-30 17:35:22', NULL, NULL),
(121, NULL, 'KATEGORI BARU', NULL, 'Ya', 'Ya', 'christopher@gmail.com', '2019-05-31 04:32:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `templatenota`
--

DROP TABLE IF EXISTS `templatenota`;
CREATE TABLE `templatenota` (
  `Atribut` varchar(30) NOT NULL,
  `Isi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templatenota`
--

INSERT INTO `templatenota` (`Atribut`, `Isi`) VALUES
('NamaToko', 'Toko Alat Tulis ABC'),
('Alamat', 'Jl. Sumatra 99'),
('NoTelp', '(031) 3894857'),
('Footer', 'Terima kasih atas kunjungan anda');

-- --------------------------------------------------------

--
-- Table structure for table `tjualbayarkasd`
--

DROP TABLE IF EXISTS `tjualbayarkasd`;
CREATE TABLE `tjualbayarkasd` (
  `IDJualBayarKasD` int(11) NOT NULL,
  `IDJualH` int(11) NOT NULL,
  `Metode` enum('Tunai','Kartu Kredit','Debit','Voucher','Retur','Transfer','Lain-lain') NOT NULL DEFAULT 'Tunai',
  `Bank` varchar(20) DEFAULT NULL,
  `NomorKartu` varchar(50) DEFAULT NULL,
  `JenisKartu` varchar(20) DEFAULT NULL,
  `RefTrans` varchar(20) DEFAULT NULL,
  `Waktu` datetime DEFAULT NULL,
  `IDJualReturH` int(11) DEFAULT NULL,
  `IDVoucherD` int(11) DEFAULT NULL,
  `Nominal` double NOT NULL,
  `Keterangan` text DEFAULT NULL,
  `Status` enum('Pending','Posted','Canceled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjualbayarkasd`
--

INSERT INTO `tjualbayarkasd` (`IDJualBayarKasD`, `IDJualH`, `Metode`, `Bank`, `NomorKartu`, `JenisKartu`, `RefTrans`, `Waktu`, `IDJualReturH`, `IDVoucherD`, `Nominal`, `Keterangan`, `Status`) VALUES
(1, 1, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 615000, NULL, 'Pending'),
(2, 2, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 215000, NULL, 'Pending'),
(3, 3, 'Kartu Kredit', '12121', '1212', NULL, '121212', NULL, NULL, NULL, 201700, '12121', 'Pending'),
(4, 4, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69500, NULL, 'Pending'),
(5, 5, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 195000, NULL, 'Pending'),
(6, 6, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 225000, NULL, 'Pending'),
(7, 7, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 310000, NULL, 'Pending'),
(8, 8, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 380000, NULL, 'Pending'),
(9, 9, 'Debit', 'Mandiri', '121212', NULL, '0898', NULL, NULL, NULL, 192000, NULL, 'Pending'),
(10, 10, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280000, NULL, 'Pending'),
(11, 11, 'Debit', 'BCA', '3433444', NULL, '0898', NULL, NULL, NULL, 319000, NULL, 'Pending'),
(12, 12, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 205000, NULL, 'Pending'),
(13, 13, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 302500, NULL, 'Pending'),
(14, 14, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42000, NULL, 'Pending'),
(15, 15, 'Debit', 'BCA', '9898989', NULL, '0898', NULL, NULL, NULL, 220000, NULL, 'Pending'),
(16, 16, 'Debit', 'BCA', '65656565', NULL, '0898', NULL, NULL, NULL, 79000, NULL, 'Pending'),
(17, 17, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62500, NULL, 'Pending'),
(18, 18, 'Debit', 'Mandiri', '787878787', NULL, '0898', NULL, NULL, NULL, 280000, NULL, 'Pending'),
(19, 19, 'Debit', 'Diamond', '090909090090', NULL, '0898', NULL, NULL, NULL, 475000, NULL, 'Pending'),
(20, 20, 'Kartu Kredit', 'Diamond', '3123134444', NULL, '0989', NULL, NULL, NULL, 367000, NULL, 'Pending'),
(21, 21, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250000, NULL, 'Pending'),
(22, 22, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 240000, NULL, 'Pending'),
(23, 23, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 140000, NULL, 'Pending'),
(24, 24, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49000, NULL, 'Pending'),
(25, 25, 'Debit', 'BCA', '463134867', NULL, '0989', NULL, NULL, NULL, 93000, NULL, 'Pending'),
(26, 26, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71000, NULL, 'Pending'),
(27, 27, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000, NULL, 'Pending'),
(28, 28, 'Debit', 'Diamond', '36754325345', NULL, '0989', NULL, NULL, NULL, 106200, NULL, 'Pending'),
(29, 29, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33500, NULL, 'Pending'),
(30, 30, 'Kartu Kredit', 'Mandiri', '4456534567', NULL, '0989', NULL, NULL, NULL, 200000, NULL, 'Pending'),
(31, 31, 'Debit', 'BCA', '03458734567', NULL, '0898', NULL, NULL, NULL, 408000, NULL, 'Pending'),
(32, 32, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 228000, NULL, 'Pending'),
(33, 33, 'Kartu Kredit', 'Diamond', '6786543498', NULL, '0898', NULL, NULL, NULL, 847500, NULL, 'Pending'),
(34, 34, 'Debit', 'Diamond', '10756534464', NULL, '0989', NULL, NULL, NULL, 440000, NULL, 'Pending'),
(35, 35, 'Kartu Kredit', 'BCA', '666688765', NULL, '0898', NULL, NULL, NULL, 780000, NULL, 'Pending'),
(36, 36, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 240000, NULL, 'Pending'),
(37, 37, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125000, NULL, 'Pending'),
(38, 38, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71000, NULL, 'Pending'),
(39, 39, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 152000, NULL, 'Pending'),
(40, 40, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80000, NULL, 'Pending'),
(41, 41, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 189000, NULL, 'Pending'),
(42, 42, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 438000, NULL, 'Pending'),
(43, 43, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500000, NULL, 'Pending'),
(44, 44, 'Debit', 'BCA', '34567867832', NULL, '0989', NULL, NULL, NULL, 113500, NULL, 'Pending'),
(45, 45, 'Debit', 'Mandiri', '303030252', NULL, '0890', NULL, NULL, NULL, 350000, NULL, 'Pending'),
(46, 46, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 159500, NULL, 'Pending'),
(47, 47, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125500, NULL, 'Pending'),
(48, 48, 'Debit', 'Diamond', '3773737337', NULL, '0890', NULL, NULL, NULL, 475000, NULL, 'Pending'),
(49, 49, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 280000, NULL, 'Pending'),
(50, 50, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88500, NULL, 'Pending'),
(51, 51, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 133400, NULL, 'Pending'),
(52, 52, 'Debit', 'Mandiri', '985212369', NULL, '0890', NULL, NULL, NULL, 230000, NULL, 'Pending'),
(53, 53, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135700, NULL, 'Pending'),
(54, 54, 'Kartu Kredit', 'Diamond', '7852147776', NULL, '0890', NULL, NULL, NULL, 292500, NULL, 'Pending'),
(55, 55, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4000, NULL, 'Pending'),
(56, 56, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7500, NULL, 'Pending'),
(57, 57, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21000, NULL, 'Pending'),
(58, 58, 'Debit', 'BCA', '985212369', NULL, '0890', NULL, NULL, NULL, 145000, NULL, 'Pending'),
(59, 59, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35000, NULL, 'Pending'),
(60, 60, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10500, NULL, 'Pending'),
(61, 61, 'Debit', 'BCA', '7852147776', NULL, '0890', NULL, NULL, NULL, 67500, NULL, 'Pending'),
(62, 62, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33500, NULL, 'Pending'),
(63, 63, 'Kartu Kredit', 'Diamond', '10756534464', NULL, '0890', NULL, NULL, NULL, 54000, NULL, 'Pending'),
(64, 64, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37000, NULL, 'Pending'),
(65, 65, 'Debit', 'BCA', '23745323728', NULL, '0890', NULL, NULL, NULL, 207700, NULL, 'Pending'),
(66, 66, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42000, NULL, 'Pending'),
(67, 67, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59500, NULL, 'Pending'),
(68, 68, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 310000, NULL, 'Pending'),
(69, 69, 'Debit', 'Mandiri', '23745323728', NULL, '0898', NULL, NULL, NULL, 1395000, NULL, 'Pending'),
(70, 70, 'Kartu Kredit', 'Mandiri', '6786543498', NULL, '0898', NULL, NULL, NULL, 82000, NULL, 'Pending'),
(71, 71, 'Kartu Kredit', 'Diamond', '985212369', NULL, '0898', NULL, NULL, NULL, 400000, NULL, 'Pending'),
(72, 72, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 203000, NULL, 'Pending'),
(73, 73, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53000, NULL, 'Pending'),
(74, 74, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50000, NULL, 'Pending'),
(75, 75, 'Debit', 'BCA', '868656907324', NULL, '0989', NULL, NULL, NULL, 71000, NULL, 'Pending'),
(76, 76, 'Kartu Kredit', 'BCA', '7789814456', NULL, '0989', NULL, NULL, NULL, 345000, NULL, 'Pending'),
(77, 77, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 258500, NULL, 'Pending'),
(78, 78, 'Debit', 'Diamond', '03458734567', NULL, '0989', NULL, NULL, NULL, 384000, NULL, 'Pending'),
(79, 79, 'Debit', 'BCA', '4631279004', NULL, '0989', NULL, NULL, NULL, 104000, NULL, 'Pending'),
(80, 80, 'Kartu Kredit', 'Mandiri', '51230987234', NULL, '0898', NULL, NULL, NULL, 287500, NULL, 'Pending'),
(81, 81, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79000, NULL, 'Pending'),
(82, 82, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82000, NULL, 'Pending'),
(83, 83, 'Kartu Kredit', 'BCA', '51230987234', NULL, '0898', NULL, NULL, NULL, 870000, NULL, 'Pending'),
(84, 84, 'Debit', 'BCA', '10756534464', NULL, '0898', NULL, NULL, NULL, 399200, NULL, 'Pending'),
(85, 85, 'Kartu Kredit', 'Diamond', '51230987234', NULL, '0989', NULL, NULL, NULL, 1098500, NULL, 'Pending'),
(86, 86, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 387500, NULL, 'Pending'),
(87, 87, 'Kartu Kredit', 'Diamond', '6786543498', NULL, '0989', NULL, NULL, NULL, 466500, NULL, 'Pending'),
(88, 88, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 408000, NULL, 'Pending'),
(89, 89, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 145000, NULL, 'Pending'),
(90, 90, 'Kartu Kredit', 'Mandiri', '868656907324', NULL, '0890', NULL, NULL, NULL, 360000, NULL, 'Pending'),
(91, 91, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600000, NULL, 'Pending'),
(92, 92, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 610700, NULL, 'Pending'),
(93, 93, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 958500, NULL, 'Pending'),
(94, 94, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 215000, NULL, 'Pending'),
(95, 95, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 898500, NULL, 'Pending'),
(96, 96, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 420000, NULL, 'Pending'),
(97, 97, 'Debit', 'BCA', '12', NULL, '12', NULL, NULL, NULL, 459500, 'a', 'Pending'),
(98, 98, 'Kartu Kredit', 'BCA', '12', NULL, '12', NULL, NULL, NULL, 289000, 'done', 'Pending'),
(99, 99, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 669500, NULL, 'Pending'),
(100, 100, 'Debit', 'BCA', '12', NULL, '12', NULL, NULL, NULL, 79000, NULL, 'Pending'),
(101, 101, 'Tunai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 210000, NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tjualbayarkash`
--

DROP TABLE IF EXISTS `tjualbayarkash`;
CREATE TABLE `tjualbayarkash` (
  `IDJualH` int(11) NOT NULL,
  `IDKasir` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Tunai` double DEFAULT NULL,
  `Kartu` double DEFAULT NULL,
  `Voucher` double DEFAULT NULL,
  `Deposit` double DEFAULT NULL,
  `LainLain` double DEFAULT NULL,
  `Total` double NOT NULL,
  `Kembali` double NOT NULL,
  `InsertUser` varchar(16) DEFAULT NULL,
  `InsertTime` datetime DEFAULT NULL,
  `InsertProgram` varchar(30) DEFAULT NULL,
  `InsertIP` varchar(30) DEFAULT NULL,
  `UpdateUser` varchar(16) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL,
  `UpdateProgram` varchar(30) DEFAULT NULL,
  `UpdateIP` varchar(30) DEFAULT NULL,
  `Terminal` varchar(50) DEFAULT NULL COMMENT '= terminalclose di tjualh'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjualbayarkash`
--

INSERT INTO `tjualbayarkash` (`IDJualH`, `IDKasir`, `Tanggal`, `Tunai`, `Kartu`, `Voucher`, `Deposit`, `LainLain`, `Total`, `Kembali`, `InsertUser`, `InsertTime`, `InsertProgram`, `InsertIP`, `UpdateUser`, `UpdateTime`, `UpdateProgram`, `UpdateIP`, `Terminal`) VALUES
(1, 7, '2019-04-22', 1000000, NULL, NULL, NULL, NULL, 615000, 385000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 7, '2019-04-22', 300000, NULL, NULL, NULL, NULL, 215000, 85000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, '2019-04-22', NULL, 201700, NULL, NULL, NULL, 201700, 98300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, '2019-05-13', 70000, NULL, NULL, NULL, NULL, 69500, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 4, '2019-05-13', 200000, NULL, NULL, NULL, NULL, 195000, 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 4, '2019-05-13', 250000, NULL, NULL, NULL, NULL, 225000, 25000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, '2019-05-13', 310000, NULL, NULL, NULL, NULL, 310000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, '2019-05-13', 400000, NULL, NULL, NULL, NULL, 380000, 20000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 4, '2019-05-13', NULL, 192000, NULL, NULL, NULL, 192000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 4, '2019-05-13', 300000, NULL, NULL, NULL, NULL, 280000, 20000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 4, '2019-05-13', NULL, 319000, NULL, NULL, NULL, 319000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 4, '2019-05-13', 205000, NULL, NULL, NULL, NULL, 205000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 4, '2019-05-13', 310000, NULL, NULL, NULL, NULL, 302500, 7500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 4, '2019-05-13', 45000, NULL, NULL, NULL, NULL, 42000, 3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 4, '2019-05-13', NULL, 220000, NULL, NULL, NULL, 220000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 4, '2019-05-13', NULL, 79000, NULL, NULL, NULL, 79000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 4, '2019-05-13', 62500, NULL, NULL, NULL, NULL, 62500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 4, '2019-05-13', NULL, 280000, NULL, NULL, NULL, 280000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 4, '2019-05-13', NULL, 475000, NULL, NULL, NULL, 475000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 4, '2019-05-13', NULL, 367000, NULL, NULL, NULL, 367000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 4, '2019-05-13', 250000, NULL, NULL, NULL, NULL, 250000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 4, '2019-05-13', 250000, NULL, NULL, NULL, NULL, 240000, 10000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 4, '2019-05-13', 140000, NULL, NULL, NULL, NULL, 140000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 4, '2019-05-13', 50000, NULL, NULL, NULL, NULL, 49000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 4, '2019-05-13', NULL, 93000, NULL, NULL, NULL, 93000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 4, '2019-05-13', 72000, NULL, NULL, NULL, NULL, 71000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 4, '2019-05-13', 100000, NULL, NULL, NULL, NULL, 100000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 4, '2019-05-13', NULL, 106200, NULL, NULL, NULL, 106200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 4, '2019-05-13', 34000, NULL, NULL, NULL, NULL, 33500, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 4, '2019-05-13', NULL, 200000, NULL, NULL, NULL, 200000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 4, '2019-05-13', NULL, 408000, NULL, NULL, NULL, 408000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 4, '2019-05-13', 230000, NULL, NULL, NULL, NULL, 228000, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 4, '2019-05-13', NULL, 847500, NULL, NULL, NULL, 847500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 4, '2019-05-13', NULL, 440000, NULL, NULL, NULL, 440000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 4, '2019-05-13', NULL, 780000, NULL, NULL, NULL, 780000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 4, '2019-05-13', 240000, NULL, NULL, NULL, NULL, 240000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 4, '2019-05-13', 125000, NULL, NULL, NULL, NULL, 125000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 4, '2019-05-13', 72000, NULL, NULL, NULL, NULL, 71000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 4, '2019-05-13', 152000, NULL, NULL, NULL, NULL, 152000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 4, '2019-05-13', 80000, NULL, NULL, NULL, NULL, 80000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 4, '2019-05-13', 189000, NULL, NULL, NULL, NULL, 189000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 4, '2019-05-13', 450000, NULL, NULL, NULL, NULL, 438000, 12000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 4, '2019-05-13', 500000, NULL, NULL, NULL, NULL, 500000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 4, '2019-05-13', NULL, 113500, NULL, NULL, NULL, 113500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 4, '2019-05-13', NULL, 350000, NULL, NULL, NULL, 350000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 4, '2019-05-13', 160000, NULL, NULL, NULL, NULL, 159500, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 4, '2019-05-13', 125500, NULL, NULL, NULL, NULL, 125500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 4, '2019-05-13', NULL, 475000, NULL, NULL, NULL, 475000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 4, '2019-05-13', 280000, NULL, NULL, NULL, NULL, 280000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 4, '2019-05-13', 90000, NULL, NULL, NULL, NULL, 88500, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 4, '2019-05-13', 135000, NULL, NULL, NULL, NULL, 133400, 1600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 4, '2019-05-13', NULL, 230000, NULL, NULL, NULL, 230000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 4, '2019-05-13', 136000, NULL, NULL, NULL, NULL, 135700, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 4, '2019-05-13', NULL, 292500, NULL, NULL, NULL, 292500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 4, '2019-05-13', 4000, NULL, NULL, NULL, NULL, 4000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 4, '2019-05-13', 8000, NULL, NULL, NULL, NULL, 7500, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 4, '2019-05-13', 21000, NULL, NULL, NULL, NULL, 21000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 4, '2019-05-13', NULL, 145000, NULL, NULL, NULL, 145000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 4, '2019-05-13', 35000, NULL, NULL, NULL, NULL, 35000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 4, '2019-05-13', 10500, NULL, NULL, NULL, NULL, 10500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 4, '2019-05-13', NULL, 67500, NULL, NULL, NULL, 67500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 4, '2019-05-13', 35000, NULL, NULL, NULL, NULL, 33500, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 4, '2019-05-13', NULL, 54000, NULL, NULL, NULL, 54000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 4, '2019-05-13', 37000, NULL, NULL, NULL, NULL, 37000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 4, '2019-05-13', NULL, 207700, NULL, NULL, NULL, 207700, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 4, '2019-05-13', 42000, NULL, NULL, NULL, NULL, 42000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 4, '2019-05-13', 60000, NULL, NULL, NULL, NULL, 59500, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 4, '2019-05-13', 310000, NULL, NULL, NULL, NULL, 310000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 4, '2019-05-13', NULL, 1395000, NULL, NULL, NULL, 1395000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 4, '2019-05-13', NULL, 82000, NULL, NULL, NULL, 82000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 4, '2019-05-13', NULL, 400000, NULL, NULL, NULL, 400000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 4, '2019-05-13', 204000, NULL, NULL, NULL, NULL, 203000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 4, '2019-05-13', 53000, NULL, NULL, NULL, NULL, 53000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 4, '2019-05-13', 50000, NULL, NULL, NULL, NULL, 50000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 4, '2019-05-13', NULL, 71000, NULL, NULL, NULL, 71000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 4, '2019-05-13', NULL, 345000, NULL, NULL, NULL, 345000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 4, '2019-05-13', 260000, NULL, NULL, NULL, NULL, 258500, 1500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 4, '2019-05-13', NULL, 384000, NULL, NULL, NULL, 384000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 4, '2019-05-13', NULL, 104000, NULL, NULL, NULL, 104000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 4, '2019-05-13', NULL, 287500, NULL, NULL, NULL, 287500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 4, '2019-05-13', 80000, NULL, NULL, NULL, NULL, 79000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 4, '2019-05-13', 100000, NULL, NULL, NULL, NULL, 82000, 18000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 4, '2019-05-13', NULL, 870000, NULL, NULL, NULL, 870000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 4, '2019-05-13', NULL, 399200, NULL, NULL, NULL, 399200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 4, '2019-05-13', NULL, 1098500, NULL, NULL, NULL, 1098500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 4, '2019-05-13', 400000, NULL, NULL, NULL, NULL, 387500, 12500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 4, '2019-05-13', NULL, 466500, NULL, NULL, NULL, 466500, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 4, '2019-05-13', 410000, NULL, NULL, NULL, NULL, 408000, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 4, '2019-05-13', 150000, NULL, NULL, NULL, NULL, 145000, 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 4, '2019-05-13', NULL, 360000, NULL, NULL, NULL, 360000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 13, '2019-05-29', 800000, NULL, NULL, NULL, NULL, 600000, 200000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 14, '2019-05-30', 700000, NULL, NULL, NULL, NULL, 610700, 89300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 15, '2020-04-03', 20000000, NULL, NULL, NULL, NULL, 958500, 19041500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 15, '2020-05-06', 20000000, NULL, NULL, NULL, NULL, 215000, 19785000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 15, '2020-05-14', 20000000, NULL, NULL, NULL, NULL, 898500, 19101500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 15, '2020-05-15', 20000000, NULL, NULL, NULL, NULL, 420000, 19580000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 15, '2020-06-18', NULL, 459500, NULL, NULL, NULL, 459500, 19540500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 15, '2020-06-26', NULL, 289000, NULL, NULL, NULL, 289000, 311000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 15, '2020-06-26', 700000, NULL, NULL, NULL, NULL, 669500, 30500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 15, '2020-06-28', NULL, 79000, NULL, NULL, NULL, 79000, 19921000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 15, '2020-06-29', 210001, NULL, NULL, NULL, NULL, 210000, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tjuald`
--

DROP TABLE IF EXISTS `tjuald`;
CREATE TABLE `tjuald` (
  `IDJualD` int(11) NOT NULL,
  `IDJualH` int(11) NOT NULL,
  `IDItem` int(11) NOT NULL,
  `NamaItem` varchar(50) DEFAULT NULL,
  `Jumlah` double NOT NULL,
  `Harga` double NOT NULL,
  `DiscPersen` double NOT NULL,
  `DiscPersen2` double NOT NULL DEFAULT 0,
  `DiscPersen3` double NOT NULL DEFAULT 0,
  `Subtotal` double NOT NULL,
  `Aktif` enum('Ya','Tidak') DEFAULT 'Ya'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjuald`
--

INSERT INTO `tjuald` (`IDJualD`, `IDJualH`, `IDItem`, `NamaItem`, `Jumlah`, `Harga`, `DiscPersen`, `DiscPersen2`, `DiscPersen3`, `Subtotal`, `Aktif`) VALUES
(1, 1, 14, 'B.FANCY LOVE & CARE KICAU 360GR', 2, 215000, 0, 0, 0, 430000, 'Ya'),
(2, 1, 16, 'B.GOLD COIN ROYAL (ISI=20)', 1, 185000, 0, 0, 0, 185000, 'Ya'),
(3, 2, 14, 'B.FANCY LOVE & CARE KICAU 360GR', 1, 215000, 0, 0, 0, 215000, 'Ya'),
(4, 3, 1, 'S.COCK INDO MERAH (50)', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(5, 3, 2, 'B.BOTOL MINUM BESAR', 2, 67500, 0, 0, 0, 135000, 'Ya'),
(6, 4, 2, 'B.BOTOL MINUM BESAR', 1, 67500, 0, 0, 0, 67500, 'Ya'),
(7, 4, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(8, 5, 6830, 'S.LAKEN BILYARD HJU TOSCA', 1, 195000, 0, 0, 0, 195000, 'Ya'),
(9, 6, 16, 'B.GOLD COIN ROYAL (ISI=20)', 1, 185000, 0, 0, 0, 185000, 'Ya'),
(10, 6, 95, 'S.COVER GITAR PARASIT', 1, 40000, 0, 0, 0, 40000, 'Ya'),
(11, 7, 13, 'B.FANCY GOOD FOOD KECIL 250GR (1CRT=50PAK)', 1, 310000, 0, 0, 0, 310000, 'Ya'),
(12, 8, 29, 'B.SANGKAR PARKIT BB-39 BULAT KECIL (10)', 2, 65000, 0, 0, 0, 130000, 'Ya'),
(13, 8, 23, 'B.PUR BURUNG 521', 1, 250000, 0, 0, 0, 250000, 'Ya'),
(14, 9, 31, 'S.COCK INDO HTM DIAMOND (50)', 1, 72000, 0, 0, 0, 72000, 'Ya'),
(15, 9, 3, 'B.BOTOL MINUM KECIL', 1, 52500, 0, 0, 0, 52500, 'Ya'),
(16, 9, 2, 'B.BOTOL MINUM BESAR', 1, 67500, 0, 0, 0, 67500, 'Ya'),
(17, 10, 33, 'B.SANGKAR PERKUTUT MAHKOTA BIASA', 1, 280000, 0, 0, 0, 280000, 'Ya'),
(18, 11, 15, 'B.GELAS D (SETENGAH BULAT)', 2, 120000, 0, 0, 0, 240000, 'Ya'),
(19, 11, 34, 'S.BAD P/P DHS 1832', 2, 39500, 0, 0, 0, 79000, 'Ya'),
(20, 12, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(21, 12, 17, 'B.KROTO KRISTAL HARTONO HIJAU (20)', 1, 112500, 0, 0, 0, 112500, 'Ya'),
(22, 13, 2, 'B.BOTOL MINUM BESAR', 1, 67500, 0, 0, 0, 67500, 'Ya'),
(23, 13, 24, 'B.SANGKAR KOSAN ISI 3', 1, 235000, 0, 0, 0, 235000, 'Ya'),
(24, 14, 6785, 'S.REBANA KECIL KOTEK', 2, 21000, 0, 0, 0, 42000, 'Ya'),
(25, 15, 6830, 'S.LAKEN BILYARD HJU TOSCA', 1, 195000, 0, 0, 0, 195000, 'Ya'),
(26, 15, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(27, 16, 36, 'S.BAD P/P BUTERFLY L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(28, 16, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(29, 16, 3, 'B.BOTOL MINUM KECIL', 1, 52500, 0, 0, 0, 52500, 'Ya'),
(30, 17, 19, 'B.LARASATI', 1, 62500, 0, 0, 0, 62500, 'Ya'),
(31, 18, 33, 'B.SANGKAR PERKUTUT MAHKOTA BIASA', 1, 280000, 0, 0, 0, 280000, 'Ya'),
(32, 19, 20, 'B.MADURA KOONG (60)', 1, 475000, 0, 0, 0, 475000, 'Ya'),
(33, 20, 7, 'B.CANARY SEED (1KARUNG=20KG)', 1, 350000, 0, 0, 0, 350000, 'Ya'),
(34, 20, 36, 'S.BAD P/P BUTERFLY L/K', 2, 8500, 0, 0, 0, 17000, 'Ya'),
(35, 21, 23, 'B.PUR BURUNG 521', 1, 250000, 0, 0, 0, 250000, 'Ya'),
(36, 22, 18, 'B.KROTO KRISTAL HARTONO MERAH (50)', 1, 240000, 0, 0, 0, 240000, 'Ya'),
(37, 23, 10, 'B.CANTELAN KAWAT', 10, 2000, 0, 0, 0, 20000, 'Ya'),
(38, 23, 15, 'B.GELAS D (SETENGAH BULAT)', 1, 120000, 0, 0, 0, 120000, 'Ya'),
(39, 24, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(40, 24, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(41, 24, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(42, 24, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(43, 25, 31, 'S.COCK INDO HTM DIAMOND (50)', 1, 72000, 0, 0, 0, 72000, 'Ya'),
(44, 25, 6785, 'S.REBANA KECIL KOTEK', 1, 21000, 0, 0, 0, 21000, 'Ya'),
(45, 26, 19, 'B.LARASATI', 1, 62500, 0, 0, 0, 62500, 'Ya'),
(46, 26, 35, 'S.BAD P/P PRASIDA L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(47, 27, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(48, 27, 8, 'B.CANTELAN B', 1, 5500, 0, 0, 0, 5500, 'Ya'),
(49, 27, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(50, 28, 34, 'S.BAD P/P DHS 1832', 1, 39500, 0, 0, 0, 39500, 'Ya'),
(51, 28, 1, 'S.COCK INDO MERAH (50)', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(52, 29, 35, 'S.BAD P/P PRASIDA L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(53, 29, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(54, 29, 6785, 'S.REBANA KECIL KOTEK', 1, 21000, 0, 0, 0, 21000, 'Ya'),
(55, 30, 4, 'B.CANARY EBOD (20)', 1, 200000, 0, 0, 0, 200000, 'Ya'),
(56, 31, 21, 'B.MILET CAMPUR 30 KG', 1, 390000, 0, 0, 0, 390000, 'Ya'),
(57, 31, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(58, 32, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 1, 210000, 0, 0, 0, 210000, 'Ya'),
(59, 32, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(60, 33, 22, 'B.MILET CAMPUR 60 KG', 1, 780000, 0, 0, 0, 780000, 'Ya'),
(61, 33, 2, 'B.BOTOL MINUM BESAR', 1, 67500, 0, 0, 0, 67500, 'Ya'),
(62, 34, 14, 'B.FANCY LOVE & CARE KICAU 360GR', 1, 215000, 0, 0, 0, 215000, 'Ya'),
(63, 34, 12, 'B.FANCY GOOD FOOD BESAR 450GR (1CRT=20PAK)', 1, 225000, 0, 0, 0, 225000, 'Ya'),
(64, 35, 22, 'B.MILET CAMPUR 60 KG', 1, 780000, 0, 0, 0, 780000, 'Ya'),
(65, 36, 15, 'B.GELAS D (SETENGAH BULAT)', 2, 120000, 0, 0, 0, 240000, 'Ya'),
(66, 37, 19, 'B.LARASATI', 2, 62500, 0, 0, 0, 125000, 'Ya'),
(67, 38, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(68, 38, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(69, 39, 17, 'B.KROTO KRISTAL HARTONO HIJAU (20)', 1, 112500, 0, 0, 0, 112500, 'Ya'),
(70, 39, 34, 'S.BAD P/P DHS 1832', 1, 39500, 0, 0, 0, 39500, 'Ya'),
(71, 40, 26, 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', 1, 80000, 0, 0, 0, 80000, 'Ya'),
(72, 41, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(73, 41, 16, 'B.GOLD COIN ROYAL (ISI=20)', 1, 185000, 0, 0, 0, 185000, 'Ya'),
(74, 42, 6830, 'S.LAKEN BILYARD HJU TOSCA', 1, 195000, 0, 0, 0, 195000, 'Ya'),
(75, 42, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(76, 42, 12, 'B.FANCY GOOD FOOD BESAR 450GR (1CRT=20PAK)', 1, 225000, 0, 0, 0, 225000, 'Ya'),
(77, 43, 23, 'B.PUR BURUNG 521', 2, 250000, 0, 0, 0, 500000, 'Ya'),
(78, 44, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(79, 44, 6785, 'S.REBANA KECIL KOTEK', 1, 21000, 0, 0, 0, 21000, 'Ya'),
(80, 45, 7, 'B.CANARY SEED (1KARUNG=20KG)', 1, 350000, 0, 0, 0, 350000, 'Ya'),
(81, 46, 34, 'S.BAD P/P DHS 1832', 1, 39500, 0, 0, 0, 39500, 'Ya'),
(82, 46, 15, 'B.GELAS D (SETENGAH BULAT)', 1, 120000, 0, 0, 0, 120000, 'Ya'),
(83, 47, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(84, 47, 3, 'B.BOTOL MINUM KECIL', 1, 52500, 0, 0, 0, 52500, 'Ya'),
(85, 47, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(86, 48, 20, 'B.MADURA KOONG (60)', 1, 475000, 0, 0, 0, 475000, 'Ya'),
(87, 49, 33, 'B.SANGKAR PERKUTUT MAHKOTA BIASA', 1, 280000, 0, 0, 0, 280000, 'Ya'),
(88, 50, 26, 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', 1, 80000, 0, 0, 0, 80000, 'Ya'),
(89, 50, 35, 'S.BAD P/P PRASIDA L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(90, 51, 1, 'S.COCK INDO MERAH (50)', 2, 66700, 0, 0, 0, 133400, 'Ya'),
(91, 52, 32, 'B.SANGKAR PERKUTUT KERANG POLOS', 1, 230000, 0, 0, 0, 230000, 'Ya'),
(92, 53, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(93, 53, 1, 'S.COCK INDO MERAH (50)', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(94, 54, 18, 'B.KROTO KRISTAL HARTONO MERAH (50)', 1, 240000, 0, 0, 0, 240000, 'Ya'),
(95, 54, 3, 'B.BOTOL MINUM KECIL', 1, 52500, 0, 0, 0, 52500, 'Ya'),
(96, 55, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(97, 56, 8, 'B.CANTELAN B', 1, 5500, 0, 0, 0, 5500, 'Ya'),
(98, 56, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(99, 57, 6785, 'S.REBANA KECIL KOTEK', 1, 21000, 0, 0, 0, 21000, 'Ya'),
(100, 58, 95, 'S.COVER GITAR PARASIT', 1, 40000, 0, 0, 0, 40000, 'Ya'),
(101, 58, 3, 'B.BOTOL MINUM KECIL', 2, 52500, 0, 0, 0, 105000, 'Ya'),
(102, 59, 36, 'S.BAD P/P BUTERFLY L/K', 2, 8500, 0, 0, 0, 17000, 'Ya'),
(103, 59, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(104, 60, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(105, 60, 35, 'S.BAD P/P PRASIDA L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(106, 61, 2, 'B.BOTOL MINUM BESAR', 1, 67500, 0, 0, 0, 67500, 'Ya'),
(107, 62, 36, 'S.BAD P/P BUTERFLY L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(108, 62, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(109, 63, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 3, 18000, 0, 0, 0, 54000, 'Ya'),
(110, 64, 10, 'B.CANTELAN KAWAT', 6, 2000, 0, 0, 0, 12000, 'Ya'),
(111, 64, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(112, 65, 31, 'S.COCK INDO HTM DIAMOND (50)', 1, 72000, 0, 0, 0, 72000, 'Ya'),
(113, 65, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(114, 65, 1, 'S.COCK INDO MERAH (50)', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(115, 66, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(116, 66, 35, 'S.BAD P/P PRASIDA L/K', 2, 8500, 0, 0, 0, 17000, 'Ya'),
(117, 67, 35, 'S.BAD P/P PRASIDA L/K', 7, 8500, 0, 0, 0, 59500, 'Ya'),
(118, 68, 13, 'B.FANCY GOOD FOOD KECIL 250GR (1CRT=50PAK)', 1, 310000, 0, 0, 0, 310000, 'Ya'),
(119, 69, 21, 'B.MILET CAMPUR 30 KG', 1, 390000, 0, 0, 0, 390000, 'Ya'),
(120, 69, 22, 'B.MILET CAMPUR 60 KG', 1, 780000, 0, 0, 0, 780000, 'Ya'),
(121, 69, 12, 'B.FANCY GOOD FOOD BESAR 450GR (1CRT=20PAK)', 1, 225000, 0, 0, 0, 225000, 'Ya'),
(122, 70, 95, 'S.COVER GITAR PARASIT', 1, 40000, 0, 0, 0, 40000, 'Ya'),
(123, 70, 6785, 'S.REBANA KECIL KOTEK', 2, 21000, 0, 0, 0, 42000, 'Ya'),
(124, 71, 15, 'B.GELAS D (SETENGAH BULAT)', 2, 120000, 0, 0, 0, 240000, 'Ya'),
(125, 71, 26, 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', 2, 80000, 0, 0, 0, 160000, 'Ya'),
(126, 72, 16, 'B.GOLD COIN ROYAL (ISI=20)', 1, 185000, 0, 0, 0, 185000, 'Ya'),
(127, 72, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(128, 73, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 2, 18000, 0, 0, 0, 36000, 'Ya'),
(129, 73, 35, 'S.BAD P/P PRASIDA L/K', 2, 8500, 0, 0, 0, 17000, 'Ya'),
(130, 74, 95, 'S.COVER GITAR PARASIT', 1, 40000, 0, 0, 0, 40000, 'Ya'),
(131, 74, 10, 'B.CANTELAN KAWAT', 5, 2000, 0, 0, 0, 10000, 'Ya'),
(132, 75, 19, 'B.LARASATI', 1, 62500, 0, 0, 0, 62500, 'Ya'),
(133, 75, 35, 'S.BAD P/P PRASIDA L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(134, 76, 18, 'B.KROTO KRISTAL HARTONO MERAH (50)', 1, 240000, 0, 0, 0, 240000, 'Ya'),
(135, 76, 26, 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', 1, 80000, 0, 0, 0, 80000, 'Ya'),
(136, 76, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(137, 77, 23, 'B.PUR BURUNG 521', 1, 250000, 0, 0, 0, 250000, 'Ya'),
(138, 77, 36, 'S.BAD P/P BUTERFLY L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(139, 78, 33, 'B.SANGKAR PERKUTUT MAHKOTA BIASA', 1, 280000, 0, 0, 0, 280000, 'Ya'),
(140, 78, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(141, 78, 9, 'B.CANTELAN K', 1, 4000, 0, 0, 0, 4000, 'Ya'),
(142, 78, 8, 'B.CANTELAN B', 1, 5500, 0, 0, 0, 5500, 'Ya'),
(143, 78, 10, 'B.CANTELAN KAWAT', 1, 2000, 0, 0, 0, 2000, 'Ya'),
(144, 79, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(145, 79, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(146, 79, 36, 'S.BAD P/P BUTERFLY L/K', 2, 8500, 0, 0, 0, 17000, 'Ya'),
(147, 80, 6830, 'S.LAKEN BILYARD HJU TOSCA', 1, 195000, 0, 0, 0, 195000, 'Ya'),
(148, 80, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(149, 81, 10, 'B.CANTELAN KAWAT', 2, 2000, 0, 0, 0, 4000, 'Ya'),
(150, 81, 5, 'B.CANARY EXCLUSIVE (CEDE)', 3, 25000, 0, 0, 0, 75000, 'Ya'),
(151, 82, 6785, 'S.REBANA KECIL KOTEK', 2, 21000, 0, 0, 0, 42000, 'Ya'),
(152, 82, 95, 'S.COVER GITAR PARASIT', 1, 40000, 0, 0, 0, 40000, 'Ya'),
(153, 83, 20, 'B.MADURA KOONG (60)', 1, 475000, 0, 0, 0, 475000, 'Ya'),
(154, 83, 6830, 'S.LAKEN BILYARD HJU TOSCA', 1, 195000, 0, 0, 0, 195000, 'Ya'),
(155, 83, 4, 'B.CANARY EBOD (20)', 1, 200000, 0, 0, 0, 200000, 'Ya'),
(156, 84, 33, 'B.SANGKAR PERKUTUT MAHKOTA BIASA', 1, 280000, 0, 0, 0, 280000, 'Ya'),
(157, 84, 1, 'S.COCK INDO MERAH (50)', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(158, 84, 3, 'B.BOTOL MINUM KECIL', 1, 52500, 0, 0, 0, 52500, 'Ya'),
(159, 85, 13, 'B.FANCY GOOD FOOD KECIL 250GR (1CRT=50PAK)', 1, 310000, 0, 0, 0, 310000, 'Ya'),
(160, 85, 22, 'B.MILET CAMPUR 60 KG', 1, 780000, 0, 0, 0, 780000, 'Ya'),
(161, 85, 36, 'S.BAD P/P BUTERFLY L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(162, 86, 19, 'B.LARASATI', 1, 62500, 0, 0, 0, 62500, 'Ya'),
(163, 86, 27, 'B.SANGKAR PARKIT BB-35 BULAT PENDEK (10)', 1, 90000, 0, 0, 0, 90000, 'Ya'),
(164, 86, 24, 'B.SANGKAR KOSAN ISI 3', 1, 235000, 0, 0, 0, 235000, 'Ya'),
(165, 87, 14, 'B.FANCY LOVE & CARE KICAU 360GR', 1, 215000, 0, 0, 0, 215000, 'Ya'),
(166, 87, 4, 'B.CANARY EBOD (20)', 1, 200000, 0, 0, 0, 200000, 'Ya'),
(167, 87, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(168, 87, 5, 'B.CANARY EXCLUSIVE (CEDE)', 1, 25000, 0, 0, 0, 25000, 'Ya'),
(169, 87, 36, 'S.BAD P/P BUTERFLY L/K', 1, 8500, 0, 0, 0, 8500, 'Ya'),
(170, 88, 21, 'B.MILET CAMPUR 30 KG', 1, 390000, 0, 0, 0, 390000, 'Ya'),
(171, 88, 11, 'B.EGG FOOD CD SUPER CANARY 6\'S', 1, 18000, 0, 0, 0, 18000, 'Ya'),
(172, 89, 26, 'B.SANGKAR PARKIT 802 KOTAK KECIL (12)', 1, 80000, 0, 0, 0, 80000, 'Ya'),
(173, 89, 29, 'B.SANGKAR PARKIT BB-39 BULAT KECIL (10)', 1, 65000, 0, 0, 0, 65000, 'Ya'),
(174, 90, 30, 'B.SANGKAR PARKIT BB-41 BULAT BESAR (6)', 1, 155000, 0, 0, 0, 155000, 'Ya'),
(175, 90, 17, 'B.KROTO KRISTAL HARTONO HIJAU (20)', 1, 112500, 0, 0, 0, 112500, 'Ya'),
(176, 90, 28, 'B.SANGKAR PARKIT BB-38 BULAT PANJANG (10)', 1, 92500, 0, 0, 0, 92500, 'Ya'),
(177, 91, 6831, 'Lagu Cover', 5, 120000, 0, 0, 0, 600000, 'Ya'),
(178, 92, 6894, 'MAKANAN', 3, 66700, 0, 0, 0, 200100, 'Tidak'),
(179, 92, 6, 'S.COCK INDO HITAM (50)', 1, 69000, 0, 0, 0, 69000, 'Ya'),
(180, 92, 20, 'B.MADURA KOONG (60)', 1, 475000, 0, 0, 0, 475000, 'Ya'),
(181, 92, 6894, 'MAKANAN', 1, 66700, 0, 0, 0, 66700, 'Ya'),
(182, 93, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 4, 210000, 0, 0, 0, 840000, 'Ya'),
(183, 93, 34, 'S.BAD P/P DHS 1832', 3, 39500, 0, 0, 0, 118500, 'Ya'),
(184, 94, 14, 'B.FANCY LOVE & CARE KICAU 360GR', 1, 215000, 0, 0, 0, 215000, 'Ya'),
(185, 95, 34, 'S.BAD P/P DHS 1832', 3, 39500, 0, 0, 0, 118500, 'Ya'),
(186, 95, 21, 'B.MILET CAMPUR 30 KG', 2, 390000, 0, 0, 0, 780000, 'Ya'),
(187, 96, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 2, 210000, 0, 0, 0, 420000, 'Ya'),
(188, 97, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 2, 210000, 0, 0, 0, 420000, 'Ya'),
(189, 97, 34, 'S.BAD P/P DHS 1832', 1, 39500, 0, 0, 0, 39500, 'Ya'),
(190, 98, 34, 'S.BAD P/P DHS 1832', 2, 39500, 0, 0, 0, 79000, 'Ya'),
(191, 98, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 1, 210000, 0, 0, 0, 210000, 'Ya'),
(192, 99, 34, 'S.BAD P/P DHS 1832', 1, 39500, 0, 0, 0, 39500, 'Ya'),
(193, 99, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 3, 210000, 0, 0, 0, 630000, 'Ya'),
(194, 100, 34, 'S.BAD P/P DHS 1832', 2, 39500, 0, 0, 0, 79000, 'Ya'),
(195, 101, 25, 'B.SANGKAR KOSAN ISI 3 KECIL', 1, 210000, 0, 0, 0, 210000, 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `tjualh`
--

DROP TABLE IF EXISTS `tjualh`;
CREATE TABLE `tjualh` (
  `IDJualH` int(11) NOT NULL,
  `IDKasir` int(11) NOT NULL,
  `Kode` varchar(20) NOT NULL,
  `Tanggal` date NOT NULL,
  `IDPeriode` int(11) DEFAULT NULL,
  `TanggalJatuhTempo` date DEFAULT NULL,
  `IDCustomer` int(11) DEFAULT NULL,
  `IDWarehouse` int(11) DEFAULT NULL,
  `IDPegawai` int(11) DEFAULT NULL,
  `Total` double NOT NULL,
  `JenisPembayaran` enum('Tunai','Kartu','','') NOT NULL,
  `Aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `Lunas` enum('Ya','Tidak') NOT NULL DEFAULT 'Tidak',
  `Keterangan` varchar(255) DEFAULT NULL,
  `InsertUser` varchar(16) DEFAULT NULL,
  `InsertTime` datetime DEFAULT NULL,
  `UpdateUser` varchar(16) DEFAULT NULL,
  `UpdateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjualh`
--

INSERT INTO `tjualh` (`IDJualH`, `IDKasir`, `Kode`, `Tanggal`, `IDPeriode`, `TanggalJatuhTempo`, `IDCustomer`, `IDWarehouse`, `IDPegawai`, `Total`, `JenisPembayaran`, `Aktif`, `Lunas`, `Keterangan`, `InsertUser`, `InsertTime`, `UpdateUser`, `UpdateTime`) VALUES
(1, 7, '1110001', '2019-04-01', NULL, NULL, NULL, NULL, NULL, 615000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(2, 7, '1110002', '2019-04-01', NULL, NULL, NULL, NULL, NULL, 215000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(3, 4, '1110003', '2019-04-02', NULL, NULL, NULL, NULL, NULL, 201700, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(4, 4, '1110004', '2019-04-04', NULL, NULL, NULL, NULL, NULL, 69500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(5, 4, '1110005', '2019-04-04', NULL, NULL, NULL, NULL, NULL, 195000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(6, 4, '1110006', '2019-04-05', NULL, NULL, NULL, NULL, NULL, 225000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(7, 4, '1110007', '2019-04-06', NULL, NULL, NULL, NULL, NULL, 310000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(8, 4, '1110008', '2019-04-08', NULL, NULL, NULL, NULL, NULL, 380000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(9, 4, '1110009', '2019-04-08', NULL, NULL, NULL, NULL, NULL, 192000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(10, 4, '1110010', '2019-04-09', NULL, NULL, NULL, NULL, NULL, 280000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(11, 4, '1110011', '2019-04-10', NULL, NULL, NULL, NULL, NULL, 319000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(12, 4, '1110012', '2019-04-11', NULL, NULL, NULL, NULL, NULL, 205000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(13, 4, '1110013', '2019-04-12', NULL, NULL, NULL, NULL, NULL, 302500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(14, 4, '1110014', '2019-04-13', NULL, NULL, NULL, NULL, NULL, 42000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(15, 4, '1110015', '2019-04-15', NULL, NULL, NULL, NULL, NULL, 220000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(16, 4, '1110016', '2019-04-16', NULL, NULL, NULL, NULL, NULL, 79000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(17, 4, '1110017', '2019-04-17', NULL, NULL, NULL, NULL, NULL, 62500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(18, 4, '1110018', '2019-04-18', NULL, NULL, NULL, NULL, NULL, 280000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(19, 4, '1110019', '2019-04-19', NULL, NULL, NULL, NULL, NULL, 475000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(20, 4, '1110020', '2019-04-20', NULL, NULL, NULL, NULL, NULL, 367000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(21, 4, '1110021', '2019-04-22', NULL, NULL, NULL, NULL, NULL, 250000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(22, 4, '1110022', '2019-04-23', NULL, NULL, NULL, NULL, NULL, 240000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(23, 4, '1110023', '2019-04-24', NULL, NULL, NULL, NULL, NULL, 140000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(24, 4, '1110024', '2019-04-25', NULL, NULL, NULL, NULL, NULL, 49000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(25, 4, '1110025', '2019-04-26', NULL, NULL, NULL, NULL, NULL, 93000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(26, 4, '1110026', '2019-04-27', NULL, NULL, NULL, NULL, NULL, 71000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(27, 4, '1110027', '2019-04-27', NULL, NULL, NULL, NULL, NULL, 100000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(28, 4, '1110028', '2019-04-29', NULL, NULL, NULL, NULL, NULL, 106200, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(29, 4, '1110029', '2019-04-30', NULL, NULL, NULL, NULL, NULL, 33500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(30, 4, '1110030', '2019-04-30', NULL, NULL, NULL, NULL, NULL, 200000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(31, 4, '1110031', '2019-05-02', NULL, NULL, NULL, NULL, NULL, 408000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(32, 4, '1110032', '2019-05-04', NULL, NULL, NULL, NULL, NULL, 228000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(33, 4, '1110033', '2019-05-04', NULL, NULL, NULL, NULL, NULL, 847500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(34, 4, '1110034', '2019-05-06', NULL, NULL, NULL, NULL, NULL, 440000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(35, 4, '1110035', '2019-05-07', NULL, NULL, NULL, NULL, NULL, 780000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(36, 4, '1110036', '2019-05-07', NULL, NULL, NULL, NULL, NULL, 240000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(37, 4, '1110037', '2019-05-08', NULL, NULL, NULL, NULL, NULL, 125000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(38, 4, '1110038', '2019-05-09', NULL, NULL, NULL, NULL, NULL, 71000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(39, 4, '1110039', '2019-05-10', NULL, NULL, NULL, NULL, NULL, 152000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(40, 4, '1110040', '2019-05-11', NULL, NULL, NULL, NULL, NULL, 80000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(41, 4, '1110041', '2019-05-13', NULL, NULL, NULL, NULL, NULL, 189000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(42, 4, '1110042', '2019-05-13', NULL, NULL, NULL, NULL, NULL, 438000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(43, 4, '1110043', '2019-05-14', NULL, NULL, NULL, NULL, NULL, 500000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(44, 4, '1110044', '2019-05-15', NULL, NULL, NULL, NULL, NULL, 113500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(45, 4, '1110045', '2019-05-17', NULL, NULL, NULL, NULL, NULL, 350000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(46, 4, '1110046', '2019-05-18', NULL, NULL, NULL, NULL, NULL, 159500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(47, 4, '1110047', '2019-05-20', NULL, NULL, NULL, NULL, NULL, 125500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(48, 4, '1110048', '2019-05-21', NULL, NULL, NULL, NULL, NULL, 475000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(49, 4, '1110049', '2019-05-22', NULL, NULL, NULL, NULL, NULL, 280000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(50, 4, '1110050', '2019-05-22', NULL, NULL, NULL, NULL, NULL, 88500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(51, 4, '1110051', '2019-05-23', NULL, NULL, NULL, NULL, NULL, 133400, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(52, 4, '1110052', '2019-05-24', NULL, NULL, NULL, NULL, NULL, 230000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(53, 4, '1110053', '2019-05-25', NULL, NULL, NULL, NULL, NULL, 135700, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(54, 4, '1110054', '2019-05-25', NULL, NULL, NULL, NULL, NULL, 292500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(55, 4, '1110055', '2019-05-27', NULL, NULL, NULL, NULL, NULL, 4000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(56, 4, '1110056', '2019-05-28', NULL, NULL, NULL, NULL, NULL, 7500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(57, 4, '1110057', '2019-05-28', NULL, NULL, NULL, NULL, NULL, 21000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(58, 4, '1110058', '2019-05-30', NULL, NULL, NULL, NULL, NULL, 145000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(59, 4, '1110059', '2019-05-30', NULL, NULL, NULL, NULL, NULL, 35000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(60, 4, '1110060', '2019-05-31', NULL, NULL, NULL, NULL, NULL, 10500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(61, 4, '1110061', '2019-06-03', NULL, NULL, NULL, NULL, NULL, 67500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(62, 4, '1110062', '2019-06-03', NULL, NULL, NULL, NULL, NULL, 33500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(63, 4, '1110063', '2019-06-04', NULL, NULL, NULL, NULL, NULL, 54000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(64, 4, '1110064', '2019-06-04', NULL, NULL, NULL, NULL, NULL, 37000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(65, 4, '1110065', '2019-06-04', NULL, NULL, NULL, NULL, NULL, 207700, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(66, 4, '1110066', '2019-06-06', NULL, NULL, NULL, NULL, NULL, 42000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(67, 4, '1110067', '2019-06-07', NULL, NULL, NULL, NULL, NULL, 59500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(68, 4, '1110068', '2019-06-07', NULL, NULL, NULL, NULL, NULL, 310000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(69, 4, '1110069', '2019-06-08', NULL, NULL, NULL, NULL, NULL, 1395000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(70, 4, '1110070', '2019-06-08', NULL, NULL, NULL, NULL, NULL, 82000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(71, 4, '1110071', '2019-06-08', NULL, NULL, NULL, NULL, NULL, 400000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(72, 4, '1110072', '2019-06-10', NULL, NULL, NULL, NULL, NULL, 203000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(73, 4, '1110073', '2019-06-11', NULL, NULL, NULL, NULL, NULL, 53000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(74, 4, '1110074', '2019-06-12', NULL, NULL, NULL, NULL, NULL, 50000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(75, 4, '1110075', '2019-06-12', NULL, NULL, NULL, NULL, NULL, 71000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(76, 4, '1110076', '2019-06-13', NULL, NULL, NULL, NULL, NULL, 345000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(77, 4, '1110077', '2019-06-13', NULL, NULL, NULL, NULL, NULL, 258500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(78, 4, '1110078', '2019-06-15', NULL, NULL, NULL, NULL, NULL, 384000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(79, 4, '1110079', '2019-06-18', NULL, NULL, NULL, NULL, NULL, 104000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(80, 4, '1110080', '2019-06-18', NULL, NULL, NULL, NULL, NULL, 287500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(81, 4, '1110081', '2019-06-19', NULL, NULL, NULL, NULL, NULL, 79000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(82, 4, '1110082', '2019-06-20', NULL, NULL, NULL, NULL, NULL, 82000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(83, 4, '1110083', '2019-06-21', NULL, NULL, NULL, NULL, NULL, 870000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(84, 4, '1110084', '2019-06-22', NULL, NULL, NULL, NULL, NULL, 399200, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(85, 4, '1110085', '2019-06-25', NULL, NULL, NULL, NULL, NULL, 1098500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(86, 4, '1110086', '2019-06-26', NULL, NULL, NULL, NULL, NULL, 387500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(87, 4, '1110087', '2019-06-27', NULL, NULL, NULL, NULL, NULL, 466500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(88, 4, '1110088', '2019-06-28', NULL, NULL, NULL, NULL, NULL, 408000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(89, 4, '1110089', '2019-06-29', NULL, NULL, NULL, NULL, NULL, 145000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(90, 4, '1110090', '2019-06-30', NULL, NULL, NULL, NULL, NULL, 360000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(91, 13, '1110091', '2019-05-29', NULL, NULL, NULL, NULL, NULL, 600000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(92, 14, '1110092', '2019-05-30', NULL, NULL, NULL, NULL, NULL, 610700, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(93, 15, '1110093', '2020-04-03', NULL, NULL, NULL, NULL, NULL, 958500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(94, 15, '1110094', '2020-05-06', NULL, NULL, NULL, NULL, NULL, 215000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(95, 15, '1110095', '2020-05-14', NULL, NULL, NULL, NULL, NULL, 898500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(96, 15, '1110096', '2020-05-15', NULL, NULL, NULL, NULL, NULL, 420000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(97, 15, '1110097', '2020-06-18', NULL, NULL, NULL, NULL, NULL, 459500, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(98, 15, '1110098', '2020-06-26', NULL, NULL, NULL, NULL, NULL, 289000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(99, 15, '1110099', '2020-06-26', NULL, NULL, NULL, NULL, NULL, 669500, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(100, 15, '1110100', '2020-06-28', NULL, NULL, NULL, NULL, NULL, 79000, 'Kartu', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL),
(101, 15, '1110101', '2020-06-29', NULL, NULL, NULL, NULL, NULL, 210000, 'Tunai', 'Ya', 'Ya', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tjurnalitem`
--

DROP TABLE IF EXISTS `tjurnalitem`;
CREATE TABLE `tjurnalitem` (
  `IDJurnalItem` int(11) NOT NULL,
  `IDItem` int(11) NOT NULL,
  `Tanggal` date NOT NULL DEFAULT '0000-00-00',
  `IDWarehouse` int(11) DEFAULT NULL,
  `Jenis` enum('Stok Awal','Mutasi Asal','Mutasi Tujuan','Mutasi Jenis','Opname','Pembelian','Retur Pembelian','Penjualan','Retur Penjualan','Produksi','Saldo','Promosi') DEFAULT NULL,
  `Jumlah` double NOT NULL,
  `Nominal` double DEFAULT NULL,
  `IDBeliD` int(11) UNSIGNED DEFAULT NULL,
  `IDBeliTerimaD` int(11) UNSIGNED DEFAULT NULL,
  `IDBeliReturD` int(11) UNSIGNED DEFAULT NULL,
  `IDJualD` int(11) DEFAULT NULL,
  `IDJualDOD` int(11) DEFAULT NULL,
  `IDJualReturD` int(11) DEFAULT NULL,
  `Aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `PostUser` varchar(16) DEFAULT NULL,
  `PostTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tjurnalitem`
--

INSERT INTO `tjurnalitem` (`IDJurnalItem`, `IDItem`, `Tanggal`, `IDWarehouse`, `Jenis`, `Jumlah`, `Nominal`, `IDBeliD`, `IDBeliTerimaD`, `IDBeliReturD`, `IDJualD`, `IDJualDOD`, `IDJualReturD`, `Aktif`, `PostUser`, `PostTime`) VALUES
(1, 14, '2019-04-22', NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'Ya', NULL, NULL),
(2, 16, '2019-04-22', NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'Ya', NULL, NULL),
(3, 14, '2019-04-22', NULL, NULL, 1, NULL, NULL, NULL, NULL, 3, NULL, NULL, 'Ya', NULL, NULL),
(4, 1, '2019-04-22', NULL, NULL, 1, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'Ya', NULL, NULL),
(5, 2, '2019-04-22', NULL, NULL, 2, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'Ya', NULL, NULL),
(6, 2, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 6, NULL, NULL, 'Ya', NULL, NULL),
(7, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 7, NULL, NULL, 'Ya', NULL, NULL),
(8, 6830, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 8, NULL, NULL, 'Ya', NULL, NULL),
(9, 16, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 9, NULL, NULL, 'Ya', NULL, NULL),
(10, 95, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 10, NULL, NULL, 'Ya', NULL, NULL),
(11, 13, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 11, NULL, NULL, 'Ya', NULL, NULL),
(12, 29, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 12, NULL, NULL, 'Ya', NULL, NULL),
(13, 23, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 13, NULL, NULL, 'Ya', NULL, NULL),
(14, 31, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 14, NULL, NULL, 'Ya', NULL, NULL),
(15, 3, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 15, NULL, NULL, 'Ya', NULL, NULL),
(16, 2, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 16, NULL, NULL, 'Ya', NULL, NULL),
(17, 33, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 17, NULL, NULL, 'Ya', NULL, NULL),
(18, 15, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 18, NULL, NULL, 'Ya', NULL, NULL),
(19, 34, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 19, NULL, NULL, 'Ya', NULL, NULL),
(20, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 20, NULL, NULL, 'Ya', NULL, NULL),
(21, 17, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 21, NULL, NULL, 'Ya', NULL, NULL),
(22, 2, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 22, NULL, NULL, 'Ya', NULL, NULL),
(23, 24, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 23, NULL, NULL, 'Ya', NULL, NULL),
(24, 6785, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 24, NULL, NULL, 'Ya', NULL, NULL),
(25, 6830, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 25, NULL, NULL, 'Ya', NULL, NULL),
(26, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 26, NULL, NULL, 'Ya', NULL, NULL),
(27, 36, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 27, NULL, NULL, 'Ya', NULL, NULL),
(28, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 28, NULL, NULL, 'Ya', NULL, NULL),
(29, 3, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 29, NULL, NULL, 'Ya', NULL, NULL),
(30, 19, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 30, NULL, NULL, 'Ya', NULL, NULL),
(31, 33, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 31, NULL, NULL, 'Ya', NULL, NULL),
(32, 20, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 32, NULL, NULL, 'Ya', NULL, NULL),
(33, 7, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 33, NULL, NULL, 'Ya', NULL, NULL),
(34, 36, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 34, NULL, NULL, 'Ya', NULL, NULL),
(35, 23, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 35, NULL, NULL, 'Ya', NULL, NULL),
(36, 18, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 36, NULL, NULL, 'Ya', NULL, NULL),
(37, 10, '2019-05-13', NULL, NULL, 10, NULL, NULL, NULL, NULL, 37, NULL, NULL, 'Ya', NULL, NULL),
(38, 15, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 38, NULL, NULL, 'Ya', NULL, NULL),
(39, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 39, NULL, NULL, 'Ya', NULL, NULL),
(40, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 40, NULL, NULL, 'Ya', NULL, NULL),
(41, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 41, NULL, NULL, 'Ya', NULL, NULL),
(42, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 42, NULL, NULL, 'Ya', NULL, NULL),
(43, 31, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 43, NULL, NULL, 'Ya', NULL, NULL),
(44, 6785, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 44, NULL, NULL, 'Ya', NULL, NULL),
(45, 19, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 45, NULL, NULL, 'Ya', NULL, NULL),
(46, 35, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 46, NULL, NULL, 'Ya', NULL, NULL),
(47, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 47, NULL, NULL, 'Ya', NULL, NULL),
(48, 8, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 48, NULL, NULL, 'Ya', NULL, NULL),
(49, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 49, NULL, NULL, 'Ya', NULL, NULL),
(50, 34, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 50, NULL, NULL, 'Ya', NULL, NULL),
(51, 1, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 51, NULL, NULL, 'Ya', NULL, NULL),
(52, 35, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 52, NULL, NULL, 'Ya', NULL, NULL),
(53, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 53, NULL, NULL, 'Ya', NULL, NULL),
(54, 6785, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 54, NULL, NULL, 'Ya', NULL, NULL),
(55, 4, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 55, NULL, NULL, 'Ya', NULL, NULL),
(56, 21, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 56, NULL, NULL, 'Ya', NULL, NULL),
(57, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 57, NULL, NULL, 'Ya', NULL, NULL),
(58, 25, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 58, NULL, NULL, 'Ya', NULL, NULL),
(59, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 59, NULL, NULL, 'Ya', NULL, NULL),
(60, 22, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 60, NULL, NULL, 'Ya', NULL, NULL),
(61, 2, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 61, NULL, NULL, 'Ya', NULL, NULL),
(62, 14, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 62, NULL, NULL, 'Ya', NULL, NULL),
(63, 12, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 63, NULL, NULL, 'Ya', NULL, NULL),
(64, 22, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 64, NULL, NULL, 'Ya', NULL, NULL),
(65, 15, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 65, NULL, NULL, 'Ya', NULL, NULL),
(66, 19, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 66, NULL, NULL, 'Ya', NULL, NULL),
(67, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 67, NULL, NULL, 'Ya', NULL, NULL),
(68, 6, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 68, NULL, NULL, 'Ya', NULL, NULL),
(69, 17, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 69, NULL, NULL, 'Ya', NULL, NULL),
(70, 34, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 70, NULL, NULL, 'Ya', NULL, NULL),
(71, 26, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 71, NULL, NULL, 'Ya', NULL, NULL),
(72, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 72, NULL, NULL, 'Ya', NULL, NULL),
(73, 16, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 73, NULL, NULL, 'Ya', NULL, NULL),
(74, 6830, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 74, NULL, NULL, 'Ya', NULL, NULL),
(75, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 75, NULL, NULL, 'Ya', NULL, NULL),
(76, 12, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 76, NULL, NULL, 'Ya', NULL, NULL),
(77, 23, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 77, NULL, NULL, 'Ya', NULL, NULL),
(78, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 78, NULL, NULL, 'Ya', NULL, NULL),
(79, 6785, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 79, NULL, NULL, 'Ya', NULL, NULL),
(80, 7, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 80, NULL, NULL, 'Ya', NULL, NULL),
(81, 34, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 81, NULL, NULL, 'Ya', NULL, NULL),
(82, 15, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 82, NULL, NULL, 'Ya', NULL, NULL),
(83, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 83, NULL, NULL, 'Ya', NULL, NULL),
(84, 3, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 84, NULL, NULL, 'Ya', NULL, NULL),
(85, 6, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 85, NULL, NULL, 'Ya', NULL, NULL),
(86, 20, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 86, NULL, NULL, 'Ya', NULL, NULL),
(87, 33, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 87, NULL, NULL, 'Ya', NULL, NULL),
(88, 26, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 88, NULL, NULL, 'Ya', NULL, NULL),
(89, 35, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 89, NULL, NULL, 'Ya', NULL, NULL),
(90, 1, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 90, NULL, NULL, 'Ya', NULL, NULL),
(91, 32, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 91, NULL, NULL, 'Ya', NULL, NULL),
(92, 6, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 92, NULL, NULL, 'Ya', NULL, NULL),
(93, 1, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 93, NULL, NULL, 'Ya', NULL, NULL),
(94, 18, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 94, NULL, NULL, 'Ya', NULL, NULL),
(95, 3, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 95, NULL, NULL, 'Ya', NULL, NULL),
(96, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 96, NULL, NULL, 'Ya', NULL, NULL),
(97, 8, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 97, NULL, NULL, 'Ya', NULL, NULL),
(98, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 98, NULL, NULL, 'Ya', NULL, NULL),
(99, 6785, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 99, NULL, NULL, 'Ya', NULL, NULL),
(100, 95, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100, NULL, NULL, 'Ya', NULL, NULL),
(101, 3, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 101, NULL, NULL, 'Ya', NULL, NULL),
(102, 36, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 102, NULL, NULL, 'Ya', NULL, NULL),
(103, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 103, NULL, NULL, 'Ya', NULL, NULL),
(104, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 104, NULL, NULL, 'Ya', NULL, NULL),
(105, 35, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 105, NULL, NULL, 'Ya', NULL, NULL),
(106, 2, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 106, NULL, NULL, 'Ya', NULL, NULL),
(107, 36, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 107, NULL, NULL, 'Ya', NULL, NULL),
(108, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 108, NULL, NULL, 'Ya', NULL, NULL),
(109, 11, '2019-05-13', NULL, NULL, 3, NULL, NULL, NULL, NULL, 109, NULL, NULL, 'Ya', NULL, NULL),
(110, 10, '2019-05-13', NULL, NULL, 6, NULL, NULL, NULL, NULL, 110, NULL, NULL, 'Ya', NULL, NULL),
(111, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 111, NULL, NULL, 'Ya', NULL, NULL),
(112, 31, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 112, NULL, NULL, 'Ya', NULL, NULL),
(113, 6, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 113, NULL, NULL, 'Ya', NULL, NULL),
(114, 1, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 114, NULL, NULL, 'Ya', NULL, NULL),
(115, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 115, NULL, NULL, 'Ya', NULL, NULL),
(116, 35, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 116, NULL, NULL, 'Ya', NULL, NULL),
(117, 35, '2019-05-13', NULL, NULL, 7, NULL, NULL, NULL, NULL, 117, NULL, NULL, 'Ya', NULL, NULL),
(118, 13, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 118, NULL, NULL, 'Ya', NULL, NULL),
(119, 21, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 119, NULL, NULL, 'Ya', NULL, NULL),
(120, 22, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 120, NULL, NULL, 'Ya', NULL, NULL),
(121, 12, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 121, NULL, NULL, 'Ya', NULL, NULL),
(122, 95, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 122, NULL, NULL, 'Ya', NULL, NULL),
(123, 6785, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 123, NULL, NULL, 'Ya', NULL, NULL),
(124, 15, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 124, NULL, NULL, 'Ya', NULL, NULL),
(125, 26, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 125, NULL, NULL, 'Ya', NULL, NULL),
(126, 16, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 126, NULL, NULL, 'Ya', NULL, NULL),
(127, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 127, NULL, NULL, 'Ya', NULL, NULL),
(128, 11, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 128, NULL, NULL, 'Ya', NULL, NULL),
(129, 35, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 129, NULL, NULL, 'Ya', NULL, NULL),
(130, 95, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 130, NULL, NULL, 'Ya', NULL, NULL),
(131, 10, '2019-05-13', NULL, NULL, 5, NULL, NULL, NULL, NULL, 131, NULL, NULL, 'Ya', NULL, NULL),
(132, 19, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 132, NULL, NULL, 'Ya', NULL, NULL),
(133, 35, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 133, NULL, NULL, 'Ya', NULL, NULL),
(134, 18, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 134, NULL, NULL, 'Ya', NULL, NULL),
(135, 26, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 135, NULL, NULL, 'Ya', NULL, NULL),
(136, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 136, NULL, NULL, 'Ya', NULL, NULL),
(137, 23, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 137, NULL, NULL, 'Ya', NULL, NULL),
(138, 36, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 138, NULL, NULL, 'Ya', NULL, NULL),
(139, 33, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 139, NULL, NULL, 'Ya', NULL, NULL),
(140, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 140, NULL, NULL, 'Ya', NULL, NULL),
(141, 9, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 141, NULL, NULL, 'Ya', NULL, NULL),
(142, 8, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 142, NULL, NULL, 'Ya', NULL, NULL),
(143, 10, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 143, NULL, NULL, 'Ya', NULL, NULL),
(144, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 144, NULL, NULL, 'Ya', NULL, NULL),
(145, 6, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 145, NULL, NULL, 'Ya', NULL, NULL),
(146, 36, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 146, NULL, NULL, 'Ya', NULL, NULL),
(147, 6830, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 147, NULL, NULL, 'Ya', NULL, NULL),
(148, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 148, NULL, NULL, 'Ya', NULL, NULL),
(149, 10, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 149, NULL, NULL, 'Ya', NULL, NULL),
(150, 5, '2019-05-13', NULL, NULL, 3, NULL, NULL, NULL, NULL, 150, NULL, NULL, 'Ya', NULL, NULL),
(151, 6785, '2019-05-13', NULL, NULL, 2, NULL, NULL, NULL, NULL, 151, NULL, NULL, 'Ya', NULL, NULL),
(152, 95, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 152, NULL, NULL, 'Ya', NULL, NULL),
(153, 20, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 153, NULL, NULL, 'Ya', NULL, NULL),
(154, 6830, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 154, NULL, NULL, 'Ya', NULL, NULL),
(155, 4, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 155, NULL, NULL, 'Ya', NULL, NULL),
(156, 33, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 156, NULL, NULL, 'Ya', NULL, NULL),
(157, 1, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 157, NULL, NULL, 'Ya', NULL, NULL),
(158, 3, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 158, NULL, NULL, 'Ya', NULL, NULL),
(159, 13, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 159, NULL, NULL, 'Ya', NULL, NULL),
(160, 22, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 160, NULL, NULL, 'Ya', NULL, NULL),
(161, 36, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 161, NULL, NULL, 'Ya', NULL, NULL),
(162, 19, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 162, NULL, NULL, 'Ya', NULL, NULL),
(163, 27, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 163, NULL, NULL, 'Ya', NULL, NULL),
(164, 24, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 164, NULL, NULL, 'Ya', NULL, NULL),
(165, 14, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 165, NULL, NULL, 'Ya', NULL, NULL),
(166, 4, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 166, NULL, NULL, 'Ya', NULL, NULL),
(167, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 167, NULL, NULL, 'Ya', NULL, NULL),
(168, 5, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 168, NULL, NULL, 'Ya', NULL, NULL),
(169, 36, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 169, NULL, NULL, 'Ya', NULL, NULL),
(170, 21, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 170, NULL, NULL, 'Ya', NULL, NULL),
(171, 11, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 171, NULL, NULL, 'Ya', NULL, NULL),
(172, 26, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 172, NULL, NULL, 'Ya', NULL, NULL),
(173, 29, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 173, NULL, NULL, 'Ya', NULL, NULL),
(174, 30, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 174, NULL, NULL, 'Ya', NULL, NULL),
(175, 17, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 175, NULL, NULL, 'Ya', NULL, NULL),
(176, 28, '2019-05-13', NULL, NULL, 1, NULL, NULL, NULL, NULL, 176, NULL, NULL, 'Ya', NULL, NULL),
(177, 6831, '2019-05-29', NULL, NULL, 5, NULL, NULL, NULL, NULL, 177, NULL, NULL, 'Ya', NULL, NULL),
(178, 6894, '2019-05-30', NULL, NULL, 3, NULL, NULL, NULL, NULL, 178, NULL, NULL, 'Tidak', NULL, NULL),
(179, 6, '2019-05-30', NULL, NULL, 1, NULL, NULL, NULL, NULL, 179, NULL, NULL, 'Ya', NULL, NULL),
(180, 20, '2019-05-30', NULL, NULL, 1, NULL, NULL, NULL, NULL, 180, NULL, NULL, 'Ya', NULL, NULL),
(181, 6894, '2019-05-30', NULL, NULL, 1, NULL, NULL, NULL, NULL, 181, NULL, NULL, 'Ya', NULL, NULL),
(182, 25, '2020-04-03', NULL, NULL, 4, NULL, NULL, NULL, NULL, 182, NULL, NULL, 'Ya', NULL, NULL),
(183, 34, '2020-04-03', NULL, NULL, 3, NULL, NULL, NULL, NULL, 183, NULL, NULL, 'Ya', NULL, NULL),
(184, 14, '2020-05-06', NULL, NULL, 1, NULL, NULL, NULL, NULL, 184, NULL, NULL, 'Ya', NULL, NULL),
(185, 34, '2020-05-14', NULL, NULL, 3, NULL, NULL, NULL, NULL, 185, NULL, NULL, 'Ya', NULL, NULL),
(186, 21, '2020-05-14', NULL, NULL, 2, NULL, NULL, NULL, NULL, 186, NULL, NULL, 'Ya', NULL, NULL),
(187, 25, '2020-05-15', NULL, NULL, 2, NULL, NULL, NULL, NULL, 187, NULL, NULL, 'Ya', NULL, NULL),
(188, 25, '2020-06-18', NULL, NULL, 2, NULL, NULL, NULL, NULL, 188, NULL, NULL, 'Ya', NULL, NULL),
(189, 34, '2020-06-18', NULL, NULL, 1, NULL, NULL, NULL, NULL, 189, NULL, NULL, 'Ya', NULL, NULL),
(190, 34, '2020-06-26', NULL, NULL, 2, NULL, NULL, NULL, NULL, 190, NULL, NULL, 'Ya', NULL, NULL),
(191, 25, '2020-06-26', NULL, NULL, 1, NULL, NULL, NULL, NULL, 191, NULL, NULL, 'Ya', NULL, NULL),
(192, 34, '2020-06-26', NULL, NULL, 1, NULL, NULL, NULL, NULL, 192, NULL, NULL, 'Ya', NULL, NULL),
(193, 25, '2020-06-26', NULL, NULL, 3, NULL, NULL, NULL, NULL, 193, NULL, NULL, 'Ya', NULL, NULL),
(194, 34, '2020-06-28', NULL, NULL, 2, NULL, NULL, NULL, NULL, 194, NULL, NULL, 'Ya', NULL, NULL),
(195, 25, '2020-06-29', NULL, NULL, 1, NULL, NULL, NULL, NULL, 195, NULL, NULL, 'Ya', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Aktif` enum('Ya','Tidak','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `jabatan`, `Aktif`, `remember_token`, `created_at`, `updated_at`, `alamat`, `telepon`) VALUES
(1, 'Vivian', 'vivi21', 'anastasiavivian98@gmail.com', '$2y$10$qupUgS2peHgOrclW6ZlI4OXR3NpuhpJrEj5TVKALif.fE7BatDFCm', 'kasir', 'Ya', '9e1IWoVezUfMfSdpkqxk6wGebnMoLQKKNZf1fLGqJw8YV53nSGilnwX0fJG5', '2018-03-08 10:21:12', '2019-05-30 10:27:59', 'jl. ngagel madya no.54', '03182183'),
(2, 'Anastasia', 'anastasia', 'anastasiavivian2@gmail.com', '$2y$10$qupUgS2peHgOrclW6ZlI4OXR3NpuhpJrEj5TVKALif.fE7BatDFCm', 'admin', 'Ya', 'yCfBz6k6KXbMrswSgCWdnDN7yje4Aa7azrsMfoSfsizDU5ivJBY0x09teQDn', '2018-04-11 01:19:50', '2019-05-13 08:56:45', 'jl.ngagel no 54', '0318218332'),
(3, 'Jefry', 'jefryhadinata2', 'jefry@gmail.com', '$2y$10$UL0WFe4k0Sxx75bPKv0bEOX83V03FHYVx4BjIrbecbbnWxsFqnql6', 'kasir', 'Ya', 'BXolRvazTwwPSe0eiHZ0B0PaYovUbmWJHHh0sZz8xg3sLE0qS5Y1FRle1gPQ', '2018-04-11 01:22:12', '2019-05-16 08:42:06', 'jl. ngagel madya 3', '08192232544'),
(4, 'Christopher', 'christopher', 'christopher@gmail.com', '$2y$10$ICtIoWOL3u3W.xqOj2hX7uGcQxOJtgt9XjuNY8oL3insOgROUq0xO', 'admin', 'Ya', NULL, '2019-04-21 23:36:48', '2019-05-20 20:20:59', 'jl.ngagel no.2', '03154354'),
(5, 'Lucas', 'christopher2', 'christopher2@gmail.com', '$2y$10$XBGoDH77orsAUwHS1BUo6e6EfPyfMpzTh.Ix2Vhog6okwYVIuQKMW', 'kasir', 'Ya', NULL, '2019-04-22 05:51:23', '2019-05-13 08:58:06', 'jl.ngagel', '0312325678'),
(6, 'Christian', 'christian123', 'christian@gmail.com', '$2y$10$EYP1cE8GaZoxjaUwS520D.ecQ7QOivQGB8R/6VN2PDgaU0bCgRE1a', 'kasir', 'Ya', NULL, '2019-04-22 05:51:30', '2019-05-13 08:58:52', 'jl.ngagel', '03182156732'),
(7, 'Kevin', 'Kevin53531', 'ck@gmail.com', '$2y$10$2a2JmHKtPFJ7Vg6PSLelMuBDlFAaXTgUQW.xXFuc4BVZQQNirC4TW', 'kasir', 'Ya', NULL, '2019-04-22 06:42:01', '2019-05-13 11:26:59', 'jl.ngagel2', '0986865324'),
(8, 'Lucas', 'christopher21', 'christopher2@gmail.com', '$2y$10$dACzkED6.hRb0q/ajat/8.A7/SgsnEeCRthGXgOL9VA0P8vBQmT1i', 'kasir', 'Ya', NULL, '2019-05-13 11:30:39', NULL, 'jl.ngagel', '0312325678'),
(12, 'Christian2', 'christian123', 'ck2@gmail.com', '$2y$10$L2H7E4U4WyQdLUO5JoW6y.OcFWEe62ZL7ozUz2cRx.xairV7mNy9m', 'kasir', 'Ya', NULL, '2019-05-16 08:36:15', NULL, 'jl.ngagel no 54', '0986865324'),
(13, 'Christian', 'kevin2', 'kevin@gmail.com', '$2y$10$bnwoqOTSgXvyEtX7131Sj.a.TAEuHTkWElYB6Oox4oFbwaJaMkxXm', 'kasir', 'Ya', NULL, '2019-05-29 01:38:13', '2019-05-30 10:05:52', 'jl.ngagel', '0986865324'),
(14, 'Christopher', 'christopher123', 'christopher123@gmail.com', '$2y$10$wCiiMMXGFCp/9tfDXjei.e4ATZSmeOcbI8gjmPRCcpLfbX9d2h/8a', 'kasir', 'Ya', NULL, '2019-05-30 10:05:10', NULL, 'jl.ngagel', '0312325678'),
(15, 'edwin', 'edwin', 'edwin.lo.el1@gmail.com', '$2b$10$n1nLpyS1DsUCeqgutqsVYeofMA4b2hjbH6ux0wwDf6bHZ5FfbDyEK', 'kasir', 'Ya', NULL, '2020-04-03 15:13:20', '2020-04-03 15:13:20', 'ngagel jaya selatan', '082337123047'),
(16, 'adrian christopher', 'adrian', 'adrian@gmail.com', '$2b$10$c99FoTzcEGhVeIXGzG./f.ehKTU/kTJgJb3cj8GqkiXsNQpucaVHO', 'admin', 'Ya', NULL, '2020-04-03 15:13:20', '2020-04-03 15:13:20', 'ngagel jaya selatan', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitem`
--
ALTER TABLE `mitem`
  ADD PRIMARY KEY (`IDItem`);

--
-- Indexes for table `mitemtipe`
--
ALTER TABLE `mitemtipe`
  ADD PRIMARY KEY (`IDTipeItem`),
  ADD UNIQUE KEY `Idx_Kode` (`Kode`);

--
-- Indexes for table `mitemtree`
--
ALTER TABLE `mitemtree`
  ADD PRIMARY KEY (`IDItemTree`);

--
-- Indexes for table `tjualbayarkasd`
--
ALTER TABLE `tjualbayarkasd`
  ADD PRIMARY KEY (`IDJualBayarKasD`),
  ADD UNIQUE KEY `Idx_IDVoucherD` (`IDVoucherD`),
  ADD KEY `Idx_Waktu` (`Waktu`),
  ADD KEY `FK_tjualbayarkasd_IDJualH` (`IDJualH`),
  ADD KEY `FK_tjualbayarkasd_IDJualReturH` (`IDJualReturH`),
  ADD KEY `FK_tjualbayarkasd_IDVoucherD` (`IDVoucherD`);

--
-- Indexes for table `tjualbayarkash`
--
ALTER TABLE `tjualbayarkash`
  ADD PRIMARY KEY (`IDJualH`),
  ADD KEY `FK_tjualbayarkash_IDKasir` (`IDKasir`);

--
-- Indexes for table `tjuald`
--
ALTER TABLE `tjuald`
  ADD PRIMARY KEY (`IDJualD`),
  ADD KEY `FK_tjuald_IDItem` (`IDItem`),
  ADD KEY `FK_tjuald_IDJualH` (`IDJualH`) USING BTREE;

--
-- Indexes for table `tjualh`
--
ALTER TABLE `tjualh`
  ADD PRIMARY KEY (`IDJualH`),
  ADD UNIQUE KEY `Idx_Kode` (`Kode`),
  ADD KEY `Idx_Tanggal` (`Tanggal`),
  ADD KEY `FK_tjualh_IDPeriode` (`IDPeriode`),
  ADD KEY `FK_tjualh_IDCustomer` (`IDCustomer`),
  ADD KEY `FK_tjualh_IDWarehouse` (`IDWarehouse`),
  ADD KEY `FK_tjualh_IDPegawai` (`IDPegawai`);

--
-- Indexes for table `tjurnalitem`
--
ALTER TABLE `tjurnalitem`
  ADD PRIMARY KEY (`IDJurnalItem`),
  ADD KEY `FK_tjurnalitem_IDJualD` (`IDJualD`),
  ADD KEY `FK_tjurnalitem_IDJualReturD` (`IDJualReturD`),
  ADD KEY `FK_tjurnalitem_IDItem` (`IDItem`),
  ADD KEY `FK_tjurnalitem_IDWarehouse` (`IDWarehouse`),
  ADD KEY `FK_tjurnalitem_IDBeliD` (`IDBeliD`),
  ADD KEY `Idx_Tanggal_IDItem_IDWarehouse_Jenis` (`Tanggal`,`IDItem`,`IDWarehouse`,`Jenis`),
  ADD KEY `FK_tjurnalitem_IDBeliReturD` (`IDBeliReturD`),
  ADD KEY `Idx_Jenis_Tanggal` (`Jenis`,`Tanggal`),
  ADD KEY `Idx_IDItem_Tanggal` (`IDItem`,`Tanggal`),
  ADD KEY `FK_tjurnalitem_IDBeliTerimaD` (`IDBeliTerimaD`),
  ADD KEY `FK_tjurnalitem_IDJualDOD` (`IDJualDOD`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mitem`
--
ALTER TABLE `mitem`
  MODIFY `IDItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6896;

--
-- AUTO_INCREMENT for table `mitemtipe`
--
ALTER TABLE `mitemtipe`
  MODIFY `IDTipeItem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitemtree`
--
ALTER TABLE `mitemtree`
  MODIFY `IDItemTree` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `tjualbayarkasd`
--
ALTER TABLE `tjualbayarkasd`
  MODIFY `IDJualBayarKasD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `tjuald`
--
ALTER TABLE `tjuald`
  MODIFY `IDJualD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `tjualh`
--
ALTER TABLE `tjualh`
  MODIFY `IDJualH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `tjurnalitem`
--
ALTER TABLE `tjurnalitem`
  MODIFY `IDJurnalItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tjuald`
--
ALTER TABLE `tjuald`
  ADD CONSTRAINT `FK_tjuad_IDJualH` FOREIGN KEY (`IDJualH`) REFERENCES `tjualh` (`IDJualH`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
