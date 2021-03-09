-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2019 at 01:01 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_managment1`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Book_ID` int(10) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Price` double(7,2) DEFAULT NULL,
  `Available` varchar(10) DEFAULT NULL,
  `Staff_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Book_ID`, `Title`, `Price`, `Available`, `Staff_ID`) VALUES
(101, 'DataBase', 750.00, 'Yes', 201),
(102, 'Data Structure', 100.00, 'Yes', 201),
(103, 'Discrete Math', 150.00, 'No', 203),
(104, 'Math', 200.00, 'No', 203),
(105, 'Numerical', 150.00, 'Yes', 201);

-- --------------------------------------------------------

--
-- Stand-in structure for view `books_view`
-- (See below for the actual view)
--
CREATE TABLE `books_view` (
`Book_ID` int(10)
,`Title` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_ID` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Member_type` varchar(15) DEFAULT NULL,
  `Due_date` date DEFAULT NULL,
  `Book_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Member_ID`, `Name`, `Address`, `Member_type`, `Due_date`, `Book_ID`) VALUES
(401, 'Hayder', 'Badda', 'Reguler', '2019-04-11', 101),
(402, 'Alia', 'Mothijel', 'Irregulger', '2019-04-07', 102),
(403, 'Abida', 'Badda', 'Reguler', '2019-04-13', 103),
(404, 'Hafiz', 'Badda', 'Reguler', '2019-04-11', 105),
(405, 'Halima', 'Baridhara', 'Irreguler', '2019-04-11', 104);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Publisher_ID` int(20) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Book_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Publisher_ID`, `Name`, `Address`, `Book_ID`) VALUES
(301, 'BrainChild', 'Boston', 104),
(302, 'Mcgril', 'New York', 102),
(303, 'Oxford', 'London', 103),
(304, 'Deitel', 'Dhaka', 105),
(305, 'PyPy', 'New York', 101);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` int(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Name`, `Phone`) VALUES
(201, 'Mr. Jamal', 2147483647),
(202, 'Mr. Manik', 1711554644),
(203, 'Mr. Alif', 171178644),
(204, 'Mr. Saif', 2147483647),
(205, 'Mr. Sajid', 1611574674);

-- --------------------------------------------------------

--
-- Structure for view `books_view`
--
DROP TABLE IF EXISTS `books_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `books_view`  AS  select `books`.`Book_ID` AS `Book_ID`,`books`.`Title` AS `Title` from `books` where (`books`.`Price` > 100) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Book_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `Book_ID` (`Book_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Publisher_ID`),
  ADD KEY `Book_ID` (`Book_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`Book_ID`);

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`Book_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
