-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2015 at 08:35 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Assignment 7`
--

-- --------------------------------------------------------

--
-- Table structure for table `AlbumDimension`
--

CREATE TABLE IF NOT EXISTS `AlbumDimension` (
  `album_key` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `cover_image` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AlbumDimension`
--

INSERT INTO `AlbumDimension` (`album_key`, `album_id`, `title`, `cover_image`) VALUES
(2001, 2001, 'Room for Squares', 'https://upload.wikimedia.org/wikipedia/en/5/5a/JohnMayer_RoomForSquares.jpg'),
(2002, 2002, 'Circus', 'https://upload.wikimedia.org/wikipedia/en/e/e1/Circus-_Album.png'),
(2003, 2003, 'Ketchup', 'https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png'),
(2004, 2004, 'The Truth About Love', 'https://upload.wikimedia.org/wikipedia/en/7/7e/The_Truth_About_Love.png'),
(2005, 2005, 'Rolling Stones', 'http://www.rollingstones.com/'),
(2006, 2006, 'Poison', 'https://en.wikipedia.org/wiki/Poison_(American_band)'),
(2007, 2007, 'Summer of 69', 'https://en.wikipedia.org/wiki/Summer_of_%2769'),
(2008, 2008, 'Venga Boyz', 'https://en.wikipedia.org/wiki/Vengaboys'),
(2009, 2009, 'Boom Boom', 'https://en.wikipedia.org/wiki/Boom_Boom_(John_Lee_Hooker_song)'),
(2010, 2010, 'Rock On', 'https://en.wikipedia.org/wiki/Rock_On!!');

-- --------------------------------------------------------

--
-- Table structure for table `AlbumReleaseFact`
--

CREATE TABLE IF NOT EXISTS `AlbumReleaseFact` (
  `calendar_key` int(11) NOT NULL,
  `album_key` int(11) NOT NULL,
  `artist_key` int(11) NOT NULL,
  `publisher_key` int(11) NOT NULL,
  `number_of_release` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AlbumReleaseFact`
--

INSERT INTO `AlbumReleaseFact` (`calendar_key`, `album_key`, `artist_key`, `publisher_key`, `number_of_release`) VALUES
(3345, 34445, 2222, 4544, 1),
(4334, 33435, 2345, 3544, 2),
(23239, 34343, 2323, 45545, 2),
(434435, 6767, 4545, 67765, 1),
(454353, 3334, 3423, 4343, 2),
(454543, 3433, 1222, 3456, 1),
(20010605, 2001, 1001, 3001, 1),
(20081128, 2002, 1002, 3002, 1),
(20120914, 2004, 1004, 3002, 1),
(20141027, 2003, 1003, 3003, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ArtistDimension`
--

CREATE TABLE IF NOT EXISTS `ArtistDimension` (
  `artist_key` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `number_of_members` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ArtistDimension`
--

INSERT INTO `ArtistDimension` (`artist_key`, `artist_id`, `name`, `number_of_members`) VALUES
(1001, 1001, 'John Mayer', 1),
(1002, 1002, 'Britney Spears', 1),
(1003, 1003, 'Talor Swift', 1),
(1004, 1004, 'P!nk', 1),
(1005, 1005, 'Enrique', 2),
(1006, 1006, 'Metallica', 5),
(1007, 1007, 'Eminem', 1),
(1008, 1008, 'Snoop Dogg', 1),
(1009, 1009, 'Iglesias', 1),
(1010, 1010, 'Beatles', 2);

-- --------------------------------------------------------

--
-- Table structure for table `CalendarDimension`
--

CREATE TABLE IF NOT EXISTS `CalendarDimension` (
  `calendar_key` int(32) NOT NULL,
  `fulldate` date NOT NULL,
  `day_of_week` char(16) NOT NULL,
  `day_of_month` varchar(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CalendarDimension`
--

INSERT INTO `CalendarDimension` (`calendar_key`, `fulldate`, `day_of_week`, `day_of_month`, `quarter`, `year`) VALUES
(10105454, '2011-10-13', 'We', 'Mar', 1, 2011),
(10114554, '2012-04-12', 'Fr', 'Jul', 3, 2012),
(12123453, '2007-11-10', 'Su', 'Nov', 4, 2007),
(20010605, '2001-06-05', 'Tu', 'Jan', 1, 2001),
(20010607, '2002-06-12', 'Tu', 'Jun', 2, 2002),
(20081128, '2008-11-28', 'Fr', 'Feb', 1, 2008),
(20120914, '2006-09-14', 'Fr', 'Aug', 3, 2006),
(20141027, '2005-10-27', 'Mo', 'Oct', 4, 2005),
(45464545, '2014-12-04', 'Sa', 'Dec', 4, 2014),
(45466567, '2009-05-08', 'Th', 'May', 3, 2009);

-- --------------------------------------------------------

--
-- Table structure for table `PublisherDimension`
--

CREATE TABLE IF NOT EXISTS `PublisherDimension` (
  `publisher_key` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PublisherDimension`
--

INSERT INTO `PublisherDimension` (`publisher_key`, `publisher_id`, `name`, `address`) VALUES
(3001, 3001, 'Aware Records', 'Evanston, Illinois, United States'),
(3002, 3002, 'Jive', '550 Madison Avenue \r\nNew York, NY 10022-3211 \r\nUSA '),
(3003, 3003, 'Big Machine Records', '1219 16th Avenue South, Nashville, TN 37212, United States'),
(3004, 3004, 'Brians', '4th St,San Jose'),
(3005, 3005, 'Adams', 'Nevada'),
(3006, 3006, 'Serra', 'Santa Barbara,CA-95115'),
(3007, 3007, 'Williams', 'Seattle,Washington'),
(3008, 3008, 'Roy', 'Las Vegas,NV'),
(3009, 3009, 'Samantha', 'Austin,TX'),
(3010, 3010, 'Roger', 'Barbados,West Indies');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AlbumDimension`
--
ALTER TABLE `AlbumDimension`
  ADD PRIMARY KEY (`album_key`);

--
-- Indexes for table `AlbumReleaseFact`
--
ALTER TABLE `AlbumReleaseFact`
  ADD PRIMARY KEY (`calendar_key`,`album_key`,`artist_key`,`publisher_key`);

--
-- Indexes for table `ArtistDimension`
--
ALTER TABLE `ArtistDimension`
  ADD PRIMARY KEY (`artist_key`);

--
-- Indexes for table `CalendarDimension`
--
ALTER TABLE `CalendarDimension`
  ADD PRIMARY KEY (`calendar_key`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
