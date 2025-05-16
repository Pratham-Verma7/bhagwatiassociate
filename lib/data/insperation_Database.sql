-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 07, 2025 at 03:33 PM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u428368793_bhagwati_assoc`
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
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `lead_id`, `path`, `created_at`, `updated_at`) VALUES
(809, 569, 'lead_images/T6F568TNZxDYBMnAnmjSgUUacJjQsOpRwZESsNiv.jpg', '2024-07-09 03:44:12', '2024-07-09 03:44:12'),
(810, 569, 'lead_images/rNSPzCvusPPd0pyCyPSRrCbN6Wy6XBLYPaFs2zvF.jpg', '2024-07-09 03:44:12', '2024-07-09 03:44:12'),
(811, 569, 'lead_images/KTOfyT7SUHGMOytmJP62suedTItBetXgagQp5b2F.jpg', '2024-07-09 03:44:12', '2024-07-09 03:44:12'),

INSERT INTO `images` (`id`, `lead_id`, `path`, `created_at`, `updated_at`) VALUES

(5884, 1735, 'lead_images/w7aUuuW9JSzVID5UQkXrjvilbRZiK8tfNM1kqvEU.jpg', '2025-05-05 05:05:15', '2025-05-05 05:05:15'),
(5885, 1735, 'lead_images/S0JH3kyvDvHIAUcvZ4QPDRldIX8sfpQkPv8EVBu3.jpg', '2025-05-05 05:05:15', '2025-05-05 05:05:15'),
(5886, 1735, 'lead_images/4iNINYhipjRQe22h5QwD7UIwKUtrxVT61z1UODJt.jpg', '2025-05-05 05:05:15', '2025-05-05 05:05:15'),
(5887, 1735, 'lead_images/cgSygzRMZFlUkbSoCtE3QgRa9vtjluWGIALbKa4W.jpg', '2025-05-05 05:05:15', '2025-05-05 05:05:15'),
(5888, 1735, 'lead_images/zHBOV01xuaL6cOdPV8ABRaH9LVnTAuMxd3Q5l5iY.jpg', '2025-05-05 05:05:15', '2025-05-05 05:05:15'),
(5889, 1735, 'lead_images/A4BVo9A0VO8l4A396ZzBZfSd2eFHqZuwm2ULMl3x.jpg', '2025-05-05 05:14:09', '2025-05-05 05:14:09'),
(5890, 1734, 'lead_images/QoK0mHx2gNpFsqvsREXWrcmGM0LgU61oHcWMwOq0.jpg', '2025-05-05 05:17:33', '2025-05-05 05:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `product` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `application_no` varchar(255) NOT NULL,
  `verification_type` varchar(255) NOT NULL,
  `type_of_visit` varchar(255) DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `client_name`, `product`, `bank_name`, `address_type`, `address`, `application_no`, `verification_type`, `type_of_visit`, `contact_no`, `assigned_to`, `assigned_by`, `status`, `created_at`, `updated_at`) VALUES
(769, 'MR. DINESH KUMAR LODHA', 'Kekri', 'HL', 'CHOLA MANDALM', 'RESI', 'JAWLA GOYLA PO NASIRABAD DIST AJMER RAJASTHAN City	JAWLA\r\nPin Code	305601 Co-Applicant', '60430667', 'residence_verification', 'RESI', '9829637495', 20, 2, 3, '2024-08-10 16:03:26', '2024-08-17 04:26:37'),
(770, 'MR. DINESH KUMAR LODHA', 'Kekri', 'HL', 'CHOLA MANDALM', 'OFFCIE', 'Office Name	Dinesh kumar lodha  Office Addrss	JAWLA Goyla, ajmer\r\nCity	JAWLA  in Code	305601', '60430667', 'office_verification', 'OFFICE', '9829637495', 20, 2, 3, '2024-08-10 16:04:29', '2024-08-17 05:01:14'),
(771, 'MR NATHU RAM', 'KUCHAMAN', 'HL', 'CHOLA MANDALM', 'RESI', ': S/O PURNA RAM DHURILA RATAU NAGAUR LADNU RAJASTHAN\r\nCity	DHURILA  Pin Code	341317  8278664742 // 8239315379   Co-Applicant	MRS NIRMLA NIRMAL', '60464710', 'residence_verification', 'RESI', '8278664742', 19, 2, 3, '2024-08-12 06:43:03', '2024-08-14 03:45:24'),
(772, 'MR NATHU RAM', 'KUCHAMAN', 'HL', 'CHOLA MANDALM', 'OFFCIE', 'Office Name	NATHU RAM DAILRY\r\nOffice Addrss	DHURILA NAGAUR RAJASTHAN\r\nCity	DHURILA\r\nPin Code	341317       8278664742 // 8239315379', '60464710', 'office_verification', 'OFFICE', '8278664742', 19, 2, 3, '2024-08-12 06:44:03', '2024-08-14 03:52:59');
INSERT INTO `leads` (`id`, `name`, `client_name`, `product`, `bank_name`, `address_type`, `address`, `application_no`, `verification_type`, `type_of_visit`, `contact_no`, `assigned_to`, `assigned_by`, `status`, `created_at`, `updated_at`) VALUES

(1734, 'Mahendra Vikram singh', 'Merta', 'HL', 'CHOLAMANDLAM', 'RESI', 'S/O: Ram Singh, TH. merta city, Dhawa, PO: Dhawa Dist: Nagaur, Rajasthan, 341511\r\nCity	Nagaur\r\nPin Code	341511', '61025595', 'residence_verification', 'RESI', '9772747047', 19, 2, 3, '2025-04-29 04:48:26', '2025-05-05 05:17:33'),
(1735, 'Mahendra Vikram singh', 'MERTA', 'HL', 'CHOLAMANDLAM', 'OFFICE', 'MAHENDRA TRACTOR ONWER CUM DAIRY\r\nOffice Addrss	S/O: Ram Singh, TH. merta city, Dhawa, PO: Dhawa Dist: Nagaur, Rajasthan, 341511\r\nCity	Nagaur\r\nPin Code	341511', '61025595', 'office_verification', 'office', '9772747047', 4, 2, 3, '2025-04-29 04:49:33', '2025-05-05 05:14:09'),
(1736, 'Hanuman ram jaat  / Suman devi', 'MERTA', 'HL', 'CHOLAMANDLAM', 'RESI', 'S/O Bakshi Ram Jat KAKDAWA KI DHANIJHINTIYA NAGAUR 341513City	Nagaur  Pin Code	341513', '61035378', 'residence_verification', 'RESI', '8949620466', 19, 2, 3, '2025-05-01 04:17:18', '2025-05-02 05:44:41'),
(1737, 'Hanuman ram jaat', 'MERTA', 'HL', 'CHOLAMANDLAM', 'OFFICE', 'Office Name	SK MEDICAL AGENCY\r\nOffice Addrss	MANISH MARKET HERO AGRO K SAMNE RIYA BADI JASNAGAR ROAD\r\nCity	Nagaur\r\nPin Code	341513   8949620466', '61035378', 'office_verification', 'office', '8949620466', 19, 2, 3, '2025-05-01 04:18:27', '2025-05-02 06:25:23'),
(1738, 'ASHOK KUMAR Sahu', 'CMB', 'BL', 'INDIFI TECH', 'RESI CAM OFFICE', 'RV	JAVAHAR BHAWAN K PASS VINOD NAGAR BEAWAR AJMER BEAWAR RAJASTHAN Ajmer Rajasthan 305901 Landmark -	BL	AJMER	INDIFI TECH', '9799299257', 'residence_verification', 'RESI CAM OFFICE', '9799299257', 7, 2, 3, '2025-05-02 03:40:04', '2025-05-02 04:20:20'),
(1743, 'Hirender Singh Rathore', 'METRIX', 'EMPLOY VERIFICETION', 'DENAVE INDIA PVT LTD', 'Present', 'Girdhar Singh		\"VTC: Pranhera, PO: Pranhera, Sub District: Kekri, District: Ajmer, Rajasthan,\r\n  305404\"		Ajmer		305404', 'DEIPCHAA182', 'matrix', 'Residence', '8209548364', 4, 2, 3, '2025-05-06 17:03:37', '2025-05-06 17:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `leads_addresses`
--

CREATE TABLE `leads_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `ease_of_location` varchar(255) DEFAULT NULL,
  `customer_designation` varchar(255) DEFAULT NULL,
  `working_time` varchar(255) DEFAULT NULL,
  `address_confirm` int(2) NOT NULL DEFAULT 0,
  `stock_seen` int(2) NOT NULL DEFAULT 0,
  `business_activity_seen` int(2) NOT NULL DEFAULT 0,
  `rental_amount` varchar(255) DEFAULT NULL,
  `application_occupation` varchar(255) DEFAULT NULL,
  `premises` varchar(255) DEFAULT NULL,
  `premise_other` varchar(255) DEFAULT NULL,
  `company_category` varchar(255) DEFAULT NULL,
  `company_category_other` varchar(255) DEFAULT NULL,
  `employee_count` varchar(255) DEFAULT NULL,
  `meet_person` varchar(255) DEFAULT NULL,
  `meet_person_relation` varchar(255) DEFAULT NULL,
  `customer_age` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `child` varchar(255) DEFAULT NULL,
  `house_member` varchar(255) DEFAULT NULL,
  `earning_person` varchar(255) DEFAULT NULL,
  `living_time` varchar(255) DEFAULT NULL,
  `house_status` varchar(255) DEFAULT NULL,
  `house_other_status` varchar(255) DEFAULT NULL,
  `date_of_visit` date DEFAULT NULL,
  `time_of_visit` time DEFAULT NULL,
  `applicant_working` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `neighbor1_name` varchar(255) DEFAULT NULL,
  `neighbor1_address` varchar(255) DEFAULT NULL,
  `neighbor2_name` varchar(255) DEFAULT NULL,
  `neighbor2_address` varchar(255) DEFAULT NULL,
  `neighbour1_status` varchar(255) DEFAULT NULL,
  `neighbour2_status` varchar(255) DEFAULT NULL,
  `co_applicant_check` int(2) NOT NULL DEFAULT 0,
  `co_applicant_name` varchar(255) DEFAULT NULL,
  `co_applicant_relation` varchar(255) DEFAULT NULL,
  `meet_person_designation` varchar(255) DEFAULT NULL,
  `co_applicant_age` varchar(255) DEFAULT NULL,
  `co_applicant_living_time` varchar(255) DEFAULT NULL,
  `co_applicant_marital_status` varchar(255) DEFAULT NULL,
  `co_applicant_working` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `business_nature` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads_addresses`
--

INSERT INTO `leads_addresses` (`id`, `lead_id`, `customer_name`, `ease_of_location`, `customer_designation`, `working_time`, `address_confirm`, `stock_seen`, `business_activity_seen`, `rental_amount`, `application_occupation`, `premises`, `premise_other`, `company_category`, `company_category_other`, `employee_count`, `meet_person`, `meet_person_relation`, `customer_age`, `marital_status`, `child`, `house_member`, `earning_person`, `living_time`, `house_status`, `house_other_status`, `date_of_visit`, `time_of_visit`, `applicant_working`, `salary`, `neighbor1_name`, `neighbor1_address`, `neighbor2_name`, `neighbor2_address`, `neighbour1_status`, `neighbour2_status`, `co_applicant_check`, `co_applicant_name`, `co_applicant_relation`, `meet_person_designation`, `co_applicant_age`, `co_applicant_living_time`, `co_applicant_marital_status`, `co_applicant_working`, `status`, `remark`, `distance`, `business_nature`, `created_at`, `updated_at`) VALUES

(529, 714, NULL, 'ease', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sandhya vaishnav', 'brother\'s wife', '29', 'married', '1', '6', '2', 'SINCE BIRTH', 'PERENTAL', NULL, '2024-07-30', '12:11:00', 'SELF EMPLOY', NULL, 'Mulchand', 'POSITIVE', 'sankar', 'POSITIVE', 'positive', 'positive', 0, 'MR ANKIT VAISHNV', 'BROTHER', NULL, '27year', 'SINCE BIRTH', 'married', 'SELF EMPLOY', 'positive', 'MRS NIRMALA DEVI', '30', NULL, '2024-08-02 12:33:38', '2024-08-02 13:19:05'),
(530, 738, NULL, 'ease', 'OWNER', '9 YEARS', 1, 1, 1, NULL, 'salaried', 'other', 'pvt school', 'trending', NULL, '10', 'MR GOVIND VAISHNAV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'seels man', NULL, '2024-08-30', '12:10:00', NULL, '25000', 'Mulchand', 'POSITIVE', 'sankar', 'POSITIVE', 'positive', 'positive', 0, NULL, NULL, 'SELF', NULL, NULL, NULL, NULL, 'positive', 'Ankit Vaishnav has been working as a salesman for 2 years and his salary is Rs. 15,000 per month.', '40', 'trending', '2024-08-02 13:17:12', '2024-08-02 13:17:12'),
(531, 733, NULL, 'ease', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Self', 'Self', '34', 'married', '0', '4', '1', 'By birth', 'Ok', NULL, '2024-08-03', '01:30:00', 'Faince DSA wrk', NULL, 'Shivraj ji', 'Ok', 'Jagdish ji', 'Ok', 'positive', 'positive', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'positive', 'Customer self mile hai location par \r\nLiving by birth', NULL, NULL, '2024-08-03 09:06:59', '2024-08-03 09:06:59'),
(532, 732, NULL, 'ease', 'NA', 'NA', 1, 1, 1, NULL, 'self-employed', 'other', 'CONTRACTOR', 'other', 'CONTRACTOR', 'NA', 'GARD NAME NOT TOLD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NA', NULL, '2024-08-03', '10:31:00', NULL, 'NA', 'NA', 'NA', 'NA', 'NA', 'positive', 'positive', 0, NULL, NULL, 'NA', NULL, NULL, NULL, NULL, 'positive', 'I called the customer at the time of visit but the customer\'s call was not received and the guard did not allow the entry inside', '25', 'services', '2024-08-04 14:09:02', '2024-08-04 14:32:18'),
(533, 744, NULL, 'ease', 'OWNER', '10year', 1, 1, 1, NULL, 'self-employed', 'owned', NULL, 'trending', NULL, '0', 'BHAWAR SINGH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OWNED', NULL, '2024-08-05', '18:30:00', NULL, '0', 'NARENDRA', 'POSITIVE', 'MANISH', 'POSITIVE', 'positive', 'positive', 0, NULL, NULL, 'FATHER', NULL, NULL, NULL, NULL, 'positive', 'Customer name. Dinesh gurjar   Father name. Bhanwer Singh gurjar   Customer age 43\r\nHome to 40 years   Cow 6   Total milk 22 ltr   Dairy sell 7ltr    Home sell 15', '25', 'trending', '2024-08-05 15:03:16', '2024-08-05 15:03:16'),
(534, 747, NULL, 'ease', 'Constebal', '8 month', 1, 1, 1, NULL, 'salaried', 'other', 'Govt office', 'other', 'Na', '56', 'Self', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Na', NULL, '2024-08-07', '13:22:00', NULL, '45600', 'Vinod', 'Ok', 'Arvind', 'Ok', 'positive', 'positive', 0, NULL, NULL, 'Self', NULL, NULL, NULL, NULL, 'positive', 'Ok', '5', 'services', '2024-08-07 07:54:09', '2024-08-07 07:54:09'),
(535, 734, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', 'H', 'B', 'B', 'unknown', 'unknown', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'refer', 'V', NULL, NULL, '2024-08-09 03:08:13', '2024-08-09 03:08:13'),
(536, 700, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'H', 'Y', 'G', 'G', 'negative', 'unknown', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'refer', 'G', NULL, NULL, '2024-08-09 03:09:26', '2024-08-09 03:09:26'),
(537, 697, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', 'H', 'V', 'H', 'unknown', 'unknown', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'refer', 'G', NULL, NULL, '2024-08-09 03:09:55', '2024-08-09 03:09:55'),
(538, 696, NULL, 'untraceable', NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8', 'G', 'G', 'G', 'negative', 'unknown', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'negative', 'Vv', NULL, NULL, '2024-08-09 03:10:44', '2024-08-09 03:10:44'),
(539, 695, NULL, 'untraceable', NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', 'G', 'V', 'G', 'negative', 'negative', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'negative', 'G', NULL, NULL, '2024-08-09 03:11:38', '2024-08-09 03:11:38'),
(540, 694, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'G', 'H', 'G', 'G', 'positive', 'negative', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'negative', 'V', NULL, NULL, '2024-08-09 03:12:09', '2024-08-09 03:12:09'),
(541, 693, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'H', 'B', 'Y', 'negative', 'negative', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'negative', 'V', NULL, NULL, '2024-08-09 03:12:35', '2024-08-09 03:12:35'),
(542, 677, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'J', 'B', 'I', 'H', 'negative', 'negative', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'negative', 'B', NULL, NULL, '2024-08-09 03:13:03', '2024-08-09 03:13:03'),
(544, 743, NULL, 'ease', 'NA', 'NA', 1, 1, 1, 'DFG', 'self-employed', 'other', 'NA', 'other', 'NA', 'NA', 'NA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NA', NULL, '2024-08-08', '11:24:00', NULL, 'NA', 'NA', 'NA', 'NA', 'NA', 'unknown', 'unknown', 0, NULL, NULL, 'NA', NULL, NULL, NULL, NULL, 'negative', 'NA', '30', 'services', '2024-08-09 05:55:50', '2024-08-09 06:03:13'),
(545, 742, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NA', 'NA', 'NA', 'NA', 'unknown', 'unknown', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'refer', 'There is no office setup on the address given by the customer. When I called the customer, he said he would return it in a little while and disconnected the call.', NULL, NULL, '2024-08-09 05:56:52', '2024-08-09 05:56:52'),
(546, 745, NULL, 'ease', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bhagwan singh', 'Father', '30year', 'married', '2', '5', '2', 'Since birth', 'Perental', NULL, '2024-08-10', '15:12:00', 'Pvt job', NULL, 'Chelsingh', 'Ok', 'Dalpat singu', 'Ok', 'positive', 'positive', 0, 'Bhagwan singh', 'Father', NULL, '62', '24', 'married', 'Lic penshner', 'positive', 'Mamta rawat.  Wife. Age. 25year on addr 6year house wife', '8', NULL, '2024-08-10 09:45:37', '2024-08-10 09:45:37'),
(547, 741, NULL, 'untraceable', NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VINOD', 'POSITIVE', 'PRKASH', 'POSITIVE', 'negative', 'positive', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'positive', 'OK', NULL, NULL, '2024-08-10 16:38:56', '2024-08-10 16:38:56'),
(548, 758, NULL, 'untraceable', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BALVEER', 'NOT CANFARM', 'MAHENDRA', 'NOT CANFARM', 'negative', 'negative', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'refer', 'OL', NULL, NULL, '2024-08-10 16:40:16', '2024-08-10 16:40:16'),
(549, 751, NULL, 'ease', NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kamal mali', 'SON', '40', 'married', '3', '5', '1', 'SINCE BIRTH', 'PERENTAL', NULL, '2024-08-09', '10:12:00', 'contracture', NULL, 'Mukesh', 'POSITIVE', 'Om parkesh j', 'POSITIVE', 'positive', 'positive', 0, 'SANTOSH MALI', 'wife', NULL, '38', '20YEAR', 'married', 'HOUSE WIFE', 'positive', 'OK', '35', NULL, '2024-08-10 16:45:13', '2024-08-10 16:45:13'),
(550, 752, NULL, 'ease', 'OWNER', '20YEAR', 1, 0, 0, NULL, 'self-employed', 'owned', NULL, 'manufacturing', NULL, '0', 'kamal mali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'resi only', NULL, '2024-08-09', '10:57:00', NULL, '0', 'Mukesh', 'POSITIVE', 'Om parkesh', 'POSITIVE', 'positive', 'positive', 0, NULL, NULL, 'SON', NULL, NULL, NULL, NULL, 'refer', 'OK', '40', 'services', '2024-08-10 16:47:31', '2024-08-10 16:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `lead_employee_address_verification`
--

CREATE TABLE `lead_employee_address_verification` (
  `lead_id` int(11) NOT NULL,
  `candidate_name_eav` varchar(99) DEFAULT NULL,
  `father_name_eav` varchar(99) DEFAULT NULL,
  `address_eav` varchar(99) DEFAULT NULL,
  `dob_eav` varchar(99) DEFAULT NULL,
  `period_of_stay_eav` varchar(99) DEFAULT NULL,
  `contact_number_eav` varchar(99) DEFAULT NULL,
  `date_time_at_visit_eav` varchar(99) DEFAULT NULL,
  `name_of_respondent_eav` varchar(99) DEFAULT NULL,
  `relation_eav` varchar(99) DEFAULT NULL,
  `landmark_eav` varchar(99) DEFAULT NULL,
  `property_type_eav` varchar(99) DEFAULT NULL,
  `address_type_eav` varchar(999) DEFAULT NULL,
  `period_of_stay_from_eav` varchar(99) DEFAULT NULL,
  `period_of_stay_to_eav` varchar(99) DEFAULT NULL,
  `no_of_family_member_eav` varchar(99) DEFAULT NULL,
  `signature_eav` varchar(99) DEFAULT NULL,
  `remarks_eav` varchar(99) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL,
  `ref_no_eav` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_employee_address_verification`
--

INSERT INTO `lead_employee_address_verification` (`lead_id`, `candidate_name_eav`, `father_name_eav`, `address_eav`, `dob_eav`, `period_of_stay_eav`, `contact_number_eav`, `date_time_at_visit_eav`, `name_of_respondent_eav`, `relation_eav`, `landmark_eav`, `property_type_eav`, `address_type_eav`, `period_of_stay_from_eav`, `period_of_stay_to_eav`, `no_of_family_member_eav`, `signature_eav`, `remarks_eav`, `created_at`, `updated_at`, `id`, `ref_no_eav`) VALUES
(1567, 'Brijesh', 'asdf', 'dhamtan sahib, narwana', '2025-03-05', 'dsaf', 'sadf', '2025-03-05T20:39', 'dsf', 'adsf', 'sadf', 'sdf', 'sadf', '2025-03-05T20:35', '2025-03-05T20:33', '2', 'https://www.bhagwatiassociate.in/storage/uploads/1741187109_67c86825b7851.jpg', NULL, '2025-03-05 15:05:09', '2025-03-05 15:39:38', 1, 'SDS'),
(1564, 'Sukirti Shrama', 'Vinod Kumar Sharma', 'A-951, Somalpur Road, Chandravardai Nagar, Ajmer, Rajasthan - 305001', '1998-03-05', 'SINCE BIRTH TO TILL DATE', '8971581271', '2025-03-05T15:38', 'Anil kumar sharma', 'FATHER IN LOW', 'SCHOOL', 'RESI', 'PARMANENT', '2019-02-05T23:18', '2025-03-05T21:45', '4', 'https://bhagwatiassociate.in/storage/uploads/1741191714_67c87a227292d.jpeg', 'OK', '2025-03-05 16:21:54', '2025-03-05 16:21:54', 2, 'BGIPL-01-03-2025-552'),
(1602, 'm,.n', 'm,n,', 'm,n,', '2025-03-11', 'mn,', 'mn,nm', '2025-03-18T00:17', 's Sohan', 'SELF', 'SCHOOL', 'since birth to tilldate', 'PARMANENT', '2025-03-06T09:20', '2024-02-19T09:20', '5', 'https://bhagwatiassociate.in/storage/uploads/1742356074_67da3e6a3fbd7.jpeg', 'door louk', '2025-03-19 03:47:54', '2025-03-19 03:47:54', 3, 'm,nm'),
(1619, 's Sohan', 'JABBAR MOHAMMAD', 'NAGINA E MITRA CC ROAD NR BHATIYA GARDAN AJMER 305001', '1984-03-27', 'SINCE BIRTH TO TILL DATE', '07737727214', '2025-03-22T11:20', 'Sohan Lal', 'SELF', 'SCHOOL', 'RESI', 'PARMANENT', '1984-03-22T11:20', '2025-03-22T11:20', '4', 'https://bhagwatiassociate.in/storage/uploads/1742622668_67de4fcca6b60.jpeg', 'OK', '2025-03-22 05:51:08', '2025-03-22 05:51:08', 4, 'FKT5634065');

-- --------------------------------------------------------

--
-- Table structure for table `lead_insurance`
--

CREATE TABLE `lead_insurance` (
  `proposal_number_if` varchar(99) DEFAULT NULL,
  `name_of_life_assured_if` varchar(99) DEFAULT NULL,
  `life_insured_name_if` varchar(99) DEFAULT NULL,
  `verification_status_if` varchar(99) DEFAULT NULL,
  `name_of_person_met_if` varchar(99) DEFAULT NULL,
  `relationship_with_applicant_if` varchar(99) DEFAULT NULL,
  `applicant_dob_if` varchar(99) DEFAULT NULL,
  `health_condition_if` varchar(99) DEFAULT NULL,
  `applied_for_policy_if` varchar(99) DEFAULT NULL,
  `received_the_policy_if` varchar(99) DEFAULT NULL,
  `any_medical_history_if` varchar(99) DEFAULT NULL,
  `medical_done_if` varchar(99) DEFAULT NULL,
  `education_if` varchar(99) DEFAULT NULL,
  `occupation_if` varchar(99) DEFAULT NULL,
  `annual_income_of_applicant_if` varchar(99) DEFAULT NULL,
  `name_of_shop_if` varchar(99) DEFAULT NULL,
  `la_informed_the_agent_if` varchar(99) DEFAULT NULL,
  `existing_insurance_agent_if` varchar(99) DEFAULT NULL,
  `nominee_relation_if` varchar(99) DEFAULT NULL,
  `insured_photo_taken_if` varchar(99) DEFAULT NULL,
  `id_proof_taken_if` varchar(99) DEFAULT NULL,
  `new_address_obtained_if` varchar(99) DEFAULT NULL,
  `residence_locality_if` varchar(99) DEFAULT NULL,
  `residence_ownership_if` varchar(99) DEFAULT NULL,
  `period_of_stay_if` varchar(99) DEFAULT NULL,
  `phone_number_if` varchar(99) DEFAULT NULL,
  `date_of_visit_if` varchar(99) DEFAULT NULL,
  `name_of_indentity_if` varchar(99) DEFAULT NULL,
  `habit_if` varchar(99) DEFAULT NULL,
  `neighbor_1_2_if` varchar(99) DEFAULT NULL,
  `neighbor_3_4_if` varchar(99) DEFAULT NULL,
  `verifier_name_if` varchar(99) DEFAULT NULL,
  `lead_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_insurance`
--

INSERT INTO `lead_insurance` (`proposal_number_if`, `name_of_life_assured_if`, `life_insured_name_if`, `verification_status_if`, `name_of_person_met_if`, `relationship_with_applicant_if`, `applicant_dob_if`, `health_condition_if`, `applied_for_policy_if`, `received_the_policy_if`, `any_medical_history_if`, `medical_done_if`, `education_if`, `occupation_if`, `annual_income_of_applicant_if`, `name_of_shop_if`, `la_informed_the_agent_if`, `existing_insurance_agent_if`, `nominee_relation_if`, `insured_photo_taken_if`, `id_proof_taken_if`, `new_address_obtained_if`, `residence_locality_if`, `residence_ownership_if`, `period_of_stay_if`, `phone_number_if`, `date_of_visit_if`, `name_of_indentity_if`, `habit_if`, `neighbor_1_2_if`, `neighbor_3_4_if`, `verifier_name_if`, `lead_id`, `id`, `created_at`, `updated_at`) VALUES
('12', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'vABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC', 'ABC222', 'ABC', 'ABC', 1577, 1, '2025-03-07 16:43:17', '2025-03-07 16:43:23'),
('NA', 's Sohan', 's Sohan', 'POSITIVE', 's Sohan', 'SELF', '10/01/1984', 'OK', 'YES', 'NO', 'NO', 'YES', '10TH PASS', 'PVT JOB', '150000', '7737727214', '7737727214', 'NO', 'SANJU', 'YES', 'YES', 'NO', 'MIDIL', 'PERENTAL', 'SINCE BORTH', '07737727214', '10/03/2025', 'AADGAR', 'NO', 'SANTOSH   VIJENDRA', 'MANOHAR   HARI', 'SOHAN', 1585, 2, '2025-03-08 16:29:59', '2025-03-08 16:29:59'),
('12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', '12', 'https://www.bhagwatiassociate.in/storage/uploads/1741603390_67cec23ece266.png', '12', '12', '12', '1', '12', '1', '12', '12', '12', '121', '21', '2', 1587, 3, '2025-03-10 10:42:33', '2025-03-10 10:43:10'),
('LA53693931', 'RANJEET JAT', 'na', 'POSITIVE', 'RANJEET JAT', 'SELF', '30year', 'OK', 'YES', 'NO', 'NO', 'YES', '10TH PASS', 'PVT JOB', '150000', 'farming', 'no', 'NO', 'na', 'https://bhagwatiassociate.in/storage/uploads/1741626924_67cf1e2ccaf4b.jpeg', 'no', 'NO', 'MIDIL', 'PERENTAL', 'SINCE BORTH', '9784173672', '07/03/2025', 'na', 'NO', 'SANTOSH   VIJENDRA', 'MANOHAR   HARI', 'hansraj', 1584, 4, '2025-03-10 17:15:24', '2025-03-10 17:15:24');

-- --------------------------------------------------------

--
-- Table structure for table `lead_matrix`
--

CREATE TABLE `lead_matrix` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_name` varchar(255) NOT NULL,
  `matrix_ref_no` varchar(255) NOT NULL,
  `verification_datetime` datetime NOT NULL,
  `address_provided` text NOT NULL,
  `address_confirmed` text NOT NULL,
  `confirmation_mode` enum('Written','Verbal') NOT NULL,
  `respondent_name` varchar(255) NOT NULL,
  `respondent_relationship` varchar(255) NOT NULL,
  `matrix_status` varchar(255) NOT NULL,
  `address_proof_details` varchar(999) NOT NULL,
  `neighbour_confirmation` enum('Yes','No','NA') NOT NULL,
  `location_nature` enum('Lower','Middle','Upper Class') NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `police_station` varchar(255) NOT NULL,
  `verification_comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `signature_of_respondent` varchar(999) DEFAULT NULL,
  `sign_AuthorizedMatrixRepresentative` varchar(999) DEFAULT NULL,
  `name_AuthorizedMatrixRepresentative` varchar(99) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_matrix`
--

INSERT INTO `lead_matrix` (`id`, `lead_id`, `candidate_name`, `matrix_ref_no`, `verification_datetime`, `address_provided`, `address_confirmed`, `confirmation_mode`, `respondent_name`, `respondent_relationship`, `matrix_status`, `address_proof_details`, `neighbour_confirmation`, `location_nature`, `landmark`, `police_station`, `verification_comment`, `created_at`, `updated_at`, `signature_of_respondent`, `sign_AuthorizedMatrixRepresentative`, `name_AuthorizedMatrixRepresentative`) VALUES
(21, 1692, 'Rampal Singh', 'RBLDCBI759', '2025-04-15 12:26:00', 'Chandan Singh 94,Rajput v Daroga ka Mohalla Nimbora	 Nagaur Rajasthan	341022		-', 'since birth to till date', 'Verbal', 'chandan singh', 'FATHER', 'PERENTAL', 'electricity_bill', 'Yes', 'Middle', 'govt school', 'Nimbora', 'na', '2025-04-15 12:18:35', '2025-04-15 12:19:14', 'https://bhagwatiassociate.in/storage/uploads/1744719515_67fe4e9b06b22.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1744719515_67fe4e9b0952f.jpeg', 'manish'),
(22, 1706, 'Irfan', 'EXLLMAK329', '2025-04-17 15:43:00', 'Munna	Sarana Road Chamdaghar Kishangarh Ajmer Rajasthan 305801	Sarana Road Chamdaghar Kishangarh Ajmer Rajasthan 305801', 'SINCE 20214 TO  TILL DATE', 'Written', 'MUNNA', 'FATHER', 'PERENTAL', 'other', 'Yes', 'Middle', 'govt school', 'KISHANGARD', 'NA', '2025-04-18 03:47:16', '2025-04-18 03:47:47', 'https://bhagwatiassociate.in/storage/uploads/1744948036_6801cb4415e76.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1744948036_6801cb441e69d.jpeg', 'DEEPAK'),
(23, 1707, 'Taushik Mandrawaliya', 'TJBGDAS003', '2025-04-21 18:52:00', 'Dinesh Mandrawaliya  1/269 Kanchan Nagar\' Dorai Hmt Ajmer Dtso Sarwar\' Ajmer Rajasthan 305003 India', 'Since 2007 to till date', 'Verbal', 'Dinesh mandarwariya', 'Father', 'Perental', 'electricity_bill', 'NA', 'Middle', 'Shani mandie', 'Ramganj', 'Na', '2025-04-21 13:25:01', '2025-04-21 16:50:27', 'https://bhagwatiassociate.in/storage/uploads/1745254227_6806775353ead.jpg', 'https://bhagwatiassociate.in/storage/uploads/1745254227_6806775356f32.heic', 'Sohan lal'),
(24, 1708, 'ROHIT NAGORA', 'IDMFCBY286', '2025-04-21 14:31:00', 'VIJAY NAGORA	34696	1466 Foola Ganj Nasirabad	Ajmer	Ajmer	Rajasthan	305601		-', 'since birth to till date', 'Verbal', 'VIJAY NAGORA', 'FATHER', 'PERENTAL', 'telephone_bill', 'Yes', 'Middle', 'govt school', 'nasirabad', 'na', '2025-04-21 17:09:37', '2025-04-22 03:03:13', 'https://bhagwatiassociate.in/storage/uploads/1745255377_68067bd1b1b7d.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1745255377_68067bd1b44d4.jpeg', 'chandrprkash'),
(25, 1709, 'Hemendra Singh Panwar', 'TJBGDAR962', '2025-04-21 13:50:00', 'Pancham Singh Panwar	Ward No 09 Khorat Taragarh Dadola Ajmer Rajasthan 305923	Ajmer	Ajmer	Rajasthan	305923		-', 'since birth to till date', 'Verbal', 'kanch', 'mother', 'PERENTAL', 'other', 'Yes', 'Lower', 'govt school', 'jawaja', 'na', '2025-04-21 17:15:30', '2025-04-22 03:04:09', 'https://bhagwatiassociate.in/storage/uploads/1745255730_68067d3234c93.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1745255730_68067d323598a.jpeg', 'Sohan Lal'),
(26, 1732, 'Chirag Kumawat', 'TJBGDAS126', '2025-04-28 16:02:00', 'Dinesh Kumawat	Pratap Nagar Gali No. 02Â BeawarÂ Ajmer Rajasthan 305901 India	Pratap Nagar Gali No. 02Â BeawarÂ Ajm', 'SINCE BIRTH TO TILL DATE', 'Verbal', 'RISHAI', 'BROTHER', 'PERENTAL', 'gas_bill', 'Yes', 'Lower', 'NR ACEDMI', 'beawar', 'NA', '2025-04-28 10:55:25', '2025-04-28 11:15:36', 'https://bhagwatiassociate.in/storage/uploads/1745837725_680f5e9d45d29.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1745837725_680f5e9d4d0db.jpeg', 'MANISH'),
(27, 1733, 'Mohit Gandhi', 'SHFLMUAA129', '2025-04-28 14:13:00', 'Prabhu Narain Gandhi	B 66 Basant kunj Vikas Marg makadwali Road Panchsheel Colony	B 66 Basant kunj Vikas Marg makadwali Road Panchsheel Colony		Ajmer	Rajasthan	3', 'last 2001 to till date', 'Verbal', 'Mohit Gandhi', 'SILF', 'PERENTAL', 'other', 'Yes', 'Middle', 'AVVNL', 'CRISHANGANJ THANA', 'NA', '2025-04-28 11:01:26', '2025-04-28 11:16:48', 'https://bhagwatiassociate.in/storage/uploads/1745838086_680f6006e1568.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1745838086_680f6006ec29c.jpeg', 'GOVIND'),
(28, 1731, 'Monika Kanwar', 'TJBGDAS042', '2025-04-29 14:31:00', 'Mahendra Singh	JharwasaÂ BandanwaraÂ Ajmer Rajasthan 305621 India Ajmer	Rajasthan	305621		-', 'since birth to till date', 'Verbal', 'chamma kanwar', 'mother', 'PERENTAL', 'electricity_bill', 'Yes', 'Lower', 'govt school', 'nasirabad', 'na', '2025-04-29 12:15:42', '2025-04-29 12:16:13', 'https://bhagwatiassociate.in/storage/uploads/1745928942_6810c2ee4646a.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1745928942_6810c2ee49b7a.jpeg', 'govind singh'),
(29, 1743, 'Hirender Singh Rathore', 'DEIPCHAA182', '2025-05-06 12:19:00', 'Girdhar Singh		\"VTC: Pranhera, PO: Pranhera, Sub District: Kekri, District: Ajmer, Rajasthan,\r\n  305404\"		Ajmer		305404', 'SINCE BIRTH TO TILLDATE', 'Written', 'gishi devi', 'neighbour', 'PERENTAL', 'other', 'Yes', 'Middle', 'shivmandir', 'Kekri', 'NA', '2025-05-06 17:08:29', '2025-05-06 17:09:56', 'https://bhagwatiassociate.in/storage/uploads/1746551309_681a420da9d2f.jpeg', 'https://bhagwatiassociate.in/storage/uploads/1746551309_681a420dadabc.jpeg', 'Sohan Lal');

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
(20, '2014_10_12_000000_create_users_table', 1),
(21, '2014_10_12_100000_create_password_resets_table', 1),
(22, '2019_08_19_000000_create_failed_jobs_table', 1),
(23, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(24, '2022_06_19_132653_create_permission_tables', 1),
(25, '2024_04_29_105532_create_leads_table', 1),
(26, '2024_05_04_120652_create_leads_address_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 32),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 16),
(3, 'App\\Models\\User', 19),
(3, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 26),
(3, 'App\\Models\\User', 28),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 33);

-- --------------------------------------------------------

--
-- Table structure for table `office_lead_verifications`
--

CREATE TABLE `office_lead_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `address_confirm` int(2) NOT NULL DEFAULT 0,
  `ease_of_location` varchar(25) DEFAULT NULL,
  `date_of_visit` date DEFAULT NULL,
  `time_of_visit` time DEFAULT NULL,
  `meet_person` varchar(255) DEFAULT NULL,
  `meet_person_designation` varchar(255) DEFAULT NULL,
  `customer_designation` varchar(255) DEFAULT NULL,
  `working_time` varchar(255) DEFAULT NULL,
  `house_status` varchar(255) DEFAULT NULL,
  `employee_count` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `business_nature` varchar(25) DEFAULT NULL,
  `stock_seen` tinyint(1) NOT NULL DEFAULT 0,
  `business_activity_seen` tinyint(1) NOT NULL DEFAULT 0,
  `premises` varchar(25) DEFAULT NULL,
  `rental_amount` int(11) DEFAULT NULL,
  `premise_other` varchar(255) DEFAULT NULL,
  `company_category` varchar(25) DEFAULT NULL,
  `company_category_other` varchar(255) DEFAULT NULL,
  `application_occupation` varchar(25) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `additional_remark` text DEFAULT NULL,
  `neighbour1_name` varchar(255) DEFAULT NULL,
  `neighbour2_name` varchar(255) DEFAULT NULL,
  `neighbour1_address` text DEFAULT NULL,
  `neighbour2_address` text DEFAULT NULL,
  `neighbour1_status` varchar(25) DEFAULT NULL,
  `neighbour2_status` varchar(25) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `cpv_status` varchar(25) DEFAULT NULL,
  `verifier_name` varchar(255) DEFAULT NULL,
  `agency_name` varchar(255) DEFAULT NULL,
  `agency_manager_name` varchar(255) DEFAULT NULL,
  `date_of_calling` varchar(255) DEFAULT NULL,
  `time_of_calling` varchar(255) DEFAULT NULL,
  `name_of_applicant` varchar(255) DEFAULT NULL,
  `contact_number` varchar(25) DEFAULT NULL,
  `contacted` varchar(255) DEFAULT NULL,
  `spoken_to_designation` varchar(255) DEFAULT NULL,
  `applicant_working_since` varchar(255) DEFAULT NULL,
  `applicant_designation` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `office_lead_verifications`
--

INSERT INTO `office_lead_verifications` (`id`, `lead_id`, `address_confirm`, `ease_of_location`, `date_of_visit`, `time_of_visit`, `meet_person`, `meet_person_designation`, `customer_designation`, `working_time`, `house_status`, `employee_count`, `salary`, `business_nature`, `stock_seen`, `business_activity_seen`, `premises`, `rental_amount`, `premise_other`, `company_category`, `company_category_other`, `application_occupation`, `distance`, `additional_remark`, `neighbour1_name`, `neighbour2_name`, `neighbour1_address`, `neighbour2_address`, `neighbour1_status`, `neighbour2_status`, `status`, `remark`, `cpv_status`, `verifier_name`, `agency_name`, `agency_manager_name`, `date_of_calling`, `time_of_calling`, `name_of_applicant`, `contact_number`, `contacted`, `spoken_to_designation`, `applicant_working_since`, `applicant_designation`, `created_at`, `updated_at`) VALUES
(444, 1666, 'ease', '2025-04-11', '10:25:00', 'BIRADA PANCHU', 'SELF', 'SELF', '0', 'married', 44, '4', '2', 'THEKEDAR', 1, 'KAMALA', 'WIFE', '15', 43, 'married', 'AGRICULTURE WORK', 2, 21, 'GYARASI LAL', 'MOHAN', 'positive', 'positive', 'positive', 'positive', 'positive', '// MRS KAMLA BIRADA   wife agr 43 year house wufe \r\nMR KALU SINGH RAWAT son  age 22 year pvt job  \r\n //MR Panchu RAJU   father age 75 year', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH BIRADA PANCHU Relation SELF AND CONFIRM THAT APPLICANT LIVES IN SINCE SELF HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '11/04/2025', '12:45 pm', '8949863450', 'MR BIRADA PANCHU', 'YES', 'MR KALU SINGH RAWAT', 'SON', '8 year', 'owned', '8949863450', 'RAVI', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-11 05:13:10', '2025-04-11 07:32:26'),
(445, 1676, 'ease', '2025-04-11', '15:23:00', 'ROHIT', 'BROTHER', 'since birth', 'perental', 'married', 35, '6', '1', 'CLOTH SHOP', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, 'BUDHRAJ', 'TEJPAL', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH ROHIT Relation BROTHER AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '13/01/2025', '2:51 PM', '8104287241', 'Sahadev', 'YES', 'Sahadev', 'self', 'since birth', 'perental', '8104287241', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-13 08:28:55', '2025-04-13 09:23:57'),
(446, 1674, 'ease', '2025-04-11', '14:54:00', 'SUSHILA', 'MOTHER', '15 YEAR', 'perental', 'married', 35, '6', '2', 'SHOP REGIN SHOUS AND BAG', 1, 'Shushila', 'MOTHER IN LOW', '35 YEAR', 55, 'married', 'house wife', 2, 35, 'ANKUSH PURI', 'JOGVEER', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH SUSHILA Relation MOTHER  IN LOW AND CONFIRM THAT APPLICANT LIVES SINCE 15  YEAR  HUSBEND PERENTAL  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - POSITIVE', '13/04/2025', '2:50 PM', '8779459920', 'KAILASH HANUMAN Sablaniya', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', '8779459920', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-13 08:32:02', '2025-04-13 09:22:19'),
(447, 1391, 'untraceable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADDRESS CONFIRMS. untraceable TO LOCATE MET WITH N/A Relation N/A AND CONFIRM THAT APPLICANT LIVES IN SINCE N/A N/A HOUSE N/A LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. N/A FAMILY MEMBER, N/A EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - N/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-13 09:30:37', '2025-04-14 16:54:36'),
(448, 1679, 'untraceable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, 'narayana', 'MUKESH', 'NOT CANFARM', 'NOT CANFARM', 'unknown', 'unknown', 'negative', 'The customer does not have any flat at the address given by the customer. It is located 2.5 km away from the given address in Kuchaman in the name of Kuchaman wali, which is given on rent to the customer.', 'negative', 'ADDRESS CONFIRMS. untraceable The customer does not have any flat at the address given by the customer. It is located 2.5 km away from the given address in Kuchaman in the name of Kuchaman wali, which is given on rent to the customer.  TPC  NOT OK. STATUS IS: - negative', '14/04/2025', '10:02 AM', '9610558989', 'NARENDRA SINGH', 'YES', 'NARENDRA SINGH', 'self', '8 month', 'owned', '9610558989', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-14 04:36:03', '2025-04-14 04:38:01'),
(449, 1682, 'ease', '2025-04-14', '22:21:00', 'NARENDRA', 'NEGOUBER', '2 YEAR', 'OWNED', 'married', 50, '0', '0', 'NA', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'NARENDRA', 'LEDY NAME NOT TOLD', 'positive', 'positive', 'positive', 'positive', 'positive', 'The customer\'s visit time was far away. The customer had gone out of station with his family. The customer had bought this house only 2 years ago.', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH NARENDRA Relation NEGOUBER AND CONFIRM THAT APPLICANT LIVES IN SINCE 2 YEAR OWNED HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 0 FAMILY MEMBER, 0 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '14/04/2025', '06:15  PM', '9785723065', 'MR. RAVI SINGH', 'YES', 'MR. RAVI SINGH', 'self', '2YEAR', 'owned', '9785723065', 'SOHAN LAL', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-14 16:52:10', '2025-04-14 17:08:58'),
(450, 1680, 'ease', '2025-04-15', '10:09:00', 'Moti lal', 'self', '1year', 'OWNED', 'married', 45, '4', '1', 'rental income', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, 'Raju Ram', 'Moola Ram.', 'positive', 'positive', 'positive', 'positive', 'positive', 'The customer had taken a loan to build shops, it is commercially used', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Moti lal Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE 1year N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 1 EARNING. The customer had taken a loan to build shops, it is commercially used  HAS BIKE TPC OK. STATUS IS: - positive', '15/04/2025', '11:30 AM', '7878747052', 'Moti lal', 'YES', 'Moti lal', 'self', '1YEAR', 'owned', '7878747052', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-15 17:32:57', '2025-04-16 11:10:29'),
(451, 1681, 'ease', '2025-04-15', '12:54:00', 'LAXMAN', 'NEGOUBER', '3 MONTH', 'OWNED', 'married', 40, '4', '1', 'NA', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, 'laxmanram', 'niraj sing', 'positive', 'positive', 'positive', 'positive', 'refer', 'The customer has taken a  Home Loan. The customer has not started the construction yet. No construction was found in progress as per the visit.', 'refer_to_credit', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH LAXMAN Relation NEGOUBER AND CONFIRM THAT APPLICANT LIVES IN SINCE 3 MONTH N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HASThe customer has taken a  Home Loan. The customer has not started the construction yet. No construction was found in progress as per the visit.    BIKE TPC OK. STATUS IS: - refer', '16/04/2025', '4:43 pm', '8000516976', 'Jagdish nayak', 'YES', 'Jagdish nayak', 'self', '3 month', 'owned', '8000516976', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-15 17:36:15', '2025-04-16 11:16:58'),
(452, 1686, 'ease', '2025-04-15', '23:07:00', 'MUKESH', 'SON', '7YEAR', 'OWNED', 'married', 45, '6', '1', 'CANTRCTION WORK', 1, 'PARAM DEVI', 'WIFE', '7year', 40, 'married', 'HOUSE WIFE', 4, 5, 'MITHU', 'JAGDISH', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH MUKESH Relation SON AND CONFIRM THAT APPLICANT LIVES IN SINCE 7YEAR HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '16/04/2025', '5:00 PM', '7726098172', 'MR. HARIKISHAN GURJAR', 'YES', 'MR. HARIKISHAN GURJAR', 'self', '7 YEAR', 'owned', '7726098172', 'SOHAN LAL', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-15 17:39:48', '2025-04-16 11:31:40'),
(453, 1689, 'ease', '2025-04-16', '11:24:00', 'madhu', 'SISTER IN LOW', 'since birth', 'perental', 'married', 35, '6', '1', 'construcation', 1, 'FARJANA RAMESH', 'wife', '20YEAR', 35, 'married', 'house wife', 4, 5, 'Salma', 'patashi', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH madhu Relation SISTER IN LOW AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '17/04/2025', '9:00 AM', '7742238203', 'MR. RAMESH SHANKAR', 'YES', 'MR. RAMESH SHANKAR', 'self', 'since birth', 'perental', '7742238203', 'govind', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-16 12:34:12', '2025-04-17 04:20:30'),
(454, 1694, 'ease', '2025-04-16', '17:59:00', 'shailendra hamelta', 'NA', 'since birth', 'perental', 'married', 40, '6', '1', 'NA', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, 'Shankar lal', 'mukesh singh', 'positive', 'positive', 'positive', 'positive', 'positive', 'The customer has given the property on rent for 2 years', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH shailendra hamelta Relation NA AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE    The customer has given the property on rent for 2 years      HAS BIKE TPC OK. STATUS IS: - positive', '17/04/2025', '9:00 AM', '9928570330', 'BABLU  KUMAWAT', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'perental', '9928570330', 'shubham', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-16 12:42:32', '2025-04-17 03:59:36'),
(455, 1697, 'ease', '2025-04-15', '22:32:00', 'LEDY NAMENOT TOLD', 'TENENT', '8 MONTH', 'OWNED', 'married', 45, '7', '1', 'milk and farming', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, 'GARD', 'NA', 'positive', 'NA', 'positive', 'unknown', 'refer', 'At the address given at the time of visit, a lady was found who did not reveal her name and did not give any information. When I talked to the customer, I came to know that the customer has given this property on rent and the society guard also confirmed that this property is given on rent.', 'refer_to_credit', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH LEDY NAMENOT TOLD Relation TENENT AND CONFIRM THAT APPLICANT LIVES IN SINCE 8 MONTH HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS  HAS At the address given at the time of visit, a lady was found who did not reveal her name and did not give any information. When I talked to the customer, I came to know that the customer has given this property on rent and the society guard also confirmed that this property is given on rent.    BIKE TPC OK. STATUS IS: - refer', '16/04/2025', '5:00 PM', '9610558989', 'NARENDRA SINGH', 'NOT Connected', 'NOT Connected', 'NOT Connected', '8 month', 'owned', '9610558989', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-16 13:10:00', '2025-04-16 17:05:30'),
(456, 1695, 'ease', '2025-04-16', '18:17:00', 'suraj singh', 'SON', '6year', 'OWNED', 'married', 45, '4', '1', 'NA', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, 'shakti singh', 'mukesh mewara', 'positive', 'positive', 'positive', 'positive', 'positive', 'ok', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH suraj singh Relation SON AND CONFIRM THAT APPLICANT LIVES IN SINCE  6year   owned  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '17/04/2025', '9:00 AM', '9001069005', 'KIRAN SINGH DROGA', 'YES', 'KIRAN SINGH DROGA', 'self', '6year', 'owned', '9001069005', 'shubham', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-16 13:13:29', '2025-04-17 03:33:12'),
(457, 1683, 'ease', '2025-04-14', '18:08:00', 'MR KAILASH CHAND JANGID', 'self', 'since birth', 'perental', 'married', 35, '6', '1', 'CARPENTER', 1, 'MRS BHANWARI DEVI', 'MOTHER', '40', 60, 'married', '35', 1, 30, 'hama ram', 'Jiwen ram', 'positive', 'positive', 'positive', 'positive', 'positive', 'MR BANSHI LAL FATHER AGE 65 YEAR', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH MR KAILASH CHAND JANGID Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '17/04/2025', '10:00 AM', '9549907680', 'MR KAILASH CHAND JANGID', 'YES', 'MR KAILASH CHAND JANGID', 'self', 'since birth', 'perental', '9549907680', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-16 13:20:07', '2025-04-17 04:46:22'),
(458, 1696, 'ease', '2025-04-17', '11:13:00', 'Rajendra Kumar arat', 'self', 'since birth', '6 month', 'married', 40, '5', '1', 'PLUMBER', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, 'Bhagwan', 'Jitu', 'positive', 'positive', 'positive', 'positive', 'positive', 'The customer himself resides in the property', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Rajendra Kumar arat Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '17/04/2025', '11:24 p,m', '9828072265', 'RAJENDRA KUMAR ARAT', 'YES', 'RAJENDRA KUMAR ARAT', 'self', '6 month', 'owned', '9828072265', 'prveen', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-17 05:46:25', '2025-04-17 05:56:21'),
(459, 1688, 'ease', '2025-04-16', '11:14:00', 'MR OMPRAKASH RAWAT', 'self', 'since birth', 'perental', 'married', 40, '7', '1', 'WATER SPPLY WORKS', 1, 'MRS Shrawani BHANWAR', 'MOTHER', '42', 55, 'married', 'house wife', 2, 35, 'Sopal', 'Rajendra', 'positive', 'positive', 'positive', 'positive', 'positive', 'MR BHANWAR SINGH  father age 60 year', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH MR OMPRAKASH RAWAT Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth   HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 7 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '18/04/2025', '10:00 am', '9680214281', 'MR OMPRAKASH RAWAT', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'perental', '9680214281', 'BHAWAR SINGH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-17 15:56:10', '2025-04-18 04:51:16'),
(460, 1698, 'ease', '2025-04-17', '15:19:00', 'KANYA LAL MILK FARM', 'self', 'since birth', 'perental', 'married', 40, '4', '1', 'milk and farming', 1, 'MRS GOPALI DEVI', 'wife', '20YEAR', 40, 'married', 'house wife', 2, 40, 'moti lal', 'babu lal', 'positive', 'positive', 'positive', 'positive', 'negative', 'The condition of the customer is not looking good, the house has three shifts', 'refer_to_credit', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH KANYA LAL MILK FARM Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS The condition of the customer is not looking good, the house has three shifts   BIKE TPC OK. STATUS IS: - refar to credit', '18/04/2025', '11:30 AM', '9636795162', 'MR KANHAIYA LAL BAIRWA', 'YES', 'MR KANHAIYA LAL BAIRWA', 'self', 'since birth', 'perental', '9636795162', 'RAJENDRA', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-17 16:17:07', '2025-04-18 06:25:43'),
(462, 1693, 'ease', '2025-04-17', '08:42:00', 'NARENDRA', 'NEGOUBER', 'since birth', 'perental', 'married', 33, '5', '1', 'CREPING WOK', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 40, 'narayana', 'MAHENDRA', 'positive', 'positive', 'positive', 'positive', 'positive', 'No one was found at Normal ji\'s house. He does not live here. He lives in Gujarat. He works there. Neighbours told', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH NARENDRA Relation NEGOUBER AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth N/A HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS    No one was found at Normal ji\'s house. He does not live here. He lives in Gujarat. He works there. Neighbours told     BIKE TPC OK. STATUS IS: - positive', '20/04/2025', '9:00 AM', '9982421863', 'NAHARAMAL  GURJAR', 'YES', 'NAHARAMAL  GURJAR', 'self', 'since birth', 'perental', '9982421863', 'RAJENDRA', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-21 03:24:16', '2025-04-21 03:54:59'),
(463, 1710, 'ease', '2025-04-19', '18:03:00', 'Mukesh', 'self', 'since birth', 'perental', 'married', 24, '4', '2', 'kirana store', 1, 'CHENA Ram', 'father', 'SINCE BIRTH', 40, 'married', 'FARMING', 4, 45, 'ramkumar', 'Parkash', 'positive', 'positive', 'positive', 'positive', 'positive', 'Debu Devi  MOTHER AGE 29 YEAR', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Mukesh Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth   HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 4 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '21/04/2025', '11:00 am', '8830999579', 'Mukesh', 'YES', '8830999579', 'self', 'since birth', 'perental', '8830999579', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-21 03:33:25', '2025-04-21 05:46:01'),
(464, 1702, 'ease', '2025-04-19', '18:14:00', 'SUKHEDV', 'self', '10YEAR', 'OWNED', 'married', 40, '5', '1', 'NA', 1, 'Chanchal', 'wife', '10 YEAR', 35, 'married', 'house wife', 3, 45, 'manish parjapat', 'Rajendra singh', 'positive', 'positive', 'positive', 'positive', 'positive', 'Tele Verification Report  APLICANT CALL NOT RECIVED', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH SUKHEDV Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE 10YEARHOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '21/04/2025', '10:00 am', '9680776017', 'SUKHEDV', 'YES', 'SUKHEDV', 'NOT Connected', 'NOT Connected', 'NOT Connected', '9680776017', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-21 03:43:47', '2025-04-21 05:31:29'),
(465, 1700, 'untraceable', '2025-04-21', '16:52:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5, 'near kirana shop', 'Badu lal', 'NOT CANFARM', 'NOT CANFARM', 'unknown', 'unknown', 'negative', 'The customer is being called since last 3 days but the customer is not responding. The address given by the customer during visit time was not received and the customer did not pick up the call.', 'negative', 'ADDRESS CONFIRMS. untraceable TO LOCATE MET WITH N/A Relation N/A AND CONFIRM THAT APPLICANT LIVES IN SINCE N/A N/A HOUSE N/A LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. N/A FAMILY MEMBER, N/A EARNING. PERENTAL HOUSE HAS   The customer is being called since last 3 days but the customer is not responding. The address given by the customer during visit time was not received and the customer did not pick up the call.   BIKE TPC OK. STATUS IS: - negative', '21/04/2025', '5:00 PM', '8209608631', '. AMAR CHAND BHADANA', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', 'NOT Connected', '8209608631', 'SOHAN LAL', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-21 17:21:39', '2025-04-22 02:57:20'),
(466, 1713, 'ease', '2025-04-23', '18:55:00', 'MR ARJUN SINGH', 'SELF', 'SINCE BIRTH', 'PERENTAL', 'unmarried', 21, '5', '4', 'PVT JOB', 1, 'MR MOUKAM SINGH', 'FATHER', 'SINCE BIRTH', 43, 'married', 'FARMER', 3, 20, 'Vishnu', 'Govind', 'positive', 'positive', 'positive', 'positive', 'positive', '. Ujjwal indiyan faineance monthly ... 25000 Post ..Unit manager \r\nMaina Devi  MOTHER age .40 Work... HOUSE WIFE\r\nKARAN SINGH BRTHER AGE 20 YEAR  PVT JOB', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH MR ARJUN SINGH Relation SELF AND CONFIRM THAT APPLICANT LIVES IN SINCE SINCE BIRTH HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 3 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '25/04/2025', '10:55 PM', '7688814592', 'MR ARJUN SINGH', 'YES', 'MR ARJUN SINGH', 'self', 'since birth', 'perental', '7688814592', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-25 03:32:52', '2025-04-25 05:25:50'),
(467, 1717, 'ease', '2025-04-24', '14:12:00', 'pooja', 'wife', '15year', 'owned', 'married', 25, '5', '1', 'KABADI WORK', 1, 'POOJA SHAMBHU', 'WIFE', '5YEAR', 24, 'married', 'HOUSE WIFE', 3, 8, 'Mukesh', 'kamla', 'POSITIVE', 'POSITIVE', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH pooja Relation wife AND CONFIRM THAT APPLICANT LIVES IN SINCE 15year  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '26/04/2025', '10:30 AM', '8209874160', 'MR. SHAMBHU LOHAR', 'YES', 'MR. SHAMBHU LOHAR', 'self', '15YEAR', 'perental', '8209874160', 'GOVIND JAGRWAL', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-25 03:41:20', '2025-04-26 05:22:40'),
(468, 1719, 'ease', '2025-04-24', '12:44:00', 'Shyam lal', 'self', '15year', 'OWNED', 'married', 45, '6', '1', 'scrap work', 1, 'Nitu devi', 'wife', '15YEAR', 42, 'married', 'house wife', 4, 40, 'BHURARAM', 'TEJPAL', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Shyam lal Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE 15year owned  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '26/04/2025', '9:00 AM', '9413083403', 'Shyam lal', 'YES', 'Shyam lal', 'self', '15YEAR', 'owned', '9413083403', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-25 17:15:19', '2025-04-26 04:32:35'),
(469, 1721, 'ease', '2025-04-27', '12:11:00', 'MRS DHANNI DEVI', 'mother', 'since birth', 'perental', 'married', 22, '5', '2', 'pvt job', 1, 'MR PRAKASH CHAND', 'father', 'SINCE BIRTH', 45, 'married', 'FARMING', 2, 40, 'om Saini', 'MAHENDRA', 'positive', 'positive', 'positive', 'positive', 'positive', 'MRS DHANNI DEVI   35 year house wifw', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH mukesh meghwal Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '28/04/2025', '10:30 am', '9799694584', 'MR MUKESH MEGHWAL', 'YES', 'MR MUKESH MEGHWAL', 'self', 'since birth', 'perental', '9799694584', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-27 06:43:49', '2025-04-28 06:13:53'),
(470, 1730, 'ease', '2025-04-27', '12:11:00', 'Kamlesh', 'self', 'since birth', 'perental', 'married', 35, '5', '1', 'flour mil mechanic', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 35, 'Rewat ram', 'Tiku ram', 'positive', 'positive', 'positive', 'positive', 'positive', 'Uncle Kagaj is a guarantor customer related person and it is near our home', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Kamlesh Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth SINCE BIRTH  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 5 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '28/03/2025', '11:30 AM', '9799694584', 'MUKESH MEGHWAL', 'YES', 'MUKESH MEGHWAL', 'NEFYU', 'since birth', 'perental', '9799694584', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-28 06:47:03', '2025-04-28 06:54:39'),
(471, 1714, 'ease', '2025-04-28', '21:21:00', 'MR HUKMA RAM', 'self', '20YEAR', 'OWNED', 'married', 43, '6', '2', 'SHREE RADHE GOVIND GOSALA SAMITI', 1, 'MRS KAMLA KAMLA', 'wife', '20YEAR', 40, 'married', 'house wife', 3, 40, 'Sarwan', 'Rajendra', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH MR HUKMA RAM Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE 20YEAR OWNED HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '28/04/2025', '1:50 PM', '9799694584', 'MR HUKMA RAM', 'YES', 'MR HUKMA RAM', 'self', '20year', 'perental', '9799694584', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-28 07:39:14', '2025-04-28 08:20:59'),
(472, 1726, 'ease', '2025-04-28', '15:30:00', 'Suresh sahu', 'self', 'since birth', 'perental', 'married', 40, '14', '4', 'HARSH AGENCIES( ACCOUNTS WORK )', 1, 'DINESH SAHU', 'BROTHER', 'since birth', 37, 'married', 'SELF EMPLOY', 2, 10, 'Bhagchand', 'kana', 'positive', 'positive', 'positive', 'positive', 'positive', 'MAMTA SAHU  wife age 41 year', 'positive', 'ADdress is confirmed. It is easy to meet Suresh Sahu. Relatives themselves and confirm that the applicant lives in ancestral house since birth. Married living is average inner and outer average middle class locality. 18  family members, 4 earners. There is bike in ancestral house, TPC is fine. Status is:- Positive', '29/04/2025', '9:58 am', '9461050433', 'MR SURESH SAHU', 'YES', 'MR SURESH SAHU', 'self', 'since birth', 'perental', '9461050433', 'DEVENDRA', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-28 10:13:29', '2025-04-29 04:31:06'),
(473, 1728, 'ease', '2025-04-28', '15:46:00', 'Bhagwati devi soni', 'self', '20', 'OWNED', 'married', 63, '2', '1', 'HOUSE WIFE', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 10, 'Sunil kumar', 'Manish sahu', 'positive', 'positive', 'positive', 'negative', 'positive', 'NA', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Bhagwati devi soni Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE 20  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 2 FAMILY MEMBER, 1 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - N/A', '29/04/2025', '9:58 am', '9928620700', 'BHAGWATI DEVI SONI', 'YES', 'BHAGWATI DEVI SONI', 'self', '20year', 'owned', '9928620700', 'DEVENDRA', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-04-28 10:49:00', '2025-04-29 04:39:34'),
(474, 1738, 'untraceable', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ADDRESS CONFIRMS. untraceable TO LOCATE MET WITH N/A Relation N/A AND CONFIRM THAT APPLICANT LIVES IN SINCE N/A N/A HOUSE N/A LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. N/A FAMILY MEMBER, N/A EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - N/A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-02 04:03:23', '2025-05-02 04:20:20'),
(475, 1736, 'ease', '2025-05-30', '13:52:00', 'Hanuman ram jaat', 'SELF', 'since birth', 'perental', 'married', 34, '7', '3', 'SK MEDICAL AGENCY', 1, 'Suman devi', 'wife', '14YEAR', 34, 'married', 'house wife', 2, 45, 'Ramkumar', 'Sunil', 'positive', 'positive', 'positive', 'positive', 'positive', 'OK', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Baksi ram Relation father AND CONFIRM THAT APPLICANT LIVES IN SINCE since birth  HOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '02/05/2025', '11:00 am', '8949620466', 'Hanuman ram jaat', 'YES', 'Hanuman ram jaat', 'self', 'since birth', 'perental', '8949620466', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-05-02 04:10:58', '2025-05-02 05:44:41'),
(476, 1734, 'ease', '2025-05-04', '17:35:00', 'Mahendra Vikram singh', 'self', 'since birth', 'perental', 'married', 35, '6', '2', 'FARMING WORK', 1, 'Mahesh kanwar', 'wife', '15YEAR', 35, 'married', 'house wife', 2, 45, 'shyam singh', 'Jathu sain', 'positive', 'positive', 'positive', 'positive', 'positive', 'Ram singh/', 'positive', 'ADDRESS CONFIRMS. ease TO LOCATE MET WITH Mahendra Vikram singh Relation self AND CONFIRM THAT APPLICANT LIVES IN SINCE since birthHOUSE Married LIV STD AVG INT AND EXT IS AVG. MIDDLE CLASS LOCALITY. 6 FAMILY MEMBER, 2 EARNING. PERENTAL HOUSE HAS BIKE TPC OK. STATUS IS: - positive', '05/05/2025', '9:00 AM', '9772747047', 'Mahendra Vikram singh', 'YES', 'Mahendra Vikram singh', 'self', 'since birth', 'perental', '9772747047', 'MANISH', 'SOHAN LAL', 'BHAGWAATI ASSOCIATE', '2025-05-05 05:02:04', '2025-05-05 05:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', NULL, NULL),
(2, 'branch_manager', 'web', NULL, NULL),
(3, 'executive', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2);

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
  `code` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1:Active\r\n0:Deactivated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `code`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'shubhamjjoshi211@gmail.com', NULL, '$2y$10$oxPwyKpPK9QytUyQBRvDmum0Q5/G6E/GA.PHwI0cNIC1jfTu9Z6q2', NULL, NULL, 1, '2024-05-04 17:10:52', '2024-05-04 17:10:52'),
(2, 'Ajmer Branch', 'slsohan45@gmail.com', NULL, '$2y$10$OELnP5N4.fkiHS.U8Ni5BesaWsG1lbpV27CeQSxA/zvJA1x2mPyg2', NULL, NULL, 1, '2024-05-04 17:14:45', '2024-11-28 14:22:13'),
(4, 'SOHAN LAL', 'SLSOHAN4545@GMAIL.COM', NULL, '$2y$10$0cqd36vWANLEEa53yIdE1uLXR05ftSUJ8WEnM38eZJYapjlGERzyK', 'JALWANIYA4545', NULL, 1, '2024-05-05 10:51:56', '2024-05-05 10:51:56'),
(5, 'kapilkishangarh', 'kapilkishangarh5484@gmail.com', NULL, '$2y$10$yS0toNQYKqEoOvAVi4cV7Ou/QcMXsJGXRm5TMEDN37tD68fC51ozq', '123456', NULL, 1, '2024-05-05 15:18:42', '2024-05-05 15:18:42'),
(6, 'yogesh parihar', 'yogesh@gmail.com', NULL, '$2y$10$UwaD7XWfqy4IGlXb69LD6u7hrosDLvKaGSHfqMM.Hxk7syubIsAb.', 'parihar@12345', NULL, 1, '2024-05-05 16:10:01', '2025-01-06 18:14:40'),
(7, 'vijay dube beawar', 'sonudube601@gmail.com', NULL, '$2y$10$C9U6NtKxaNbM0xFVDiDWtO3pJu9mXWDuZiY66fbYTJJCZd0lnbt4K', '123456', NULL, 1, '2024-05-06 03:59:08', '2025-03-14 03:32:48'),
(9, 'SHRIKANT SENI', 'SHRIKANTSENI@GMAIL.COM', NULL, '$2y$10$e18Qtz5cVDeKlQ3TXpJfKOUBhB7QO5NkCFjvv/fC4W.sUgFVfmxea', '12345678', NULL, 1, '2024-05-06 04:32:14', '2024-05-06 04:32:14'),
(10, 'CHANDRA PRKASH', 'CHANDRAPRKASH@GMAIL.COM', NULL, '$2y$10$ylZOVKGM/xeniIWZN.RDPujkT20SNKmM59EjrMVlz..q3nA3gz68G', '123456', NULL, 1, '2024-05-06 05:59:04', '2025-03-14 03:33:18'),
(11, 'GOVIND JAGARWAL', 'GOVIND@GMAIL.COM', NULL, '$2y$10$FK/cP.q2krKmYtDGk52w4.ujWJ1C1nlygAt.lsEljgiyk8xHhSkFy', '123456', NULL, 1, '2024-05-06 06:06:07', '2025-04-18 09:09:39'),
(12, 'RAVI MASUDA', 'RAVIMASUDA@HMAIL.COM', NULL, '$2y$10$7ORuuXPkwx0hMQYs2JdTre8Ri9V9otJeOCqCYNr3JqENh35g.jjga', '123456', NULL, 1, '2024-05-06 06:46:29', '2024-05-06 06:46:29'),
(13, 'BHAWAR SINGH GURJAR', 'BHAWARSINGHGURJAR@GMAIL.COM', NULL, '$2y$10$BfdWRWaRelyNJFa.8PYbY.y/eTp.mtibexPs5gaQNoUm/8Wkoyj6u', '123456', NULL, 1, '2024-05-09 06:56:26', '2024-05-09 06:56:26'),
(14, 'SHAHID', 'SHAHIDMANSURI@GMAIL.COM', NULL, '$2y$10$t.E69yWNtJMCNw8vkTmIiOPe4rUbBWYvm/DutZszR881qx0JSYmHq', '123456', NULL, 1, '2024-06-11 17:19:53', '2024-06-11 17:21:18'),
(16, 'SHUBHAM BIJAY NAGAR', 'SHUBHAM@GMAIL.COM', NULL, '$2y$10$XRYNNfK3WiIXzcILBwXi8e2V/5uErX8rkG/OYD92VH318dDWq7t4y', '123456', NULL, 1, '2024-06-17 05:50:41', '2024-06-17 05:50:41'),
(19, 'MANISH 1', 'MANISH123@GMAIL.COM', NULL, '$2y$10$0CxQBCfCp.Hfnrerhr2eLu23HanUxNPxBwGWEj9nxXptML1ytByIu', '123456', NULL, 1, '2024-07-12 02:51:58', '2024-07-12 02:52:29'),
(20, 'Praveen samariya', 'Praveensamariya@gmail.com', NULL, '$2y$10$Wk0pSZST9uI9UQ2BqTQGq.MZSOoJBj0ksdKbPmTbSyXvUT0yRdRZa', '123456', NULL, 1, '2024-07-21 17:10:15', '2024-07-21 17:10:41'),
(26, 'HANSRAJ KEKDI', 'HANSRAJKEKDI@GMAIL.COM', NULL, '$2y$10$yI.q.iY.XjhajHpMrnKZb.rCnYv.hPWqpsqpZkSjdjCsMVjBahHaG', '123456', NULL, 1, '2024-09-29 16:27:51', '2024-09-29 16:27:51'),
(28, 'Antriksh Agarwal', 'antriksh@gmail.com', NULL, '$2y$10$d4o/MpWFebdfBtE6CVdqt.VTl0O9FP1ua7qlS.I/pcUxtSLT3botS', '12345678', NULL, 1, '2025-01-08 17:07:09', '2025-01-08 17:13:19'),
(29, 'MANOHAR LAL', 'MANOHARLAL@GMAIL.COM', NULL, '$2y$10$kEo9y.7Y3VY5dv..Sb80V.OWG9896VK6GNvyIdXhLwoy/aNAWrwrO', '123456', NULL, 1, '2025-03-08 16:22:27', '2025-03-08 16:22:27'),
(32, 'green finance tech', 'greenfinancetech@mail.com', NULL, '$2y$10$ebVf/ppv7vsx.Brs1tCC6upYhPq2sdmI05wvBLT/xO5rloItbLr.6', '123456', NULL, 1, '2025-04-18 08:58:43', '2025-04-18 08:58:43'),
(33, 'RAJENDRA BHIM', 'RAJENDRA.BHIM@GMAIL.COM', NULL, '$2y$10$Y29lrzEBGe/Q7emZU8Gu6uAKBBfQc0XQS7nf420Poh6O1VHWYj2fq', '123456', NULL, 1, '2025-04-18 09:08:28', '2025-04-18 09:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `full_name` varchar(111) NOT NULL,
  `father_name` varchar(111) NOT NULL,
  `mother_name` varchar(111) NOT NULL,
  `present_address` text NOT NULL,
  `city` varchar(111) NOT NULL,
  `mobile_no` varchar(111) NOT NULL,
  `emergency_contact` varchar(111) DEFAULT NULL,
  `high_school_name` varchar(111) DEFAULT NULL,
  `intermediate_school_name` varchar(111) DEFAULT NULL,
  `graduation_college_name` varchar(111) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`full_name`, `father_name`, `mother_name`, `present_address`, `city`, `mobile_no`, `emergency_contact`, `high_school_name`, `intermediate_school_name`, `graduation_college_name`, `user_id`, `created_at`, `updated_at`, `id`) VALUES
('sfsd', 'fdsfds', 'fsdfsadsf', 'adsfadsfdsfdsfdsfdsfdsf', 'adsfadsf', 'sdfdsf', 'adsfsda', 'sdfsdfds', 'dsfsdf', 'sdfsdfsdfdsfsdfdsfsdfdsfdsf', 5, '2025-03-22 10:35:59', '2025-03-22 10:36:25', 1),
('sohan lal', 'nenu ram', 'sugni devi', 'hmt ke samne sanjar nagar beawar road ajmer 305001', 'ajmer', '7737727214', '7300232314', 'no', 'sohan lal', 'na', 4, '2025-03-23 12:39:11', '2025-03-23 12:39:11', 2);

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
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_assigned_to_foreign` (`assigned_to`),
  ADD KEY `leads_assigned_by_foreign` (`assigned_by`);

--
-- Indexes for table `leads_addresses`
--
ALTER TABLE `leads_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_address_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_employee_address_verification`
--
ALTER TABLE `lead_employee_address_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_insurance`
--
ALTER TABLE `lead_insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_matrix`
--
ALTER TABLE `lead_matrix`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `office_lead_verifications`
--
ALTER TABLE `office_lead_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `residence_lead_verifications`
--
ALTER TABLE `residence_lead_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_id` (`lead_id`),
  ADD KEY `lead_id_2` (`lead_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5891;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1744;

--
-- AUTO_INCREMENT for table `leads_addresses`
--
ALTER TABLE `leads_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=551;

--
-- AUTO_INCREMENT for table `lead_employee_address_verification`
--
ALTER TABLE `lead_employee_address_verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lead_insurance`
--
ALTER TABLE `lead_insurance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lead_matrix`
--
ALTER TABLE `lead_matrix`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `office_lead_verifications`
--
ALTER TABLE `office_lead_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `residence_lead_verifications`
--
ALTER TABLE `residence_lead_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leads_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `leads_addresses`
--
ALTER TABLE `leads_addresses`
  ADD CONSTRAINT `leads_address_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
