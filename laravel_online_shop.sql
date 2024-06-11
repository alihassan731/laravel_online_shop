-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2024 at 11:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hawaii', 'hawaii', 1, '2024-01-12 19:41:26', '2024-02-01 02:20:41'),
(3, 'Samsung phone', 'samsung-phone', 1, '2024-01-12 20:36:55', '2024-01-12 20:36:55'),
(4, 'apple', 'apple', 0, '2024-01-12 20:38:26', '2024-01-12 20:38:26'),
(6, 'New Bags', 'new-bags', 1, '2024-01-12 23:42:03', '2024-01-13 00:24:19'),
(9, 'apple bad ok', 'apple-bad-ok', 1, '2024-01-13 00:17:48', '2024-01-13 00:23:46'),
(10, 'HP', 'hp', 1, '2024-01-31 22:23:58', '2024-01-31 22:23:58'),
(11, 'Dell', 'dell', 1, '2024-01-31 22:24:14', '2024-01-31 22:24:14'),
(12, 'IPHONE', 'iphone', 1, '2024-01-31 22:24:39', '2024-01-31 22:24:39'),
(13, 'SAMSUNG', 'samsung', 1, '2024-01-31 22:25:36', '2024-01-31 22:25:36'),
(14, 'Pak', 'pak', 1, '2024-01-31 22:26:54', '2024-01-31 22:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `status`, `showHome`, `created_at`, `updated_at`) VALUES
(9, 'Pant Shirt', 'pant-shirt', NULL, '0', 'No', '2024-01-09 22:05:44', '2024-01-09 22:05:44'),
(10, 'apple tew', 'apple-tew', '10-1706420283.jpeg', '1', 'Yes', '2024-01-09 22:09:59', '2024-01-28 00:38:03'),
(12, 'Tanis', 'tanis', NULL, '0', 'No', '2024-01-09 22:16:53', '2024-01-09 22:16:53'),
(13, 'Watches', 'watches', NULL, '1', 'No', '2024-01-09 22:33:42', '2024-01-09 22:33:42'),
(14, 'Computer', 'computer', '14-1706420048.jpeg', '1', 'Yes', '2024-01-09 22:36:41', '2024-01-28 00:34:08'),
(15, 'Laptop', 'laptop', '15-1706420029.jpeg', '1', 'Yes', '2024-01-09 22:36:54', '2024-01-28 00:33:49'),
(16, 'Speakers', 'speakers', NULL, '0', 'No', '2024-01-09 22:37:19', '2024-01-09 22:37:19'),
(17, 'Bags', 'bags', '17-1706419993.jpeg', '1', 'Yes', '2024-01-10 02:32:53', '2024-01-28 00:33:13'),
(18, 'School Bags', 'school-bags', NULL, '1', 'No', '2024-01-10 02:37:18', '2024-01-10 02:37:18'),
(19, 'Office Chair', 'office-chair', NULL, '1', 'No', '2024-01-10 02:45:47', '2024-01-27 22:46:19'),
(20, 'Best Place', 'best-place', '20.jpg', '0', 'No', '2024-01-10 02:51:05', '2024-01-10 02:51:05'),
(22, 'Moblie Phone', 'moblie-phone', '22.jpeg', '1', 'Yes', '2024-01-30 19:48:30', '2024-01-30 19:48:30'),
(23, 'Electronics', 'electronics', '23.jpg', '1', 'Yes', '2024-01-30 20:02:26', '2024-01-30 20:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'US', NULL, NULL),
(2, 'Canada', 'CA', NULL, NULL),
(3, 'Afghanistan', 'AF', NULL, NULL),
(4, 'Albania', 'AL', NULL, NULL),
(5, 'Algeria', 'DZ', NULL, NULL),
(6, 'American Samoa', 'AS', NULL, NULL),
(7, 'Andorra', 'AD', NULL, NULL),
(8, 'Angola', 'AO', NULL, NULL),
(9, 'Anguilla', 'AI', NULL, NULL),
(10, 'Antarctica', 'AQ', NULL, NULL),
(11, 'Antigua and/or Barbuda', 'AG', NULL, NULL),
(12, 'Argentina', 'AR', NULL, NULL),
(13, 'Armenia', 'AM', NULL, NULL),
(14, 'Aruba', 'AW', NULL, NULL),
(15, 'Australia', 'AU', NULL, NULL),
(16, 'Austria', 'AT', NULL, NULL),
(17, 'Azerbaijan', 'AZ', NULL, NULL),
(18, 'Bahamas', 'BS', NULL, NULL),
(19, 'Bahrain', 'BH', NULL, NULL),
(20, 'Bangladesh', 'BD', NULL, NULL),
(21, 'Barbados', 'BB', NULL, NULL),
(22, 'Belarus', 'BY', NULL, NULL),
(23, 'Belgium', 'BE', NULL, NULL),
(24, 'Belize', 'BZ', NULL, NULL),
(25, 'Benin', 'BJ', NULL, NULL),
(26, 'Bermuda', 'BM', NULL, NULL),
(27, 'Bhutan', 'BT', NULL, NULL),
(28, 'Bolivia', 'BO', NULL, NULL),
(29, 'Bosnia and Herzegovina', 'BA', NULL, NULL),
(30, 'Botswana', 'BW', NULL, NULL),
(31, 'Bouvet Island', 'BV', NULL, NULL),
(32, 'Brazil', 'BR', NULL, NULL),
(33, 'British lndian Ocean Territory', 'IO', NULL, NULL),
(34, 'Brunei Darussalam', 'BN', NULL, NULL),
(35, 'Bulgaria', 'BG', NULL, NULL),
(36, 'Burkina Faso', 'BF', NULL, NULL),
(37, 'Burundi', 'BI', NULL, NULL),
(38, 'Cambodia', 'KH', NULL, NULL),
(39, 'Cameroon', 'CM', NULL, NULL),
(40, 'Cape Verde', 'CV', NULL, NULL),
(41, 'Cayman Islands', 'KY', NULL, NULL),
(42, 'Central African Republic', 'CF', NULL, NULL),
(43, 'Chad', 'TD', NULL, NULL),
(44, 'Chile', 'CL', NULL, NULL),
(45, 'China', 'CN', NULL, NULL),
(46, 'Christmas Island', 'CX', NULL, NULL),
(47, 'Cocos (Keeling) Islands', 'CC', NULL, NULL),
(48, 'Colombia', 'CO', NULL, NULL),
(49, 'Comoros', 'KM', NULL, NULL),
(50, 'Congo', 'CG', NULL, NULL),
(51, 'Cook Islands', 'CK', NULL, NULL),
(52, 'Costa Rica', 'CR', NULL, NULL),
(53, 'Croatia (Hrvatska)', 'HR', NULL, NULL),
(54, 'Cuba', 'CU', NULL, NULL),
(55, 'Cyprus', 'CY', NULL, NULL),
(56, 'Czech Republic', 'CZ', NULL, NULL),
(57, 'Democratic Republic of Congo', 'CD', NULL, NULL),
(58, 'Denmark', 'DK', NULL, NULL),
(59, 'Djibouti', 'DJ', NULL, NULL),
(60, 'Dominica', 'DM', NULL, NULL),
(61, 'Dominican Republic', 'DO', NULL, NULL),
(62, 'East Timor', 'TP', NULL, NULL),
(63, 'Ecudaor', 'EC', NULL, NULL),
(64, 'Egypt', 'EG', NULL, NULL),
(65, 'El Salvador', 'SV', NULL, NULL),
(66, 'Equatorial Guinea', 'GQ', NULL, NULL),
(67, 'Eritrea', 'ER', NULL, NULL),
(68, 'Estonia', 'EE', NULL, NULL),
(69, 'Ethiopia', 'ET', NULL, NULL),
(70, 'Falkland Islands (Malvinas)', 'FK', NULL, NULL),
(71, 'Faroe Islands', 'FO', NULL, NULL),
(72, 'Fiji', 'FJ', NULL, NULL),
(73, 'Finland', 'FI', NULL, NULL),
(74, 'France', 'FR', NULL, NULL),
(75, 'France, Metropolitan', 'FX', NULL, NULL),
(76, 'French Guiana', 'GF', NULL, NULL),
(77, 'French Polynesia', 'PF', NULL, NULL),
(78, 'French Southern Territories', 'TF', NULL, NULL),
(79, 'Gabon', 'GA', NULL, NULL),
(80, 'Gambia', 'GM', NULL, NULL),
(81, 'Georgia', 'GE', NULL, NULL),
(82, 'Germany', 'DE', NULL, NULL),
(83, 'Ghana', 'GH', NULL, NULL),
(84, 'Gibraltar', 'GI', NULL, NULL),
(85, 'Greece', 'GR', NULL, NULL),
(86, 'Greenland', 'GL', NULL, NULL),
(87, 'Grenada', 'GD', NULL, NULL),
(88, 'Guadeloupe', 'GP', NULL, NULL),
(89, 'Guam', 'GU', NULL, NULL),
(90, 'Guatemala', 'GT', NULL, NULL),
(91, 'Guinea', 'GN', NULL, NULL),
(92, 'Guinea-Bissau', 'GW', NULL, NULL),
(93, 'Guyana', 'GY', NULL, NULL),
(94, 'Haiti', 'HT', NULL, NULL),
(95, 'Heard and Mc Donald Islands', 'HM', NULL, NULL),
(96, 'Honduras', 'HN', NULL, NULL),
(97, 'Hong Kong', 'HK', NULL, NULL),
(98, 'Hungary', 'HU', NULL, NULL),
(99, 'Iceland', 'IS', NULL, NULL),
(100, 'India', 'IN', NULL, NULL),
(101, 'Indonesia', 'ID', NULL, NULL),
(102, 'Iran (Islamic Republic of)', 'IR', NULL, NULL),
(103, 'Iraq', 'IQ', NULL, NULL),
(104, 'Ireland', 'IE', NULL, NULL),
(105, 'Israel', 'IL', NULL, NULL),
(106, 'Italy', 'IT', NULL, NULL),
(107, 'Ivory Coast', 'CI', NULL, NULL),
(108, 'Jamaica', 'JM', NULL, NULL),
(109, 'Japan', 'JP', NULL, NULL),
(110, 'Jordan', 'JO', NULL, NULL),
(111, 'Kazakhstan', 'KZ', NULL, NULL),
(112, 'Kenya', 'KE', NULL, NULL),
(113, 'Kiribati', 'KI', NULL, NULL),
(114, 'Korea, Democratic People\'s Republic of', 'KP', NULL, NULL),
(115, 'Korea, Republic of', 'KR', NULL, NULL),
(116, 'Kuwait', 'KW', NULL, NULL),
(117, 'Kyrgyzstan', 'KG', NULL, NULL),
(118, 'Lao People\'s Democratic Republic', 'LA', NULL, NULL),
(119, 'Latvia', 'LV', NULL, NULL),
(120, 'Lebanon', 'LB', NULL, NULL),
(121, 'Lesotho', 'LS', NULL, NULL),
(122, 'Liberia', 'LR', NULL, NULL),
(123, 'Libyan Arab Jamahiriya', 'LY', NULL, NULL),
(124, 'Liechtenstein', 'LI', NULL, NULL),
(125, 'Lithuania', 'LT', NULL, NULL),
(126, 'Luxembourg', 'LU', NULL, NULL),
(127, 'Macau', 'MO', NULL, NULL),
(128, 'Macedonia', 'MK', NULL, NULL),
(129, 'Madagascar', 'MG', NULL, NULL),
(130, 'Malawi', 'MW', NULL, NULL),
(131, 'Malaysia', 'MY', NULL, NULL),
(132, 'Maldives', 'MV', NULL, NULL),
(133, 'Mali', 'ML', NULL, NULL),
(134, 'Malta', 'MT', NULL, NULL),
(135, 'Marshall Islands', 'MH', NULL, NULL),
(136, 'Martinique', 'MQ', NULL, NULL),
(137, 'Mauritania', 'MR', NULL, NULL),
(138, 'Mauritius', 'MU', NULL, NULL),
(139, 'Mayotte', 'TY', NULL, NULL),
(140, 'Mexico', 'MX', NULL, NULL),
(141, 'Micronesia, Federated States of', 'FM', NULL, NULL),
(142, 'Moldova, Republic of', 'MD', NULL, NULL),
(143, 'Monaco', 'MC', NULL, NULL),
(144, 'Mongolia', 'MN', NULL, NULL),
(145, 'Montserrat', 'MS', NULL, NULL),
(146, 'Morocco', 'MA', NULL, NULL),
(147, 'Mozambique', 'MZ', NULL, NULL),
(148, 'Myanmar', 'MM', NULL, NULL),
(149, 'Namibia', 'NA', NULL, NULL),
(150, 'Nauru', 'NR', NULL, NULL),
(151, 'Nepal', 'NP', NULL, NULL),
(152, 'Netherlands', 'NL', NULL, NULL),
(153, 'Netherlands Antilles', 'AN', NULL, NULL),
(154, 'New Caledonia', 'NC', NULL, NULL),
(155, 'New Zealand', 'NZ', NULL, NULL),
(156, 'Nicaragua', 'NI', NULL, NULL),
(157, 'Niger', 'NE', NULL, NULL),
(158, 'Nigeria', 'NG', NULL, NULL),
(159, 'Niue', 'NU', NULL, NULL),
(160, 'Norfork Island', 'NF', NULL, NULL),
(161, 'Northern Mariana Islands', 'MP', NULL, NULL),
(162, 'Norway', 'NO', NULL, NULL),
(163, 'Oman', 'OM', NULL, NULL),
(164, 'Pakistan', 'PK', NULL, NULL),
(165, 'Palau', 'PW', NULL, NULL),
(166, 'Panama', 'PA', NULL, NULL),
(167, 'Papua New Guinea', 'PG', NULL, NULL),
(168, 'Paraguay', 'PY', NULL, NULL),
(169, 'Peru', 'PE', NULL, NULL),
(170, 'Philippines', 'PH', NULL, NULL),
(171, 'Pitcairn', 'PN', NULL, NULL),
(172, 'Poland', 'PL', NULL, NULL),
(173, 'Portugal', 'PT', NULL, NULL),
(174, 'Puerto Rico', 'PR', NULL, NULL),
(175, 'Qatar', 'QA', NULL, NULL),
(176, 'Republic of South Sudan', 'SS', NULL, NULL),
(177, 'Reunion', 'RE', NULL, NULL),
(178, 'Romania', 'RO', NULL, NULL),
(179, 'Russian Federation', 'RU', NULL, NULL),
(180, 'Rwanda', 'RW', NULL, NULL),
(181, 'Saint Kitts and Nevis', 'KN', NULL, NULL),
(182, 'Saint Lucia', 'LC', NULL, NULL),
(183, 'Saint Vincent and the Grenadines', 'VC', NULL, NULL),
(184, 'Samoa', 'WS', NULL, NULL),
(185, 'San Marino', 'SM', NULL, NULL),
(186, 'Sao Tome and Principe', 'ST', NULL, NULL),
(187, 'Saudi Arabia', 'SA', NULL, NULL),
(188, 'Senegal', 'SN', NULL, NULL),
(189, 'Serbia', 'RS', NULL, NULL),
(190, 'Seychelles', 'SC', NULL, NULL),
(191, 'Sierra Leone', 'SL', NULL, NULL),
(192, 'Singapore', 'SG', NULL, NULL),
(193, 'Slovakia', 'SK', NULL, NULL),
(194, 'Slovenia', 'SI', NULL, NULL),
(195, 'Solomon Islands', 'SB', NULL, NULL),
(196, 'Somalia', 'SO', NULL, NULL),
(197, 'South Africa', 'ZA', NULL, NULL),
(198, 'South Georgia South Sandwich Islands', 'GS', NULL, NULL),
(199, 'Spain', 'ES', NULL, NULL),
(200, 'Sri Lanka', 'LK', NULL, NULL),
(201, 'St. Helena', 'SH', NULL, NULL),
(202, 'St. Pierre and Miquelon', 'PM', NULL, NULL),
(203, 'Sudan', 'SD', NULL, NULL),
(204, 'Suriname', 'SR', NULL, NULL),
(205, 'Svalbarn and Jan Mayen Islands', 'SJ', NULL, NULL),
(206, 'Swaziland', 'SZ', NULL, NULL),
(207, 'Sweden', 'SE', NULL, NULL),
(208, 'Switzerland', 'CH', NULL, NULL),
(209, 'Syrian Arab Republic', 'SY', NULL, NULL),
(210, 'Taiwan', 'TW', NULL, NULL),
(211, 'Tajikistan', 'TJ', NULL, NULL),
(212, 'Tanzania, United Republic of', 'TZ', NULL, NULL),
(213, 'Thailand', 'TH', NULL, NULL),
(214, 'Togo', 'TG', NULL, NULL),
(215, 'Tokelau', 'TK', NULL, NULL),
(216, 'Tonga', 'TO', NULL, NULL),
(217, 'Trinidad and Tobago', 'TT', NULL, NULL),
(218, 'Tunisia', 'TN', NULL, NULL),
(219, 'Turkey', 'TR', NULL, NULL),
(220, 'Turkmenistan', 'TM', NULL, NULL),
(221, 'Turks and Caicos Islands', 'TC', NULL, NULL),
(222, 'Tuvalu', 'TV', NULL, NULL),
(223, 'Uganda', 'UG', NULL, NULL),
(224, 'Ukraine', 'UA', NULL, NULL),
(225, 'United Arab Emirates', 'AE', NULL, NULL),
(226, 'United Kingdom', 'GB', NULL, NULL),
(227, 'United States minor outlying islands', 'UM', NULL, NULL),
(228, 'Uruguay', 'UY', NULL, NULL),
(229, 'Uzbekistan', 'UZ', NULL, NULL),
(230, 'Vanuatu', 'VU', NULL, NULL),
(231, 'Vatican City State', 'VA', NULL, NULL),
(232, 'Venezuela', 'VE', NULL, NULL),
(233, 'Vietnam', 'VN', NULL, NULL),
(234, 'Virgin Islands (British)', 'VG', NULL, NULL),
(235, 'Virgin Islands (U.S.)', 'VI', NULL, NULL),
(236, 'Wallis and Futuna Islands', 'WF', NULL, NULL),
(237, 'Western Sahara', 'EH', NULL, NULL),
(238, 'Yemen', 'YE', NULL, NULL),
(239, 'Yugoslavia', 'YU', NULL, NULL),
(240, 'Zaire', 'ZR', NULL, NULL),
(241, 'Zambia', 'ZM', NULL, NULL),
(242, 'Zimbabwe', 'ZW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `created_at`, `updated_at`) VALUES
(1, 4, 'Hassan', 'Ali', 'Apple@gmail.com', '123123', 164, 'Near park road daska sialkot', '12345678', 'sialkot', 'skt', '123123', '2024-02-07 00:37:59', '2024-02-14 00:25:20'),
(2, 5, 'John S', 'Doe', 'john22@example.com', '123456745', 2, 'Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress', '123456', 'sialkot', 'sk', '1234', '2024-02-07 23:06:57', '2024-02-07 23:06:57'),
(3, 3, 'John X', 'Doe X', 'johnX@example.com', '1234123', 224, 'Dummy Address Dummy Address Dummy Address', '123456', 'Dnipro', 'Territory', '51010', '2024-02-14 00:39:04', '2024-02-14 00:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `discount_coupons`
--

CREATE TABLE `discount_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_uses` int(11) DEFAULT NULL,
  `max_uses_user` int(11) DEFAULT NULL,
  `type` enum('percent','fixed') NOT NULL DEFAULT 'fixed',
  `discount_amount` double(10,2) NOT NULL,
  `min_amount` double(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `starts_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_coupons`
--

INSERT INTO `discount_coupons` (`id`, `code`, `name`, `description`, `max_uses`, `max_uses_user`, `type`, `discount_amount`, `min_amount`, `status`, `starts_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'IND2020', 'India', 'Dummy description ok', 10, 1, 'fixed', 10.00, NULL, 0, '2024-02-08 06:21:42', '2024-02-10 05:00:46', '2024-02-09 01:23:08', '2024-02-09 10:55:54'),
(3, 'IND30', 'Dummy Name', 'Dummy data', 5, 2, 'percent', 10.00, 80.00, 1, '2024-02-08 06:46:26', '2024-02-29 06:46:37', '2024-02-09 01:46:55', '2024-02-09 23:42:06');

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
(5, '2024_01_08_055630_alter_users_table', 2),
(6, '2024_01_09_041413_create_categories_table', 3),
(7, '2024_01_10_064722_create_temp_images_table', 4),
(8, '2024_01_11_070039_create_sub_categories_table', 5),
(9, '2024_01_12_234646_create_brands_table', 6),
(10, '2024_01_13_054759_create_products_table', 7),
(11, '2024_01_13_054830_create_products_images_table', 7),
(12, '2024_01_25_044210_create_product_images_table', 8),
(13, '2024_01_28_032823_alter_categories_table', 9),
(14, '2024_01_28_034825_alter_products_table', 10),
(15, '2024_01_28_040559_alter_sub_categories_table', 11),
(16, '2024_01_28_041158_alter_categories_table', 12),
(17, '2024_02_02_052204_alter_products_table', 13),
(18, '2024_02_06_065242_alter_users_table', 14),
(19, '2024_02_06_181638_create_countries_table', 15),
(20, '2024_02_07_040601_create_orders_table', 16),
(21, '2024_02_07_040751_create_order_items_table', 16),
(22, '2024_02_07_040841_create_customer_addresses_table', 16),
(23, '2024_02_07_145843_create_shipping_charges_table', 17),
(24, '2024_02_08_161000_create_discount_coupons_table', 18),
(25, '2024_02_09_171004_alter_orders_table', 19),
(26, '2024_02_10_052858_alter_orders_table', 20),
(27, '2024_02_12_014505_alter_orders_table', 21),
(28, '2024_02_13_030307_create_wishlists_table', 22),
(29, '2024_02_14_061019_alter_users_table', 23),
(30, '2024_02_14_155508_create_pages_table', 24),
(31, '2024_02_17_040235_create_product_ratings_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_code_id` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `grand_total` double(10,2) NOT NULL,
  `payment_status` enum('paid','not paid') NOT NULL DEFAULT 'not paid',
  `status` enum('pending','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `shipped_date` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `apartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `shipping`, `coupon_code`, `coupon_code_id`, `discount`, `grand_total`, `payment_status`, `status`, `shipped_date`, `first_name`, `last_name`, `email`, `mobile`, `country_id`, `address`, `apartment`, `city`, `state`, `zip`, `notes`, `created_at`, `updated_at`) VALUES
(3, 4, 67.00, 0.00, NULL, NULL, NULL, 67.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 02:03:40', '2024-02-07 02:03:40'),
(4, 4, 217.00, 0.00, NULL, NULL, NULL, 217.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '2024-02-07 02:32:34', '2024-02-07 02:32:34'),
(5, 4, 45.00, 0.00, NULL, NULL, NULL, 45.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 02:40:49', '2024-02-07 02:40:49'),
(6, 4, 76.00, 0.00, NULL, NULL, NULL, 76.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 02:43:52', '2024-02-07 02:43:52'),
(7, 4, 23.00, 0.00, NULL, NULL, NULL, 23.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 02:45:53', '2024-02-07 02:45:53'),
(8, 4, 23.00, 0.00, NULL, NULL, NULL, 23.00, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 164, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 03:16:23', '2024-02-07 03:16:23'),
(9, 4, 120.00, 18.60, NULL, NULL, NULL, 138.60, 'not paid', 'shipped', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 2, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-07 22:51:43', '2024-02-07 22:51:43'),
(10, 5, 23.00, 9.30, NULL, NULL, NULL, 32.30, 'not paid', 'pending', NULL, 'John S', 'Doe', 'john22@example.com', '123456745', 2, 'Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress Dummy adress', '123456', 'sialkot', 'sk', '1234', NULL, '2024-02-07 23:06:57', '2024-02-07 23:06:57'),
(11, 4, 143.00, 18.60, 'IND30', 3, 14.30, 147.30, 'not paid', 'delivered', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 2, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-09 12:22:35', '2024-02-09 12:22:35'),
(12, 4, 45.00, 9.30, '', NULL, 0.00, 54.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 2, 'Dumy address Dumy addressDumy addressDumy addressDumy address Dumy address', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-10 21:53:34', '2024-02-10 21:53:34'),
(13, 4, 80.00, 18.60, 'IND30', 3, 8.00, 90.60, 'not paid', 'shipped', '2024-02-20 02:38:32', 'hasAli', 'hsn', 'hsn@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-11 12:36:25', '2024-02-11 22:15:45'),
(14, 4, 100.00, 9.30, '', NULL, 0.00, 109.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'Apple@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-12 01:51:22', '2024-02-12 01:51:22'),
(15, 4, 60.00, 9.30, '', NULL, 0.00, 69.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'Apple@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-12 02:00:56', '2024-02-12 02:00:56'),
(16, 4, 60.00, 9.30, '', NULL, 0.00, 69.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'Apple@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-01-24 02:01:40', '2024-02-12 02:01:40'),
(17, 4, 60.00, 9.30, '', NULL, 0.00, 69.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'Apple@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-01-16 02:02:16', '2024-02-12 02:02:16'),
(18, 4, 67.00, 9.30, '', NULL, 0.00, 76.30, 'not paid', 'pending', NULL, 'hasAli', 'hsn', 'Apple@gmail.com', '123456789', 2, 'Near park road daska sialkot', '12345678', 'sialkot', 'sk', '123123', NULL, '2024-02-13 02:43:33', '2024-02-13 02:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 110, 'Y7a', 1, 67.00, 67.00, '2024-02-07 02:03:40', '2024-02-07 02:03:40'),
(2, 4, 110, 'Y7a', 1, 67.00, 67.00, '2024-02-07 02:32:34', '2024-02-07 02:32:34'),
(3, 4, 107, 'Huawei Y8p', 2, 75.00, 150.00, '2024-02-07 02:32:34', '2024-02-07 02:32:34'),
(4, 5, 103, 'Huawei nova Y61', 1, 45.00, 45.00, '2024-02-07 02:40:49', '2024-02-07 02:40:49'),
(5, 6, 109, 'Porsche Design Huawei Mate 10', 1, 76.00, 76.00, '2024-02-07 02:43:52', '2024-02-07 02:43:52'),
(6, 7, 108, 'Nova 7i', 1, 23.00, 23.00, '2024-02-07 02:45:53', '2024-02-07 02:45:53'),
(7, 8, 108, 'Nova 7i', 1, 23.00, 23.00, '2024-02-07 03:16:23', '2024-02-07 03:16:23'),
(8, 9, 103, 'Huawei nova Y61', 1, 45.00, 45.00, '2024-02-07 22:51:43', '2024-02-07 22:51:43'),
(9, 9, 107, 'Huawei Y8p', 1, 75.00, 75.00, '2024-02-07 22:51:43', '2024-02-07 22:51:43'),
(10, 10, 60, 'Spot Light', 1, 23.00, 23.00, '2024-02-07 23:06:57', '2024-02-07 23:06:57'),
(11, 11, 110, 'Y7a', 1, 67.00, 67.00, '2024-02-09 12:22:35', '2024-02-09 12:22:35'),
(12, 11, 109, 'Porsche Design Huawei Mate 10', 1, 76.00, 76.00, '2024-02-09 12:22:35', '2024-02-09 12:22:35'),
(13, 12, 103, 'Huawei nova Y61', 1, 45.00, 45.00, '2024-02-10 21:53:34', '2024-02-10 21:53:34'),
(14, 13, 103, 'Huawei nova Y61', 1, 45.00, 45.00, '2024-02-11 12:36:25', '2024-02-11 12:36:25'),
(15, 13, 104, 'Huawei P30 Pro', 1, 35.00, 35.00, '2024-02-11 12:36:25', '2024-02-11 12:36:25'),
(16, 14, 78, 'iPhone X', 1, 100.00, 100.00, '2024-02-12 01:51:23', '2024-02-12 01:51:23'),
(17, 15, 66, 'iPhone 5', 1, 60.00, 60.00, '2024-02-12 02:00:56', '2024-02-12 02:00:56'),
(18, 16, 66, 'iPhone 5', 1, 60.00, 60.00, '2024-02-12 02:01:40', '2024-02-12 02:01:40'),
(19, 17, 66, 'iPhone 5', 1, 60.00, 60.00, '2024-02-12 02:02:16', '2024-02-12 02:02:16'),
(20, 18, 110, 'Y7a', 1, 67.00, 67.00, '2024-02-13 02:43:33', '2024-02-13 02:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'about-us', '<p><p></p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.<p></p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.</p><p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quas assumenda aliquam deserunt aspernatur numquam animi sit veniam distinctio voluptatem nihil ratione possimus ex eligendi molestias, similique earum? Ut accusamus exercitationem illo porro quis doloribus quasi atque, inventore dignissimos. Vel molestias quos maiores sequi explicabo numquam doloribus labore qui facilis rem.<br></p><p><br></p>', '2024-02-14 11:42:59', '2024-02-14 23:43:43'),
(3, 'Terms and Conditions', 'terms-and-conditions', '<p></p><p><b>Introduction</b>\r\n</p><ul><li>\r\nExplanation of the purpose of the terms and conditions.\r\n</li><li>Statement of agreement to terms by users upon accessing or using the platform.</li></ul><b>\r\n\r\nDefinitions</b><p></p><ul><li>\r\nClarification of terms used throughout the document to avoid ambiguity.\r\n</li></ul><p><b>Use of the Platform\r\n</b></p><ul><li>Eligibility criteria for users (e.g., age restrictions).</li><li>\r\nRestrictions on unlawful or prohibited activities.</li><li>\r\nUser responsibilities regarding account security and confidentiality.</li></ul><p><b>\r\nProduct Listings and Purchases</b></p><ul><li>\r\nGuidelines for product listings, including prohibited items.\r\n</li><li>Pricing information, including currency, taxes, and fees.\r\n</li><li>Payment terms, methods accepted, and billing procedures.\r\n</li><li>Order acceptance and cancellation policies.\r\n</li><li>Shipping and delivery terms, including estimated delivery times and shipping costs.\r\n</li><li>Returns, refunds, and exchange policies.</li></ul>', '2024-02-15 00:12:08', '2024-02-15 00:12:08'),
(4, 'Contact US', 'contact-us', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content.</p>\r\n                    <address>\r\n                    Cecilia Chapman <br>\r\n                    711-2880 Nulla St.<br> \r\n                    Mankato Mississippi 96522<br>\r\n                    <a href=\"tel:+xxxxxxxx\">(XXX) 555-2368</a><br>\r\n                    <a href=\"mailto:jim@rock.com\">jim@rock.com</a>\r\n                    </address>', '2024-02-15 10:37:45', '2024-02-15 10:53:32');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `shipping_return` text DEFAULT NULL,
  `related_products` text DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_featured` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `track_qty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_return`, `related_products`, `price`, `compare_price`, `category_id`, `sub_category_id`, `brand_id`, `is_featured`, `sku`, `barcode`, `track_qty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(39, 'Good Images', 'good-images', '<p>Good Images description<br></p>', NULL, NULL, NULL, 23.00, 212.00, 19, NULL, 9, 'Yes', '12345', '2342', 'Yes', 2, 1, '2024-01-26 00:41:01', '2024-01-29 12:36:11'),
(42, 'Sample Product', 'sample-product', '<p>Sample Product<br></p>', NULL, NULL, NULL, 75.00, 50.00, 17, NULL, NULL, 'Yes', 'SKU-001', 'BARCODE-001', 'Yes', 2, 1, '2024-01-26 01:19:57', '2024-01-29 12:35:25'),
(43, 'For Edit 1', 'for-edit-1', '<p>For Description 1</p>', NULL, NULL, NULL, 232.00, 501.00, 10, 1, 9, 'Yes', '122345', 'BARCODE-0012', 'Yes', 2, 1, '2024-01-26 12:14:28', '2024-01-28 00:59:23'),
(44, 'Cell Phpne', 'cell-phpne', '<p>this is the cell phone apple</p>', NULL, NULL, NULL, 500.00, 560.00, 14, 5, 3, 'Yes', 'SKU-0011', 'BARCODE-0011', 'Yes', 5, 1, '2024-01-30 00:08:08', '2024-01-30 00:08:08'),
(45, 'Office Chair', 'office-chair', '<p>This is the office Chare</p>', NULL, NULL, NULL, 700.00, 800.00, 14, 5, 3, 'Yes', 'SKU-002', 'BARCODE-002', 'Yes', 4, 1, '2024-01-30 00:57:41', '2024-01-30 00:57:41'),
(46, 'AC Fan', 'ac-fan', '<p>AC Fan Description<br></p>', NULL, NULL, NULL, 20.00, 30.00, 23, NULL, 14, 'No', 'Pak-1', 'Pak-01', 'Yes', 3, 1, '2024-01-31 22:29:02', '2024-01-31 22:29:02'),
(47, 'Air Conditioner', 'air-conditioner', '<p>Air Conditioner Description<br></p>', NULL, NULL, NULL, 50.00, 60.00, 23, NULL, 14, 'Yes', 'Pak-2', 'Pak-02', 'Yes', 2, 1, '2024-01-31 22:30:54', '2024-01-31 22:30:54'),
(48, 'Blender', 'blender', '<p>This is the Blender&nbsp;Blender.</p>', NULL, NULL, NULL, 30.00, 40.00, 23, NULL, 14, 'Yes', 'Pak-3', 'Pak-03', 'Yes', 5, 1, '2024-01-31 22:32:28', '2024-01-31 22:32:28'),
(49, 'Clothes iron', 'clothes-iron', '<p>This is the&nbsp;Clothes iron</p>', NULL, NULL, NULL, 40.00, 50.00, 23, NULL, 14, 'Yes', 'Pak-4', 'Pak-04', 'Yes', 2, 1, '2024-01-31 22:33:40', '2024-01-31 22:33:40'),
(50, 'Corn Bulbs', 'corn-bulbs', '<p>This is the&nbsp;Corn Bulbs</p>', NULL, NULL, NULL, 30.00, 35.00, 23, NULL, 14, 'Yes', 'Pak-5', 'Pak-05', 'Yes', 4, 1, '2024-01-31 22:35:09', '2024-01-31 22:35:09'),
(51, 'Electric Heater', 'electric-heater', '<p>This is the&nbsp;Electric Heater</p>', NULL, NULL, NULL, 50.00, 60.00, 23, NULL, 14, 'Yes', 'Pak-6', 'Pak-06', 'Yes', 4, 1, '2024-01-31 22:36:41', '2024-01-31 22:36:41'),
(52, 'Electric Kettle', 'electric-kettle', 'This is the&nbsp;Electric Kettle', NULL, NULL, NULL, 75.00, 50.00, 23, NULL, 14, 'Yes', 'Pak-7', 'Pak-07', 'Yes', 3, 1, '2024-01-31 22:38:25', '2024-01-31 22:38:25'),
(53, 'Electric toaster', 'electric-toaster', '<p>This is the&nbsp;Electric toaster</p>', NULL, NULL, NULL, 23.00, 50.00, 23, NULL, 14, 'Yes', 'Pak-8', 'Pak-08', 'Yes', 2, 1, '2024-01-31 22:39:30', '2024-01-31 22:39:30'),
(54, 'fluorescent light', 'fluorescent-light', '<p>This is the&nbsp;fluorescent light</p>', NULL, NULL, NULL, 75.00, 100.00, 23, NULL, 14, 'Yes', 'Pak-9', 'Pak-09', 'Yes', 1, 1, '2024-01-31 22:40:49', '2024-01-31 22:40:49'),
(55, 'Hairdryer', 'hairdryer', '<p>This is the&nbsp;Hairdryer</p>', NULL, NULL, NULL, 23.00, 40.00, 23, NULL, 14, 'Yes', 'Pak-01', 'Pak-001', 'Yes', 2, 1, '2024-01-31 22:42:17', '2024-01-31 22:42:17'),
(56, 'Incandescent Light', 'incandescent-light', '<p>This is the&nbsp;Incandescent Light</p>', NULL, NULL, NULL, 75.00, 80.00, 23, NULL, 14, 'Yes', 'Pak-02', 'Pak-002', 'Yes', 2, 1, '2024-01-31 22:43:55', '2024-01-31 22:43:55'),
(57, 'Microwave', 'microwave', '<p>This is the&nbsp;Microwave</p>', NULL, NULL, NULL, 60.00, 70.00, 23, NULL, 14, 'Yes', 'Pak-03', 'Pak-003', 'Yes', 3, 1, '2024-01-31 22:46:24', '2024-01-31 22:46:24'),
(58, 'Oven', 'oven', '<p>This is the Electric Oven</p>', NULL, NULL, NULL, 70.00, 100.00, 23, NULL, 14, 'Yes', 'Pak-04', 'Pak-004', 'Yes', 2, 1, '2024-01-31 22:48:31', '2024-01-31 22:48:31'),
(59, 'Refrigerators', 'refrigerators', '<p>This is the&nbsp;Refrigerators</p>', NULL, NULL, NULL, 300.00, 390.00, 23, NULL, 14, 'Yes', 'Pak-05', 'Pak-005', 'Yes', 2, 1, '2024-01-31 22:53:12', '2024-01-31 22:53:12'),
(60, 'Spot Light', 'spot-light', '<p>This is the&nbsp;Spot Light</p>', NULL, NULL, NULL, 23.00, 50.00, 23, NULL, NULL, 'Yes', 'Pak-06', 'Pak-006', 'Yes', 3, 1, '2024-01-31 22:55:07', '2024-01-31 22:55:07'),
(61, 'Television', 'television', 'This is the House&nbsp;Television', NULL, NULL, NULL, 50.00, 60.00, 23, NULL, NULL, 'No', 'Pak-08', 'Pak-008', 'Yes', 3, 1, '2024-01-31 22:56:37', '2024-01-31 22:56:37'),
(62, 'Tower fan', 'tower-fan', '<p>This is the&nbsp;Tower fan</p>', NULL, NULL, NULL, 70.00, 100.00, 23, NULL, NULL, 'Yes', 'Pak-09', 'Pak-009', 'Yes', 2, 0, '2024-01-31 22:57:47', '2024-01-31 22:57:47'),
(63, 'vacuum cleaner', 'vacuum-cleaner', '<p>This is the house cleaning&nbsp;vacuum cleaner</p>', NULL, NULL, NULL, 200.00, 230.00, 23, NULL, NULL, 'Yes', 'Pak-001', 'Pak-0001', 'Yes', 2, 1, '2024-01-31 22:59:17', '2024-01-31 22:59:17'),
(64, 'Washing Machine', 'washing-machine', '<p>Local&nbsp;Washing Machine</p>', NULL, NULL, NULL, 123.00, 212.00, 23, NULL, 14, 'Yes', 'Pak-002', 'Pak-0002', 'No', 2, 1, '2024-01-31 23:00:33', '2024-01-31 23:00:33'),
(65, 'iPhone 3GS', 'iphone-3gs', '<p>This is the&nbsp;iPhone 3GS.</p>', NULL, NULL, NULL, 50.00, 60.00, 22, 8, 12, 'Yes', 'iphone-1', 'iphone-01', 'Yes', 2, 1, '2024-02-01 01:29:56', '2024-02-01 01:29:56'),
(66, 'iPhone 5', 'iphone-5', '<p>This is the&nbsp;iPhone 5</p>', NULL, NULL, NULL, 60.00, 70.00, 22, 8, 12, 'Yes', 'iphone-2', 'iphone-02', 'Yes', 1, 1, '2024-02-01 01:31:50', '2024-02-01 01:31:50'),
(67, 'iPhone 6', 'iphone-6', '<p>This is the&nbsp;iPhone 6</p>', NULL, NULL, NULL, 70.00, 80.00, 22, 8, 12, 'Yes', 'iphone-3', 'iphone-03', 'Yes', 1, 1, '2024-02-01 01:33:11', '2024-02-01 01:33:11'),
(68, 'iPhone 6s', 'iphone-6s', '<p>This is the iPhone 6s<br></p>', NULL, NULL, NULL, 80.00, 90.00, 22, 8, 12, 'Yes', 'iphone-4', 'iphone-04', 'Yes', 2, 1, '2024-02-01 01:34:34', '2024-02-01 01:34:34'),
(69, 'iPhone 7', 'iphone-7', '<p>iPhone 7 description<br></p>', NULL, NULL, NULL, 100.00, 110.00, 22, 8, 12, 'Yes', 'iphone-5', 'iphone-05', 'Yes', 2, 1, '2024-02-01 01:36:12', '2024-02-01 01:36:12'),
(70, 'iPhone 8', 'iphone-8', '<p>iPhone 8&nbsp;Description<br></p>', NULL, NULL, NULL, 110.00, 120.00, 22, 8, 12, 'Yes', 'iphone-6', 'iphone-06', 'Yes', 1, 1, '2024-02-01 01:37:52', '2024-02-01 01:37:52'),
(71, 'iPhone 11', 'iphone-11', '<p>iPhone 11&nbsp;Description<br></p>', NULL, NULL, NULL, 120.00, 130.00, 22, 8, 12, 'Yes', 'iphone-11', 'iphone-011', 'Yes', 2, 1, '2024-02-01 01:39:13', '2024-02-01 01:39:13'),
(72, 'iPhone 12', 'iphone-12', '<p>iPhone 12&nbsp;Description<br></p>', NULL, NULL, NULL, 130.00, 140.00, 22, 8, 12, 'Yes', 'iphone-12', 'iphone-012', 'Yes', 1, 1, '2024-02-01 01:40:25', '2024-02-01 01:40:25'),
(73, 'iphone 13', 'iphone-13', '<p>iphone 13&nbsp;Description<br></p>', NULL, NULL, NULL, 150.00, 160.00, 22, 8, 12, 'Yes', 'iphone-13', 'iphone-013', 'Yes', 2, 1, '2024-02-01 01:41:38', '2024-02-01 01:41:38'),
(74, 'iPhone 14 Pro', 'iphone-14-pro', '<p>iPhone 14 Pro&nbsp;Description<br></p>', NULL, NULL, NULL, 160.00, 170.00, 22, 8, 12, 'Yes', 'iphone-14p', 'iphone-014p', 'Yes', 2, 1, '2024-02-01 01:43:05', '2024-02-01 01:43:05'),
(75, 'iphone 14', 'iphone-14', '<p>iphone 14&nbsp;Description<br></p>', NULL, NULL, NULL, 200.00, 210.00, 22, 8, 12, 'Yes', 'iphone-14', 'iphone-014', 'Yes', 1, 1, '2024-02-01 01:44:12', '2024-02-01 01:44:12'),
(76, 'iphone 15', 'iphone-15', '<p>iphone 15&nbsp;Description<br></p>', NULL, NULL, NULL, 220.00, 230.00, 22, 8, 12, 'Yes', 'iphone-15', 'iphone-015', 'Yes', 1, 1, '2024-02-01 01:45:17', '2024-02-01 01:45:17'),
(77, 'iPhone SE 3', 'iphone-se-3', '<p>iPhone SE 3&nbsp;Description<br></p>', NULL, NULL, NULL, 270.00, 280.00, 22, 8, 12, 'Yes', 'iphone-se', 'iphone-0se', 'Yes', 5, 1, '2024-02-01 01:46:33', '2024-02-01 01:46:33'),
(78, 'iPhone X', 'iphone-x', '<p>iPhone X&nbsp;Description<br></p>', NULL, NULL, NULL, 100.00, 110.00, 22, 8, 12, 'Yes', 'iphone-10', 'iphone-010', 'Yes', 2, 1, '2024-02-01 01:47:48', '2024-02-01 01:47:48'),
(79, 'Galaxy A03s', 'galaxy-a03s', '<p>Galaxy A03s&nbsp;Description<br></p>', NULL, NULL, NULL, 10.00, 15.00, 22, 9, 13, 'Yes', 'samsung-a03', 'samsung-a03', 'Yes', 2, 1, '2024-02-01 01:51:09', '2024-02-01 01:51:09'),
(80, 'Galaxy A04', 'galaxy-a04', '<p>Galaxy A04&nbsp;Description<br></p>', NULL, NULL, NULL, 35.00, 34.00, 22, 9, 13, 'Yes', 'samsung-a04', 'samsung-a04', 'Yes', 1, 1, '2024-02-01 01:52:25', '2024-02-01 01:52:25'),
(81, 'Galaxy A13', 'galaxy-a13', '<p>Galaxy A13&nbsp;Description<br></p>', NULL, NULL, NULL, 34.00, 54.00, 22, 9, 13, 'Yes', 'samsung-a13', 'samsung-a13', 'Yes', 2, 1, '2024-02-01 01:53:51', '2024-02-01 01:53:51'),
(82, 'Galaxy A14', 'galaxy-a14', '<p>Galaxy A14&nbsp;Description<br></p>', NULL, NULL, NULL, 43.00, 45.00, 22, 9, 13, 'Yes', 'samsung-a14', 'samsung-a14', 'Yes', 1, 1, '2024-02-01 01:56:02', '2024-02-01 01:56:02'),
(83, 'galaxy fold 2', 'galaxy-fold-2', '<p>galaxy fold 2&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 65.00, 22, 9, 13, 'Yes', 'samsung-fold', 'samsung-fold', 'Yes', 1, 1, '2024-02-01 01:57:19', '2024-02-01 01:57:19'),
(84, 'Galaxy M04', 'galaxy-m04', '<p>Galaxy M04&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 76.00, 22, 9, 13, 'Yes', 'samsung-mo4', 'samsung-mo4', 'Yes', 1, 1, '2024-02-01 01:58:21', '2024-02-01 01:58:21'),
(85, 'Galaxy Note10', 'galaxy-note10', '<p>Galaxy Note10&nbsp;Description<br></p>', NULL, NULL, NULL, 67.00, 76.00, 22, 9, 13, 'Yes', 'samsung-note10', 'samsung-note10', 'Yes', 1, 1, '2024-02-01 01:59:43', '2024-02-01 01:59:43'),
(86, 'Galaxy Note20', 'galaxy-note20', '<p>Galaxy Note20&nbsp;Description<br></p>', NULL, NULL, NULL, 34.00, 54.00, 22, 9, NULL, 'Yes', 'samsung-note20', 'samsung-note20', 'Yes', 1, 1, '2024-02-01 02:01:06', '2024-02-01 02:01:06'),
(87, 'Galaxy S', 'galaxy-s', '<p>Galaxy S&nbsp;Description<br></p>', NULL, NULL, NULL, 45.00, 65.00, 22, 9, 13, 'Yes', 'samsung-s', 'samsung-s', 'Yes', 1, 1, '2024-02-01 02:02:03', '2024-02-01 02:02:03'),
(88, 'Galaxy S23', 'galaxy-s23', '<p>Galaxy S23&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 65.00, 22, 9, 13, 'Yes', 'samsung-s23', 'samsung-s23', 'Yes', 2, 1, '2024-02-01 02:03:14', '2024-02-01 02:03:14'),
(89, 'Galaxy XCover', 'galaxy-xcover', '<p>Galaxy XCover&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 76.00, 22, 9, 13, 'Yes', 'samsung-x', 'samsung-x', 'Yes', 3, 1, '2024-02-01 02:05:09', '2024-02-01 02:05:09'),
(90, 'Galaxy Z', 'galaxy-z', '<p>Galaxy Z&nbsp;Description<br></p>', NULL, NULL, NULL, 23.00, 50.00, 22, 9, 13, 'Yes', 'samsung-z', 'samsung-z', 'Yes', 1, 1, '2024-02-01 02:08:53', '2024-02-01 02:08:53'),
(91, 'Samsung Galaxy A', 'samsung-galaxy-a', '<p>Samsung Galaxy A&nbsp;Description<br></p>', NULL, NULL, NULL, 34.00, 43.00, 22, 9, 13, 'Yes', 'samsung-a', 'samsung-a', 'Yes', 2, 1, '2024-02-01 02:10:20', '2024-02-01 02:10:20'),
(92, 'Samsung Galaxy M23', 'samsung-galaxy-m23', '<p>Samsung Galaxy M23&nbsp;Description<br></p>', NULL, NULL, NULL, 67.00, 76.00, 22, 9, 13, 'Yes', 'samsung-m23', 'samsung-m23', 'Yes', 3, 1, '2024-02-01 02:14:08', '2024-02-01 02:14:08'),
(93, 'Samsung Galaxy S10', 'samsung-galaxy-s10', '<p>Samsung Galaxy S10&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 67.00, 22, 9, 13, 'Yes', 'samsung-s10', 'samsung-s10', 'Yes', 3, 1, '2024-02-01 02:15:57', '2024-02-01 02:15:57'),
(94, 'samsung s23 ultraa', 'samsung-s23-ultraa', '<p>samsung s23 ultraa&nbsp;Description<br></p>', NULL, NULL, NULL, 67.00, 78.00, 22, 9, 13, 'Yes', 'samsung-s23ultra', 'samsung-s23ultra', 'Yes', 4, 1, '2024-02-01 02:17:11', '2024-02-01 02:17:11'),
(95, 'Honor 10', 'honor-10', '<p>Honor 10&nbsp;Description<br></p>', NULL, NULL, NULL, 23.00, 34.00, 22, 10, 1, 'Yes', 'hawai-1', 'hawai-1', 'Yes', 2, 1, '2024-02-01 02:21:29', '2024-02-01 02:21:46'),
(96, 'Huawei Enjoy 70', 'huawei-enjoy-70', '<p>Huawei Enjoy 70&nbsp;Description<br></p>', NULL, NULL, NULL, 23.00, 50.00, 22, 10, 1, 'Yes', 'hawai-70', 'hawai-70', 'Yes', 2, 1, '2024-02-01 02:22:52', '2024-02-01 02:22:52'),
(97, 'Huawei Mate 20', 'huawei-mate-20', '<p>Huawei Mate 20&nbsp;Description<br></p>', NULL, NULL, NULL, 75.00, 76.00, 22, 10, 1, 'Yes', 'hawai-20', 'hawai-20', 'Yes', 2, 1, '2024-02-01 02:23:51', '2024-02-01 02:23:51'),
(98, 'Huawei Mate 30', 'huawei-mate-30', '<p>Huawei Mate 30&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 67.00, 22, 10, 1, 'Yes', 'hawai-30', 'hawai-30', 'Yes', 4, 1, '2024-02-01 02:25:02', '2024-02-01 02:25:02'),
(99, 'Huawei Mate X3', 'huawei-mate-x3', '<p>Huawei Mate X3&nbsp;Description<br></p>', NULL, NULL, NULL, 67.00, 87.00, 22, 10, 1, 'Yes', 'hawai-x3', 'hawai-x3', 'Yes', 2, 1, '2024-02-01 02:26:13', '2024-02-01 02:26:13'),
(100, 'Huawei Mate Xs', 'huawei-mate-xs', '<p>Huawei Mate Xs&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 67.00, 22, 10, 1, 'Yes', 'hawai-xs', 'hawai-xs', 'Yes', 5, 1, '2024-02-01 02:27:18', '2024-02-01 02:27:18'),
(101, 'Huawei nova 9', 'huawei-nova-9', '<p>Huawei nova 9&nbsp;Description<br></p>', NULL, NULL, '', 67.00, 78.00, 22, 10, 1, 'Yes', 'hawai-9', 'hawai-9', 'Yes', 0, 0, '2024-02-01 02:28:26', '2024-02-13 03:17:11'),
(102, 'Huawei nova 10', 'huawei-nova-10', '<p>Huawei nova 10&nbsp;Description<br></p>', NULL, NULL, NULL, 78.00, 93.00, 22, 10, 1, 'Yes', 'hawai-10', 'hawai-10', 'Yes', 3, 1, '2024-02-01 02:29:44', '2024-02-01 02:29:44'),
(103, 'Huawei nova Y61', 'huawei-nova-y61', '<p>Huawei nova Y61&nbsp;Description<br></p>', NULL, NULL, '', 45.00, 56.00, 22, 10, 1, 'Yes', 'hawai-y61', 'hawai-y61', 'Yes', 2, 1, '2024-02-01 02:30:45', '2024-02-13 03:51:51'),
(104, 'Huawei P30 Pro', 'huawei-p30-pro', '<p>Huawei P30 Pro&nbsp;Description<br></p>', NULL, NULL, NULL, 35.00, 42.00, 22, 10, 1, 'Yes', 'hawai-p30', 'hawai-p30', 'Yes', 5, 1, '2024-02-01 02:32:03', '2024-02-01 02:32:03'),
(105, 'Huawei P60 Pro', 'huawei-p60-pro', '<p>Huawei P60 Pro&nbsp;Description<br></p>', NULL, NULL, NULL, 34.00, 45.00, 22, 10, 1, 'Yes', 'hawai-p60', 'hawai-p60', 'Yes', 1, 1, '2024-02-01 02:35:40', '2024-02-01 02:35:40'),
(106, 'Huawei Y5p', 'huawei-y5p', '<p>Huawei Y5p&nbsp;Description<br></p>', NULL, NULL, NULL, 56.00, 67.00, 22, 10, 1, 'Yes', 'hawai-y5p', 'hawai-y5p', 'Yes', 2, 1, '2024-02-01 02:37:03', '2024-02-01 02:37:03'),
(107, 'Huawei Y8p', 'huawei-y8p', '<p>Huawei Y8p&nbsp;Description<br></p>', NULL, NULL, NULL, 75.00, 76.00, 22, 10, 1, 'Yes', 'hawai-y8p', 'hawai-y8p', 'Yes', 4, 1, '2024-02-01 02:38:22', '2024-02-01 02:38:22'),
(108, 'Nova 7i', 'nova-7i', '<p>Nova 7i&nbsp;Description<br></p>', NULL, NULL, '', 23.00, 50.00, 22, 10, 1, 'Yes', 'hawai-7i', 'hawai-7i', 'Yes', 0, 1, '2024-02-01 02:39:36', '2024-02-13 03:01:02'),
(109, 'Porsche Design Huawei Mate 10', 'porsche-design-huawei-mate-10', '<p>Porsche Design Huawei Mate 10&nbsp;Description<br></p>', NULL, NULL, NULL, 76.00, 87.00, 22, NULL, 1, 'Yes', 'hawai-10pd', 'hawai-10pd', 'Yes', 4, 1, '2024-02-01 02:41:02', '2024-02-01 02:41:02'),
(110, 'Y7a', 'y7a', '<p>Y7a&nbsp;Description</p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>', '<p>Short Description:&nbsp;<span style=\"font-size: 1rem;\">Y7a&nbsp;Description</span><br></p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Error aliquid facere illum soluta tenetur explicabo optio laborum aspernatur vel! Voluptate natus ut aliquid non dolorum pariatur adipisci quos libero et!', '<p><span style=\"font-size: 1rem;\">Shipping and Return</span>:&nbsp;<span style=\"font-size: 1rem;\">Y7a&nbsp;Description</span><br></p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Error aliquid facere illum soluta tenetur explicabo optio laborum aspernatur vel! Voluptate natus ut aliquid non dolorum pariatur adipisci quos libero et!<br></p>', '97,99,101,103', 67.00, 75.00, 22, 10, 1, 'Yes', 'y7i', 'y7i', 'Yes', 0, 1, '2024-02-01 02:42:08', '2024-02-13 03:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(54, 39, '39-54-1706247661.jpeg', NULL, '2024-01-26 00:41:01', '2024-01-26 00:41:01'),
(57, 42, '42-57-1706249997.png', NULL, '2024-01-26 01:19:57', '2024-01-26 01:19:57'),
(58, 42, '42-58-1706249998.jpeg', NULL, '2024-01-26 01:19:58', '2024-01-26 01:19:58'),
(59, 43, '43-59-1706289268.jpeg', NULL, '2024-01-26 12:14:28', '2024-01-26 12:14:28'),
(60, 42, '42-60-1706330703.jpeg', NULL, '2024-01-26 23:45:03', '2024-01-26 23:45:03'),
(63, 44, '44-63-1706591288.jpeg', NULL, '2024-01-30 00:08:08', '2024-01-30 00:08:08'),
(64, 45, '45-64-1706594261.jpeg', NULL, '2024-01-30 00:57:41', '2024-01-30 00:57:41'),
(65, 46, '46-65-1706758142.png', NULL, '2024-01-31 22:29:02', '2024-01-31 22:29:02'),
(66, 47, '47-66-1706758254.png', NULL, '2024-01-31 22:30:54', '2024-01-31 22:30:54'),
(67, 48, '48-67-1706758348.jpeg', NULL, '2024-01-31 22:32:28', '2024-01-31 22:32:28'),
(68, 49, '49-68-1706758420.jpeg', NULL, '2024-01-31 22:33:40', '2024-01-31 22:33:40'),
(69, 50, '50-69-1706758509.png', NULL, '2024-01-31 22:35:09', '2024-01-31 22:35:09'),
(70, 51, '51-70-1706758601.jpeg', NULL, '2024-01-31 22:36:41', '2024-01-31 22:36:41'),
(71, 52, '52-71-1706758705.jpeg', NULL, '2024-01-31 22:38:25', '2024-01-31 22:38:25'),
(72, 53, '53-72-1706758770.jpeg', NULL, '2024-01-31 22:39:30', '2024-01-31 22:39:30'),
(73, 54, '54-73-1706758849.jpeg', NULL, '2024-01-31 22:40:49', '2024-01-31 22:40:49'),
(74, 55, '55-74-1706758937.jpeg', NULL, '2024-01-31 22:42:17', '2024-01-31 22:42:17'),
(75, 56, '56-75-1706759035.jpeg', NULL, '2024-01-31 22:43:55', '2024-01-31 22:43:55'),
(76, 57, '57-76-1706759184.jpeg', NULL, '2024-01-31 22:46:24', '2024-01-31 22:46:24'),
(77, 58, '58-77-1706759311.jpeg', NULL, '2024-01-31 22:48:31', '2024-01-31 22:48:31'),
(78, 59, '59-78-1706759592.jpeg', NULL, '2024-01-31 22:53:12', '2024-01-31 22:53:12'),
(79, 60, '60-79-1706759707.jpeg', NULL, '2024-01-31 22:55:07', '2024-01-31 22:55:07'),
(80, 61, '61-80-1706759797.jpeg', NULL, '2024-01-31 22:56:37', '2024-01-31 22:56:37'),
(81, 62, '62-81-1706759867.jpeg', NULL, '2024-01-31 22:57:47', '2024-01-31 22:57:47'),
(82, 63, '63-82-1706759957.jpeg', NULL, '2024-01-31 22:59:17', '2024-01-31 22:59:17'),
(83, 64, '64-83-1706760033.png', NULL, '2024-01-31 23:00:33', '2024-01-31 23:00:33'),
(84, 65, '65-84-1706768996.jpeg', NULL, '2024-02-01 01:29:56', '2024-02-01 01:29:56'),
(85, 66, '66-85-1706769110.jpeg', NULL, '2024-02-01 01:31:50', '2024-02-01 01:31:50'),
(86, 67, '67-86-1706769191.jpeg', NULL, '2024-02-01 01:33:11', '2024-02-01 01:33:11'),
(87, 68, '68-87-1706769274.jpeg', NULL, '2024-02-01 01:34:34', '2024-02-01 01:34:34'),
(88, 69, '69-88-1706769372.jpeg', NULL, '2024-02-01 01:36:12', '2024-02-01 01:36:12'),
(89, 70, '70-89-1706769472.jpeg', NULL, '2024-02-01 01:37:52', '2024-02-01 01:37:52'),
(90, 71, '71-90-1706769553.jpeg', NULL, '2024-02-01 01:39:13', '2024-02-01 01:39:13'),
(91, 72, '72-91-1706769625.jpeg', NULL, '2024-02-01 01:40:25', '2024-02-01 01:40:25'),
(92, 73, '73-92-1706769698.jpeg', NULL, '2024-02-01 01:41:38', '2024-02-01 01:41:38'),
(93, 74, '74-93-1706769785.jpeg', NULL, '2024-02-01 01:43:05', '2024-02-01 01:43:05'),
(94, 75, '75-94-1706769852.jpeg', NULL, '2024-02-01 01:44:12', '2024-02-01 01:44:12'),
(95, 76, '76-95-1706769917.jpeg', NULL, '2024-02-01 01:45:17', '2024-02-01 01:45:17'),
(96, 77, '77-96-1706769993.jpeg', NULL, '2024-02-01 01:46:33', '2024-02-01 01:46:33'),
(97, 78, '78-97-1706770068.jpeg', NULL, '2024-02-01 01:47:48', '2024-02-01 01:47:48'),
(98, 79, '79-98-1706770269.jpeg', NULL, '2024-02-01 01:51:09', '2024-02-01 01:51:09'),
(99, 80, '80-99-1706770345.jpeg', NULL, '2024-02-01 01:52:25', '2024-02-01 01:52:25'),
(100, 81, '81-100-1706770431.jpeg', NULL, '2024-02-01 01:53:51', '2024-02-01 01:53:51'),
(101, 82, '82-101-1706770562.jpeg', NULL, '2024-02-01 01:56:02', '2024-02-01 01:56:02'),
(102, 83, '83-102-1706770639.jpeg', NULL, '2024-02-01 01:57:19', '2024-02-01 01:57:19'),
(103, 84, '84-103-1706770701.jpg', NULL, '2024-02-01 01:58:21', '2024-02-01 01:58:21'),
(104, 85, '85-104-1706770783.jpeg', NULL, '2024-02-01 01:59:43', '2024-02-01 01:59:43'),
(105, 86, '86-105-1706770866.jpeg', NULL, '2024-02-01 02:01:06', '2024-02-01 02:01:06'),
(106, 87, '87-106-1706770923.jpeg', NULL, '2024-02-01 02:02:03', '2024-02-01 02:02:03'),
(107, 88, '88-107-1706770994.jpeg', NULL, '2024-02-01 02:03:14', '2024-02-01 02:03:14'),
(108, 89, '89-108-1706771109.jpeg', NULL, '2024-02-01 02:05:09', '2024-02-01 02:05:09'),
(109, 90, '90-109-1706771333.jpeg', NULL, '2024-02-01 02:08:53', '2024-02-01 02:08:53'),
(110, 91, '91-110-1706771420.jpeg', NULL, '2024-02-01 02:10:20', '2024-02-01 02:10:20'),
(111, 92, '92-111-1706771648.jpeg', NULL, '2024-02-01 02:14:08', '2024-02-01 02:14:08'),
(112, 93, '93-112-1706771757.jpeg', NULL, '2024-02-01 02:15:57', '2024-02-01 02:15:57'),
(113, 94, '94-113-1706771831.jpeg', NULL, '2024-02-01 02:17:11', '2024-02-01 02:17:11'),
(114, 95, '95-114-1706772089.jpeg', NULL, '2024-02-01 02:21:29', '2024-02-01 02:21:29'),
(115, 96, '96-115-1706772172.jpeg', NULL, '2024-02-01 02:22:52', '2024-02-01 02:22:52'),
(116, 97, '97-116-1706772231.jpeg', NULL, '2024-02-01 02:23:51', '2024-02-01 02:23:51'),
(117, 98, '98-117-1706772302.jpeg', NULL, '2024-02-01 02:25:02', '2024-02-01 02:25:02'),
(118, 99, '99-118-1706772373.jpeg', NULL, '2024-02-01 02:26:13', '2024-02-01 02:26:13'),
(119, 100, '100-119-1706772438.jpeg', NULL, '2024-02-01 02:27:18', '2024-02-01 02:27:18'),
(120, 101, '101-120-1706772506.jpeg', NULL, '2024-02-01 02:28:26', '2024-02-01 02:28:26'),
(121, 102, '102-121-1706772584.jpeg', NULL, '2024-02-01 02:29:44', '2024-02-01 02:29:44'),
(122, 103, '103-122-1706772645.jpeg', NULL, '2024-02-01 02:30:45', '2024-02-01 02:30:45'),
(123, 104, '104-123-1706772723.jpeg', NULL, '2024-02-01 02:32:03', '2024-02-01 02:32:03'),
(124, 105, '105-124-1706772940.jpeg', NULL, '2024-02-01 02:35:40', '2024-02-01 02:35:40'),
(125, 106, '106-125-1706773023.jpeg', NULL, '2024-02-01 02:37:03', '2024-02-01 02:37:03'),
(126, 107, '107-126-1706773102.jpeg', NULL, '2024-02-01 02:38:22', '2024-02-01 02:38:22'),
(127, 108, '108-127-1706773176.jpeg', NULL, '2024-02-01 02:39:36', '2024-02-01 02:39:36'),
(128, 109, '109-128-1706773262.jpeg', NULL, '2024-02-01 02:41:02', '2024-02-01 02:41:02'),
(129, 110, '110-129-1706773328.jpeg', NULL, '2024-02-01 02:42:08', '2024-02-01 02:42:08'),
(130, 108, '108-130-1706851049.jpeg', NULL, '2024-02-02 00:17:29', '2024-02-02 00:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` double(3,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `username`, `email`, `comment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 110, 'Mark Doe', 'Marked@gmail.com', 'Good Product for use!!', 4.00, 1, '2024-02-17 00:28:05', '2024-02-17 21:24:44'),
(2, 110, 'John Deu', 'john@example.com', 'this is the not extremely good', 3.00, 0, '2024-02-17 01:30:00', '2024-02-17 21:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `country_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, '100', 12.00, '2024-02-07 11:15:44', '2024-02-07 12:17:01'),
(4, '1', 10.00, '2024-02-07 12:54:16', '2024-02-07 12:54:16'),
(5, 'rest_of_world', 50.00, '2024-02-07 12:54:30', '2024-02-07 12:54:30'),
(6, '164', 15.00, '2024-02-07 21:09:20', '2024-02-07 21:09:20'),
(7, '2', 9.30, '2024-02-07 22:40:44', '2024-02-07 22:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `slug`, `status`, `showHome`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Motivation nmae', 'motivation-nmae', 1, 'No', 10, '2024-01-12 00:35:47', '2024-01-13 00:18:29'),
(4, 'HP Laptops', 'hp-laptops', 1, 'No', 15, '2024-01-27 22:18:08', '2024-01-27 22:18:08'),
(5, 'Dell Computer', 'dell-computer', 1, 'No', 14, '2024-01-27 22:18:40', '2024-01-27 22:18:40'),
(6, 'Apple Watch', 'apple-watch', 0, 'No', 10, '2024-01-27 22:19:22', '2024-01-27 22:19:22'),
(7, 'Dynamic', 'dynamic', 1, 'Yes', 17, '2024-01-27 23:19:26', '2024-01-27 23:19:42'),
(8, 'iphone mobile', 'iphone-mobile', 1, 'Yes', 22, '2024-01-30 19:52:14', '2024-01-30 19:53:36'),
(9, 'Samsung Mobile', 'samsung-mobile', 1, 'Yes', 22, '2024-01-30 19:54:21', '2024-01-30 19:54:21'),
(10, 'Hawaii Moblie', 'hawaii-moblie', 1, 'Yes', 22, '2024-01-30 19:54:45', '2024-01-30 19:54:45'),
(11, 'Dell Laptops', 'dell-laptops', 1, 'Yes', 15, '2024-01-30 19:55:52', '2024-01-30 19:55:52'),
(12, 'HP Computer', 'hp-computer', 1, 'Yes', 14, '2024-01-30 19:57:04', '2024-01-30 19:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `temp_images`
--

CREATE TABLE `temp_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, 2, 1, NULL, '$2y$12$nHJQOXZgFUvac/rxyGK/Su4VHZ3fWDH8185fBxN/RWVPhky49aLMW', NULL, '2024-01-08 01:09:09', '2024-02-15 02:37:19'),
(2, 'Mohit Singh', 'mohit@example.com', NULL, 1, 1, NULL, '$2y$12$DVRiBNYt.8QEANlD8PDVA.aPcfQ3LUZU7dPkN8bPMRcPTXuEYKBgG', NULL, '2024-01-08 01:13:26', '2024-01-08 01:13:26'),
(3, 'John Deu', 'john@example.com', '123456789', 1, 1, NULL, '$2y$12$2pilGF2rOid8OyS3WiRUlO7bMd9Lt2eNVC5yECD4c61Hxd.DaOoKK', NULL, '2024-02-06 02:20:51', '2024-02-06 02:20:51'),
(4, 'Mark Doe', 'mark@example.com', '123456789', 1, 1, NULL, '$2y$12$1oUYrYkr01dYKkXoL4lMbeukSr6p3/tOi0g0Xa.ZlehMsgcm1Ehvm', NULL, '2024-02-06 02:31:58', '2024-02-16 01:15:23'),
(5, 'john', 'john22@example.com', '123456789', 1, 1, NULL, '$2y$12$Nemr2e0/nDWQM3YAS/sNs.eyvaZcLymHM96fNE6LEV/OjKLoWG2fa', NULL, '2024-02-07 22:56:11', '2024-02-07 22:56:11'),
(8, 'Marked', 'Marked@gmail', '123123', 1, 1, NULL, '$2y$12$UkUa4mrlDEGOzfuFBZJIGOlta//uSs84QGnC6Yf012X8H0njXSOGi', NULL, '2024-02-14 09:29:01', '2024-02-14 09:29:01');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(8, 4, 107, '2024-02-13 02:15:46', '2024-02-13 02:15:46'),
(9, 4, 78, '2024-02-13 02:21:12', '2024-02-13 02:21:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_user_id_foreign` (`user_id`),
  ADD KEY `customer_addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_country_id_foreign` (`country_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `temp_images`
--
ALTER TABLE `temp_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_coupons`
--
ALTER TABLE `discount_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `temp_images`
--
ALTER TABLE `temp_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
