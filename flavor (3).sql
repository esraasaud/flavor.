-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2021 at 01:49 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flavor`
--

-- --------------------------------------------------------

--
-- Table structure for table `belong`
--

CREATE TABLE `belong` (
  `id_categories` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id_bookmark` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comments` int(12) NOT NULL,
  `id_recipes` int(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comments` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `username` varchar(20) NOT NULL,
  `id_comments` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id_ingredients` int(11) NOT NULL,
  `barcode` blob NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id_like` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `Msg_content` varchar(256) DEFAULT NULL,
  `Receiver_id` int(10) NOT NULL,
  `Sender_id` int(10) NOT NULL,
  `Msg_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `rating` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id_recipes` int(11) NOT NULL,
  `id_catagories` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `media` blob NOT NULL,
  `quantity` int(11) NOT NULL,
  `calories` varchar(50) NOT NULL,
  `protein` varchar(50) NOT NULL,
  `partition` varchar(50) NOT NULL,
  `fats` varchar(50) NOT NULL,
  `carbs` varchar(50) NOT NULL,
  `id_rating` int(11) NOT NULL,
  `id_like` int(11) NOT NULL,
  `id_ingredients` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registerd_users`
--

CREATE TABLE `registerd_users` (
  `username` varchar(20) NOT NULL,
  `passworrd` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `photo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `send_receive`
--

CREATE TABLE `send_receive` (
  `send` varchar(500) NOT NULL,
  `receive` varchar(500) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shopping list`
--

CREATE TABLE `shopping list` (
  `id_shoppinglist` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `use`
--

CREATE TABLE `use` (
  `id_ingredients` int(11) NOT NULL,
  `id_recipes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belong`
--
ALTER TABLE `belong`
  ADD KEY `id_categories` (`id_categories`),
  ADD KEY `id_recipes` (`id_recipes`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id_bookmark`),
  ADD KEY `id_recipes` (`id_recipes`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `id_recipes` (`id_recipes`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD KEY `username` (`username`),
  ADD KEY `id_comments` (`id_comments`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id_ingredients`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `id_recipes` (`id_recipes`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`Msg_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_recipes` (`id_recipes`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id_recipes`),
  ADD KEY `id_catagories` (`id_catagories`),
  ADD KEY `username` (`username`),
  ADD KEY `id_rating` (`id_rating`),
  ADD KEY `id_like` (`id_like`),
  ADD KEY `id_ingredients` (`id_ingredients`);

--
-- Indexes for table `registerd_users`
--
ALTER TABLE `registerd_users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `send_receive`
--
ALTER TABLE `send_receive`
  ADD KEY `username` (`username`),
  ADD KEY `receive` (`receive`),
  ADD KEY `send` (`send`);

--
-- Indexes for table `shopping list`
--
ALTER TABLE `shopping list`
  ADD PRIMARY KEY (`id_shoppinglist`),
  ADD KEY `id_recipes` (`id_recipes`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `use`
--
ALTER TABLE `use`
  ADD KEY `id_ingredients` (`id_ingredients`),
  ADD KEY `id_recipes` (`id_recipes`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belong`
--
ALTER TABLE `belong`
  ADD CONSTRAINT `belong_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `belong_ibfk_2` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`);

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`),
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`id_comments`) REFERENCES `comments` (`id_comments`),
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`),
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`),
  ADD CONSTRAINT `recipes_ibfk_2` FOREIGN KEY (`id_catagories`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `recipes_ibfk_3` FOREIGN KEY (`id_rating`) REFERENCES `rating` (`id_rating`),
  ADD CONSTRAINT `recipes_ibfk_4` FOREIGN KEY (`id_like`) REFERENCES `like` (`id_like`),
  ADD CONSTRAINT `recipes_ibfk_5` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients` (`id_ingredients`);

--
-- Constraints for table `send_receive`
--
ALTER TABLE `send_receive`
  ADD CONSTRAINT `send_receive_ibfk_1` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`),
  ADD CONSTRAINT `send_receive_ibfk_2` FOREIGN KEY (`receive`) REFERENCES `registerd_users` (`username`),
  ADD CONSTRAINT `send_receive_ibfk_3` FOREIGN KEY (`send`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `shopping list`
--
ALTER TABLE `shopping list`
  ADD CONSTRAINT `shopping list_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`),
  ADD CONSTRAINT `shopping list_ibfk_2` FOREIGN KEY (`username`) REFERENCES `registerd_users` (`username`);

--
-- Constraints for table `use`
--
ALTER TABLE `use`
  ADD CONSTRAINT `use_ibfk_1` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients` (`id_ingredients`),
  ADD CONSTRAINT `use_ibfk_2` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id_recipes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
