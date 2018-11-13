-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2018 at 03:14 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `userupvote` (`id` INT(11), `username` VARCHAR(255))  BEGIN
   INSERT into userupvote(id,username) values (id,username);
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vote` (`id` INT(11))  BEGIN 
INSERT INTO upvotes  (id,upvote) VALUES (id,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vote1` (IN `id` INT(11))  BEGIN
   INSERT into downvotes (id,downvote) VALUES (id,0);
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Science', ''),
(2, 'Social Studies', ''),
(3, 'English', ''),
(4, 'Mathematics', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `display`
-- (See below for the actual view)
--
CREATE TABLE `display` (
`id` int(11) unsigned
,`answer` longtext
,`question` mediumtext
,`askedby` varchar(255)
,`answeredby` varchar(255)
,`upvote` int(11)
,`downvote` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `downvotes`
--

CREATE TABLE `downvotes` (
  `id` int(11) UNSIGNED NOT NULL,
  `downvote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downvotes`
--

INSERT INTO `downvotes` (`id`, `downvote`) VALUES
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(1, 1),
(45, 20);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myquestion`
-- (See below for the actual view)
--
CREATE TABLE `myquestion` (
);

-- --------------------------------------------------------

--
-- Table structure for table `quacat`
--

CREATE TABLE `quacat` (
  `id` int(11) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quacat`
--

INSERT INTO `quacat` (`id`, `category`) VALUES
(51, 'English'),
(55, 'English'),
(56, 'English'),
(44, 'Mathematics'),
(46, 'Mathematics'),
(1, 'Science'),
(45, 'Science'),
(48, 'Science'),
(49, 'Science'),
(50, 'Science'),
(52, 'Science'),
(53, 'Science'),
(57, 'Science'),
(42, 'Social Studies'),
(43, 'Social Studies'),
(47, 'Social Studies'),
(54, 'Social Studies');

-- --------------------------------------------------------

--
-- Table structure for table `quans`
--

CREATE TABLE `quans` (
  `id` int(11) UNSIGNED NOT NULL,
  `question` mediumtext NOT NULL,
  `answer` longtext,
  `askedby` varchar(255) NOT NULL,
  `answeredby` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quans`
--

INSERT INTO `quans` (`id`, `question`, `answer`, `askedby`, `answeredby`) VALUES
(1, 'keplers law', 'The Law of Orbits: All planets move in elliptical orbits, with the sun at one focus. 2. The Law of Areas: A line that connects a planet to the sun sweeps out equal areas in equal times. 3. The Law of Periods: The square of the period of any planet is proportional to the cube of the semimajor axis of its orbit.<br>or<br>nice answer jeevottam<br>or<br>ya<br>or<br>kk<br>or<br>kk<br>or<br>aa<br>or<br>00', 'root', 'root'),
(41, 'what are verb tenses', 'Verb tenses. The tense of a verb tells you when a person did something or when something existed or happened. In English, there are three main tenses: the present, the past, and the future.<br>or<br>aa', 'jeevottam', 'root'),
(42, 'name the flag which was designed by gandhiji in 1921', 'swaraj flag<br>or<br>aa', 'root', 'root'),
(43, 'in which year did nepal became a constitutional monarchy?', 'Nepal became a constitutional monarchy after the Jana Andolan movement when the new Constitution was adopted i.e. in November 1990. <br>or<br>nice<br>or<br>gg', 'root', 'root'),
(44, 'How did i do this website', 'gg', 'root', 'root'),
(45, 'What are the best books to learn algorithms and data structures?', 'Padma reddy', 'root', 'root'),
(46, 'What is Srinivasa Ramanujan\'s magic square?', NULL, 'root', NULL),
(47, 'The impact of Alauddin Khilji', 'The shockingly rapid progress of Turkic and then Mongol hordes through the world from roughly the 10th century begs the question of why they were so successful in the first place. Their meritocratic, well-drilled and highly mobile cavalry armies crushed larger forces from China to Hungary and India. However, their true talent lay in psychological warfare.', 'root', 'root'),
(48, 'Carbon bonding', NULL, 'root', NULL),
(49, 'Carbonâ€“oxygen bond', NULL, 'root', NULL),
(50, 'can any one explain kepler\'s law..', NULL, 'root', NULL),
(51, 'What is a example of a noun?', NULL, 'root', NULL),
(52, 'what is photosynthesis', 'the process of  breaking down plants food into glucose and salts present in water in the presence of sunlight is called photosynthesis ..for funny answers contact 9686222753', 'root', 'root'),
(53, 'what is thermodynamics', NULL, 'root', NULL),
(54, 'Who was Alauddin Khilji wife?', 'Malika-i-Jahan (wife of Alauddin Khalji) Malika-i-Jahan (\"Queen of the World\") was the first and chief wife of Sultan Alauddin Khalji, the second and most powerful ruler of the Khalji dynasty that ruled the Delhi Sultanate.', 'root', 'root'),
(55, 'what is pronoun', NULL, 'root', NULL),
(56, 'what is adjective', NULL, 'root', NULL),
(57, 'why this site', 'for project', 'amoghana', 'amoghana');

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE `upvotes` (
  `id` int(11) UNSIGNED NOT NULL,
  `upvote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upvotes`
--

INSERT INTO `upvotes` (`id`, `upvote`) VALUES
(1, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 1),
(41, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `join_date`) VALUES
(23, 'amoghana', '$2y$10$uPpo3cwNsQc187xglsKR2.7jUr5hq.hrdqmywScu3NsBvd7krgSt2', 'amoghana', 'amoghana.lokurti@wipro.com', '2018-11-12 17:15:24'),
(19, 'jeevottam', 'jeevo123', 'Jeevottam', '', '2018-11-09 08:20:48'),
(21, 'root', '$2y$10$.tEu45YxCNxdk8VZft1LyuzVLlPXIhYmKpz0usPUHCAveC13HNC02', 'Chart', 'amoghana.lokurti@wipro.com', '2018-11-09 08:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `userupvote`
--

CREATE TABLE `userupvote` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `display`
--
DROP TABLE IF EXISTS `display`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `display`  AS  select `q`.`id` AS `id`,`q`.`answer` AS `answer`,`q`.`question` AS `question`,`q`.`askedby` AS `askedby`,`q`.`answeredby` AS `answeredby`,`u`.`upvote` AS `upvote`,`d`.`downvote` AS `downvote` from ((`quans` `q` join `upvotes` `u`) join `downvotes` `d`) where ((`q`.`id` = `u`.`id`) and (`q`.`id` = `d`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `myquestion`
--
DROP TABLE IF EXISTS `myquestion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myquestion`  AS  select `q`.`id` AS `id`,`q`.`question` AS `question`,`q`.`askedby` AS `askedby`,`q`.`answeredby` AS `answeredby`,`q`.`answer` AS `answer`,`u`.`upvotes` AS `upvotes`,`d`.`downvotes` AS `downvotes` from ((`quans` `q` join `upvotes` `u`) join `downvotes` `d`) where ((`q`.`id` = `u`.`id`) and (`q`.`id` = `d`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`,`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `downvotes`
--
ALTER TABLE `downvotes`
  ADD PRIMARY KEY (`downvote`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `quacat`
--
ALTER TABLE `quacat`
  ADD PRIMARY KEY (`category`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `quans`
--
ALTER TABLE `quans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `askedby` (`askedby`);

--
-- Indexes for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`upvote`,`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `userupvote`
--
ALTER TABLE `userupvote`
  ADD PRIMARY KEY (`id`,`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quans`
--
ALTER TABLE `quans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `downvotes`
--
ALTER TABLE `downvotes`
  ADD CONSTRAINT `quacat_ibfk_4` FOREIGN KEY (`id`) REFERENCES `quans` (`id`);

--
-- Constraints for table `quacat`
--
ALTER TABLE `quacat`
  ADD CONSTRAINT `quacat_ibfk_1` FOREIGN KEY (`id`) REFERENCES `quans` (`id`),
  ADD CONSTRAINT `quacat_ibfk_3` FOREIGN KEY (`category`) REFERENCES `category` (`name`);

--
-- Constraints for table `quans`
--
ALTER TABLE `quans`
  ADD CONSTRAINT `quans_ibfk_1` FOREIGN KEY (`askedby`) REFERENCES `users` (`username`);

--
-- Constraints for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD CONSTRAINT `quacat_ibfk_2` FOREIGN KEY (`id`) REFERENCES `quans` (`id`);

--
-- Constraints for table `userupvote`
--
ALTER TABLE `userupvote`
  ADD CONSTRAINT `userupvote_ibfk_1` FOREIGN KEY (`id`) REFERENCES `quans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
