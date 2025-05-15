-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 07:43 PM
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
-- Database: `agrishop`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `region`, `province`, `city`) VALUES
(1, 'Region III', 'Aurora', 'Baler'),
(2, 'Region III', 'Aurora', 'Casiguran'),
(3, 'Region III', 'Aurora', 'Dilasag'),
(4, 'Region III', 'Aurora', 'Dinalungan'),
(5, 'Region III', 'Aurora', 'Dipaculao'),
(6, 'Region III', 'Aurora', 'Maria Aurora'),
(7, 'Region III', 'Aurora', 'San Luis'),
(8, 'Region III', 'Bataan', 'Abucay'),
(9, 'Region III', 'Bataan', 'Bagac'),
(10, 'Region III', 'Bataan', 'Balanga City'),
(11, 'Region III', 'Bataan', 'Dinalupihan'),
(12, 'Region III', 'Bataan', 'Hermosa'),
(13, 'Region III', 'Bataan', 'Limay'),
(14, 'Region III', 'Bataan', 'Mariveles'),
(15, 'Region III', 'Bataan', 'Morong'),
(16, 'Region III', 'Bataan', 'Orani'),
(17, 'Region III', 'Bataan', 'Orion'),
(18, 'Region III', 'Bataan', 'Pilar'),
(19, 'Region III', 'Bataan', 'Samal'),
(20, 'Region III', 'Bulacan', 'Angat'),
(21, 'Region III', 'Bulacan', 'Balagtas'),
(22, 'Region III', 'Bulacan', 'Baliuag'),
(23, 'Region III', 'Bulacan', 'Bocaue'),
(24, 'Region III', 'Bulacan', 'Bulakan'),
(25, 'Region III', 'Bulacan', 'Bustos'),
(26, 'Region III', 'Bulacan', 'Calumpit'),
(27, 'Region III', 'Bulacan', 'Doña Remedios Trinidad'),
(28, 'Region III', 'Bulacan', 'Guiguinto'),
(29, 'Region III', 'Bulacan', 'Hagonoy'),
(30, 'Region III', 'Bulacan', 'Iba'),
(31, 'Region III', 'Bulacan', 'Malolos City'),
(32, 'Region III', 'Bulacan', 'Marilao'),
(33, 'Region III', 'Bulacan', 'Meycauayan City'),
(34, 'Region III', 'Bulacan', 'Norzagaray'),
(35, 'Region III', 'Bulacan', 'Obando'),
(36, 'Region III', 'Bulacan', 'Paombong'),
(37, 'Region III', 'Bulacan', 'Plaridel'),
(38, 'Region III', 'Bulacan', 'Pulilan'),
(39, 'Region III', 'Bulacan', 'San Ildefonso'),
(40, 'Region III', 'Bulacan', 'San Jose del Monte City'),
(41, 'Region III', 'Bulacan', 'San Miguel'),
(42, 'Region III', 'Bulacan', 'San Rafael'),
(43, 'Region III', 'Bulacan', 'Santa Maria'),
(44, 'Region III', 'Nueva Ecija', 'Aliaga'),
(45, 'Region III', 'Nueva Ecija', 'Bongabon'),
(46, 'Region III', 'Nueva Ecija', 'Cabanatuan City'),
(47, 'Region III', 'Nueva Ecija', 'Cabiao'),
(48, 'Region III', 'Nueva Ecija', 'Carranglan'),
(49, 'Region III', 'Nueva Ecija', 'Cuyapo'),
(50, 'Region III', 'Nueva Ecija', 'Gabaldon'),
(51, 'Region III', 'Nueva Ecija', 'Gapan City'),
(52, 'Region III', 'Nueva Ecija', 'General Mamerto Natividad'),
(53, 'Region III', 'Nueva Ecija', 'General Tinio'),
(54, 'Region III', 'Nueva Ecija', 'Guimba'),
(55, 'Region III', 'Nueva Ecija', 'Jaen'),
(56, 'Region III', 'Nueva Ecija', 'Laur'),
(57, 'Region III', 'Nueva Ecija', 'Licab'),
(58, 'Region III', 'Nueva Ecija', 'Llanera'),
(59, 'Region III', 'Nueva Ecija', 'Lupao'),
(60, 'Region III', 'Nueva Ecija', 'Muñoz City'),
(61, 'Region III', 'Nueva Ecija', 'Nampicuan'),
(62, 'Region III', 'Nueva Ecija', 'Palayan City'),
(63, 'Region III', 'Nueva Ecija', 'Pantabangan'),
(64, 'Region III', 'Nueva Ecija', 'Peñaranda'),
(65, 'Region III', 'Nueva Ecija', 'Quezon'),
(66, 'Region III', 'Nueva Ecija', 'San Antonio'),
(67, 'Region III', 'Nueva Ecija', 'San Isidro'),
(68, 'Region III', 'Nueva Ecija', 'San Leonardo'),
(69, 'Region III', 'Nueva Ecija', 'Santa Rosa'),
(70, 'Region III', 'Nueva Ecija', 'Santo Domingo'),
(71, 'Region III', 'Nueva Ecija', 'Talavera'),
(72, 'Region III', 'Nueva Ecija', 'Talugtug'),
(73, 'Region III', 'Pampanga', 'Angeles City'),
(74, 'Region III', 'Pampanga', 'Apalit'),
(75, 'Region III', 'Pampanga', 'Arayat'),
(76, 'Region III', 'Pampanga', 'Bacolor'),
(77, 'Region III', 'Pampanga', 'Candaba'),
(78, 'Region III', 'Pampanga', 'Floridablanca'),
(79, 'Region III', 'Pampanga', 'Guagua'),
(80, 'Region III', 'Pampanga', 'Lubao'),
(81, 'Region III', 'Pampanga', 'Mabalacat City'),
(82, 'Region III', 'Pampanga', 'Macabebe'),
(83, 'Region III', 'Pampanga', 'Magalang'),
(84, 'Region III', 'Pampanga', 'Masantol'),
(85, 'Region III', 'Pampanga', 'Mexico'),
(86, 'Region III', 'Pampanga', 'Minalin'),
(87, 'Region III', 'Pampanga', 'Porac'),
(88, 'Region III', 'Pampanga', 'San Fernando City'),
(89, 'Region III', 'Pampanga', 'San Luis'),
(90, 'Region III', 'Pampanga', 'San Simon'),
(91, 'Region III', 'Pampanga', 'Santa Ana'),
(92, 'Region III', 'Pampanga', 'Santa Rita'),
(93, 'Region III', 'Pampanga', 'Santo Tomas'),
(94, 'Region III', 'Pampanga', 'Sasmuan'),
(95, 'Region III', 'Tarlac', 'Anao'),
(96, 'Region III', 'Tarlac', 'Bamban'),
(97, 'Region III', 'Tarlac', 'Camiling'),
(98, 'Region III', 'Tarlac', 'Capas'),
(99, 'Region III', 'Tarlac', 'Concepcion'),
(100, 'Region III', 'Tarlac', 'Gerona'),
(101, 'Region III', 'Tarlac', 'La Paz'),
(102, 'Region III', 'Tarlac', 'Mayantoc'),
(103, 'Region III', 'Tarlac', 'Moncada'),
(104, 'Region III', 'Tarlac', 'Paniqui'),
(105, 'Region III', 'Tarlac', 'Pura'),
(106, 'Region III', 'Tarlac', 'Ramos'),
(107, 'Region III', 'Tarlac', 'San Clemente'),
(108, 'Region III', 'Tarlac', 'San Jose'),
(109, 'Region III', 'Tarlac', 'San Manuel'),
(110, 'Region III', 'Tarlac', 'Santa Ignacia'),
(111, 'Region III', 'Tarlac', 'Tarlac City'),
(112, 'Region III', 'Tarlac', 'Victoria'),
(113, 'Region III', 'Zambales', 'Botolan'),
(114, 'Region III', 'Zambales', 'Cabangan'),
(115, 'Region III', 'Zambales', 'Candelaria'),
(116, 'Region III', 'Zambales', 'Castillejos'),
(117, 'Region III', 'Zambales', 'Iba'),
(118, 'Region III', 'Zambales', 'Masinloc'),
(119, 'Region III', 'Zambales', 'Olongapo City'),
(120, 'Region III', 'Zambales', 'Palauig'),
(121, 'Region III', 'Zambales', 'San Antonio'),
(122, 'Region III', 'Zambales', 'San Felipe'),
(123, 'Region III', 'Zambales', 'San Marcelino'),
(124, 'Region III', 'Zambales', 'Santa Cruz'),
(125, 'Region III', 'Zambales', 'Subic');

-- --------------------------------------------------------

--
-- Table structure for table `mainpost`
--

CREATE TABLE `mainpost` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `category` enum('selling','buying') NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainpost`
--

INSERT INTO `mainpost` (`id`, `username`, `category`, `description`, `file_path`, `created_at`) VALUES
(1, 'reggie', 'selling', 's', 'uploads/homepic.png', '2025-04-09 08:24:24'),
(2, 'xmond', 'selling', 'sumakses', 'uploads/homepic.png', '2025-04-09 08:24:50'),
(3, 'reggie1', 'selling', 'Thank you for this transaction', 'uploads/659-06185716en_Masterfile.jpg', '2025-04-10 05:36:42'),
(6, 'juan', 'selling', 'thanks', 'uploads/eggplant.jpg', '2025-05-13 14:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `receiver`, `message`, `timestamp`, `is_read`) VALUES
(11, 'Raymond Esparagoza', 'Raymond Salgado', 'hello bebi number 1', '2025-03-23 22:32:39', 0),
(12, 'Reggie Hallare', 'Raymond Esparagoza', 'bebi', '2025-03-23 22:34:22', 1),
(13, 'Raymond Esparagoza', 'Reggie Hallare', 'bakit bebi', '2025-03-23 22:35:06', 1),
(20, 'Raymond Esparagoza', 'Reggie Hallare', 'pre', '2025-03-23 22:50:20', 1),
(23, 'Raymond Esparagoza', 'regs', 'nagkaon kaba rin ba?', '2025-03-23 22:59:19', 0),
(24, 'Raymond Esparagoza', 'Raymond Esparagoza', 'pogi', '2025-03-23 23:22:23', 1),
(27, 'Raymond Esparagoza', 'Reggie Hallare', 'hi', '2025-03-24 10:29:03', 1),
(28, 'Raymond Esparagoza', 'Reggie Hallare', 'oy', '2025-03-28 15:22:07', 1),
(29, 'Reggie Hallare', 'Raymond Esparagoza', 'baket pre?', '2025-03-28 15:22:33', 1),
(30, 'Raymond Esparagoza3', 'Raymond Esparagoza', 'qweqwe', '2025-03-28 15:41:57', 1),
(32, 'Reggie Hallare1', 'Raymond Esparagoza', '12323qwewe', '2025-03-28 16:18:44', 1),
(33, 'Reggie Hallare1', 'Raymond Esparagoza3', 'paree si reggie to', '2025-03-28 16:19:11', 1),
(34, 'Raymond Esparagoza3', 'Juan DelaCruz', 'tol?\r\n', '2025-03-28 16:20:01', 1),
(35, 'Raymond Esparagoza', 'Reggie Hallare1', 'oy', '2025-03-28 17:46:25', 1),
(36, 'Reggie Hallare1', 'Raymond Esparagoza3', 'oyyy pre', '2025-03-28 17:47:55', 1),
(40, 'Raymond Esparagoza3', 'Reggie Hallare1', 'pre', '2025-03-28 18:26:17', 1),
(41, 'Raymond Esparagoza3', 'Reggie Hallare1', 'reggie anong oras na', '2025-03-28 18:27:36', 1),
(42, 'Reggie Hallare1', 'juan delacruz', 'nanya?', '2025-03-28 18:28:41', 1),
(43, 'Reggie Hallare1', 'juan delacruz', 'asdasdasd', '2025-03-28 18:29:02', 1),
(44, 'Juan DelaCruz', 'Reggie Hallare1', 'yow', '2025-03-28 18:29:26', 1),
(45, 'Reggie Hallare1', 'juan delacruz', 'qweqwe', '2025-03-28 18:29:48', 1),
(46, 'Reggie Hallare1', 'juan delacruz', 'waeqweq', '2025-03-29 06:18:30', 1),
(47, 'reggie1', 'juan delacruz', 'qweqwe', '2025-03-29 06:34:14', 0),
(48, 'reggie1', 'juan delacruz', 'qweqwe', '2025-03-29 06:36:43', 0),
(49, 'reggie1', 'juan delacruz', 'qweqwe', '2025-03-29 06:36:55', 0),
(50, 'reggie1', 'juan delacruz', 'qweqwe', '2025-03-29 06:37:03', 0),
(51, 'reggie1', 'juan delacruz', 'qweqwe', '2025-03-29 06:37:35', 0),
(52, 'reggie1', 'juan delacruz', 'wqeqweqw', '2025-03-29 06:39:37', 0),
(53, 'reggie1', 'juan delacruz', 'try', '2025-03-29 06:39:56', 0),
(54, 'raymond1', 'juan delacruz', 'pakyu ka pre', '2025-03-29 15:03:51', 0),
(55, 'raymond1', 'juan', 'pare\r\n', '2025-03-29 15:07:14', 0),
(56, 'raymond1', 'juan delacruz', 'oy ako to', '2025-03-29 15:07:33', 0),
(57, 'raymond1', 'juan', 'pre', '2025-03-29 15:07:42', 0),
(58, 'Juan DelaCruz', 'Reggie Hallare1', 'pare si anya to', '2025-03-29 15:15:10', 1),
(59, 'reggie1', 'juan delacruz', '11:16pm', '2025-03-29 15:16:36', 0),
(60, 'Reggie Hallare1', 'juan delacruz', 'ok pre 11:16pm na uwi kana', '2025-03-29 15:17:01', 1),
(61, 'Reggie Hallare1', 'Raymond Esparagoza3', 'pare si reggie hallare to pwede pautang load?', '2025-03-29 15:23:41', 1),
(62, 'Reggie Hallare1', 'juan delacruz', 'anya uwi kana daw sabi mama', '2025-03-29 15:23:55', 1),
(63, 'Raymond Esparagoza3', 'Reggie Hallare1', 'oy', '2025-03-29 15:24:49', 1),
(64, 'Juan DelaCruz', 'Raymond Esparagoza', 'pare', '2025-03-29 16:17:01', 1),
(65, 'Juan DelaCruz', 'Reggie Hallare1', 'si anya to ya', '2025-03-29 16:17:33', 1),
(66, 'Juan DelaCruz', 'Raymond Esparagoza3', 'pre si anyaaaaaah na to', '2025-03-29 17:03:32', 1),
(67, 'Raymond Esparagoza3', 'juan delacruz', 'mare', '2025-03-30 06:16:09', 1),
(68, 'Juan DelaCruz', 'Reggie Hallare1', 'reggie san ka?', '2025-03-30 06:19:29', 1),
(69, 'Reggie Hallare', 'Raymond Esparagoza', 'pakiss', '2025-04-09 04:20:39', 1),
(70, 'Raymond Esparagoza', 'Reggie Hallare1', 'par', '2025-04-09 04:21:04', 1),
(71, 'Reggie Hallare', 'Raymond Esparagoza', 'pakiss', '2025-04-09 04:21:08', 1),
(72, 'Raymond Esparagoza', 'Raymond Esparagoza', 'Pst', '2025-04-09 04:22:05', 1),
(73, 'Raymond Esparagoza', 'Reggie Hallare', 'Hello', '2025-04-09 04:22:42', 1),
(74, 'Reggie Hallare', 'Raymond Esparagoza', 'Hi', '2025-04-09 04:23:03', 1),
(75, 'Juan DelaCruz', 'Reggie Hallare1', 'yaaaa', '2025-04-13 09:41:30', 1),
(76, 'Juan DelaCruz', 'Reggie Hallare1', 'sdasd', '2025-04-17 14:40:06', 1),
(77, 'Juan DelaCruz', 'Reggie Hallare1', 'qweqweqwe', '2025-05-13 14:48:07', 0),
(78, 'Joel Santos', 'juan delacruz', 'Hello Available paba yung binebenta mo?', '2025-05-14 01:56:34', 0),
(79, 'Albert Mesias', 'juan delacruz', 'Available paba yung okra seed mo?', '2025-05-14 02:40:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages_backup`
--

CREATE TABLE `messages_backup` (
  `id` int(11) NOT NULL DEFAULT 0,
  `sender` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages_backup`
--

INSERT INTO `messages_backup` (`id`, `sender`, `receiver`, `message`, `timestamp`) VALUES
(8, 'regs', 'xmond', 'kumain kana', '2025-03-23 22:21:42'),
(9, 'regs', 'xmond', 'oo naman ako paba?', '2025-03-23 22:22:00'),
(11, 'xmond', 'raymond', 'hello bebi number 1', '2025-03-23 22:32:39'),
(12, 'reggie', 'xmond', 'bebi', '2025-03-23 22:34:22'),
(13, 'xmond', 'reggie', 'bakit bebi', '2025-03-23 22:35:06'),
(20, 'xmond', 'reggie', 'pre', '2025-03-23 22:50:20'),
(23, 'xmond', 'regs', 'nagkaon kaba rin ba?', '2025-03-23 22:59:19'),
(24, 'xmond', 'xmond', 'pogi', '2025-03-23 23:22:23'),
(27, 'xmond', 'reggie', 'hi', '2025-03-24 10:29:03'),
(28, 'xmond', 'reggie', 'oy', '2025-03-28 15:22:07'),
(29, 'reggie', 'xmond', 'baket pre?', '2025-03-28 15:22:33'),
(30, 'raymond1', 'xmond', 'qweqwe', '2025-03-28 15:41:57'),
(32, 'reggie1', 'xmond', '12323qwewe', '2025-03-28 16:18:44'),
(33, 'reggie1', 'raymond1', 'paree si reggie to', '2025-03-28 16:19:11'),
(34, 'raymond1', 'juan', 'tol?\r\n', '2025-03-28 16:20:01'),
(35, 'xmond', 'Reggie Hallare1', 'oy', '2025-03-28 17:46:25'),
(36, 'reggie1', 'Raymond Esparagoza3', 'oyyy pre', '2025-03-28 17:47:55');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `category` enum('selling','buying') NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Available','Sold') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `username`, `category`, `description`, `file_path`, `region`, `province`, `city`, `barangay`, `street`, `created_at`, `status`) VALUES
(7, 'reggie', 'buying', 'buyinggg ako neto', 'uploads/formal.png', NULL, NULL, NULL, NULL, NULL, '2025-02-11 16:22:31', 'Available'),
(15, 'xmond', 'selling', 'Sell this okra seed', 'uploads/okra seed.jpg', NULL, NULL, NULL, NULL, NULL, '2025-02-28 14:43:58', 'Available'),
(18, 'raymond1', 'buying', 'buyinggg ako nitong seen na to parekoy', 'uploads/okra seed.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-10 14:48:19', 'Available'),
(21, 'reggie1', 'buying', 'buying ako nitong seed', 'uploads/okra seed.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-10 15:55:23', 'Available'),
(27, 'raymond1', 'selling', 'sell this again i have 20pcs', 'uploads/eggplant.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-28 14:16:56', 'Available'),
(28, 'raymond1', 'selling', 'sell this kalabasa seed 20pcs available', 'uploads/kalabasa.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-28 14:27:57', 'Available'),
(29, 'reggie1', 'buying', 'buyinggggg', 'uploads/kalabasa.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-28 18:17:09', 'Available'),
(31, 'juan', 'selling', 'Selling this tomatoes plant', 'uploads/tomato.jpg', NULL, NULL, NULL, NULL, NULL, '2025-03-29 16:20:10', 'Available'),
(32, 'reggie', 'selling', 'Sell 1200 Sacks of Rice', 'uploads/659-06185716en_Masterfile.jpg', NULL, NULL, NULL, NULL, NULL, '2025-04-10 04:07:17', 'Available'),
(39, 'amistoso', 'selling', 'Sell this', 'uploads/eggplant.jpg', 'Region III', 'Bataan', 'Limay', NULL, NULL, '2025-05-09 12:54:04', 'Available'),
(45, 'juan', 'selling', 'Sell this tomatoe', 'uploads/tomato.jpg', NULL, 'Zambales', 'Olongapo City', 'Sta. Rita', NULL, '2025-05-11 16:28:55', 'Available'),
(55, 'reggie1', 'buying', 'Buying this seed', 'uploads/kalabasa.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', NULL, '2025-05-13 17:26:17', 'Available'),
(58, 'albert', 'buying', 'Buying this seed 10pcss', 'uploads/okra seed.jpg', NULL, 'Zambales', 'Olongapo City', 'Kalaklan', NULL, '2025-05-14 02:38:37', 'Available'),
(59, 'juan', 'buying', '21312eqweqw', 'uploads/grantt chart.JPG', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', NULL, '2025-05-15 15:25:41', 'Sold'),
(62, 'reggie1', 'buying', 'ttt2', 'uploads/eggplant.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', NULL, '2025-05-15 15:57:03', 'Available'),
(63, 'reggie1', 'selling', 'qweqweqwe1', 'uploads/tomato.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', NULL, '2025-05-15 15:59:25', 'Sold'),
(65, 'reggie1', 'buying', 'qweqwe', 'uploads/watermelon seed.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', NULL, '2025-05-15 16:12:40', 'Sold'),
(71, 'reggie1', 'buying', 'wqeqweq', 'uploads/kalabasa.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', 'blk27', '2025-05-15 17:30:30', 'Sold'),
(72, 'reggie1', 'selling', 'qweqweqwe', 'uploads/14696196458_f9405109de_z.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', 'Blk 27 Zenia Street', '2025-05-15 17:37:24', 'Sold'),
(73, 'Jeric', 'buying', 'Buying ako nito', 'uploads/asin.jpg', NULL, 'Zambales', 'Olongapo City', 'Gordon Heights', 'Blk 27 Zenia st ', '2025-05-15 17:40:58', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `srp_prices`
--

CREATE TABLE `srp_prices` (
  `id` int(11) NOT NULL,
  `crop_name` varchar(255) NOT NULL,
  `min_price` decimal(10,2) DEFAULT NULL,
  `max_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `srp_prices`
--

INSERT INTO `srp_prices` (`id`, `crop_name`, `min_price`, `max_price`, `created_at`) VALUES
(1, 'Rice', 45.00, 55.00, '2025-04-09 05:21:19'),
(2, 'Corn', 30.00, 40.00, '2025-04-09 05:21:19'),
(3, 'Mango', 80.00, 120.00, '2025-04-09 05:21:19'),
(4, 'Tomato', 60.00, 80.00, '2025-04-09 05:21:19'),
(5, 'Onion', 70.00, 90.00, '2025-04-09 05:21:19'),
(6, 'Sweet Potato', 25.00, 35.00, '2025-04-09 05:38:44'),
(7, 'Cabbage', 40.00, 50.00, '2025-04-09 05:38:44'),
(8, 'Carrot', 55.00, 65.00, '2025-04-09 05:38:44'),
(9, 'Banana (Saba)', 20.00, 30.00, '2025-04-09 05:38:44'),
(10, 'Eggplant', 35.00, 45.00, '2025-04-09 05:38:44'),
(11, 'Green Beans', 60.00, 75.00, '2025-04-09 05:38:44'),
(12, 'Watermelon', 30.00, 40.00, '2025-04-09 05:38:44'),
(13, 'Pineapple', 45.00, 55.00, '2025-04-09 05:38:44'),
(14, 'Papaya', 35.00, 45.00, '2025-04-09 05:38:44'),
(15, 'Ginger', 120.00, 150.00, '2025-04-09 05:38:44'),
(16, 'Garlic', 180.00, 220.00, '2025-04-09 05:38:44'),
(17, 'Chili Pepper', 250.00, 300.00, '2025-04-09 05:38:44'),
(18, 'Cassava', 15.00, 25.00, '2025-04-09 05:38:44'),
(19, 'Okra', 50.00, 60.00, '2025-04-09 05:38:44'),
(20, 'Spinach', 30.00, 40.00, '2025-04-09 05:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'uploads/default.png',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) NOT NULL DEFAULT 'uploads/default.png',
  `role` enum('admin','user') DEFAULT 'user',
  `is_admin` tinyint(1) DEFAULT 0,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `img`, `status`, `created_at`, `profile_image`, `role`, `is_admin`, `email`) VALUES
(1, 'raymond', 'Raymond Salgado', '$2y$10$fIteB6CFtCxExYNo.pK.6ObWJm6Vun0hjiL1GNC25La5bBFL.jGem', 'uploads/default.png', 'active', '2025-02-11 15:39:31', 'uploads/default.png', 'user', 0, ''),
(3, 'xmond', 'Raymond Esparagoza', '$2y$10$.utDXoeYNat2SHElUlAcgOOiwHETNjVTFChcGY71RG77oIw8aYLsO', 'uploads/default.png', 'active', '2025-02-11 16:05:59', 'uploads/default.png', 'user', 0, ''),
(4, 'aaa', 'wqe', '$2y$10$H9RXDfQQPUAHz9002hy15uQ99b1qBH4d5Vwu3NlWuOEqSXfoQuwLG', 'uploads/default.png', 'active', '2025-02-11 16:17:04', 'uploads/default.png', 'user', 0, ''),
(5, 'reggie', 'Reggie Hallare', '$2y$10$YrR9n/nU9rPgyWGBAw2BMO80cSh.XFBDXfIptxpu633Sa.QbW5KwS', 'uploads/default.png', 'active', '2025-02-11 16:22:03', 'uploads/default.png', 'user', 0, ''),
(7, 'mond', 'Raymond Esparagoza1', '$2y$10$qrIS1RqD6SWZ658dFbEL5uG2O79c/qjgylVE7e/DWrLZLIsqbPRaq', 'uploads/default.png', 'active', '2025-02-13 15:13:43', 'uploads/default.png', 'user', 0, ''),
(9, 'xxmond', 'Raymond Esparagoza2', '$2y$10$fHhuoYI8O9HSHykemprpm.Vna3G1olMVWMaaHbi2QoAn9WbVE/n4S', 'uploads/default.png', 'active', '2025-02-16 12:52:06', 'uploads/default.png', 'user', 0, ''),
(10, 'raymond1', 'Raymond Esparagoza3', '$2y$10$hYNd..ppjo/lop5cMfqIdeQfgEKMgnEJIx3KNsPkNJbkLTPQcZCZC', 'uploads/default.png', 'active', '2025-03-10 14:46:15', 'uploads/1741617975_2x2.jpg', 'user', 0, ''),
(12, 'reggie1', 'Reggie Hallare1', '$2y$10$/oAkP43xs7l8k33ldY749e1XybasJNW4ZhnLajV4FGZvVWvGNNaZe', 'uploads/default.png', 'active', '2025-03-10 15:54:48', 'uploads/1741622088_1111.jpg', 'user', 0, ''),
(13, 'juan', 'Juan DelaCruz', '$2y$10$HOuBGUM7wbWt6/3TlNJZtestWSXzvu3CFpuip8ok3xLZ8CY4U/NtK', 'uploads/default.png', 'active', '2025-03-24 13:02:12', 'uploads/1742821332_a2.jpg', 'user', 0, ''),
(17, 'admin', 'Admin User', '$2y$10$C9YMEt5dMcSUo3F4Z0pZUeeu9oWtdDWxb5LNpJqd1Ce.N3o.3zDAC', 'uploads/default.png', 'active', '2025-04-13 09:52:07', 'uploads/default.png', 'admin', 1, ''),
(20, 'xmond1', 'Raymond Esparagoza', '$2y$10$uIMcxS0lyTfUFVyFIlEFXefqugdk8AIILruVCekjAwJtuaADltwA2', 'uploads/default.png', 'active', '2025-05-09 10:59:30', 'uploads/default.png', 'user', 0, 'xmond@gmail.com'),
(21, 'jerome', 'Jerome Salgado', '$2y$10$VpQSqJuckvl6DfeHHyKjquR0FAruw.0NHCGXqa7jcgiNOn1Qz7Jy.', 'uploads/default.png', 'active', '2025-05-09 11:48:08', 'uploads/1746791288_Capture.JPG', 'user', 0, 'jerome@gmail.com'),
(22, 'Jeric', 'Jeric Nario', '$2y$10$2M5JFJpGnYZeNLDme3Ig0uC0Pm4wNVhmiy0MfHLycaSOdDEbl4rn6', 'uploads/default.png', 'active', '2025-05-09 12:43:58', 'uploads/1746794638_burat.jfif', 'user', 0, 'jeric@gmail.com'),
(23, 'amistoso', 'Ian Amistoso', '$2y$10$yGFrGcvLUqATuYo6IFI/pOco06X1vTEF69t44IHjoPFgA9v3gNv7m', 'uploads/default.png', 'active', '2025-05-09 12:52:10', 'uploads/1746795130_Untitled.png', 'user', 0, 'amistoso@gmail.com'),
(24, 'gerald', 'Gerald Rosos', '$2y$10$KF02ec9voMTDc6wGlYyA7OfMpCCxxpSN3fesItJxPK9Q3BwjPwcde', 'uploads/default.png', 'active', '2025-05-09 13:48:46', 'uploads/1746798526_r2.png', 'user', 0, 'rosos@gmail.com'),
(25, 'mond1', 'raymond esparagoza', '$2y$10$OFqoXrG6.PJtaCkEye481ORcokgMj5RWEOIR7cyn8Z0QbbCaq6du.', 'uploads/default.png', 'active', '2025-05-14 01:43:30', 'uploads/1747187010_2x2.jpg', 'user', 0, 'esparagoza@gmail.com'),
(26, 'Joel', 'Joel Santos', '$2y$10$z31GRRhf5Zln32TqW1z0A.ARhz5R1qJWgg9FKeoViFoxslAPvRCfi', 'uploads/default.png', 'active', '2025-05-14 01:53:57', 'uploads/1747187637_r1.png', 'user', 0, 'Joel@gmail.com'),
(27, 'albert', 'Albert Mesias', '$2y$10$pMuM9NZBpsXAfmQx6zcOE.eNV4ZKBygUQ4obtDJTN2gbRcWf2eQpi', 'uploads/default.png', 'active', '2025-05-14 02:33:18', 'uploads/1747189998_profile.jpg', 'user', 0, 'albert@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_region` (`region`),
  ADD KEY `idx_province` (`province`),
  ADD KEY `idx_city` (`city`),
  ADD KEY `idx_region_province` (`region`,`province`);

--
-- Indexes for table `mainpost`
--
ALTER TABLE `mainpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `srp_prices`
--
ALTER TABLE `srp_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `mainpost`
--
ALTER TABLE `mainpost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `srp_prices`
--
ALTER TABLE `srp_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
