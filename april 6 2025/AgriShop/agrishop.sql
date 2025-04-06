-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2025 at 09:32 AM
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
(12, 'Reggie Hallare', 'Raymond Esparagoza', 'bebi', '2025-03-23 22:34:22', 0),
(13, 'Raymond Esparagoza', 'Reggie Hallare', 'bakit bebi', '2025-03-23 22:35:06', 0),
(20, 'Raymond Esparagoza', 'Reggie Hallare', 'pre', '2025-03-23 22:50:20', 0),
(23, 'Raymond Esparagoza', 'regs', 'nagkaon kaba rin ba?', '2025-03-23 22:59:19', 0),
(24, 'Raymond Esparagoza', 'Raymond Esparagoza', 'pogi', '2025-03-23 23:22:23', 0),
(27, 'Raymond Esparagoza', 'Reggie Hallare', 'hi', '2025-03-24 10:29:03', 0),
(28, 'Raymond Esparagoza', 'Reggie Hallare', 'oy', '2025-03-28 15:22:07', 0),
(29, 'Reggie Hallare', 'Raymond Esparagoza', 'baket pre?', '2025-03-28 15:22:33', 0),
(30, 'Raymond Esparagoza3', 'Raymond Esparagoza', 'qweqwe', '2025-03-28 15:41:57', 0),
(32, 'Reggie Hallare1', 'Raymond Esparagoza', '12323qwewe', '2025-03-28 16:18:44', 0),
(33, 'Reggie Hallare1', 'Raymond Esparagoza3', 'paree si reggie to', '2025-03-28 16:19:11', 0),
(34, 'Raymond Esparagoza3', 'Juan DelaCruz', 'tol?\r\n', '2025-03-28 16:20:01', 1),
(35, 'Raymond Esparagoza', 'Reggie Hallare1', 'oy', '2025-03-28 17:46:25', 1),
(36, 'Reggie Hallare1', 'Raymond Esparagoza3', 'oyyy pre', '2025-03-28 17:47:55', 0),
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
(61, 'Reggie Hallare1', 'Raymond Esparagoza3', 'pare si reggie hallare to pwede pautang load?', '2025-03-29 15:23:41', 0),
(62, 'Reggie Hallare1', 'juan delacruz', 'anya uwi kana daw sabi mama', '2025-03-29 15:23:55', 1),
(63, 'Raymond Esparagoza3', 'Reggie Hallare1', 'oy', '2025-03-29 15:24:49', 1),
(64, 'Juan DelaCruz', 'Raymond Esparagoza', 'pare', '2025-03-29 16:17:01', 0),
(65, 'Juan DelaCruz', 'Reggie Hallare1', 'si anya to ya', '2025-03-29 16:17:33', 1),
(66, 'Juan DelaCruz', 'Raymond Esparagoza3', 'pre si anyaaaaaah na to', '2025-03-29 17:03:32', 1),
(67, 'Raymond Esparagoza3', 'juan delacruz', 'mare', '2025-03-30 06:16:09', 1),
(68, 'Juan DelaCruz', 'Reggie Hallare1', 'reggie san ka?', '2025-03-30 06:19:29', 1);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `username`, `category`, `description`, `file_path`, `created_at`) VALUES
(1, 'User1', 'buying', 'awds', 'uploads/2x2241.jpg', '2025-02-11 15:14:21'),
(3, 'User1', 'buying', 'awdadasdadasdasdas', 'uploads/Untitled-1.jpg', '2025-02-11 15:48:11'),
(7, 'reggie', 'buying', 'buyinggg ako neto', 'uploads/formal.png', '2025-02-11 16:22:31'),
(8, '', 'buying', '123', 'uploads/123123123.jpg', '2025-02-13 14:44:52'),
(9, '', 'buying', '13123123', 'uploads/123123123.jpg', '2025-02-13 14:45:14'),
(10, '', 'buying', '1ssdfaw', 'uploads/berto.jpg', '2025-02-13 14:46:32'),
(11, 'xmond', 'buying', 'buying talong ni berto', 'uploads/berto.jpg', '2025-02-13 14:48:30'),
(12, 'mond', 'buying', 'buying ako nito mga nigga', 'uploads/emp2.JPG', '2025-02-13 15:14:18'),
(15, 'xmond', 'selling', 'Sell this okra seed', 'uploads/okra seed.jpg', '2025-02-28 14:43:58'),
(18, 'raymond1', 'buying', 'buyinggg ako nitong seen na to parekoy', 'uploads/okra seed.jpg', '2025-03-10 14:48:19'),
(21, 'reggie1', 'buying', 'buying ako nitong seed', 'uploads/okra seed.jpg', '2025-03-10 15:55:23'),
(27, 'raymond1', 'selling', 'sell this again i have 20pcs', 'uploads/eggplant.jpg', '2025-03-28 14:16:56'),
(28, 'raymond1', 'selling', 'sell this kalabasa seed 20pcs available', 'uploads/kalabasa.jpg', '2025-03-28 14:27:57'),
(29, 'reggie1', 'buying', 'buyingggggg', 'uploads/kalabasa.jpg', '2025-03-28 18:17:09'),
(31, 'juan', 'selling', 'Selling this tomatoes plant', 'uploads/tomato.jpg', '2025-03-29 16:20:10');

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
  `profile_image` varchar(255) NOT NULL DEFAULT 'uploads/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `password`, `img`, `status`, `created_at`, `profile_image`) VALUES
(1, 'raymond', 'Raymond Salgado', '$2y$10$fIteB6CFtCxExYNo.pK.6ObWJm6Vun0hjiL1GNC25La5bBFL.jGem', 'uploads/default.png', 'active', '2025-02-11 15:39:31', 'uploads/default.png'),
(3, 'xmond', 'Raymond Esparagoza', '$2y$10$.utDXoeYNat2SHElUlAcgOOiwHETNjVTFChcGY71RG77oIw8aYLsO', 'uploads/default.png', 'active', '2025-02-11 16:05:59', 'uploads/default.png'),
(4, 'aaa', 'wqe', '$2y$10$H9RXDfQQPUAHz9002hy15uQ99b1qBH4d5Vwu3NlWuOEqSXfoQuwLG', 'uploads/default.png', 'active', '2025-02-11 16:17:04', 'uploads/default.png'),
(5, 'reggie', 'Reggie Hallare', '$2y$10$YrR9n/nU9rPgyWGBAw2BMO80cSh.XFBDXfIptxpu633Sa.QbW5KwS', 'uploads/default.png', 'active', '2025-02-11 16:22:03', 'uploads/default.png'),
(7, 'mond', 'Raymond Esparagoza1', '$2y$10$qrIS1RqD6SWZ658dFbEL5uG2O79c/qjgylVE7e/DWrLZLIsqbPRaq', 'uploads/default.png', 'active', '2025-02-13 15:13:43', 'uploads/default.png'),
(9, 'xxmond', 'Raymond Esparagoza2', '$2y$10$fHhuoYI8O9HSHykemprpm.Vna3G1olMVWMaaHbi2QoAn9WbVE/n4S', 'uploads/default.png', 'active', '2025-02-16 12:52:06', 'uploads/default.png'),
(10, 'raymond1', 'Raymond Esparagoza3', '$2y$10$hYNd..ppjo/lop5cMfqIdeQfgEKMgnEJIx3KNsPkNJbkLTPQcZCZC', 'uploads/default.png', 'active', '2025-03-10 14:46:15', 'uploads/1741617975_2x2.jpg'),
(12, 'reggie1', 'Reggie Hallare1', '$2y$10$/oAkP43xs7l8k33ldY749e1XybasJNW4ZhnLajV4FGZvVWvGNNaZe', 'uploads/default.png', 'active', '2025-03-10 15:54:48', 'uploads/1741622088_1111.jpg'),
(13, 'juan', 'Juan DelaCruz', '$2y$10$HOuBGUM7wbWt6/3TlNJZtestWSXzvu3CFpuip8ok3xLZ8CY4U/NtK', 'uploads/default.png', 'active', '2025-03-24 13:02:12', 'uploads/1742821332_a2.jpg');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
