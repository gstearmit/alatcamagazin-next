-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2014 at 12:13 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alatcamagazin`
--

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(500) NOT NULL,
  `config_value` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news_group`
--

CREATE TABLE IF NOT EXISTS `news_group` (
  `group_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `group_order` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `emergency_code` varchar(50) DEFAULT '00000000',
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `pass` varchar(50) DEFAULT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `birthday` int(255) DEFAULT NULL,
  `sex` smallint(1) DEFAULT NULL,
  `reg_date` int(255) DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'vn',
  `avatar` varchar(255) DEFAULT NULL,
  `health_type` varchar(50) DEFAULT NULL,
  `conclusions` text,
  `advice` text,
  `unit` tinyint(1) DEFAULT '1',
  `update` int(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `blood_type` int(11) DEFAULT NULL,
  `blood_group` int(1) DEFAULT NULL,
  `share_service` varchar(20) NOT NULL DEFAULT 'friend',
  `share_profile` varchar(20) NOT NULL DEFAULT 'friend',
  `type` int(1) DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_reg_medlatec` int(11) NOT NULL DEFAULT '0',
  `last_login` int(20) NOT NULL DEFAULT '0',
  `update_info` int(11) DEFAULT NULL COMMENT '1 cập nhật bước 1 ; 2 là cập nhật bước 2 , 3 là cập nhật bước,4 là đã cập nhật đủ 3 bước  ',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `emergency_code`, `user_name`, `email`, `pass`, `firstname`, `lastname`, `birthday`, `sex`, `reg_date`, `lang`, `avatar`, `health_type`, `conclusions`, `advice`, `unit`, `update`, `info`, `blood_type`, `blood_group`, `share_service`, `share_profile`, `type`, `role_id`, `active`, `is_reg_medlatec`, `last_login`, `update_info`) VALUES
(1, 'f24fae', 'superadmin', 'superadmin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoang', 'Phuc', 564080400, 2, 1367052041, 'vn', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'friend', 'friend', NULL, 1, 1, 0, 0, NULL),
(2, '5300e8', 'sale', 'sale@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đào', 'Anh', 468176400, 1, 1365210950, 'vn', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'friend', 'friend', NULL, 4, 1, 0, 1365233191, NULL),
(3, 'c2fba2', 'marketing', 'marketing@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lương', 'Mai Loan ', 309546000, 1, 1367290810, 'vn', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'friend', 'friend', NULL, 0, 1, 0, 0, NULL),
(4, '2353c7', 'marketingadmin', 'marketingadmin@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'hung', ' ', 0, 2, 1369119221, 'vn', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'friend', 'friend', NULL, 0, 1, 0, 1369391939, NULL),
(5, '00000000', 'admin', 'admin@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', 'trung', 'pham', 915037200, 1, 2013, 'vn', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'friend', 'friend', NULL, 0, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `role_id` smallint(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`, `description`, `is_active`) VALUES
(1, 'Supper Admin', 'Tất cả các quyền ', 1),
(2, 'Marketing admin', 'Xem, sửa visitor, page, domain, CTA', 1),
(3, 'Marketing ', 'Xem page, page detail, CTA ', 1),
(4, 'Sale', 'Xem visitor, visitor detail ', 1),
(5, 'Admin', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zend_actions`
--

CREATE TABLE IF NOT EXISTS `zend_actions` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `action_name_display` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=412 ;

--
-- Dumping data for table `zend_actions`
--

INSERT INTO `zend_actions` (`action_id`, `module_id`, `action_name`, `action_name_display`, `description`, `is_active`) VALUES
(1, 1, 'index', 'Truy cập', 'Actioncategory', 1),
(2, 2, 'index', 'Truy cập', 'Action', 1),
(3, 3, 'index', 'Truy cập', 'Actioninsuranceagency', 1),
(4, 4, 'index', 'Truy cập', 'Actioninsuranceprovider', 1),
(5, 5, 'index', 'Truy cập', 'Actioninsuranceservice', 1),
(6, 6, 'index', 'Truy cập', 'Actionlocation', 1),
(7, 7, 'index', 'Truy cập', 'Actionnews', 1),
(8, 8, 'index', 'Truy cập', 'Actionrole', 1),
(9, 9, 'index', 'Truy cập', 'Actionseraction', 1),
(10, 10, 'index', 'Truy cập', 'Actionseractivities', 1),
(11, 11, 'index', 'Truy cập', 'Actionserphase', 1),
(12, 12, 'index', 'Truy cập', 'Actionsertime', 1),
(13, 13, 'index', 'Truy cập', 'Actionservice', 1),
(14, 14, 'index', 'Truy cập', 'Actionsubservice', 1),
(15, 15, 'index', 'Truy cập', 'Actionuser', 1),
(16, 16, 'index', 'Truy cập', 'Allergiestype', 1),
(17, 17, 'index', 'Truy cập', 'Babyterm', 1),
(18, 18, 'index', 'Truy cập', 'Category', 1),
(19, 19, 'index', 'Truy cập', 'Comment', 1),
(20, 20, 'index', 'Truy cập', 'Commune', 1),
(21, 21, 'index', 'Truy cập', 'Disease', 1),
(22, 22, 'index', 'Truy cập', 'Diseasetype', 1),
(23, 23, 'index', 'Truy cập', 'Doctor', 1),
(24, 24, 'index', 'Truy cập', 'Faq', 1),
(25, 25, 'index', 'Truy cập', 'Import', 1),
(26, 26, 'index', 'Truy cập', 'Importexcel', 1),
(27, 27, 'index', 'Truy cập', 'Insuranceagency', 1),
(28, 28, 'index', 'Truy cập', 'Insuranceprovider', 1),
(29, 29, 'index', 'Truy cập', 'Insuranceservice', 1),
(30, 30, 'index', 'Truy cập', 'Listpost', 1),
(31, 31, 'index', 'Truy cập', 'Location', 1),
(32, 32, 'index', 'Truy cập', 'Momterm', 1),
(33, 33, 'index', 'Truy cập', 'News', 1),
(34, 34, 'index', 'Truy cập', 'Newstags', 1),
(35, 35, 'index', 'Truy cập', 'Pictrue', 1),
(36, 36, 'index', 'Truy cập', 'Posts', 1),
(37, 37, 'index', 'Truy cập', 'Pregnantbyweek', 1),
(38, 38, 'index', 'Truy cập', 'Product', 1),
(39, 39, 'index', 'Truy cập', 'Relationname', 1),
(40, 40, 'index', 'Truy cập', 'Relax', 1),
(41, 41, 'index', 'Truy cập', 'Role', 1),
(42, 42, 'index', 'Truy cập', 'Seraction', 1),
(43, 43, 'index', 'Truy cập', 'Seractivities', 1),
(44, 44, 'index', 'Truy cập', 'Serphase', 1),
(45, 45, 'index', 'Truy cập', 'Sertime', 1),
(46, 46, 'index', 'Truy cập', 'Service', 1),
(47, 47, 'index', 'Truy cập', 'Servicetest', 1),
(48, 48, 'index', 'Truy cập', 'Sms', 1),
(49, 49, 'index', 'Truy cập', 'subservice', 1),
(50, 50, 'index', 'Truy cập', 'Term', 1),
(51, 51, 'index', 'Truy cập', 'Test', 1),
(52, 52, 'index', 'Truy cập', 'Tooltip', 1),
(53, 53, 'index', 'Truy cập', 'User', 1),
(54, 54, 'index', 'Truy cập', 'Vaccinationtype', 1),
(55, 55, 'index', 'Truy cập', 'Vaccine', 1),
(56, 56, 'index', 'Truy cập', 'Vaccinetype', 1),
(57, 57, 'index', 'Truy cập', 'Video', 1),
(58, 58, 'index', 'Truy cập', 'Trang chủ', 1),
(59, 58, 'denied', 'Access denied', 'Trang thông báo cho người dùng biết bị cấm quyền truy cập vào module', 1),
(60, 16, 'add', 'Thêm mới', 'Thêm mới', 1),
(61, 17, 'addterm', 'Thêm mới', 'addterm', 1),
(62, 19, 'add', 'Thêm mới', 'add', 1),
(63, 20, 'edit', 'Sửa', 'commune', 1),
(64, 20, 'pagination', 'Phân trang', 'pagination', 1),
(65, 20, 'province', 'province', 'province', 1),
(66, 21, 'add', 'Thêm mới', 'disease', 1),
(67, 22, 'add', 'Thêm mới', '', 1),
(68, 23, 'update', 'Cập nhật', '', 1),
(69, 24, 'update', 'Cập nhật', '', 1),
(70, 25, 'excel', 'excel', 'excel', 1),
(71, 26, 'upload', 'upload', 'upload', 1),
(72, 30, 'add', 'Thêm mới', '', 1),
(73, 30, 'edit', 'Cập nhật', '', 1),
(74, 30, 'general_add', 'general_add', 'general_add', 1),
(75, 30, 'general_edit', 'general_edit', 'general_edit', 1),
(76, 30, 'general_index', 'general_index', 'general_index', 1),
(77, 32, 'addmomterm', 'addmomterm', 'addmomterm', 1),
(78, 33, 'list', 'list', 'list', 1),
(79, 33, 'search', 'search', 'search', 1),
(80, 33, 'pagination', 'pagination', 'pagination', 1),
(81, 34, 'edit', 'edit', 'edit', 1),
(82, 35, 'upload', 'upload', 'upload', 1),
(83, 36, 'posts', 'posts', 'posts', 1),
(84, 37, 'add', 'add', 'add', 1),
(85, 37, 'using', 'using', 'using', 1),
(86, 38, 'edit', 'Cập nhật', '', 1),
(87, 39, 'add', 'Thêm mới', '', 1),
(88, 39, 'edit', 'Cập nhật', '', 1),
(89, 39, 'general_add', 'general_add', '', 1),
(90, 39, 'general_edit', 'general_edit', '', 1),
(91, 39, 'general_index', 'general_index', '', 1),
(92, 40, 'list', 'Hiển thị danh sách', '', 1),
(93, 40, 'update', 'Cập nhật', '', 1),
(94, 40, 'updateitem', 'updateitem', 'updateitem', 1),
(95, 46, 'addservice', 'Thêm dịch vụ mới', 'addservice', 1),
(96, 47, 'addterm', 'addterm', 'addterm', 1),
(97, 52, 'edit', 'edit', 'edit', 1),
(98, 53, 'contentms', 'contentms', 'contentms', 1),
(99, 53, 'createuser', 'createuser', 'createuser', 1),
(100, 53, 'crontab-mail-newsletter', 'crontab-mail-newsletter', 'crontab-mail-newsletter', 1),
(101, 53, 'findbysex', 'findbysex', 'findbysex', 1),
(102, 53, 'mailhipt', 'mailhipt', 'mailhipt', 1),
(103, 53, 'regis', 'regis', 'regis', 1),
(104, 53, 'sendmail', 'sendmail', 'sendmail', 1),
(105, 53, 'sendmember', 'sendmember', 'sendmember', 1),
(106, 53, 'sendms', 'sendms', 'sendms', 1),
(107, 53, 'update-email-user', 'update-email-user', 'update-email-user', 1),
(108, 53, 'usercreated', 'usercreated', 'usercreated', 1),
(109, 54, 'add', 'Thêm mới', '', 1),
(110, 55, 'edit', 'Cập nhật', '', 1),
(111, 56, 'edit', 'Cập nhật', '', 1),
(112, 56, 'sertime', 'sertime', 'sertime', 1),
(113, 57, 'add', 'Thêm mới', '', 1),
(114, 57, 'edit', 'edit', '', 1),
(115, 57, 'general_add', 'general_add', '', 1),
(116, 57, 'general_edit', 'general_edit', 'general_edit', 1),
(117, 57, 'general_index', 'general_index', 'general_index', 1),
(118, 59, 'index', 'Truy cập', 'users', 1),
(119, 60, 'index', 'Truy cập', 'Advertising', 1),
(120, 61, 'index', 'Truy cập', 'Answer', 1),
(121, 62, 'index', 'Truy cập', 'Appointment', 1),
(122, 63, 'index', 'Truy cập', 'Faqcat', 1),
(123, 64, 'index', 'Truy cập', 'Login', 1),
(124, 65, 'index', 'Truy cập', 'Questions', 1),
(125, 59, 'add', 'Thêm mới', 'Thêm mới thành viên', 1),
(126, 59, 'edit', 'Cập nhật', '', 1),
(127, 59, 'delete', 'Xóa thành viên', '', 1),
(128, 60, 'add', 'Thêm mới', '', 1),
(129, 60, 'edit', 'Cập nhật', '', 1),
(130, 60, 'delete', 'Xóa dữ liệu', '', 1),
(131, 61, 'add', 'Thêm mới', '', 1),
(132, 61, 'edit', 'Cập nhật', '', 1),
(133, 61, 'delete', 'Xóa dữ liệu', '', 1),
(134, 61, 'changestatus', 'Thay đổi tình trạng', 'Thay đổi tình trạng', 1),
(135, 62, 'view', 'view', 'view', 1),
(136, 62, 'add', 'Thêm mới', '', 1),
(137, 62, 'edit', 'Cập nhật', '', 1),
(138, 63, 'add', 'Thêm mới', '', 1),
(139, 63, 'edit', 'Cập nhật', '', 1),
(140, 33, 'add', 'Thêm mới', '', 1),
(141, 33, 'edit', 'Cập nhật', '', 1),
(142, 65, 'add', 'Thêm mới', '', 1),
(143, 65, 'edit', 'Cập nhật', '', 1),
(144, 62, 'delete', 'Xóa dữ liệu', '', 1),
(145, 63, 'delete', 'Xóa dữ liệu', '', 1),
(146, 64, 'delete', 'Xóa dữ liệu', '', 1),
(147, 65, 'delete', 'Xóa dữ liệu', '', 1),
(148, 66, 'index', 'Truy cập', 'Loại địa điểm', 1),
(149, 66, 'update', 'Cập nhật', '', 1),
(150, 67, 'index', 'Truy cập', 'Ứng dụng', 1),
(151, 68, 'index', 'Truy cập', 'Modules', 1),
(152, 41, 'update', 'Thêm mới / Cập nhật', 'Thêm mới, cập nhật module', 1),
(153, 69, 'index', 'Truy cập', 'icd10', 1),
(154, 69, 'update', 'Thêm mới / Cập nhật', '', 1),
(155, 69, 'delete', 'delete', 'delete', 1),
(156, 70, 'index', 'Truy cập', 'ACL - Hệ thống phân quyền', 1),
(157, 53, 'role', 'Cấp quyền truy cập', '', 1),
(158, 31, 'update', 'Thêm mới / Cập nhật', '', 1),
(159, 46, 'update', 'Thêm mới / Cập nhật', '', 1),
(160, 68, 'update', 'Thêm mới / Cập nhật', '', 1),
(161, 68, 'delete', 'Xóa module', '', 1),
(162, 70, 'update', 'Thêm mới / Cập nhật', '', 1),
(163, 62, 'backup', 'Export to excel', '', 1),
(164, 2, 'update', 'Cập nhật / Thêm mới', '', 1),
(165, 53, 'role', 'Cấp quyền', '', 1),
(166, 71, 'index', 'Truy cập', 'Vouchers', 1),
(167, 72, 'index', 'Truy cập', 'Coupons', 1),
(168, 73, 'index', 'Truy cập', 'Đối tác', 1),
(169, 72, 'add', 'Thêm mới', '', 1),
(170, 72, 'edit', 'Sửa', '', 1),
(171, 73, 'add', 'Thêm mới', '', 1),
(172, 73, 'edit', 'Sửa', '', 1),
(173, 65, 'changestatus', 'Thay đổi trạng thái', '', 1),
(174, 74, 'index', 'Truy cập', 'Ảnh của coupon', 1),
(175, 74, 'add', 'Thêm mới', '', 1),
(176, 74, 'edit', 'Cập nhật', '', 1),
(177, 75, 'index', 'Truy cập', 'Loại tin bài', 1),
(178, 75, 'update', 'Thêm mới / Cập nhật', '', 1),
(179, 34, 'update', 'Thêm mới / Cập nhật', 'Chức năng quản lý tags bên Administrator', 1),
(180, 74, 'delete', 'Xóa ảnh', '', 1),
(181, 74, 'changestatus', 'Thay đổi trạng thái', '', 1),
(182, 72, 'delete', 'Xoá', '', 1),
(183, 76, 'index', 'Truy cập', 'SEO', 1),
(184, 76, 'update', 'Thêm mới / Cập nhật', '', 1),
(185, 71, 'delete', 'Xoá', '', 1),
(186, 70, 'reload', 'reload', '', 1),
(187, 33, 'changestatus', 'changestatus', NULL, 1),
(188, 33, 'delete', 'Xóa', NULL, 1),
(189, 53, 'update', 'Cập nhật', NULL, 1),
(190, 77, 'index', 'Truy cập', 'Error', 1),
(191, 77, 'error', 'error', NULL, 1),
(192, 67, 'add', 'Thêm mới', NULL, 1),
(193, 67, 'edit', 'Sửa', NULL, 1),
(194, 67, 'changestatus', 'changestatus', NULL, 1),
(195, 67, 'delete', 'Xóa', NULL, 1),
(196, 71, 'insertvoucher', 'insertvoucher', NULL, 1),
(197, 72, 'changestatus', 'changestatus', NULL, 1),
(198, 2, 'getlist', 'getList', NULL, 1),
(199, 73, 'insertvoucher', 'insertVoucher', NULL, 1),
(200, 73, 'changestatus', 'changestatus', NULL, 1),
(201, 73, 'delete', 'Xóa', NULL, 1),
(202, 20, 'update', 'Cập nhật', '', 1),
(203, 78, 'index', 'Truy cập', 'Quận - Huyện', 1),
(204, 78, 'update', 'Thêm mới / Cập nhật', '', 1),
(205, 2, 'view', 'view', NULL, 1),
(206, 1, 'view', 'view', NULL, 1),
(207, 3, 'view', 'view', NULL, 1),
(208, 4, 'view', 'view', NULL, 1),
(209, 5, 'view', 'view', NULL, 1),
(210, 6, 'view', 'view', NULL, 1),
(211, 7, 'view', 'view', NULL, 1),
(212, 8, 'view', 'view', NULL, 1),
(213, 9, 'view', 'view', NULL, 1),
(214, 10, 'view', 'view', NULL, 1),
(215, 11, 'view', 'view', NULL, 1),
(216, 12, 'view', 'view', NULL, 1),
(217, 13, 'view', 'view', NULL, 1),
(218, 14, 'view', 'view', NULL, 1),
(219, 15, 'view', 'view', NULL, 1),
(220, 16, 'view', 'view', NULL, 1),
(221, 18, 'view', 'view', NULL, 1),
(222, 19, 'view', 'view', NULL, 1),
(223, 20, 'delete', 'Xóa', NULL, 1),
(224, 21, 'view', 'view', NULL, 1),
(225, 22, 'view', 'view', NULL, 1),
(226, 23, 'updateitem', 'updateitem', NULL, 1),
(227, 58, 'view', 'view', NULL, 1),
(228, 27, 'view', 'view', NULL, 1),
(229, 28, 'view', 'view', NULL, 1),
(230, 29, 'view', 'view', NULL, 1),
(231, 30, 'delete', 'Xóa', NULL, 1),
(232, 31, 'delete', 'Xóa', NULL, 1),
(233, 31, 'view', 'view', NULL, 1),
(234, 34, 'delete', 'Xóa', NULL, 1),
(235, 35, 'view', 'view', NULL, 1),
(236, 36, 'view', 'view', NULL, 1),
(237, 37, 'view', 'view', NULL, 1),
(238, 38, 'delete', 'Xóa', NULL, 1),
(239, 39, 'delete', 'Xóa', NULL, 1),
(240, 41, 'view', 'view', NULL, 1),
(241, 42, 'view', 'view', NULL, 1),
(242, 43, 'view', 'view', NULL, 1),
(243, 44, 'view', 'view', NULL, 1),
(244, 45, 'view', 'view', NULL, 1),
(245, 46, 'view', 'view', NULL, 1),
(246, 47, 'view', 'view', NULL, 1),
(247, 50, 'view', 'view', NULL, 1),
(248, 51, 'view', 'view', NULL, 1),
(249, 53, 'sendbyselect', 'sendbyselect', NULL, 1),
(250, 53, 'crontabmailnewsletter', 'crontabMailNewsletter', NULL, 1),
(251, 53, 'updateemailuser', 'updateEmailUser', NULL, 1),
(252, 54, 'delete', 'Xóa', NULL, 1),
(253, 55, 'delete', 'Xóa', NULL, 1),
(254, 56, 'delete', 'Xóa', NULL, 1),
(255, 57, 'delete', 'Xóa', NULL, 1),
(256, 49, 'view', 'view', NULL, 1),
(257, 79, 'index', 'Truy cập', 'Seopage', 1),
(258, 79, 'update', 'Cập nhật', NULL, 1),
(259, 80, 'index', 'Truy cập', 'Trackingemail', 1),
(260, 80, 'view', 'view', NULL, 1),
(261, 80, 'delete', 'Xóa', NULL, 1),
(262, 80, 'backup', 'backup', NULL, 1),
(263, 71, 'backup', 'Xuất Excel', '', 1),
(264, 81, 'index', 'Truy cập', 'Trackinguser', 1),
(265, 81, 'view', 'view', NULL, 1),
(266, 81, 'delete', 'Xóa', NULL, 1),
(267, 81, 'backup', 'backup', NULL, 1),
(268, 82, 'index', 'Truy cập', 'Totals', 1),
(269, 82, 'view', 'view', NULL, 1),
(270, 83, 'index', 'Truy cập', 'Userspecial', 1),
(271, 83, 'add', 'Thêm mới', NULL, 1),
(272, 83, 'edit', 'Sửa', NULL, 1),
(273, 83, 'changestatus', 'changestatus', NULL, 1),
(274, 83, 'delete', 'Xóa', NULL, 1),
(275, 84, 'index', 'Truy cập', 'Voucherpartner', 1),
(276, 84, 'view', 'view', NULL, 1),
(277, 84, 'delete', 'Xóa', NULL, 1),
(278, 84, 'changestatus', 'changeStatus', NULL, 1),
(279, 84, 'backup', 'backup', NULL, 1),
(280, 85, 'index', 'Truy cập', 'Appcat', 1),
(281, 85, 'add', 'Thêm mới', NULL, 1),
(282, 85, 'edit', 'Sửa', NULL, 1),
(283, 85, 'delete', 'Xóa', NULL, 1),
(284, 79, 'keyword', 'keyword', NULL, 1),
(285, 79, 'import', 'import', NULL, 1),
(286, 79, 'report', 'report', NULL, 1),
(287, 33, 'getrssnews', 'getRssNews', NULL, 1),
(288, 33, 'crawler', 'crawler', NULL, 1),
(289, 33, 'testcrawler', 'testcrawler', NULL, 1),
(290, 33, 'getcrawlersitecontent', 'getcrawlersitecontent', NULL, 1),
(291, 79, 'news', 'news', NULL, 1),
(292, 86, 'index', 'Truy cập', 'Seoreport', 1),
(293, 87, 'index', 'Truy cập', 'Listappointment', 1),
(294, 87, 'add', 'Thêm mới', NULL, 1),
(295, 87, 'edit', 'Sửa', NULL, 1),
(296, 87, 'delete', 'Xóa', NULL, 1),
(297, 88, 'index', 'Truy cập', 'Listtimeappointment', 1),
(298, 88, 'add', 'Thêm mới', NULL, 1),
(299, 88, 'edit', 'Sửa', NULL, 1),
(300, 88, 'delete', 'Xóa', NULL, 1),
(301, 89, 'index', 'Truy cập', 'Seocomment', 1),
(302, 89, 'update', 'Cập nhật', NULL, 1),
(303, 79, 'sitemap', 'sitemap', NULL, 1),
(304, 79, 'autolink', 'autolink', NULL, 1),
(305, 82, 'statistic', 'statistic', 'statistic', 1),
(306, 90, 'index', 'Truy cập', 'Seoauto', 1),
(307, 90, 'update', 'Cập nhật', NULL, 1),
(308, 91, 'index', 'Truy cập', 'Statistic', 1),
(309, 91, 'postlikestatistic', 'postlikestatistic', NULL, 1),
(310, 91, 'advertisingclick', 'advertisingclick', NULL, 1),
(311, 91, 'userstatistic', 'userstatistic', NULL, 1),
(312, 91, 'csvexport', 'csvexport', NULL, 1),
(313, 92, 'index', 'Truy cập', 'Menu', 1),
(314, 92, 'update', 'Cập nhật', NULL, 1),
(315, 91, 'newsstatistic', 'newsstatistic', NULL, 1),
(316, 93, 'index', 'Truy cập', 'Menugroup', 1),
(317, 93, 'update', 'Cập nhật', NULL, 1),
(318, 91, 'questionanswerstatistic', 'questionanswerstatistic', NULL, 1),
(319, 91, 'apptatistic', 'apptatistic', NULL, 1),
(320, 94, 'index', 'Truy cập', 'Seogroup', 1),
(321, 94, 'suggest', 'suggest', NULL, 1),
(322, 91, 'userhistorystatistic', 'userhistorystatistic', NULL, 1),
(323, 91, 'searchuserjson', 'searchuserjson', NULL, 1),
(324, 94, 'update', 'Cập nhật', NULL, 1),
(325, 95, 'index', 'Truy cập', 'Contest', 1),
(326, 95, 'add', 'Thêm mới', NULL, 1),
(327, 95, 'edit', 'Sửa', NULL, 1),
(328, 95, 'changestatus', 'changestatus', NULL, 1),
(329, 95, 'delete', 'Xóa', NULL, 1),
(330, 33, 'getrssnewsv2', 'getrssnewsv2', NULL, 1),
(331, 33, 'getcrawlersitecontentv2', 'getcrawlersitecontentv2', NULL, 1),
(332, 79, 'automark', 'automark', NULL, 1),
(333, 79, 'auto', 'auto', NULL, 1),
(334, 96, 'index', 'Truy cập', 'Newsv2', 1),
(335, 96, 'update', 'Cập nhật', NULL, 1),
(336, 97, 'index', 'Truy cập', 'Seoer', 1),
(337, 97, 'update', 'Cập nhật', NULL, 1),
(338, 79, 'rss', 'rss', NULL, 1),
(339, 79, 'resetindexing', 'resetindexing', NULL, 1),
(340, 79, 'indexing', 'indexing', NULL, 1),
(341, 98, 'index', 'Truy cập', 'Seopagetype', 1),
(342, 98, 'update', 'Cập nhật', NULL, 1),
(343, 99, 'index', 'Truy cập', 'Userrequest', 1),
(344, 99, 'update', 'Cập nhật', NULL, 1),
(345, 100, 'index', 'Truy cập', 'Config', 1),
(346, 100, 'update', 'Cập nhật', NULL, 1),
(347, 101, 'index', 'Truy cập', 'Successpage', 1),
(348, 101, 'update', 'Cập nhật', NULL, 1),
(349, 102, 'index', 'Truy cập', 'Url', 1),
(350, 102, 'update', 'Cập nhật', NULL, 1),
(351, 103, 'index', 'Truy cập', 'Ctapage', 1),
(352, 103, 'update', 'Cập nhật', NULL, 1),
(353, 104, 'index', 'Truy cập', 'Domain', 1),
(354, 104, 'update', 'Cập nhật', NULL, 1),
(355, 105, 'index', 'Truy cập', 'Visitor', 1),
(356, 105, 'update', 'Cập nhật', NULL, 1),
(357, 106, 'index', 'Truy c?p', 'Tracking', 1),
(358, 106, 'update', 'C?p nh?t', NULL, 1),
(359, 107, 'index', 'Truy c?p', 'Useradmin', 1),
(360, 107, 'role', 'role', NULL, 1),
(361, 107, 'update', 'C?p nh?t', NULL, 1),
(362, 107, 'editpass', 'editpass', NULL, 1),
(363, 107, 'edituser', 'edituser', NULL, 1),
(364, 107, 'editpassadmin', 'editpassadmin', NULL, 1),
(365, 107, 'check_exitemail', 'check_exitemail', NULL, 1),
(366, 107, 'getpass', 'getpass', NULL, 1),
(367, 108, 'index', 'Truy cập', 'Dwvisitors', 1),
(368, 108, 'update', 'Cập nhật', NULL, 1),
(369, 108, 'session', 'session', NULL, 1),
(370, 108, 'visitordetail', 'visitordetail', NULL, 1),
(371, 109, 'index', 'Truy cập', 'Session', 1),
(372, 109, 'update', 'Cập nhật', NULL, 1),
(373, 102, 'referenceurl', 'referenceurl', NULL, 1),
(374, 102, 'tabpage', 'tabpage', NULL, 1),
(375, 105, 'session', 'session', NULL, 1),
(376, 105, 'visitordetail', 'visitordetail', NULL, 1),
(377, 110, 'index', 'Truy cập', 'News', 1),
(378, 110, 'crawler', 'crawler', NULL, 1),
(379, 110, 'add', 'Thêm mới', NULL, 1),
(380, 110, 'edit', 'Sửa', NULL, 1),
(381, 110, 'changestatus', 'changestatus', NULL, 1),
(382, 110, 'delete', 'Xóa', NULL, 1),
(383, 110, 'getrssnews', 'getrssnews', NULL, 1),
(384, 110, 'getcrawlersitecontent', 'getcrawlersitecontent', NULL, 1),
(385, 110, 'getrssnewsv2', 'getrssnewsv2', NULL, 1),
(386, 110, 'getcrawlersitecontentv2', 'getcrawlersitecontentv2', NULL, 1),
(387, 110, 'testcrawler', 'testcrawler', NULL, 1),
(388, 111, 'index', 'Truy cập', 'Newsv2', 1),
(389, 111, 'update', 'Cập nhật', NULL, 1),
(390, 112, 'index', 'Truy cập', 'Page', 1),
(391, 112, 'detail', 'detail', NULL, 1),
(392, 110, 'update', 'Cập nhật', NULL, 1),
(393, 113, 'index', 'Truy cập', 'Newscategory', 1),
(394, 113, 'update', 'Cập nhật', NULL, 1),
(395, 114, 'index', 'Truy cập', 'Newsgroup', 1),
(396, 114, 'update', 'Cập nhật', NULL, 1),
(397, 115, 'index', 'Truy cập', 'Note', 1),
(398, 115, 'update', 'Cập nhật', NULL, 1),
(399, 116, 'index', 'Truy cập', 'Login', 1),
(400, 116, 'role', 'role', NULL, 1),
(401, 116, 'update', 'Cập nhật', NULL, 1),
(402, 117, 'index', 'Truy cập', 'Packageitem', 1),
(403, 117, 'update', 'Cập nhật', NULL, 1),
(404, 118, 'index', 'Truy cập', 'Notegroup', 1),
(405, 118, 'update', 'Cập nhật', NULL, 1),
(406, 119, 'index', 'Truy cập', 'Seo', 1),
(407, 119, 'changepass', 'changepass', NULL, 1),
(408, 119, 'update', 'Cập nhật', NULL, 1),
(409, 120, 'index', 'Truy cập', 'Slider', 1),
(410, 120, 'update', 'Cập nhật', NULL, 1),
(411, 53, 'changepass', 'changepass', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zend_menu`
--

CREATE TABLE IF NOT EXISTS `zend_menu` (
  `menu_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` smallint(6) NOT NULL,
  `menu_name` varchar(500) NOT NULL,
  `menu_url` varchar(500) NOT NULL,
  `action_id` int(11) NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_description` varchar(500) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `zend_menu`
--

INSERT INTO `zend_menu` (`menu_id`, `group_id`, `menu_name`, `menu_url`, `action_id`, `menu_order`, `menu_description`) VALUES
(16, 3, 'Quản lý thành viên', 'http://wish.vn/administrator/user', 53, 100, ''),
(56, 16, 'Reload ACL', 'http://wish.vn/administrator/acl/reload', 186, 100, ''),
(57, 16, 'Quản lý nhóm thành viên', 'http://wish.vn/administrator/role', 41, 90, ''),
(59, 16, 'Quản lý modules', 'http://wish.vn/administrator/module', 151, 70, ''),
(63, 16, 'Quản lý nhóm menu', 'http://wish.vn/administrator/menugroup', 316, 30, ''),
(73, 18, 'System config', 'http://localhost/UserTracking/administrator/config', 345, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `zend_menugroup`
--

CREATE TABLE IF NOT EXISTS `zend_menugroup` (
  `group_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(500) NOT NULL,
  `group_url` varchar(500) DEFAULT NULL,
  `group_icon` varchar(100) NOT NULL DEFAULT 'icon-edit',
  `description` varchar(500) NOT NULL,
  `group_order` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `zend_menugroup`
--

INSERT INTO `zend_menugroup` (`group_id`, `group_name`, `group_url`, `group_icon`, `description`, `group_order`) VALUES
(3, 'Quản lý thành viên', '', 'icon-male', 'Thành viên', 1000),
(16, 'Hệ thống phân quyền', '', ' icon-user ', 'Hệ thống phân quyền', 0),
(18, 'Configs', '', 'icon-wrench', 'Cập nhật những configs chung của hệ thống', 10);

-- --------------------------------------------------------

--
-- Table structure for table `zend_modules`
--

CREATE TABLE IF NOT EXISTS `zend_modules` (
  `module_id` int(10) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL,
  `module_name_display` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `zend_modules`
--

INSERT INTO `zend_modules` (`module_id`, `module_name`, `module_name_display`, `description`, `is_active`) VALUES
(2, 'action', 'Action', 'Action', 1),
(41, 'role', 'Role', 'Role', 1),
(53, 'user', 'User', 'User', 1),
(58, 'index', 'Trang chủ', 'index', 1),
(68, 'module', 'Modules', '', 1),
(70, 'acl', 'ACL - Hệ thống phân quyền', '', 1),
(77, 'error', 'Error', NULL, 1),
(92, 'menu', 'Menu', NULL, 1),
(93, 'menugroup', 'Menugroup', NULL, 1),
(100, 'config', 'Config', NULL, 1),
(109, 'session', 'Session', NULL, 1),
(116, 'login', 'Login', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zend_rights`
--

CREATE TABLE IF NOT EXISTS `zend_rights` (
  `right_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) NOT NULL,
  `action_id` int(10) NOT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `zend_rights`
--

INSERT INTO `zend_rights` (`right_id`, `role_id`, `action_id`) VALUES
(1, 1, 156),
(2, 1, 162),
(3, 1, 186),
(4, 1, 2),
(5, 1, 164),
(6, 1, 205),
(7, 1, 198),
(8, 1, 345),
(9, 1, 346),
(10, 1, 191),
(11, 1, 190),
(12, 1, 313),
(13, 1, 314),
(14, 1, 317),
(15, 1, 316),
(16, 1, 151),
(17, 1, 160),
(18, 1, 161),
(19, 1, 240),
(20, 1, 41),
(21, 1, 152),
(22, 1, 59),
(23, 1, 227),
(24, 1, 58),
(25, 1, 101),
(26, 1, 165),
(27, 1, 105),
(28, 1, 108),
(29, 1, 157),
(30, 1, 251),
(31, 1, 100),
(32, 1, 104),
(33, 1, 107),
(34, 1, 53),
(35, 1, 250),
(36, 1, 99),
(37, 1, 103),
(38, 1, 189),
(39, 1, 249),
(40, 1, 98),
(41, 1, 102),
(42, 1, 106),
(43, 1, 347),
(44, 1, 348),
(45, 1, 349),
(46, 1, 350),
(47, 1, 351),
(48, 1, 352),
(49, 1, 353),
(50, 1, 354),
(51, 1, 355),
(52, 1, 356),
(53, 1, 357),
(54, 1, 358),
(55, 1, 359),
(56, 1, 360),
(57, 1, 361),
(58, 2, 358),
(59, 2, 357),
(60, 2, 59),
(61, 2, 58),
(62, 2, 227),
(63, 2, 350),
(64, 2, 349),
(65, 1, 362),
(66, 1, 363),
(67, 1, 364),
(68, 1, 365),
(69, 1, 366),
(70, 1, 367),
(71, 1, 368),
(72, 1, 369),
(73, 1, 370),
(74, 1, 371),
(75, 1, 372),
(76, 1, 373),
(77, 1, 374),
(78, 1, 375),
(79, 1, 376),
(80, 4, 376),
(81, 4, 355),
(82, 1, 377),
(83, 1, 378),
(84, 1, 379),
(85, 1, 380),
(86, 1, 381),
(87, 1, 382),
(88, 1, 383),
(89, 1, 384),
(90, 1, 385),
(91, 1, 386),
(92, 1, 387),
(93, 1, 388),
(94, 1, 389),
(95, 1, 390),
(96, 1, 391),
(97, 1, 392),
(98, 1, 393),
(99, 1, 394),
(100, 1, 395),
(101, 1, 396),
(102, 1, 397),
(103, 1, 398),
(104, 1, 399),
(105, 1, 400),
(106, 1, 401),
(107, 1, 402),
(108, 1, 403),
(109, 1, 404),
(110, 1, 405),
(111, 1, 406),
(112, 1, 407),
(113, 1, 408),
(114, 1, 409),
(115, 1, 410),
(116, 1, 411);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
