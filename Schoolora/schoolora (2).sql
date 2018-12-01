-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2018 at 08:38 AM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatevote` (`qid` INT(11), `upvotes` INT(11))  BEGIN
  UPDATE upvotes SET upvote =upvotes WHERE id=qid;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userupvote` (`id` INT(11), `username` VARCHAR(255))  BEGIN
   INSERT into userupvote(id,username) values (id,username);
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validate_user` (IN `age` INT(11), IN `email` VARCHAR(255))  NO SQL
    DETERMINISTIC
BEGIN
	IF age < 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Improper age';
	END IF;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vote` (`id` INT(11))  BEGIN 
INSERT INTO upvotes  (id,upvote) VALUES (id,0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `votecount` (IN `id` INT(11))  BEGIN
   SELECT id,count(id)  FROM userupvote u where u.id=id GROUP by (id);
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Science'),
(2, 'Social Studies'),
(3, 'English'),
(4, 'Mathematics');

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
(41, 'English'),
(51, 'English'),
(55, 'English'),
(56, 'English'),
(46, 'Mathematics'),
(48, 'Science'),
(49, 'Science'),
(50, 'Science'),
(52, 'Science'),
(53, 'Science'),
(57, 'Science'),
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
(41, 'what are verb tenses', 'Verb tenses. The tense of a verb tells you when a person did something or when something existed or happened. In English, there are three main tenses: the present, the past, and the future.<br>or<br>aa', 'jeevottam', 'root'),
(46, 'What is Srinivasa Ramanujans magic square?', 'aa', 'root', 'root'),
(47, 'The impact of Alauddin Khilji', 'The shockingly rapid progress of Turkic and then Mongol hordes through the world from roughly the 10th century begs the question of why they were so successful in the first place. Their meritocratic, well-drilled and highly mobile cavalry armies crushed larger forces from China to Hungary and India. However, their true talent lay in psychological warfare.', 'root', 'root'),
(48, 'Carbon bonding', 'Prof. Arunan from the Department of Inorganic and Physical Chemistry led an international task group formed by', 'root', 'root'),
(49, 'Carbonâ€“oxygen bond', NULL, 'root', NULL),
(50, 'can any one explain keplers law..', 'aa', 'root', 'root'),
(51, 'What is a example of a noun?', 'name place or a thing', 'root', 'Admin'),
(52, 'what is photosynthesis', 'the process of  breaking down plants food into glucose and salts present in water in the presence of sunlight is called photosynthesis ..for funny answers contact 9686222753', 'root', 'root'),
(53, 'what is thermodynamics', NULL, 'root', NULL),
(54, 'Who was Alauddin Khilji wife?', 'Malika-i-Jahan (wife of Alauddin Khalji) Malika-i-Jahan (\"Queen of the World\") was the first and chief wife of Sultan Alauddin Khalji, the second and most powerful ruler of the Khalji dynasty that ruled the Delhi Sultanate.', 'root', 'root'),
(55, 'what is pronoun', NULL, 'root', NULL),
(56, 'what is adjective', 'adjective', 'root', 'root'),
(57, 'why this site', 'for project', 'amoghana', 'amoghana');

-- --------------------------------------------------------

--
-- Stand-in structure for view `search`
-- (See below for the actual view)
--
CREATE TABLE `search` (
`id` int(11) unsigned
,`question` mediumtext
,`answer` longtext
,`answeredby` varchar(255)
,`askedby` varchar(255)
,`upvote` int(11)
);

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
(54, 0),
(47, 1),
(52, 1),
(53, 1),
(55, 1),
(56, 1),
(57, 1),
(41, 2),
(46, 2),
(48, 2),
(49, 2),
(51, 2),
(50, 4);

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
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `join_date`, `age`) VALUES
(30, '321321321321321321321321', '$2y$10$/ZiS9r6ZxJG1jWo4WIenmOj2GAAtKVlciMz4VLcLM1K3LYTGdry2y', '65465498756421', '141741@gmail.com', '2018-11-23 05:07:54', 12),
(24, 'Admin', '$2y$10$aSYfr7ZSuv4jWCMykdIkTejlKKG0rKr1qHS2LFc3mm5E5izFi9qVa', 'admin', 'admin@schoolora.com', '2018-11-13 17:54:27', 14),
(23, 'amoghana', '$2y$10$uPpo3cwNsQc187xglsKR2.7jUr5hq.hrdqmywScu3NsBvd7krgSt2', 'amoghana', 'amoghana.lokurti@wipro.com', '2018-11-12 17:15:24', 13),
(26, 'codeelit', '$2y$10$o7il/5eTZ2FQqYgm9oYwnOEeCnkn5cf9JoT0zdEKobEzT8INfbFvy', 'Code Elit', 'jdkcodeelit@gmail.com', '2018-11-15 15:52:05', 18),
(27, 'djhacker', '$2y$10$7jYjF5oHLg0yo4lJAtILvelv5Np7znJxnq8YM2pG8DuKGGkQ4wW/2', 'djhacker', 'djhacker@gmail.com', '2018-11-20 15:51:08', 12),
(31, 'jyo', '$2y$10$DzP7dJatEh51qZijijZXleJCy27E1VrLNR7XKczLnSxVSmUh2cI5O', 'jyo', 'jyo@gail.com', '2018-11-23 06:02:14', 12),
(25, 'kathik', '$2y$10$tLUkCvCLFatxAtgKIakdF.Nw1eO5caqxFn9EL8VaE/aybDeEQbDJa', 'karthik', 'karthik808@gmail.com', '2018-11-15 15:50:33', 12),
(21, 'root', '$2y$10$.tEu45YxCNxdk8VZft1LyuzVLlPXIhYmKpz0usPUHCAveC13HNC02', 'Chart', 'amoghana.lokurti@wipro.com', '2018-11-09 08:21:55', 14),
(28, 'root321321', '$2y$10$4wu66eHe4OnXByMxIpQgaOHAZo9IFUPjWa.NreFLDaxMcCLt9V14O', '321321321', '321321321@gmail.com', '2018-11-23 05:05:47', 12);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `validate_user_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
	CALL validate_user(NEW.age, NEW.email);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userupvote`
--

CREATE TABLE `userupvote` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userupvote`
--

INSERT INTO `userupvote` (`id`, `username`) VALUES
(41, 'jyo'),
(41, 'root'),
(46, 'jyo'),
(46, 'root'),
(47, 'root'),
(48, 'codeelit'),
(48, 'root'),
(49, 'codeelit'),
(49, 'root'),
(50, 'Admin'),
(50, 'codeelit'),
(50, 'jyo'),
(50, 'root'),
(51, 'Admin'),
(51, 'root'),
(52, 'codeelit'),
(53, 'root'),
(55, 'root'),
(56, 'jyo'),
(57, 'Admin');

-- --------------------------------------------------------

--
-- Structure for view `search`
--
DROP TABLE IF EXISTS `search`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `search`  AS  select `q`.`id` AS `id`,`q`.`question` AS `question`,`q`.`answer` AS `answer`,`q`.`answeredby` AS `answeredby`,`q`.`askedby` AS `askedby`,`u`.`upvote` AS `upvote` from (`upvotes` `u` join `quans` `q`) where (`q`.`id` = `u`.`id`) ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quans`
--
ALTER TABLE `quans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quacat`
--
ALTER TABLE `quacat`
  ADD CONSTRAINT `quacat_ibfk_1` FOREIGN KEY (`id`) REFERENCES `quans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quacat_ibfk_3` FOREIGN KEY (`category`) REFERENCES `category` (`name`) ON DELETE CASCADE;

--
-- Constraints for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD CONSTRAINT `quacat_ibfk_2` FOREIGN KEY (`id`) REFERENCES `quans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userupvote`
--
ALTER TABLE `userupvote`
  ADD CONSTRAINT `userupvote_ibfk_1` FOREIGN KEY (`id`) REFERENCES `quans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
