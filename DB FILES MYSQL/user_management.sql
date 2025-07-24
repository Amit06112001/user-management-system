-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2025 at 03:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2025_07_24_070808_create_roles_table', 3),
(11, '2025_07_24_070909_create_user_role_table', 3),
(12, '2025_07_24_072653_create_jobs_table', 4),
(13, '2025_07_24_115554_add_soft_deletes_to_users_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03f99de3676c211973527a7eb049a7065c298ceb3ac797b301e43329de821173dcc84687d6d09a75', 1, 3, 'MyApp', '[]', 0, '2025-07-24 05:52:52', '2025-07-24 05:52:52', '2026-07-24 11:22:52'),
('06a5a751a64f12e4cea629e2ce576d3f719bb733e4eccce5884977ad67a72ee52242421b5d013445', 1, 3, 'MyApp', '[]', 0, '2025-07-24 04:18:30', '2025-07-24 04:18:30', '2026-07-24 09:48:30'),
('14228c27417e6513a680f5f98fe8703f6ba445fa02727fd9bc89334f1f998b1bdd97111b98cd856b', 1, 3, 'MyApp', '[]', 0, '2025-07-24 04:34:25', '2025-07-24 04:34:25', '2026-07-24 10:04:25'),
('1cd80f6efb7ffbb83cb864654460a7762b9c8a776a038ed5bb3aae457436227068d3c26643d852e6', 1, 1, 'MyApp', '[]', 0, '2025-07-24 03:56:09', '2025-07-24 03:56:10', '2026-07-24 09:26:09'),
('232ef2c8ef282efc2471ce032ab80729f3abe30fa742b5fb9a23671f65b5023a500813fca75871a4', 1, 3, 'MyApp', '[]', 0, '2025-07-24 07:11:29', '2025-07-24 07:11:29', '2026-07-24 12:41:29'),
('3ddaeac369a5fa601e27fe3975672fbe7a5b71002d8f329ef25be68ef1abf70510346e9fceba1ffc', 1, 3, 'MyApp', '[]', 0, '2025-07-24 04:49:48', '2025-07-24 04:49:48', '2026-07-24 10:19:48'),
('42e1c57a996daa8fdbca6459771d700c93d0baf479e3910119452ce1a000b88f8e1204ac8ca04d90', 1, 3, 'MyApp', '[]', 0, '2025-07-24 05:11:31', '2025-07-24 05:11:31', '2026-07-24 10:41:31'),
('4e0154e125e601e24845705754ce11ab5e12bf9384a50792cad62b43417f723115e27ac55280e852', 16, 3, 'MyApp', '[]', 0, '2025-07-24 07:30:55', '2025-07-24 07:30:55', '2026-07-24 13:00:55'),
('58b835f240461f7a2d64f512221c8f2ed71d1e2e8fba8299aebaee65a21023d13e52b30570250ff7', 1, 3, 'MyApp', '[]', 0, '2025-07-24 05:05:08', '2025-07-24 05:05:08', '2026-07-24 10:35:08'),
('67fd4cfd683b9a3cbcf6c77da6796e154b4e29e5237880757806f67cbeeb9aaa8f6bfdc721a8a3d1', 1, 3, 'MyApp', '[]', 0, '2025-07-24 07:07:46', '2025-07-24 07:07:46', '2026-07-24 12:37:46'),
('7e0ec5c6e73c0f74c3aa1bba5d2d757e6b4338d9d18ba0e2fa45556f2d94cb4f06ee681b94259cd8', 1, 1, 'MyApp', '[]', 0, '2025-07-24 03:59:33', '2025-07-24 03:59:33', '2026-07-24 09:29:33'),
('99a9ab43f60f3655749e13089ded4bace9f5bfce27ade8b6033b9482fa6220163cf567b49069310d', 1, 3, 'MyApp', '[]', 0, '2025-07-24 04:18:26', '2025-07-24 04:18:26', '2026-07-24 09:48:26'),
('ad76f702464da20d9ac305820092c53e02069262e0354ac699eab310d16e7a256b393af09898c9fe', 10, 3, 'MyApp', '[]', 0, '2025-07-24 05:15:53', '2025-07-24 05:15:53', '2026-07-24 10:45:53'),
('b258ad8e9d729d7c2dd86c1c9940e00a05eba877b3ebc7e0adf2e3c975adc1d2b384a78fc6395282', 5, 3, 'MyApp', '[]', 0, '2025-07-24 04:41:39', '2025-07-24 04:41:39', '2026-07-24 10:11:39'),
('cfeec968604d9c20b390dc60d72bd12d9ec122818f9f24a5fde6bebaf26780db6e2c8bd19f46f0f6', 5, 3, 'MyApp', '[]', 0, '2025-07-24 04:54:24', '2025-07-24 04:54:24', '2026-07-24 10:24:24'),
('d059ee68c7923961f913d3969250898d7e0a171df67b6d307cf776afb7c29d270f2206c1444be7ab', 1, 3, 'MyApp', '[]', 0, '2025-07-24 04:57:14', '2025-07-24 04:57:14', '2026-07-24 10:27:14'),
('d1b3585b4ed06bbedd6c17be8f7ce255d4b1ab1b77cc2a430afbc18ce9aa69213621e9f7851ad12a', 13, 3, 'MyApp', '[]', 0, '2025-07-24 05:17:41', '2025-07-24 05:17:41', '2026-07-24 10:47:41'),
('d9862f72de0bc9af0fe626e27bffcb2c58420a342f487cf6f9207c568260bbdb66626406a7c46dcb', 10, 3, 'MyApp', '[]', 0, '2025-07-24 07:25:38', '2025-07-24 07:25:38', '2026-07-24 12:55:38'),
('e99d5c9e9eb74545d7bc9d6efd55eea866ab4662857fb2c345a728c5bdd9963008a9246db1d4ebda', 10, 3, 'MyApp', '[]', 0, '2025-07-24 05:20:28', '2025-07-24 05:20:28', '2026-07-24 10:50:28'),
('eef65fae8c254ec1901b895124b3ef5c325906289f305ebcd202a4be7743a9096865d25ee425e3c7', 5, 3, 'MyApp', '[]', 0, '2025-07-24 05:01:49', '2025-07-24 05:01:49', '2026-07-24 10:31:49'),
('f5245cb55d071433dbb586d0e748b6ae363e03542cb99f775a0a988c2e7118f3c732739d11edfcf7', 16, 3, 'MyApp', '[]', 0, '2025-07-24 07:26:53', '2025-07-24 07:26:53', '2026-07-24 12:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '9pAcpFcvAKkwCAoMDmOUXqLsDaFaIQjMxoDk8B3I', NULL, 'http://localhost', 1, 0, 0, '2025-07-24 01:37:32', '2025-07-24 01:37:32'),
(2, NULL, 'Laravel Password Grant Client', 'L2Yn4lrwiRhMpgMouei17cbWANTGPllqmarSsgna', 'users', 'http://localhost', 0, 1, 0, '2025-07-24 01:37:32', '2025-07-24 01:37:32'),
(3, NULL, 'Laravel Personal Access Client', 'bNbLZ8WBq0pf0WzBqCEG1WtRVqviLLeduurVYUwC', NULL, 'http://localhost', 1, 0, 0, '2025-07-24 04:15:45', '2025-07-24 04:15:45'),
(4, NULL, 'Laravel Password Grant Client', 'EUy5YyYDBA6Pen2bPMjg4IGbSVbquUkJqkdZYl44', 'users', 'http://localhost', 0, 1, 0, '2025-07-24 04:15:45', '2025-07-24 04:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-07-24 01:37:32', '2025-07-24 01:37:32'),
(2, 3, '2025-07-24 04:15:45', '2025-07-24 04:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', '2025-07-24 02:25:00', '2025-07-24 02:25:00'),
(2, 'Admin', '2025-07-24 02:25:00', '2025-07-24 02:25:00'),
(3, 'User', '2025-07-24 02:25:00', '2025-07-24 02:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'superadmin@example.com', NULL, '$2y$10$se0PUmf13KvtE2HZCPU.4u44Yw65P0Zj3f6e/qTRgJDFOOIMuzSRy', NULL, '2025-07-24 05:12:39', '2025-07-24 05:12:39', NULL),
(10, 'Admin', 'admin@example.com', NULL, '$2y$10$SQjpPCUadmNPf.O8KBVYyeq1O.e3K7KwIjDiHVjZ.pt6SGlcX78C2', NULL, '2025-07-24 05:11:14', '2025-07-24 05:11:14', NULL),
(11, 'Test User chnage', 'user1@chnage.com', NULL, '$2y$10$2qBKzRjiK.hWjlgf2.99seTkIra0vZjSpYS25dMAwm17QqsBc6quy', NULL, '2025-07-24 05:15:30', '2025-07-24 06:29:35', '2025-07-24 06:29:35'),
(12, 'Test User 2', 'user2@example.com', NULL, '$2y$10$Srpc3fjCjFN8QzycObDJ4.Qq9Zfu1HIYEYEObbfSwtZEDEDnXdFai', NULL, '2025-07-24 05:15:30', '2025-07-24 05:15:30', NULL),
(14, 'Test User 3', 'user3@example.com', NULL, '$2y$10$/pGxAmz24s31hBM3D/JxyuiELALpPefL.JMlk7swAu2jpAswTlOvC', NULL, '2025-07-24 07:13:04', '2025-07-24 07:13:04', NULL),
(15, 'Test User 3', 'user4@example.com', NULL, '$2y$10$2axqznfbhPRWxMhPsJBRAeCjnMLwQqxLEY615tq3in/8wDhhiohIO', NULL, '2025-07-24 07:13:19', '2025-07-24 07:13:19', NULL),
(16, 'amit', 'amit@example.com', NULL, '$2y$10$xgGfRSjiJ5phOsBxQFaKBu0C3FBykVP9xrtiN.ePH2VwvYUq053lG', NULL, '2025-07-24 07:24:36', '2025-07-24 07:31:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(11, 10, 2, NULL, NULL),
(12, 1, 1, NULL, NULL),
(13, 11, 3, NULL, NULL),
(14, 12, 3, NULL, NULL),
(16, 14, 3, NULL, NULL),
(17, 15, 3, NULL, NULL),
(18, 16, 3, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
