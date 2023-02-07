-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 06, 2023 at 11:07 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id19070639_searchengine`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `account_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `account_type` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_details`
--

INSERT INTO `account_details` (`account_id`, `email`, `fname`, `lname`, `account_type`, `password`, `created_at`) VALUES
(20, 'vijaay12@gmail.com', 'Vijayy', 'prabhu', 'reguser', '123', '2022-01-09 08:45:33'),
(21, 'summa@gmail.com', 'naaren', 'dhiraaaaaa', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', '2022-01-09 08:47:24'),
(22, 'qwerty@gmail.com', 'naren', 'dhiran', 'reguser', '123', '2022-01-10 14:23:05'),
(24, 'beardsa@gmail.com', 'Hashim', 'Amla', 'reguser', '123', '2022-01-10 14:33:13'),
(25, 'pradeep@gmail.com', 'Pradeep', 'Kumar', 'reguser', '111', '2022-01-10 14:34:40'),
(27, 'viratbhai@gmail.com', 'rohit', 'kholi', 'user', '123', '2022-01-10 16:17:29'),
(28, 'rohit@gmail.com', 'Rohit', 'prashanth', 'user', 'rohit', '2022-01-12 08:36:54'),
(29, 'boom@gmail.com', 'Bumrah', 'boom', 'reguser', 'sanj', '2022-01-12 16:15:48'),
(30, 'gill@gmail.com', 'Shubman', 'Gill', 'reguser', 'kkr', '2022-01-12 16:32:51'),
(32, 'lord@gmail.com', 'Shardul', 'Thakur', 'user', '31fe85ee055403d6e43657043c2b0ae3', '2022-01-12 17:42:02'),
(33, 'zxc@gmail.com', 'sdsds', 'sfsfsf', 'reguser', '202cb962ac59075b964b07152d234b70', '2022-01-12 17:43:19'),
(34, 'yadav@gmail.com', 'Umesh ', 'Yadav', 'reguser', 'e555f863fb09593119fe2f3459e9783a', '2020-01-12 17:44:08'),
(38, 'narenpugazh@gmail.com', 'Narendhiran', 'Pugazhendhi', 'admin', '202cb962ac59075b964b07152d234b70', '2022-01-12 18:15:32'),
(39, 'mithun@gmail.com', 'Mithun', 'RR', 'reguser', 'db413d6fbb1d9d0ced3e178e8adbcd97', '2022-06-08 12:45:45');

--
-- Triggers `account_details`
--
DELIMITER $$
CREATE TRIGGER `admin_insert` AFTER INSERT ON `account_details` FOR EACH ROW BEGIN
DECLARE temp_acc_id integer;
 IF new.account_type='admin'
 THEN
    SELECT
      account_id
    INTO
      temp_acc_id
    FROM
      account_details where account_type='admin' and account_id=new.account_id;
    insert into admin (account_id,admin_total_uploads) values (new.account_id,0);
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upload_rights_insert_admin` AFTER INSERT ON `account_details` FOR EACH ROW BEGIN
DECLARE temp_acc_id integer;
 IF new.account_type='admin'
 THEN
    SELECT
      account_id
    INTO
      temp_acc_id
    FROM
      account_details where account_type='admin' and account_id=new.account_id;
    insert into upload_rights (account_id) values (new.account_id);
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `upload_rights_insert_reg` AFTER UPDATE ON `account_details` FOR EACH ROW BEGIN
DECLARE temp_acc_id integer;
 IF new.account_type='reguser'
 THEN
 IF old.account_type='user'
 THEN
    SELECT
      account_id
    INTO
      temp_acc_id
    FROM
      account_details where account_type='reg_user' and account_id=new.account_id;
    insert into upload_rights (account_id) values (new.account_id);
  END IF;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `admin_total_uploads` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `account_id`, `admin_total_uploads`) VALUES
(3, 21, 21),
(4, 38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `location`, `name`, `author_id`, `media_type`, `title`, `description`, `status`, `comments`) VALUES
(23, 'Videos/Part-1-2-3.mp4', 'Part-1-2-3.mp4', 21, 'video', 'Sampletry', 'Random video ', 'approved', ''),
(25, 'Images/out_01.png', 'out_01.png', 21, 'image', 'Project Output', 'Output of project replicating amrita website', 'approved', ''),
(26, 'Images/Screenshot (1).png', 'Screenshot (1).png', 21, 'image', 'Screenshot ', 'Sample random ones', 'approved', ''),
(27, 'Videos/carz.mp4', 'carz.mp4', 21, 'video', 'Cars', 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people rather than goods.', 'approved', ''),
(30, 'https://www.cricbuzz.com/', 'website', 21, 'article', 'Crickbuzz', 'Get the T20 WC Live Cricket Score, Scorecard, Schedules of International and Domestic cricket matches along with Latest News, Videos and ICC Cricket ', 'approved', ''),
(31, 'https://www.w3schools.com/', 'website', 21, 'article', 'W3Schools', 'W3Schools is optimized for learning, testing, and training. Examples might be simplified to improve reading and basic understanding. Tutorials, references ', 'approved', ''),
(32, 'Images/Screenshot (65).png', 'Screenshot (65).png', 23, 'image', 'Rainbow', 'seven colours rainbow', 'approved', ''),
(33, 'https://aumscb.amrita.edu/aums/Jsp/Core_Common/index.jsp?task=off', 'website', 23, 'article', 'AUMS', 'Website for all amrita students for their assesment and marks publishment purpose', 'approved', 'none'),
(34, 'https://cms.cb.amrita.edu/login', 'website', 23, 'article', 'CMS Amrita', 'Website of CMS amrita university', 'approved', 'none'),
(35, 'https://www.amazon.in/', 'website', 23, 'article', 'Amazon', 'Amazon.in: Online Shopping India - Buy mobiles, laptops, cameras, books, watches, apparel, shoes and e-Gift Cards. Free Shipping & Cash on Delivery', 'approved', 'none'),
(36, 'Images/Jonny-Bairstow-batting-semifinal-match-England-Australia-2019.jpg', 'Jonny-Bairstow-batting-semifinal-match-England-Australia-2019.jpg', 23, 'image', 'Eng vs Aus', 'Bairstow unbeaten (121(58)) century guides england to victory ', 'approved', ''),
(37, 'Audios/Valimai-masstamilan.in.mp3', 'Valimai-masstamilan.in.mp3', 23, 'audio', 'valimai', 'whistle theme', 'approved', ''),
(51, 'Images/Screenshot (16).png', 'Screenshot (16).png', 21, 'image', 'sfsfsf', 'sfsfs', 'approved', 'none'),
(52, 'Audios/Eyy Beta Idhu En Patta-Masstamilan.In.mp3', 'Eyy Beta Idhu En Patta-Masstamilan.In.mp3', 21, 'audio', 'Pushpa the rise', 'Ey beta idhu ....', 'failed', 'None'),
(54, 'Images/Screenshot (60).png', 'Screenshot (60).png', 38, 'image', 'screenshot summa', 'Sample random ones', 'failed', 'None');

--
-- Triggers `content`
--
DELIMITER $$
CREATE TRIGGER `status` BEFORE INSERT ON `content` FOR EACH ROW BEGIN
SET new.status = "pending";
SET new.comments="none";
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `uploads add` AFTER INSERT ON `content` FOR EACH ROW BEGIN
DECLARE temp_uploads,temp_acc_type integer;
    SELECT account_type into temp_acc_type FROM account_details INNER JOIN content ON account_details.account_id=content.author_id where account_id=new.author_id and id=new.id;
 IF temp_acc_type='admin'
 THEN
 select admin_total_uploads into temp_uploads from admin where account_id = new.author_id;
 update admin set admin_total_uploads=temp_uploads+1 where account_id=new.author_id;
 END IF;
 IF temp_acc_type='reguser'
 THEN
select reg_user_total_uploads into temp_uploads from reg_user where account_id = new.author_id;
 update reg_user set reg_user_total_uploads=temp_uploads+1 where account_id=new.author_id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `location`, `name`, `author_id`) VALUES
(4, 'Images/Screenshot (1).png', 'Screenshot (1).png', 21),
(5, 'Images/Screenshot (18).png', 'Screenshot (18).png', 21),
(6, 'Images/out_01.png', 'out_01.png', 21),
(7, 'Images/Screenshot (16).png', 'Screenshot (16).png', 21),
(8, 'Images/Screenshot (16).png', 'Screenshot (16).png', 21),
(9, 'Images/Screenshot (42).png', 'Screenshot (42).png', 21),
(10, 'Images/Screenshot (54).png', 'Screenshot (54).png', 21),
(11, 'Images/Screenshot (40).png', 'Screenshot (40).png', 21),
(12, 'Images/Screenshot (51).png', 'Screenshot (51).png', 21),
(13, 'Images/Screenshot (47).png', 'Screenshot (47).png', 21),
(14, 'Images/Screenshot (47).png', 'Screenshot (47).png', 21),
(15, 'Images/Screenshot (50).png', 'Screenshot (50).png', 21);

-- --------------------------------------------------------

--
-- Table structure for table `order_seq`
--

CREATE TABLE `order_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) UNSIGNED NOT NULL,
  `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_seq`
--

INSERT INTO `order_seq` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
(134000, 1, 1000000, 1000, 133, 1000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `transaction_no` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` int(11) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `account_id` int(11) NOT NULL,
  `card_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `transaction_no`, `date`, `amount`, `purpose`, `account_id`, `card_no`) VALUES
(4, 1000, '2022-01-12 17:59:50', 200, 'Registration', 34, NULL),
(5, 1133, '2022-01-12 18:00:32', 100, 'Registration', 33, NULL),
(6, 1266, '2022-01-12 18:04:45', 150, 'Registration', 35, '50'),
(7, 1399, '2022-01-12 18:08:38', 200, 'Renewal', 36, 'md5(4673313211637018)'),
(8, 1532, '2022-01-12 18:10:25', 200, 'Registration', 37, '8326efa6bfd687e16fec9cdab3d426de');

--
-- Triggers `payments`
--
DELIMITER $$
CREATE TRIGGER `trans_no` BEFORE INSERT ON `payments` FOR EACH ROW BEGIN
SET new.transaction_no = NEXT VALUE FOR order_seq;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reg_user`
--

CREATE TABLE `reg_user` (
  `account_id` int(11) NOT NULL,
  `reg_user_total_uploads` int(11) NOT NULL,
  `reg_signup_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `scheme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_user`
--

INSERT INTO `reg_user` (`account_id`, `reg_user_total_uploads`, `reg_signup_date`, `scheme_id`) VALUES
(20, 0, '2022-01-09 08:46:27', 1),
(22, 0, '2022-01-10 14:23:37', 1),
(24, 0, '2022-01-10 14:33:38', 2),
(25, 0, '2022-01-10 14:35:06', 2),
(29, 0, '2022-01-12 16:16:33', 3),
(30, 0, '2022-01-12 16:33:43', 3),
(33, 0, '2022-01-12 18:00:31', 1),
(34, 0, '2022-01-12 17:59:48', 3),
(39, 0, '2022-06-08 16:35:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `renewal_details`
--

CREATE TABLE `renewal_details` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `scheme_id` int(11) NOT NULL,
  `reg_signup_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `scheme`
--

CREATE TABLE `scheme` (
  `scheme_id` int(11) NOT NULL,
  `scheme_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheme`
--

INSERT INTO `scheme` (`scheme_id`, `scheme_type`) VALUES
(1, 'Basic'),
(3, 'Premium'),
(2, 'Standard');

-- --------------------------------------------------------

--
-- Table structure for table `scheme_details`
--

CREATE TABLE `scheme_details` (
  `scheme_type` varchar(255) NOT NULL,
  `scheme_description` varchar(255) NOT NULL,
  `scheme_price_rupees` int(11) NOT NULL,
  `scheme_tenure_years` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scheme_details`
--

INSERT INTO `scheme_details` (`scheme_type`, `scheme_description`, `scheme_price_rupees`, `scheme_tenure_years`) VALUES
('Basic', 'For Normal Use', 1000, 1),
('Premium', 'For Organization', 50000, 3),
('Standard', 'For Small Offices', 10000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `date_visited` timestamp NOT NULL DEFAULT current_timestamp(),
  `keyword_entered` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `search_history`
--

INSERT INTO `search_history` (`id`, `account_id`, `date_visited`, `keyword_entered`) VALUES
(5, 21, '2022-01-10 17:22:18', 'scree'),
(6, 21, '2022-01-10 17:23:21', 'scree'),
(7, 21, '2022-01-10 17:24:20', 'scree'),
(8, 21, '2022-01-10 17:25:40', 'scree'),
(9, 21, '2022-01-10 17:51:11', 'kohli'),
(10, 21, '2022-01-11 15:07:19', 'scree'),
(11, 21, '2022-01-11 15:07:38', 'scree'),
(12, 21, '2022-01-12 01:37:40', 'part'),
(13, 21, '2022-01-12 01:43:42', 'scree'),
(14, 21, '2022-01-12 01:44:18', 'scree'),
(15, 21, '2022-01-12 01:44:35', 'sfsfsfsf'),
(16, 21, '2022-01-12 01:44:45', 'sfsfsfsf'),
(17, 21, '2022-01-12 01:45:28', 'sfsfsfsf'),
(18, 21, '2022-01-12 02:33:00', 'part'),
(19, 21, '2022-01-12 02:33:41', 'part'),
(20, 21, '2022-01-12 02:33:50', 'part'),
(21, 21, '2022-01-12 02:34:22', 'part'),
(22, 21, '2022-01-12 02:34:28', 'scree'),
(23, 21, '2022-01-12 02:34:46', 'sample'),
(24, 21, '2022-01-12 02:36:34', 'sample'),
(25, 21, '2022-01-12 02:36:58', 'sample'),
(26, 21, '2022-01-12 02:38:06', 'sample'),
(27, 21, '2022-01-12 02:38:20', 'scree'),
(28, 21, '2022-01-12 02:39:08', 'scree'),
(29, 21, '2022-01-12 02:39:28', 'scree'),
(30, 21, '2022-01-12 02:39:33', 'scree'),
(31, 21, '2022-01-12 02:40:12', 'scree'),
(32, 21, '2022-01-12 02:40:34', 'scree'),
(33, 21, '2022-01-12 02:40:37', 'scree'),
(34, 21, '2022-01-12 03:15:28', 'scree'),
(35, 21, '2022-01-12 03:16:12', 'scree'),
(36, 21, '2022-01-12 03:18:13', 'scree'),
(37, 21, '2022-01-12 03:18:25', 'part'),
(38, 21, '2022-01-12 03:36:58', 'part'),
(39, 21, '2022-01-12 03:37:08', 'part'),
(40, 21, '2022-01-12 03:38:27', 'part'),
(41, 21, '2022-01-12 03:38:57', 'part'),
(42, 21, '2022-01-12 03:39:39', 'part'),
(43, 21, '2022-01-12 03:40:44', 'part'),
(44, 21, '2022-01-12 03:42:08', 'part'),
(45, 21, '2022-01-12 03:43:16', 'part'),
(46, 21, '2022-01-12 03:43:23', 'part'),
(47, 21, '2022-01-12 03:43:42', 'part'),
(48, 21, '2022-01-12 03:43:45', 'part'),
(49, 21, '2022-01-12 03:43:54', 'part'),
(50, 21, '2022-01-12 03:44:34', 'part'),
(51, 21, '2022-01-12 03:44:59', 'part'),
(52, 21, '2022-01-12 03:45:02', 'part'),
(53, 21, '2022-01-12 03:46:31', 'part'),
(54, 21, '2022-01-12 03:46:44', 'part'),
(55, 21, '2022-01-12 03:47:07', 'part'),
(56, 21, '2022-01-12 03:48:34', 'part'),
(57, 21, '2022-01-12 03:51:58', 'scree'),
(58, 21, '2022-01-12 04:23:23', 'scree'),
(59, 21, '2022-01-12 04:23:32', 'naa'),
(60, 21, '2022-01-12 04:28:08', 'naar'),
(61, 21, '2022-01-12 04:28:13', 'naar'),
(62, 21, '2022-01-12 04:28:30', 'naar'),
(63, 21, '2022-01-12 04:28:39', 'naar'),
(64, 21, '2022-01-12 04:30:01', 'naar'),
(65, 21, '2022-01-12 04:30:06', 'naar'),
(66, 21, '2022-01-12 04:30:36', 'naar'),
(67, 21, '2022-01-12 04:30:41', 'naar'),
(68, 21, '2022-01-12 04:31:13', 'naar'),
(69, 21, '2022-01-12 04:31:20', 'naar'),
(70, 21, '2022-01-12 04:32:36', 'naar'),
(71, 21, '2022-01-12 04:32:56', 'naa'),
(72, 21, '2022-01-12 04:33:43', 'naa'),
(73, 21, '2022-01-12 04:44:43', 'scree'),
(74, 21, '2022-01-12 04:45:33', 'scree'),
(75, 21, '2022-01-12 04:47:29', 'scree'),
(76, 21, '2022-01-12 04:47:51', 'scree'),
(77, 21, '2022-01-12 04:48:06', 'scree'),
(78, 21, '2022-01-12 04:48:48', 'vali'),
(79, 21, '2022-01-12 04:49:36', 'vali'),
(80, 21, '2022-01-12 04:50:50', 'vali'),
(81, 21, '2022-01-12 04:55:20', 'vali'),
(82, 21, '2022-01-12 05:03:17', 'scree'),
(83, 21, '2022-01-12 05:19:23', 'cric'),
(84, 21, '2022-01-12 05:20:11', 'cric'),
(85, 21, '2022-01-12 05:21:05', 'cric'),
(86, 21, '2022-01-12 05:22:40', 'cric'),
(87, 21, '2022-01-12 05:22:45', 'cric'),
(88, 21, '2022-01-12 05:23:08', 'cric'),
(89, 21, '2022-01-12 05:24:54', 'scree'),
(90, 21, '2022-01-12 05:25:26', 'naa'),
(91, 21, '2022-01-12 07:05:50', 'naa'),
(92, 23, '2022-01-12 09:53:11', 'scree'),
(93, 23, '2022-01-12 10:17:42', 'aums'),
(94, 23, '2022-01-12 10:43:25', 'cric'),
(95, 23, '2022-01-12 10:43:36', 'bair'),
(96, 21, '2022-01-12 11:11:44', 'val'),
(97, 21, '2022-01-12 11:11:55', 'scree'),
(98, 21, '2022-01-12 11:57:01', 'scree'),
(99, 21, '2022-01-12 11:58:21', 'scree'),
(100, 21, '2022-01-12 11:59:44', 'scree'),
(101, 21, '2022-01-12 12:00:14', 'scree'),
(102, 21, '2022-01-12 12:00:51', 'scree'),
(103, 21, '2022-01-12 12:01:06', 'naa'),
(104, 21, '2022-01-12 12:09:31', 'scree'),
(105, 21, '2022-01-12 14:42:49', 'naa'),
(106, 21, '2022-01-12 14:44:42', 'naa'),
(107, 21, '2022-01-12 14:45:41', 'naa'),
(108, 21, '2022-01-12 14:45:45', 'naa'),
(109, 21, '2022-01-12 14:47:42', 'naa'),
(110, 21, '2022-01-12 14:48:28', 'naa'),
(111, 21, '2022-01-12 14:49:37', 'naa'),
(112, 23, '2022-01-12 17:13:22', 'dean'),
(113, 23, '2022-01-12 17:14:06', 'dean'),
(114, 23, '2022-01-12 17:14:11', 'dean'),
(115, 28, '2022-01-12 17:21:11', 'scree'),
(116, 28, '2022-01-12 17:21:26', 'elgar'),
(117, 39, '2022-06-08 12:46:14', 'scree');

-- --------------------------------------------------------

--
-- Table structure for table `upload_rights`
--

CREATE TABLE `upload_rights` (
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `upload_rights`
--

INSERT INTO `upload_rights` (`account_id`) VALUES
(20),
(21),
(22),
(24),
(25),
(29),
(30),
(33),
(38),
(39);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`account_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content` (`author_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images` (`author_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_no` (`transaction_no`);

--
-- Indexes for table `reg_user`
--
ALTER TABLE `reg_user`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `scheme_id` (`scheme_id`);

--
-- Indexes for table `renewal_details`
--
ALTER TABLE `renewal_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `renewal_details` (`account_id`);

--
-- Indexes for table `scheme`
--
ALTER TABLE `scheme`
  ADD PRIMARY KEY (`scheme_id`),
  ADD UNIQUE KEY `scheme_type` (`scheme_type`);

--
-- Indexes for table `scheme_details`
--
ALTER TABLE `scheme_details`
  ADD PRIMARY KEY (`scheme_type`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_history` (`account_id`);

--
-- Indexes for table `upload_rights`
--
ALTER TABLE `upload_rights`
  ADD PRIMARY KEY (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
