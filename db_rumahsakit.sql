-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Okt 2026 pada 11.56
-- Versi server: 10.11.16-MariaDB
-- Versi PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `db_rumahsakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `spesialisasi` varchar(100) NOT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status_dokter` varchar(20) NOT NULL DEFAULT 'Aktif'
) ;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'dr. Hendra Pratama, Sp.PD', 2, 'Penyakit Dalam', 150000.00, 'Aktif'),
(2, 'dr. Maya Sari, Sp.PD', 2, 'Endokrinologi', 150000.00, 'Aktif'),
(3, 'dr. Rina Kusuma', 1, 'Dokter Umum', 100000.00, 'Aktif'),
(4, 'dr. Bagas Wicaksono, Sp.B', 4, 'Bedah Ortopedi', 250000.00, 'Aktif'),
(5, 'dr. Tika Anggraini, Sp.KK', 5, 'Dermatologi', 120000.00, 'Aktif'),
(6, 'dr. Yusuf Rahman, Sp.PD', 2, 'Gastroenterologi', 100000.00, 'Cuti'),
(7, 'dr. Anisa Putri, Sp.A', 3, 'Anak', 250000.00, 'Aktif'),
(8, 'drg. Farhan Hakim', 6, 'Dokter Gigi', 60000.00, 'Aktif'),
(9, 'dr. Wulan Dari, Sp.M', 7, 'Mata', 100000.00, 'Aktif'),
(10, 'dr. Eko Prasetyo, Sp.JP', 8, 'Jantung', 200000.00, 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` varchar(30) NOT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) NOT NULL DEFAULT 'Menunggu'
) ;

--
-- Dumping data untuk tabel `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-09-01', 'Umum', 'Hipertensi', 'Selesai'),
(2, 2, 2, '2026-09-02', 'Kontrol', 'Diabetes melitus tipe 2', 'Selesai'),
(3, 3, 3, '2026-09-03', 'Umum', 'ISPA', 'Selesai'),
(4, 4, 4, '2026-09-05', 'Darurat', 'Fraktur tulang lengan', 'Selesai'),
(5, 5, 5, '2026-09-07', 'Umum', 'Dermatitis kontak', 'Selesai'),
(6, 1, 6, '2026-09-10', 'Kontrol', 'Gastritis', 'Selesai'),
(7, 6, 7, '2026-09-12', 'Darurat', 'Demam berdarah dengue', 'Diperiksa'),
(8, 7, 8, '2026-09-15', 'Umum', 'Karies gigi', 'Selesai'),
(9, 8, 9, '2026-09-18', 'Kontrol', 'Pasca operasi katarak', 'Selesai'),
(10, 2, 1, '2026-09-20', 'Umum', 'Nyeri dada ringan', 'Selesai'),
(11, 3, 2, '2026-09-22', 'Umum', NULL, 'Batal'),
(12, 4, 3, '2026-09-25', 'Kontrol', NULL, 'Menunggu'),
(13, 5, 4, '2026-09-28', 'Darurat', NULL, 'Batal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Budi Santoso', 'L', '1985-03-12', 'Jl. Merdeka No. 10, Lamongan', '081234567801'),
(2, 'Siti Aminah', 'P', '1990-07-21', 'Jl. Sudirman No. 5, Lamongan', '081234567802'),
(3, 'Ahmad Fauzi', 'L', '1978-11-02', 'Jl. Diponegoro No. 22, Gresik', '081234567803'),
(4, 'Dewi Lestari', 'P', '2001-01-15', 'Jl. Pahlawan No. 8, Lamongan', '081234567804'),
(5, 'Rudi Hartono', 'L', '1995-05-30', 'Jl. Veteran No. 3, Tuban', '081234567805'),
(6, 'Nur Hidayah', 'P', '2010-09-09', 'Jl. Mawar No. 17, Lamongan', '081234567806'),
(7, 'Andi Wijaya', 'L', '1988-12-25', 'Jl. Melati No. 4, Gresik', '081234567807'),
(8, 'Lina Marlina', 'P', '1969-04-18', 'Jl. Kenanga No. 12, Lamongan', '081234567808'),
(9, 'Fajar Nugroho', 'L', '1999-08-08', 'Jl. Anggrek No. 7, Tuban', '081234567809'),
(10, 'Putri Ayu', 'P', '2005-02-27', 'Jl. Cempaka No. 1, Lamongan', '081234567810');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_kunjungan` int(11) NOT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `biaya_konsultasi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_obat` decimal(12,2) NOT NULL DEFAULT 0.00,
  `biaya_laboratorium` decimal(12,2) NOT NULL DEFAULT 0.00,
  `diskon` decimal(12,2) NOT NULL DEFAULT 0.00,
  `metode_bayar` varchar(30) NOT NULL,
  `status_bayar` varchar(20) NOT NULL DEFAULT 'Belum Lunas'
) ;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-09-01', 150000.00, 80000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(2, 2, '2026-09-02', 150000.00, 120000.00, 50000.00, 20000.00, 'Asuransi', 'Lunas'),
(3, 3, '2026-09-03', 100000.00, 30000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(4, 4, '2026-09-05', 250000.00, 150000.00, 200000.00, 50000.00, 'Transfer', 'Lunas'),
(5, 5, '2026-09-07', 120000.00, 60000.00, 0.00, 10000.00, 'Tunai', 'Lunas'),
(6, 6, NULL, 100000.00, 40000.00, 0.00, 0.00, 'Transfer', 'Belum Lunas'),
(7, 7, NULL, 250000.00, 100000.00, 150000.00, 0.00, 'Asuransi', 'Belum Lunas'),
(8, 8, '2026-09-15', 60000.00, 15000.00, 0.00, 5000.00, 'Tunai', 'Lunas'),
(9, 9, '2026-09-18', 100000.00, 50000.00, 0.00, 15000.00, 'Transfer', 'Lunas'),
(10, 10, '2026-09-20', 150000.00, 20000.00, 0.00, 0.00, 'Tunai', 'Lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int(11) NOT NULL,
  `status_poli` varchar(20) NOT NULL DEFAULT 'Aktif'
) ;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Penyakit Dalam', 2, 'Aktif'),
(3, 'Poli Anak', 1, 'Aktif'),
(4, 'Poli Bedah', 3, 'Aktif'),
(5, 'Poli Kulit', 2, 'Aktif'),
(6, 'Poli Gigi', 1, 'Aktif'),
(7, 'Poli Mata', 2, 'Aktif'),
(8, 'Poli Jantung', 3, 'Aktif'),
(9, 'Poli THT', 2, 'Aktif'),
(10, 'Poli Rehabilitasi', 1, 'Nonaktif');

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `fk_kunjungan_pasien` (`id_pasien`),
  ADD KEY `fk_kunjungan_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `uq_pembayaran_kunjungan` (`id_kunjungan`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `fk_kunjungan_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kunjungan_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_kunjungan` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
