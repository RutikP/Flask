-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 02:56 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notes`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `email` varchar(15) NOT NULL,
  `msg` varchar(150) NOT NULL,
  `phone` int(13) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `date`, `email`, `msg`, `phone`, `name`) VALUES
(1, '2021-04-05 21:31:34.950280', 'rutika.18.becs@', 'Hi i am Rohan Das', 2147483647, 'Rohan'),
(2, '2021-04-05 21:37:20.941747', 'rutika.18.becs@', 'Hi i am Krishna Kumar', 2147483647, 'Krishna'),
(3, '2021-04-12 12:08:55.329104', 'panchalkrishna@', 'Hi this is Rahul!!', 2147483647, 'Rahul'),
(4, '2021-04-12 12:11:06.188471', 'panchalkrishna@', 'Hi this is Rahul!!', 2147483647, 'Rutik'),
(5, '2021-04-12 12:12:17.297200', 'enfkjsdnx', 'ekjhfoseldjxl', 0, 'Rahul'),
(6, '2021-04-12 12:14:33.851463', '2021DPU2073@cbg', 'Hi this is Rahul!!', 2147483647, 'Rahul');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `sno` int(10) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `content` varchar(500) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`sno`, `title`, `subtitle`, `content`, `date`) VALUES
(14, 'Sherlock Holmes', 'From Wikipedia, the free encyclopedia', 'Sherlock Holmes (/ˈʃɜːrlɒk ˈhoʊmz/ or /-ˈhoʊlmz/) is a fictional private detective created by British author Sir Arthur Conan Doyle. Referring to himself as a \"consulting detective\" in the stories, Holmes is known for his proficiency with observation, deduction, forensic science, and logical reasoning that borders on the fantastic, which he employs when investigating cases for a wide variety of clients, including Scotland Yard.\r\n\r\n', '2021-04-04 18:15:37'),
(16, 'Swami Vivekananda', 'From Wikipedia, the free encyclopedia', 'Swami Vivekananda (Bengali: [ʃami bibekanɔndo] (About this soundlisten); 12 January 1863 – 4 July 1902), born Narendranath Datta (Bengali: [nɔrendronatʰ dɔto]), was an Indian Hindu monk. He was a chief disciple of the 19th-century Indian mystic Ramakrishna.[4][5] He was a key figure in the introduction of the Indian philosophies of Vedanta and Yoga to the Western world.\r\n', '2021-04-06 12:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` varchar(80) NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `img_file`, `slug`, `content`, `date`) VALUES
(5, 'Sherlock Holmes', 'From Wikipedia, the free encyclopedia', 'pimg-1.jpg', 'New-Postt', 'Sherlock Holmes (/ˈʃɜːrlɒk ˈhoʊmz/ or /-ˈhoʊlmz/) is a fictional private detective created by British author Sir Arthur Conan Doyle. Referring to himself as a \"consulting detective\" in the stories, Holmes is known for his proficiency with observation, deduction, forensic science, and logical reasoning that borders on the fantastic, which he employs when investigating cases for a wide variety of clients, including Scotland Yard.\r\n\r\nFirst appearing in print in 1887\'s A Study in Scarlet, the character\'s popularity became widespread with the first series of short stories in The Strand Magazine, beginning with \"A Scandal in Bohemia\" in 1891; additional tales appeared from then until 1927, eventually totalling four novels and 56 short stories. All but one are set in the Victorian or Edwardian eras, between about 1880 and 1914. Most are narrated by the character of Holmes\'s friend and biographer Dr. John H. Watson, who usually accompanies Holmes during his investigations and often shares quarters with him at the address of 221B Baker Street, London, where many of the stories begin.\r\n\r\nThough not the first fictional detective, Sherlock Holmes is arguably the best known.[1] By the 1990s there were already over 25,000 stage adaptations, films, television productions and publications featuring the detective,[2] and Guinness World Records lists him as the most portrayed literary human character in film and television history.[3] Holmes\'s popularity and fame are such that many have believed him to be not a fictional character but a real individual;[4][5] numerous literary and fan societies have been founded on this pretense. Avid readers of the Holmes stories helped create the modern practice of fandom.[6] The character and stories have had a profound and lasting effect on mystery writing and popular culture as a whole, with the original tales as well as thousands written by authors other than Conan Doyle being adapted into stage and radio plays, television, films, video games, ', '2021-04-04 16:36:24'),
(6, 'Loreum', 'Texts', 'pimg-2.jpg', 'Loreum post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe nostrum ullam eveniet pariatur voluptates odit,\r\n        fuga atque ea nobis sit soluta odio, adipisci quas excepturi maxime quae totam ducimus consectetur?\r\n      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius praesentium recusandae illo eaque architecto\r\n        error, repellendus iusto reprehenderit, doloribus, minu', '2021-04-04 16:41:44'),
(7, 'Mahatma Gandhi', 'From Wikipedia, the free encyclopedia', 'pimg-3.jpg', 'Post', 'Mohandas Karamchand Gandhi (/ˈɡɑːndi, ˈɡændi/;[1] 2 October 1869 – 30 January 1948) was an Indian lawyer,[2] anti-colonial nationalist,[3] and political ethicist,[4] who employed nonviolent resistance to lead the successful campaign for India\'s independence from British rule,[5] and in turn inspired movements for civil rights and freedom across the world. The honorific Mahātmā (Sanskrit: \"great-souled\", \"venerable\"), first applied to him in 1914 in South Africa, is now used throughout the world.[6][7]\r\n\r\nBorn and raised in a Hindu family in coastal Gujarat, western India, Gandhi trained in law at the Inner Temple, London, and was called to the bar at age 22 in June 1891. After two uncertain years in India, where he was unable to start a successful law practice, he moved to South Africa in 1893, to represent an Indian merchant in a lawsuit. He went on to live in South Africa for 21 years. It was in South Africa that Gandhi raised a family, and first employed nonviolent resistance in a campaign for civil rights. In 1915, aged 45, he returned to India. He set about organising peasants, farmers, and urban labourers to protest against excessive land-tax and discrimination. Assuming leadership of the Indian National Congress in 1921, Gandhi led nationwide campaigns for easing poverty, expanding women\'s rights, building religious and ethnic amity, ending untouchability, and above all for achieving Swaraj or self-rule.[8]', '2021-04-04 18:18:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `title` (`title`(25));

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
