-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2022 at 03:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add equipment', 7, 'add_equipment'),
(26, 'Can change equipment', 7, 'change_equipment'),
(27, 'Can delete equipment', 7, 'delete_equipment'),
(28, 'Can view equipment', 7, 'view_equipment'),
(29, 'Can add plan', 8, 'add_plan'),
(30, 'Can change plan', 8, 'change_plan'),
(31, 'Can delete plan', 8, 'delete_plan'),
(32, 'Can view plan', 8, 'view_plan'),
(33, 'Can add user member', 9, 'add_usermember'),
(34, 'Can change user member', 9, 'change_usermember'),
(35, 'Can delete user member', 9, 'delete_usermember'),
(36, 'Can view user member', 9, 'view_usermember'),
(37, 'Can add enquiry', 10, 'add_enquiry'),
(38, 'Can change enquiry', 10, 'change_enquiry'),
(39, 'Can delete enquiry', 10, 'delete_enquiry'),
(40, 'Can view enquiry', 10, 'view_enquiry'),
(41, 'Can add contact', 11, 'add_contact'),
(42, 'Can change contact', 11, 'change_contact'),
(43, 'Can delete contact', 11, 'delete_contact'),
(44, 'Can view contact', 11, 'view_contact');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$BSI5TtooayMFPths3EmA80$WPzPKhjb1r7Db+i8I3nSQf0RFZ+grFvGLsTz+vUvwN0=', '2022-05-07 11:28:28.166050', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-05-03 07:58:53.200519'),
(2, 'pbkdf2_sha256$320000$zO6coM8m3CnvktdjFF3wnG$I4a5q6KWbfAZ6PLU2bWh5VwY3fYlWvO1a12SIcVcvAg=', '2022-05-07 11:17:22.169166', 0, 'dev', 'Dev', 'Das', 'dev@gmail.com', 0, 1, '2022-05-04 06:05:02.370199'),
(3, 'pbkdf2_sha256$320000$HDupEPha5tTQgRjICF78mZ$bSFHJhY3einIMgXJuwKS9gur/+LUtTeEq8eJHvcIDOI=', '2022-05-06 11:17:29.504773', 0, 'Nandhu', 'Nandhu', 'Kannan', 'kannan@gmail.com', 0, 1, '2022-05-06 11:16:36.604823'),
(4, 'pbkdf2_sha256$320000$yGZ89BlMFYG6SWnomce32D$xh3PM0jhSnk89idAIvp3ApTfEvuKwOB/YpQsTQRL6ZY=', '2022-05-07 11:25:15.891315', 0, 'liju', 'liju', 'babu', 'd@gmail.com', 0, 1, '2022-05-07 11:22:21.671881');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-03 09:28:34.772783', '1', 'silver', 1, '[{\"added\": {}}]', 8, 1),
(2, '2022-05-03 09:29:40.177301', '1', 'abc', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'gymapp', 'contact'),
(10, 'gymapp', 'enquiry'),
(7, 'gymapp', 'equipment'),
(8, 'gymapp', 'plan'),
(9, 'gymapp', 'usermember'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-03 07:56:51.433602'),
(2, 'auth', '0001_initial', '2022-05-03 07:57:10.951139'),
(3, 'admin', '0001_initial', '2022-05-03 07:57:13.543921'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-03 07:57:13.599915'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-03 07:57:13.663911'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-03 07:57:15.003881'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-03 07:57:16.959826'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-03 07:57:17.351817'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-03 07:57:17.814712'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-03 07:57:18.961150'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-03 07:57:19.024403'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-03 07:57:19.104401'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-03 07:57:19.248392'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-03 07:57:19.457735'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-03 07:57:19.669756'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-03 07:57:19.766570'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-03 07:57:19.942551'),
(18, 'gymapp', '0001_initial', '2022-05-03 07:57:25.203448'),
(19, 'sessions', '0001_initial', '2022-05-03 07:57:27.706076'),
(20, 'gymapp', '0002_contact_plan', '2022-05-05 06:59:30.673169');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('64vz61g95bhrfvzpeofkjg1fm89bh51q', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLH82OIAcKU4qxN0hUgpo38y8lwhxW2vYOi9hKuIsQJx-txTzg9sOyj222yzz3NZlSnJX5EG7vM6Fn5fD_TuosddvnZRhBYMh65DAkfIZLBFrAkBn1YgQtcGinUmoDHk7EGZnRuLkNZJ4fwCMJzWb:1nloIz:ArdkVPRIvmUQr_TbwZEzQn60jt7_8TlzhZkVu9s8rSc', '2022-05-17 08:54:49.841458'),
('9fj0dlb1g82l394w1tuh8fktpnr64oy5', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmfen:_hlCxEG_YvgNFE_m3GPkZg7hWb-UqCeN2Lt121Uv2WA', '2022-05-19 17:52:53.290896'),
('aex0v4e214ojekwmgddj681vk8cxckn2', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmdLX:DlnH-uG8_GLq4ha9zrH3PtaC7kbSi3y2KeuYHlfEX_g', '2022-05-19 15:24:51.695087'),
('c0d9cb8zure1j6edmxgx2e3rvzssqfx4', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmrwQ:L-ENCqP0R1cGdsmD8ROWBfFSOg3tQH2Ba1pCBHhL8wM', '2022-05-20 06:59:54.970856'),
('dkqrp2vnc6wb8l8lwvs0krupaqpfsuno', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmdYY:lgALT2W5xCDx__bfKbs5M4EhCLmCvaVBjcFALyMEHUo', '2022-05-19 15:38:18.543827'),
('gjco4hdu382mjfyp8ikw6oec6v0m41op', '.eJxVjMEOwiAQRP-FsyHsQkE8evcbyLIQqRpISjkZ_9026aW3yZs38xVjTuKGFxForCWMnpewE4HixCLxO9e9SC-qzya51XWZo9wVebRdPlrKn_vhng4K9bKtDV2TRgM6I3kFbIxOYB0yqWgJvfMKt8DI6JVVHB0qmCKAcRMCRvH7AzIaOJk:1nmeW5:4qu4WQpETbAONZ3i7_7WKm944hR1feFLnz2pCrHecsw', '2022-05-19 16:39:49.423966'),
('j73i1m5ubpkv5m8o1ifrwnlqzu6i8h5x', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmg4G:-YKnBSe60McWUTHtpnTxVOAq_1dTg_fyhVkPrRNltYs', '2022-05-19 18:19:12.091235'),
('l93ckynb5ximnv1wds8fa3tqtebi2p1j', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmdDa:HwF02RFn3QW74TUTQwOAzYXuZv3x_c6XXDKb5sF-a5Y', '2022-05-19 15:16:38.964125'),
('mshepivdjgzdoz3ii25l7983dpedzjok', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nmddi:f75CEQrbDiv5Xt5r86kFgdkIa6KIq53jaUje0NtiCfI', '2022-05-19 15:43:38.016920'),
('opels20o27j6yzn3p4nlcgf8gbygbgfv', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLH82OIAcKU4qxN0hUgpo38y8lwhxW2vYOi9hKuIsQJx-txTzg9sOyj222yzz3NZlSnJX5EG7vM6Fn5fD_TuosddvnZRhBYMh65DAkfIZLBFrAkBn1YgQtcGinUmoDHk7EGZnRuLkNZJ4fwCMJzWb:1nmVVA:6b52jYIhmSrJ4cJKxEAl_xj03cdAZ9lyM2j10urQYww', '2022-05-19 07:02:16.925528'),
('sid58dpphapjchhxznljsne8m2iwucgd', '.eJxVjDsOwjAQBe_iGlnZ9fpHSc8ZLP-CA8iR4rhC3B0spUk7M-99WF8Su8KFOd_34nrLmxuEATux4OMr1yHS09fHyuNa920JfCT8sI3f15Tft6M9HRTfyn8dhMoCJkXaIIEhYSNooiwJAI0WM4KXCpM0KqBQZPVEGI2aKQcrkdj3BwHYN7g:1nnIbs:IvLB6iSdIweV0saiQuhwjVMZCF-X0OTxTUCULWlorpY', '2022-05-21 11:28:28.239009');

-- --------------------------------------------------------

--
-- Table structure for table `gymapp_contact`
--

CREATE TABLE `gymapp_contact` (
  `msgdate` date DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `isread` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gymapp_contact`
--

INSERT INTO `gymapp_contact` (`msgdate`, `id`, `name`, `emailid`, `contact`, `subject`, `message`, `isread`, `user_id`, `plan_id`) VALUES
('2022-05-06', 4, 'dev', 'dev@gmail.com', '9090909090', 'xxxxxxyyyyyyyyyyy', 'qwertyuio  asdfghjk', 'yes', 2, 1),
('2022-05-07', 5, 'liju', 'd@gmail.com', '98674578', 'kkkkkkkkkkkk', 'qwert asdfghj zxcvbn', 'no', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `gymapp_enquiry`
--

CREATE TABLE `gymapp_enquiry` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `age` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gymapp_equipment`
--

CREATE TABLE `gymapp_equipment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `purchasedate` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gymapp_equipment`
--

INSERT INTO `gymapp_equipment` (`id`, `name`, `price`, `unit`, `purchasedate`, `description`, `image`) VALUES
(1, 'abcd', '21000', '101', '2022-05-03', 'aaaaaaaaaaaa', 'image/user/gym4.jpg'),
(2, 'equip one', '20000', '10', '2022-05-02', 'xxxxxxxxxxxxxxxxx', 'image/user/gym1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gymapp_plan`
--

CREATE TABLE `gymapp_plan` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `amount` varchar(15) DEFAULT NULL,
  `duration` varchar(15) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gymapp_plan`
--

INSERT INTO `gymapp_plan` (`id`, `name`, `amount`, `duration`, `description`) VALUES
(1, 'silver', '12000', '6Month', 'XXXXXXXXXXXXXXXX'),
(3, 'gold', '13000', '8month', 'vvvvvvvvvvvvvvvvvvvvvvvv');

-- --------------------------------------------------------

--
-- Table structure for table `gymapp_usermember`
--

CREATE TABLE `gymapp_usermember` (
  `id` bigint(20) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_gender` varchar(150) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gymapp_usermember`
--

INSERT INTO `gymapp_usermember` (`id`, `user_address`, `user_gender`, `user_mobile`, `user_photo`, `user_id`) VALUES
(1, 'Kaloor', 'male', '9898989898', 'image/user/person2_im84yxf.png', 2),
(2, 'Kochi', 'female', '9887675655', 'image/user/person3.png', 3),
(3, 'asdfgh', 'male', '9897876756', 'image/user/person2_5gzjbvT.png', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `gymapp_contact`
--
ALTER TABLE `gymapp_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gymapp_contact_user_id_f56db10f_fk_auth_user_id` (`user_id`),
  ADD KEY `gymapp_contact_plan_id_b0fc1acd_fk_gymapp_plan_id` (`plan_id`);

--
-- Indexes for table `gymapp_enquiry`
--
ALTER TABLE `gymapp_enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gymapp_enquiry_user_id_ef101a4f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `gymapp_equipment`
--
ALTER TABLE `gymapp_equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gymapp_plan`
--
ALTER TABLE `gymapp_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gymapp_usermember`
--
ALTER TABLE `gymapp_usermember`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gymapp_usermember_user_id_69a2ad3f_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gymapp_contact`
--
ALTER TABLE `gymapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gymapp_enquiry`
--
ALTER TABLE `gymapp_enquiry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gymapp_equipment`
--
ALTER TABLE `gymapp_equipment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gymapp_plan`
--
ALTER TABLE `gymapp_plan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gymapp_usermember`
--
ALTER TABLE `gymapp_usermember`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gymapp_contact`
--
ALTER TABLE `gymapp_contact`
  ADD CONSTRAINT `gymapp_contact_plan_id_b0fc1acd_fk_gymapp_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `gymapp_plan` (`id`),
  ADD CONSTRAINT `gymapp_contact_user_id_f56db10f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gymapp_enquiry`
--
ALTER TABLE `gymapp_enquiry`
  ADD CONSTRAINT `gymapp_enquiry_user_id_ef101a4f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gymapp_usermember`
--
ALTER TABLE `gymapp_usermember`
  ADD CONSTRAINT `gymapp_usermember_user_id_69a2ad3f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
