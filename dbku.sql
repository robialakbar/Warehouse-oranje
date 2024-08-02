-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 02 Agu 2024 pada 16.11
-- Versi server: 10.11.8-MariaDB-cll-lve
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u741451673_oranjemotor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL DEFAULT 1,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`category_id`, `warehouse_id`, `category_name`) VALUES
(8, 2, 'Cat 1'),
(10, 1, 'MITSUBISHI'),
(11, 1, 'TOYOTA'),
(12, 1, 'HONDA'),
(13, 1, 'SUZUKI'),
(14, 1, 'ISUZU'),
(15, 1, 'DAIHATSU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL,
  `user_id` bigint(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `purchase_price` varchar(255) NOT NULL,
  `sale_price` varchar(255) NOT NULL,
  `category_id` bigint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products_wip`
--

CREATE TABLE `products_wip` (
  `product_wip_id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `customer` varchar(255) NOT NULL,
  `no_nota` varchar(255) NOT NULL,
  `product_amount` bigint(255) NOT NULL,
  `date_in` datetime NOT NULL DEFAULT current_timestamp(),
  `date_out` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 = Progress; 1 = Done;'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products_wip`
--

INSERT INTO `products_wip` (`product_wip_id`, `warehouse_id`, `product_id`, `customer`, `no_nota`, `product_amount`, `date_in`, `date_out`, `status`) VALUES
(1, 1, 1, 'PT. XYZ', '123456', 50, '2021-05-19 22:05:17', '2021-05-19 22:05:56', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `shelf`
--

CREATE TABLE `shelf` (
  `shelf_id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL,
  `shelf_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `shelf`
--

INSERT INTO `shelf` (`shelf_id`, `warehouse_id`, `shelf_name`) VALUES
(7, 1, 'Troli Sparepart Listrik'),
(8, 1, 'Troli Sparepart Motor'),
(9, 1, 'Troli Sparepart Mobil'),
(10, 2, 'Rak 1'),
(12, 1, 'Troli Sparepart Mesin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock`
--

CREATE TABLE `stock` (
  `stock_id` bigint(255) NOT NULL,
  `warehouse_id` bigint(255) NOT NULL DEFAULT 1,
  `user_id` bigint(255) NOT NULL,
  `shelf_id` bigint(255) NOT NULL,
  `product_id` bigint(255) NOT NULL,
  `stock_name` varchar(255) DEFAULT NULL,
  `no_nota` varchar(255) DEFAULT NULL,
  `product_amount` bigint(255) NOT NULL DEFAULT 0,
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '0 = OUT; 1 = IN; 2 = Refund;',
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `ending_amount` bigint(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stock`
--

INSERT INTO `stock` (`stock_id`, `warehouse_id`, `user_id`, `shelf_id`, `product_id`, `stock_name`, `no_nota`, `product_amount`, `type`, `datetime`, `ending_amount`) VALUES
(7, 1, 1, 7, 11, 'dwi', '123', 5, 1, '2021-08-09 09:04:20', 5),
(9, 1, 1, 7, 11, 'dwi', '123', 3, 0, '2021-08-09 09:25:28', 2),
(15, 1, 1, 7, 11, 'Amini', '123', 1, 1, '2021-08-09 12:03:42', 3),
(16, 1, 1, 10, 17, 'BCA', 'ABCD', 2, 1, '2021-08-09 12:04:35', 2),
(17, 1, 1, 8, 16, 'Amini', '123', 1, 1, '2021-08-09 12:05:02', 1),
(18, 1, 1, 9, 18, 'Amini', '123', 1, 1, '2021-08-09 12:06:00', 1),
(19, 1, 1, 9, 17, 'Amini', '123', 1, 1, '2021-08-09 12:06:20', 3),
(20, 1, 1, 9, 17, 'Amini', '444', 1, 1, '2021-08-09 12:09:56', 4),
(21, 1, 1, 9, 17, 'PT. ABC', 'ABCDE', 1, 0, '2021-08-09 13:15:06', 3),
(22, 1, 1, 8, 17, 'robialakba', '32323', 1, 1, '2021-08-09 13:17:40', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `role` int(1) NOT NULL DEFAULT 1 COMMENT '0 = Admin; 1 = User;',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'oranje motor', 'desman@pardosi.net', 'Oranje', 0, NULL, '$2y$10$HY6s.ompKry.h/y34Xd8nO0UP/C1NXF08kFgrul8C6QlcjgogHXRG', 'Jq4B0BtCvFz18kGghauCvxNJDzhz61XXZkpr6GHabXJO0OqJ4s23ed4U6Nk8', '2021-02-18 08:15:56', '2021-02-18 08:15:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` bigint(255) NOT NULL,
  `warehouse_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`) VALUES
(1, 'ORANJE motor'),
(3, 'gudang 1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `products_wip`
--
ALTER TABLE `products_wip`
  ADD PRIMARY KEY (`product_wip_id`);

--
-- Indeks untuk tabel `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_id`);

--
-- Indeks untuk tabel `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `username` (`username`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `products_wip`
--
ALTER TABLE `products_wip`
  MODIFY `product_wip_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `shelf`
--
ALTER TABLE `shelf`
  MODIFY `shelf_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `warehouse_id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
