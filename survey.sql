-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2018 at 04:27 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_answer`
--

CREATE TABLE `tb_answer` (
  `id_answer` int(11) NOT NULL,
  `answer` text NOT NULL,
  `id_survey` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_answer`
--

INSERT INTO `tb_answer` (`id_answer`, `answer`, `id_survey`, `id_question`, `id_user`) VALUES
(1, '', 1, 1, 2),
(2, '', 1, 2, 2),
(3, '', 1, 3, 2),
(4, '', 1, 4, 2),
(5, '', 1, 5, 2),
(6, '', 1, 1, 3),
(7, '', 1, 2, 3),
(8, '', 1, 3, 3),
(9, '', 1, 4, 3),
(10, '', 1, 5, 3),
(11, '', 1, 1, 4),
(12, '', 1, 2, 4),
(13, '', 1, 3, 4),
(14, '', 1, 4, 4),
(15, '', 1, 5, 4),
(16, '', 2, 6, 2),
(17, '', 2, 7, 2),
(18, '', 2, 8, 2),
(19, '', 2, 6, 3),
(20, '', 2, 7, 3),
(21, '', 2, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_question`
--

CREATE TABLE `tb_question` (
  `id_question` int(11) NOT NULL,
  `tipe_question` varchar(30) NOT NULL,
  `question` text NOT NULL,
  `option_1` varchar(30) DEFAULT NULL,
  `option_2` varchar(30) DEFAULT NULL,
  `option_3` varchar(30) DEFAULT NULL,
  `option_4` varchar(30) DEFAULT NULL,
  `id_survey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_question`
--

INSERT INTO `tb_question` (`id_question`, `tipe_question`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `id_survey`) VALUES
(1, 'text', 'Apa yang dimaksud dengan pembangunan ?', '', '', '', '', 1),
(2, 'text', 'Apa yang dimaksud dengan teknik pembandungan ?', '', '', '', '', 1),
(3, 'text', 'Apa yang dimaksud dengan rencana pembangunan ?', '', '', '', '', 1),
(4, 'multiple', 'Apa saja yang termasuk teknologi pembangunan ?', 'Robot', 'Tukang', 'Kayu', 'Kondektur', 1),
(5, 'multiple', 'Apa saja yang termasuk cara pembangunan ?', 'Semen', 'Baja', 'Karet', 'Rotan', 1),
(6, 'text', 'Apa yang dimaksud dengan ketenagakerjaan ?', '', '', '', '', 2),
(7, 'text', 'Apa yang dimaksud dengan lembaga ketenagakerjaan ?', '', '', '', '', 2),
(8, 'text', 'Sebutkan yang termasuk lembaga ketenagakerjaan ?', '', '', '', '', 2),
(9, 'multiple', 'Apa saja yang termasuk infrastruktur ?', 'Gedung', 'Pulau', 'Pesawat', 'Lift', 3),
(10, 'multiple', 'Apa saja yang termasuk cara perawatan infrastruktur ?', 'Dioles', 'Dibuka', 'Diatur', 'Dirombak', 3),
(11, 'text', 'Apakah yg dimaksud perikanan ?', '', '', '', '', 4),
(12, 'text', 'Ada berapakah jenis ikan yang ada di Indonesia ?', '', '', '', '', 4),
(13, 'text', 'Siapa seorang pelaut ?', '', '', '', '', 7),
(14, 'text', 'kenapa gitu ?', '', '', '', '', 7),
(15, 'text', 'siapa ?', '', '', '', '', 7),
(16, 'multiple', 'Yang bukan jenis ikan ?', 'Lele', 'Paus', 'Mujaer', 'Bawal', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_survey`
--

CREATE TABLE `tb_survey` (
  `id_survey` int(11) NOT NULL,
  `nama_survey` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_survey`
--

INSERT INTO `tb_survey` (`id_survey`, `nama_survey`, `created_at`, `modified_at`) VALUES
(1, 'Survey Pembangunan', '2018-02-09 18:00:00', '2018-02-10 15:16:22'),
(2, 'Survey Ketenagakerjaan', '2018-02-08 20:00:00', '2018-02-10 15:16:22'),
(3, 'Survey Infrastruktur', '2018-02-10 02:00:00', '2018-02-10 15:16:22'),
(4, 'Survey Perikanan', '2018-02-09 18:00:00', '2018-02-10 16:21:17'),
(7, 'Survey Kelautan', '2018-02-10 22:16:28', '2018-02-10 22:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `no_hp` varchar(16) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `no_hp`, `alamat`, `username`, `password`) VALUES
(2, 'Nikko Eka Saputra', '08988190546', 'Jakarta', 'nikko', 'nikko'),
(3, 'Aditya Permana Putra', '08988190546', 'Bandung', 'adit', 'adit'),
(4, 'Ivanka Tri Agustin', '08988190546', 'Surabaya', 'ivanka', 'ivanka'),
(5, 'Muhammad Rafif', '08988190546', 'Bandung', 'rafif', 'rafif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_answer`
--
ALTER TABLE `tb_answer`
  ADD PRIMARY KEY (`id_answer`),
  ADD KEY `id_question` (`id_question`),
  ADD KEY `id_survey` (`id_survey`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_question`
--
ALTER TABLE `tb_question`
  ADD PRIMARY KEY (`id_question`),
  ADD KEY `id_survey` (`id_survey`);

--
-- Indexes for table `tb_survey`
--
ALTER TABLE `tb_survey`
  ADD PRIMARY KEY (`id_survey`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_answer`
--
ALTER TABLE `tb_answer`
  MODIFY `id_answer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_question`
--
ALTER TABLE `tb_question`
  MODIFY `id_question` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_survey`
--
ALTER TABLE `tb_survey`
  MODIFY `id_survey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_answer`
--
ALTER TABLE `tb_answer`
  ADD CONSTRAINT `tb_answer_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `tb_question` (`id_question`),
  ADD CONSTRAINT `tb_answer_ibfk_2` FOREIGN KEY (`id_survey`) REFERENCES `tb_survey` (`id_survey`),
  ADD CONSTRAINT `tb_answer_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`);

--
-- Constraints for table `tb_question`
--
ALTER TABLE `tb_question`
  ADD CONSTRAINT `tb_question_ibfk_1` FOREIGN KEY (`id_survey`) REFERENCES `tb_survey` (`id_survey`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
