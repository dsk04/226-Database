-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2015 at 06:38 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `JukeboxWarehouse`
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
(2003, 2003, '1989', 'https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png'),
(2004, 2004, 'The Truth About Love', 'https://upload.wikimedia.org/wikipedia/en/7/7e/The_Truth_About_Love.png');

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
(1004, 1004, 'P!nk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `CalendarDimension`
--

CREATE TABLE IF NOT EXISTS `CalendarDimension` (
  `calendar_key` int(32) NOT NULL,
  `fulldate` date NOT NULL,
  `day_of_week` char(16) NOT NULL,
  `day_of_month` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CalendarDimension`
--

INSERT INTO `CalendarDimension` (`calendar_key`, `fulldate`, `day_of_week`, `day_of_month`, `quarter`, `year`) VALUES
(20010605, '2001-06-05', 'Tu', 5, 2, 2001),
(20081128, '2008-11-28', 'Fr', 28, 4, 2008),
(20120914, '2012-09-14', 'Fr', 14, 3, 2012),
(20141027, '2014-10-27', 'Mo', 27, 4, 2014);

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
(3003, 3003, 'Big Machine Records', '1219 16th Avenue South, Nashville, TN 37212, United States');

-- --------------------------------------------------------

--
-- Table structure for table `SongDimension`
--

CREATE TABLE IF NOT EXISTS `SongDimension` (
  `song_key` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `genre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SongDimension`
--

INSERT INTO `SongDimension` (`song_key`, `song_id`, `title`, `genre`) VALUES
(4001, 4001, 'Neon', 'Blues'),
(4002, 4002, 'Circus', 'Dance'),
(4003, 4003, 'Shake It Off', 'Pop'),
(4004, 4004, 'Just Give Me A Reason', 'P!nk');

-- --------------------------------------------------------

--
-- Table structure for table `SongGenreFact`
--

CREATE TABLE IF NOT EXISTS `SongGenreFact` (
  `calendar_key` int(11) NOT NULL,
  `song_key` int(11) NOT NULL,
  `artist_key` int(11) NOT NULL,
  `publisher_key` int(11) NOT NULL,
  `number_of_release` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SongGenreFact`
--

INSERT INTO `SongGenreFact` (`calendar_key`, `song_key`, `artist_key`, `publisher_key`, `number_of_release`) VALUES
(20010605, 4001, 1001, 3001, 1),
(20081128, 4002, 1002, 3002, 1),
(20141027, 4003, 1003, 3003, 1);

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

--
-- Indexes for table `SongDimension`
--
ALTER TABLE `SongDimension`
  ADD PRIMARY KEY (`song_key`);

--
-- Indexes for table `SongGenreFact`
--
ALTER TABLE `SongGenreFact`
  ADD PRIMARY KEY (`calendar_key`,`song_key`,`artist_key`,`publisher_key`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
