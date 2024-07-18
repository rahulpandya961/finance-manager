-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 05:57 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finance`
--

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `amount`, `category`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, '200.00', 'three', 'two', '2024-07-18 09:32:26', '2024-07-18 09:53:26'),
(4, 1, '500.00', 't-shirt', 'two', '2024-07-18 09:35:52', '2024-07-18 09:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `user_id`, `amount`, `category`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, '240.00', 't-ahirt', 'this for', '2024-07-18 07:47:45', '2024-07-18 08:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2024_07_18_100248_add_role_to_users_table', 3),
(11, '2024_07_18_111327_create_incomes_table', 4),
(12, '2024_07_18_111345_create_expenses_table', 4),
(13, '2024_07_18_135229_create_transactions_table', 5),
(14, '2024_07_18_135644_create_portfolios_table', 6),
(15, '2024_07_18_135702_create_portfolio_items_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('17a877378719ba098ecd0e2940adf02ed5c65ad6e84b9d1a423a75122f42c7bfdbe01585f8f6303b', 5, 1, 'Personal Access Token', '[]', 0, '2024-07-18 05:37:21', '2024-07-18 05:37:21', '2025-07-18 11:07:21'),
('1f1b2b17337e8867255d27ae71cf5bd073771e52f5fb484ed45d6530dad773527edf0ca96fa841c3', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:20:26', '2024-07-18 07:20:27', '2025-07-18 12:50:26'),
('293602408a0850195740ac6818df64dddee1ee8ac28e09aaf6119d4afef0ede8c437490ae4d1fabe', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:21:11', '2024-07-18 07:21:11', '2025-07-18 12:51:11'),
('2a8cac49a0a0e4077702c6ff1663afc13df7ab009ebcb2838bd8edab1f767ce2c4e13ff24f0d7fd5', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:13:05', '2024-07-18 07:13:06', '2025-07-18 12:43:05'),
('3621fd0da6234b2ca69fa228f916d28f08da1c729a1c7a9ea7de7839191325ff06546b56a7d73539', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:07:01', '2024-07-18 07:07:01', '2025-07-18 12:37:01'),
('40334313b51c36888d119987cefb083a396781e55cc575230b4d313452cbf6c7e485d863d7b2d8bf', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:04:58', '2024-07-18 07:04:58', '2025-07-18 12:34:58'),
('4ad7b081041824a98bb0dd00843c9c75f8ad22673f9fa1565cbcab7587678ff964db25957f40c640', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:29:11', '2024-07-18 07:29:11', '2025-07-18 12:59:11'),
('5673e15e3d78aa7948a5f4fc51e5bc9f2a30b0c72b08121fc7de2d5dac019eacd41fd8fc8e42e9d9', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:22:30', '2024-07-18 07:22:30', '2025-07-18 12:52:30'),
('59728e5623db4b96db9f4d512e68491d814c58a5a706fd728323194676eb61058e330fb752c31096', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:21:31', '2024-07-18 07:21:31', '2025-07-18 12:51:31'),
('5a96006a403456188ad8fba9c6fde1f35334a88aa7895544a2f708706e0682805fdf567306347251', 1, 1, 'Personal Access Token', '[]', 0, '2024-07-18 06:38:41', '2024-07-18 06:38:41', '2025-07-18 12:08:41'),
('5d987b4e355c18f5b6f6d57fa095eeb353154011a273af8063ad0c0a9fba799ee023526379fd40f1', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:20:56', '2024-07-18 07:20:56', '2025-07-18 12:50:56'),
('6092af015a67b6d059993a1b0e6524b318a14de66a54b4ad75341f494f3e2c1697f6b0a76375855a', 6, 1, 'Personal Access Token', '[]', 0, '2024-07-18 10:09:31', '2024-07-18 10:09:31', '2025-07-18 15:39:31'),
('65487d972cdbd26c461a3ccb4fb633ecb848e3cfe374bdf2ec973085354862756e9788eb4cea10c2', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:21:45', '2024-07-18 07:21:45', '2025-07-18 12:51:45'),
('6e6727afe208380f076bef4e7350f207adac75f387651ffc1daaf204d1c9d99603d38e552b039b2f', 5, 1, 'Personal Access Token', '[]', 0, '2024-07-18 06:10:08', '2024-07-18 06:10:08', '2025-07-18 11:40:08'),
('97e09ab5442a620b5f98b82a800ae299aa8fdb5a158256e673bc6f248158dc99508f76bbb93da4a3', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:20:05', '2024-07-18 07:20:05', '2025-07-18 12:50:05'),
('a0065e0d697a6e952f1fee5d933fc09350c6664e0b9b682776bdfca1df963b9d0e51e8c7993daaa1', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:30:37', '2024-07-18 07:30:37', '2025-07-18 13:00:37'),
('a3076b50cae0f999b1cd25b36ce903f3883a4b468d842c1e8256836a999e8f4a49c29ddaa367c865', 3, 1, 'Personal Access Token', '[]', 0, '2024-07-18 05:25:43', '2024-07-18 05:25:45', '2025-07-18 10:55:43'),
('bae99f962f19340d4951ffadefbb3ea8fa84c1924528a5a0ca38a35f5851b95d7ae86d9aadb2dcb8', 8, 1, 'Personal Access Token', '[]', 0, '2024-07-18 10:11:03', '2024-07-18 10:11:03', '2025-07-18 15:41:03'),
('bd9a025fd971a04990bf48fd01cdfbd4b50c3600b9e97544e9b0dac5b3e462da8b5221230c6fca54', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:19:47', '2024-07-18 07:19:47', '2025-07-18 12:49:47'),
('be2df69ed5d1ba8a55d8de5c40e0e472036509dcdea2901ea986a369cce3f73bf62453480e216862', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:31:00', '2024-07-18 07:31:00', '2025-07-18 13:01:00'),
('cad852f0e5650c475a46f057bb04e0cc864c41396f959901d1abbf246039540d9a31a77a69091cbc', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:06:03', '2024-07-18 07:06:04', '2025-07-18 12:36:03'),
('cff23a6daa9cf096782d6d576b4c9af82581eb4b68efc213f2017ba13f44411fe7e552cd0268ed65', 5, 1, 'Personal Access Token', '[]', 0, '2024-07-18 05:26:13', '2024-07-18 05:26:13', '2025-07-18 10:56:13'),
('d3a13f389e43c663d56d0961d26709a8ca6a759d6854dea825246eb4a73d513774f9485746c5d3bc', 8, 1, 'MyApp', '[]', 0, '2024-07-18 10:11:03', '2024-07-18 10:11:03', '2025-07-18 15:41:03'),
('d78e02ca06b0c884ad3c3b0bd9febdaa80042223f169ad538ea16f0a6b56716aaa11191e825a9d73', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:18:55', '2024-07-18 07:18:55', '2025-07-18 12:48:55'),
('e6b7dd6afa107b668273d9f3279a73e80e848c3432b2e37f57114625d312724d685f7290aeb80215', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:20:39', '2024-07-18 07:20:39', '2025-07-18 12:50:39'),
('f62e9d1a48dba7889f4399e05939ea187cba3ab0006b14f195b278aab1092cbcf26dc0da2ff06659', 5, 1, 'MyApp', '[]', 0, '2024-07-18 07:22:11', '2024-07-18 07:22:11', '2025-07-18 12:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, NULL, 'Laravel Personal Access Client', '9Wcq9r2dkI9hNCkRrjwghWoTY6oHH4gLIbLCm9m7', NULL, 'http://localhost', 1, 0, 0, '2024-07-18 04:23:33', '2024-07-18 04:23:33'),
(2, NULL, 'Laravel Password Grant Client', 'NE0o057f1twgHBjhEHqJ75cjmgEH9dTcDCUNVOTE', 'users', 'http://localhost', 0, 1, 0, '2024-07-18 04:23:33', '2024-07-18 04:23:33');

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
(1, 1, '2024-07-18 04:23:33', '2024-07-18 04:23:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_items`
--

CREATE TABLE `portfolio_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `portfolio_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('stock','bond','cryptocurrency') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` enum('income','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` enum('daily','weekly','monthly') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Rahul', 'rahulpandya961@gmail.com', NULL, '$2y$10$cq6lO85e/WJ7iC31mZiKJeqTHwAE87t.Ye/v7jDm8S4TzIl8Z79Oy', NULL, '2024-07-18 05:16:45', '2024-07-18 05:16:45', 'user'),
(3, 'Rahul', 'roy@gmail.com', NULL, '$2y$10$Kknu8JSv8ZLHgYJphDgnBeMe77X5Z.Sfj4FqdV/6S/J4aVtHp3ULO', NULL, '2024-07-18 05:25:42', '2024-07-18 05:25:42', 'user'),
(5, 'Rahul', 'roy1@gmail.com', NULL, '$2y$10$Nxkec.UV.UG48dk1ofDsfe7SBh066QrJXxm4kZm1RbFoPuVa0QbO6', NULL, '2024-07-18 05:26:13', '2024-07-18 05:26:13', 'user'),
(6, 'Rahul', 'roy7@gmail.com', NULL, '$2y$10$LfzOLtQyEWTBuW/4WtmRhurMATmo7YOFu.YGs1dISqKGfGAHNnaiW', NULL, '2024-07-18 10:09:31', '2024-07-18 10:09:31', 'user'),
(8, 'Rahul', 'roy8@gmail.com', NULL, '$2y$10$TOC6ZE2/SdEwBW4BB1jGWu.ANAl.GxwsIcWSlD65si94rk/8kMmSy', NULL, '2024-07-18 10:11:03', '2024-07-18 10:11:03', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_user_id_foreign` (`user_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_items`
--
ALTER TABLE `portfolio_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_items_portfolio_id_foreign` (`portfolio_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_items`
--
ALTER TABLE `portfolio_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `portfolio_items`
--
ALTER TABLE `portfolio_items`
  ADD CONSTRAINT `portfolio_items_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
