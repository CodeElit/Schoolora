-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2018 at 06:59 PM
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
-- Database: `schoolora`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `subject_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `subject_name`) VALUES
(1, 'science');

-- --------------------------------------------------------

--
-- Table structure for table `quans`
--

CREATE TABLE `quans` (
  `qid` int(11) NOT NULL,
  `question` varchar(1000) DEFAULT NULL,
  `askedby` varchar(25) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `answerdby` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quans`
--

INSERT INTO `quans` (`qid`, `question`, `askedby`, `answer`, `answerdby`) VALUES
(1, 'can any one explain kepler\'s law..', 'jeevottam', 'Johannes Kepler, working with data painstakingly collected by Tycho Brahe without the aid of a telescope, developed three laws which described the motion of the planets across the sky.\r\n\r\n1. The Law of Orbits: All planets move in elliptical orbits, with the sun at one focus.\r\n\r\n2. The Law of Areas: A line that connects a planet to the sun sweeps out equal areas in equal times.\r\n\r\n3. The Law of Periods: The square of the period of any planet is proportional to the cube of the semimajor axis of its orbit.\r\n\r\nKepler\'s laws were derived for orbits around the sun, but they apply to satellite orbits as well.', 'admin'),
(2, 'Kepler\'s three laws of planetary motion', 'jeevottam', 'an be stated as follows: (1) All planets move about the Sun in elliptical orbits, having the Sun as one of the foci. (2) A radius vector joining any planet to the Sun sweeps out equal areas in equal lengths of time.', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `qucategory`
--

CREATE TABLE `qucategory` (
  `cid` int(11) NOT NULL,
  `qid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qucategory`
--

INSERT INTO `qucategory` (`cid`, `qid`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE `upvotes` (
  `qid` int(11) NOT NULL,
  `upvote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `user_name`, `pass`, `join_date`) VALUES
(1, 'root', 'root', NULL, '2018-11-05 15:33:17'),
(2, 'Jeevottam Lokurti', 'jeevottam', 'jeevo123', '2018-11-06 18:23:18'),
(3, 'Jeevottam l', '', '', '2018-11-07 13:00:34'),
(4, 'Jeevottam l', '', '', '2018-11-07 13:03:10'),
(5, 'Chart', 'jeevottamlokurti@gma', 'jeevo', '2018-11-07 13:05:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `quans`
--
ALTER TABLE `quans`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `qucategory`
--
ALTER TABLE `qucategory`
  ADD PRIMARY KEY (`cid`,`qid`);

--
-- Indexes for table `upvotes`
--
ALTER TABLE `upvotes`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quans`
--
ALTER TABLE `quans`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
