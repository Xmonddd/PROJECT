-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2025 at 01:04 PM
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
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender`, `receiver`, `message`, `timestamp`) VALUES
(8, 'regs', 'xmond', 'kumain kana', '2025-03-23 22:21:42'),
(9, 'regs', 'xmond', 'oo naman ako paba?', '2025-03-23 22:22:00'),
(11, 'xmond', 'raymond', 'hello bebi number 1', '2025-03-23 22:32:39'),
(12, 'reggie', 'xmond', 'bebi', '2025-03-23 22:34:22'),
(13, 'xmond', 'reggie', 'bakit bebi', '2025-03-23 22:35:06'),
(20, 'xmond', 'reggie', 'pre', '2025-03-23 22:50:20'),
(22, 'xmond', 'aaa', 'pre', '2025-03-23 22:54:09'),
(23, 'xmond', 'regs', 'nagkaon kaba rin ba?', '2025-03-23 22:59:19'),
(24, 'xmond', 'xmond', 'pogi', '2025-03-23 23:22:23'),
(27, 'xmond', 'reggie', 'hi', '2025-03-24 10:29:03');

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
(18, 'raymond1', 'buying', 'buyinggg ako nitooooo parekoy', 'uploads/okra seed.jpg', '2025-03-10 14:48:19'),
(19, 'raymond1', 'buying', 'burgis', 'uploads/481098066_9990814834267103_8963652169202346633_n.jpg', '2025-03-10 15:20:25'),
(20, 'raymond1', 'selling', 'burgiss mo', 'uploads/480855547_9080326622090471_7981972995620375903_n.jpg', '2025-03-10 15:21:59'),
(21, 'reggie1', 'buying', 'buying ako nitong seed', 'uploads/okra seed.jpg', '2025-03-10 15:55:23');

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
(1, 'raymond', '', '$2y$10$fIteB6CFtCxExYNo.pK.6ObWJm6Vun0hjiL1GNC25La5bBFL.jGem', 'uploads/default.png', 'active', '2025-02-11 15:39:31', 'uploads/default.png'),
(3, 'xmond', 'Raymond Esparagoza', '$2y$10$.utDXoeYNat2SHElUlAcgOOiwHETNjVTFChcGY71RG77oIw8aYLsO', 'uploads/default.png', 'active', '2025-02-11 16:05:59', 'uploads/default.png'),
(4, 'aaa', 'wqe', '$2y$10$H9RXDfQQPUAHz9002hy15uQ99b1qBH4d5Vwu3NlWuOEqSXfoQuwLG', 'uploads/default.png', 'active', '2025-02-11 16:17:04', 'uploads/default.png'),
(5, 'reggie', 'Reggie Hallare', '$2y$10$YrR9n/nU9rPgyWGBAw2BMO80cSh.XFBDXfIptxpu633Sa.QbW5KwS', 'uploads/default.png', 'active', '2025-02-11 16:22:03', 'uploads/default.png'),
(7, 'mond', 'Raymond Esparagoza', '$2y$10$qrIS1RqD6SWZ658dFbEL5uG2O79c/qjgylVE7e/DWrLZLIsqbPRaq', 'uploads/default.png', 'active', '2025-02-13 15:13:43', 'uploads/default.png'),
(9, 'xxmond', 'Raymond Esparagoza1', '$2y$10$fHhuoYI8O9HSHykemprpm.Vna3G1olMVWMaaHbi2QoAn9WbVE/n4S', 'uploads/default.png', 'active', '2025-02-16 12:52:06', 'uploads/default.png'),
(10, 'raymond1', 'Raymond Esparagoza', '$2y$10$hYNd..ppjo/lop5cMfqIdeQfgEKMgnEJIx3KNsPkNJbkLTPQcZCZC', 'uploads/default.png', 'active', '2025-03-10 14:46:15', 'uploads/1741617975_2x2.jpg'),
(12, 'reggie1', 'Reggie Hallare', '$2y$10$/oAkP43xs7l8k33ldY749e1XybasJNW4ZhnLajV4FGZvVWvGNNaZe', 'uploads/default.png', 'active', '2025-03-10 15:54:48', 'uploads/1741622088_1111.jpg'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
