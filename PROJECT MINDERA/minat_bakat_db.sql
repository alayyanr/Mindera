-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2025 at 04:28 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minat_bakat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hasil_tes`
--

CREATE TABLE `hasil_tes` (
  `id_hasil` int NOT NULL,
  `id_user` int NOT NULL,
  `jenis_tes` enum('minat','bakat') NOT NULL,
  `total_skor` int DEFAULT NULL,
  `kategori_hasil` varchar(100) DEFAULT NULL,
  `deskripsi_hasil` text,
  `tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hasil_tes`
--

INSERT INTO `hasil_tes` (`id_hasil`, `id_user`, `jenis_tes`, `total_skor`, `kategori_hasil`, `deskripsi_hasil`, `tanggal`) VALUES
(1, 2, 'minat', 1, 'Tipe Investigatif & Analitis', 'Kamu tertarik pada pekerjaan yang membutuhkan pemikiran analitis dan pemecahan masalah. Cocok untuk bidang seperti penelitian, sains, atau teknologi informasi.', '2025-12-31 03:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban_tes`
--

CREATE TABLE `jawaban_tes` (
  `id_jawaban` int NOT NULL,
  `id_hasil` int NOT NULL,
  `nomor_soal` int NOT NULL,
  `jawaban` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jawaban_tes`
--

INSERT INTO `jawaban_tes` (`id_jawaban`, `id_hasil`, `nomor_soal`, `jawaban`) VALUES
(1, 1, 1, 'pikiran'),
(2, 1, 2, 'visual'),
(3, 1, 3, 'analitis'),
(4, 1, 4, 'individual'),
(5, 1, 5, 'sistematis'),
(6, 1, 6, 'teoritis'),
(7, 1, 7, 'teknis'),
(8, 1, 8, 'konvensional'),
(9, 1, 9, 'indoor'),
(10, 1, 10, 'bisnis'),
(11, 1, 11, 'terstruktur'),
(12, 1, 12, 'ambisius'),
(13, 1, 13, 'mental'),
(14, 1, 14, 'dinamis'),
(15, 1, 15, 'stabil');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `created_at`) VALUES
(1, 'demo', '$2b$12$Ktn/VcOd3dH1qFIyG.gNquN4wNoDq4kWGaMpI1iSEWeem1dRNtd5O', '2025-12-31 03:39:17'),
(2, 'ulangi', '$2b$12$VIbT7qn6GwZmFVOsAJu.JenIxXL6eaGatxxJMQNGi8PaGKTe8HYe6', '2025-12-31 03:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id_log` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `aktivitas` varchar(100) DEFAULT NULL,
  `waktu` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hasil_tes`
--
ALTER TABLE `hasil_tes`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `jawaban_tes`
--
ALTER TABLE `jawaban_tes`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_hasil` (`id_hasil`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hasil_tes`
--
ALTER TABLE `hasil_tes`
  MODIFY `id_hasil` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jawaban_tes`
--
ALTER TABLE `jawaban_tes`
  MODIFY `id_jawaban` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hasil_tes`
--
ALTER TABLE `hasil_tes`
  ADD CONSTRAINT `hasil_tes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `jawaban_tes`
--
ALTER TABLE `jawaban_tes`
  ADD CONSTRAINT `jawaban_tes_ibfk_1` FOREIGN KEY (`id_hasil`) REFERENCES `hasil_tes` (`id_hasil`) ON DELETE CASCADE;

--
-- Constraints for table `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
