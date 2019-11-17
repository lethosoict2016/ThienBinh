-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2019 at 10:53 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medix_pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `mp_banks`
--

CREATE TABLE `mp_banks` (
  `id` int(11) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `branchcode` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `accountno` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_bank_opening`
--

CREATE TABLE `mp_bank_opening` (
  `id` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `bank_id` int(11) NOT NULL,
  `amount` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_bank_transaction`
--

CREATE TABLE `mp_bank_transaction` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `method` varchar(50) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `transaction_status` int(1) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `cleared_date` date NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `attachment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_bank_transaction_payee`
--

CREATE TABLE `mp_bank_transaction_payee` (
  `tran_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `payee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_barcode`
--

CREATE TABLE `mp_barcode` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `random_no` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_brand`
--

CREATE TABLE `mp_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_brand`
--

INSERT INTO `mp_brand` (`id`, `name`, `company_id`) VALUES
(1, 'Headache', 12);

-- --------------------------------------------------------

--
-- Table structure for table `mp_brand_sector`
--

CREATE TABLE `mp_brand_sector` (
  `id` int(11) NOT NULL,
  `sector` varchar(255) NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_brand_sector`
--

INSERT INTO `mp_brand_sector` (`id`, `sector`, `created`, `updated`) VALUES
(1, 'Headache', '2019-04-13', '2019-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `mp_category`
--

CREATE TABLE `mp_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `register_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `added_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_category`
--

INSERT INTO `mp_category` (`id`, `category_name`, `description`, `register_date`, `status`, `added_by`) VALUES
(1, 'Blue', 'Here goes description', '2019-04-13', 0, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `mp_contactabout`
--

CREATE TABLE `mp_contactabout` (
  `id` int(11) NOT NULL,
  `contact_title` varchar(255) NOT NULL,
  `contact_description` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linked` varchar(255) NOT NULL,
  `googleplus` varchar(255) NOT NULL,
  `about_title` varchar(255) NOT NULL,
  `about_quotation` varchar(255) NOT NULL,
  `about_name` varchar(255) NOT NULL,
  `about_title2` varchar(255) NOT NULL,
  `about_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_contactabout`
--

INSERT INTO `mp_contactabout` (`id`, `contact_title`, `contact_description`, `phone_number`, `address`, `email`, `facebook`, `twitter`, `linked`, `googleplus`, `about_title`, `about_quotation`, `about_name`, `about_title2`, `about_description`) VALUES
(1, 'Contact Us', 'Lorum Ipsum dolar sit ami ', '+1 800 123 1234', '21th Street North way Commerical Market Mohenjo Daro', 'info@gbdevelopers.net', 'http://www.facebook.com/ali.i.roshan', 'ali.i.roshan', 'ali.i.roshan', 'ali.i.roshan', '« Lorem Ipsum is simply dummy text of the printing  »', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.p;#039;s standard dummy text ever since the 1500s, when an unknown printer took a ga', '— Medix Pharmacy', 'About Us', 'Praesent convallis tortor et enim laoreet, vel consectetur purus latoque penatibus et dis parturient.');

-- --------------------------------------------------------

--
-- Table structure for table `mp_drivers`
--

CREATE TABLE `mp_drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `lisence` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_drivers`
--

INSERT INTO `mp_drivers` (`id`, `name`, `contact`, `address`, `lisence`, `ref`, `date`, `cus_picture`, `status`) VALUES
(1, 'asdasdasd', 'asdasdasd', '', '', '', '0000-00-00', 'default.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_estimate`
--

CREATE TABLE `mp_estimate` (
  `id` int(11) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `date` date NOT NULL,
  `expire_date` date NOT NULL,
  `user` varchar(255) NOT NULL,
  `memo` longtext NOT NULL,
  `payee_id` int(11) NOT NULL,
  `billing` varchar(255) NOT NULL,
  `invoicemessage` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_estimate_sales`
--

CREATE TABLE `mp_estimate_sales` (
  `id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `tax` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_expense`
--

CREATE TABLE `mp_expense` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(255) NOT NULL,
  `method` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `payee_id` int(11) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_generalentry`
--

CREATE TABLE `mp_generalentry` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `naration` varchar(255) NOT NULL,
  `generated_source` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_head`
--

CREATE TABLE `mp_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nature` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `expense_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_head`
--

INSERT INTO `mp_head` (`id`, `name`, `nature`, `type`, `relation_id`, `expense_type`) VALUES
(1, 'Salary', 'Expense', 'Current', 0, 'Cash Expense'),
(2, 'Cash', 'Assets', 'Non-Current', 0, 'Non-Cash Expense'),
(3, 'Inventory', 'Assets', 'Current', 0, '-'),
(4, 'Accounts receivable', 'Assets', 'Current', 0, '-'),
(5, 'Accounts payable', 'Libility', 'Current', 0, 'Cash Expense'),
(6, 'Telephone Expense', 'Expense', 'Current', 0, '-'),
(7, 'CapitalStock', 'Equity', 'Current', 0, '-'),
(8, 'Land', 'Assets', 'Non-Current', 0, '-'),
(9, 'Building', 'Assets', 'Non-Current', 0, '-'),
(10, 'Notes payable', 'Libility', 'Non-Current', 0, '-'),
(11, 'Tools and Equipments', 'Assets', 'Current', 0, '-'),
(12, 'Repair Service Revenue', 'Revenue', 'Current', 0, '-'),
(13, 'Wages Expense', 'Expense', 'Current', 0, '-'),
(14, 'Utitlity Expense', 'Expense', 'Current', 0, 'Cash Expense'),
(15, 'Adverstising Expense', 'Expense', 'Current', 0, '-'),
(16, 'Cash in bank', 'Assets', 'Current', 0, '-'),
(17, 'Collection fee', 'Expense', 'Current', 0, 'Bank Expense'),
(18, 'Cost of goods', 'Expense', 'Current', 0, 'Cash Expense'),
(19, 'Sales', 'Revenue', 'Current', 0, '-'),
(20, 'Tax payable', 'Libility', 'Non-Current', 0, '-');

-- --------------------------------------------------------

--
-- Table structure for table `mp_invoices`
--

CREATE TABLE `mp_invoices` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `discount` decimal(11,3) NOT NULL,
  `status` int(1) NOT NULL,
  `description` varchar(255) NOT NULL,
  `agentname` varchar(100) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `delivered_to` varchar(100) NOT NULL,
  `delivered_by` varchar(100) NOT NULL,
  `delivered_date` date NOT NULL,
  `delivered_description` varchar(255) NOT NULL,
  `shippingcharges` decimal(11,3) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `payment_method` int(1) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `source` int(1) NOT NULL,
  `store_id` int(11) NOT NULL,
  `sales_man_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_langingpage`
--

CREATE TABLE `mp_langingpage` (
  `id` int(11) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `companydescription` varchar(255) NOT NULL,
  `companykeywords` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `slider1` varchar(255) NOT NULL,
  `slider2` varchar(255) NOT NULL,
  `slider3` varchar(255) NOT NULL,
  `slider4` varchar(255) NOT NULL,
  `slider5` varchar(255) NOT NULL,
  `title1` varchar(255) NOT NULL,
  `title2` varchar(255) NOT NULL,
  `title3` varchar(255) NOT NULL,
  `title4` varchar(255) NOT NULL,
  `title5` varchar(255) NOT NULL,
  `title6` varchar(255) NOT NULL,
  `subtitle6` varchar(255) NOT NULL,
  `subtitle6one` varchar(255) NOT NULL,
  `title8` varchar(255) NOT NULL,
  `title9` varchar(255) NOT NULL,
  `title10` varchar(255) NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(50) NOT NULL,
  `primarycolor` varchar(50) NOT NULL,
  `theme_pri_hover` varchar(50) NOT NULL,
  `expirey` int(11) NOT NULL,
  `startday` int(2) NOT NULL,
  `startmonth` int(2) NOT NULL,
  `endday` int(2) NOT NULL,
  `endmonth` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_langingpage`
--

INSERT INTO `mp_langingpage` (`id`, `companyname`, `companydescription`, `companykeywords`, `address`, `email`, `contact`, `logo`, `banner`, `slider1`, `slider2`, `slider3`, `slider4`, `slider5`, `title1`, `title2`, `title3`, `title4`, `title5`, `title6`, `subtitle6`, `subtitle6one`, `title8`, `title9`, `title10`, `currency`, `language`, `primarycolor`, `theme_pri_hover`, `expirey`, `startday`, `startmonth`, `endday`, `endmonth`) VALUES
(1, 'Medix v3.0 | The Pharmacy Manager', 'Medix v3.0 | The Pharmacy Manager', 'Medix v3.0 | The Pharmacy Manager', '11th commercial street, DHA ', 'info@spantiklab.com', '923472394224', 'e2f94b9b091f0564e3d53ffdb5982d3b.png', '06d5d4bbad1de729d96b4ef051156bd6.jpg', '9ca86106d2dca70bfb12e2d5163a4443.jpg', '3bd680cbfe01b350c5627b0781acd9bc.png', 'b4c5cbc468b9231e4c9a5756d360cc01.jpg', '86c470aaa38d95680490777667771de1.png', '9373e9594181bdcf9392d9bf9742704d.jpg', 'THE  PHARMACY AND POS MANAGER v3.0', 'OUR SERVICES', 'THINGS YOU SHOULD KNOW ABOUT US', 'MEET OUR PHARMACIST!.', 'SEE WHAT PATIENTS ARE SAYING?.', 'CONTACT US.', 'Contact Info.', 'Having Any Query! Or Book an appointment.', 'Quick Links.', 'Follow us.', '© Copyright Medix 2018- 2020  All Rights Reserved.', 'USD', 'EN', '#4a6984', '#1f5788', 5, 1, 1, 31, 12);

-- --------------------------------------------------------

--
-- Table structure for table `mp_menu`
--

CREATE TABLE `mp_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_menu`
--

INSERT INTO `mp_menu` (`id`, `name`, `icon`, `priority`) VALUES
(1, 'Medicines', 'fa fa-life-ring', 2),
(2, 'Settings', 'fa fa-cog', 14),
(5, 'Reports', 'fa fa-balance-scale', 11),
(6, 'POS', 'fa fa-clipboard', 3),
(12, 'Roles', 'fa fa-users', 12),
(18, 'Bank', 'fa fa-bank', 4),
(20, 'Purchase', 'fa fa-briefcase', 5),
(21, 'Supply ', 'fa fa-flask', 6),
(22, 'Initilization', 'fa fa-anchor', 7),
(23, 'Accounts', 'fa fa-calculator', 8),
(24, 'Statements', 'fa fa-line-chart', 9),
(25, 'Options', 'fa fa-shopping-bag', 10),
(26, 'Dashboard', 'fa fa-dashboard', 1),
(27, 'Expense', 'fa fa-paper-plane', 0),
(31, 'Extra ', 'fa fa-plus-circle', 13);

-- --------------------------------------------------------

--
-- Table structure for table `mp_menulist`
--

CREATE TABLE `mp_menulist` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_menulist`
--

INSERT INTO `mp_menulist` (`id`, `menu_id`, `title`, `link`) VALUES
(1, 1, 'Medicines & Products', 'product'),
(2, 1, 'Categories', 'category'),
(3, 2, 'Layout & System', 'layout'),
(10, 5, 'Sales Report', 'sales_report'),
(13, 6, 'View Invoice', 'invoice/manage'),
(16, 25, 'Personal Profile', 'profile'),
(17, 25, 'Users', 'users'),
(18, 25, 'Requested items', 'todolist'),
(26, 12, 'Multiple Roles', 'multiple_roles'),
(29, 25, 'Expense', 'Expense'),
(30, 18, 'Cheques', 'bank/written_cheque'),
(31, 18, 'Banks', 'bank'),
(34, 1, 'Pending stock', 'product/pending_stock'),
(36, 6, 'Create invoice', 'invoice'),
(37, 6, 'Return items', 'return_items'),
(38, 5, 'Return report', 'sales_report/return_item_report'),
(39, 20, 'Purchases', 'purchase'),
(40, 21, 'Supply List', 'supply'),
(41, 21, 'Drivers', 'supply/drivers'),
(42, 21, 'Vehicles', 'supply/vehicle'),
(43, 22, 'Brands', 'initilization'),
(44, 22, 'Brand Sector', 'initilization/brand_sector'),
(45, 22, 'Region', 'initilization/region'),
(46, 22, 'Towns', 'initilization/town'),
(47, 22, 'units', 'initilization/units'),
(48, 22, 'Stores', 'initilization/stores'),
(49, 1, 'Out of stock', 'stock_alert_report'),
(50, 1, 'Recent expired', 'product/expired_list'),
(51, 1, 'Stock ', 'product/product_stock'),
(52, 1, 'Expired Stock', 'product/expired_stock'),
(56, 20, 'Purchase return', 'purchase/return_list'),
(57, 4, 'Customer payments', 'customers/payment_list '),
(58, 23, 'Chart of accounts', 'accounts'),
(59, 24, 'General Journal', 'statements'),
(60, 24, 'Ledger Account', 'statements/ledger_accounts'),
(61, 24, 'Trail Balance', 'statements/trail_balance'),
(62, 24, 'Income', 'statements/income_statement'),
(63, 24, 'Balance Sheet', 'statements/balancesheet'),
(65, 23, 'Opening Account Heads', 'vouchers'),
(68, 31, 'Take Backup', 'backup'),
(69, 25, 'Restore Backup', 'backup/upload_restore'),
(70, 18, 'Bank Deposits', 'bank/deposit_list'),
(71, 18, 'Bank Book', 'bank/bank_book'),
(72, 26, 'Dashboard', 'homepage'),
(73, 25, 'Printer Settings', 'Printer_settings'),
(77, 31, 'Company', 'Company'),
(78, 20, 'Purchase Order', 'Purchase_order'),
(79, 21, 'Salesman', 'supply/sales_man'),
(80, 5, 'Top Customers', 'sales_report/top_customers'),
(81, 5, 'Top Salesman', 'sales_report/top_salesman'),
(82, 5, 'Brands report', 'sales_report/brand_sale'),
(83, 5, 'Section report', 'sales_report/brand_section'),
(84, 5, 'Company Wise', 'sales_report/company_wise'),
(85, 5, 'Storewise report', 'sales_report/store_wise'),
(86, 5, 'SKU Wise', 'Sales_report/sku_wise'),
(88, 24, 'Bank Reconciliation', 'statements/bank_reconciliation'),
(89, 18, 'Bank Collection', 'Bank/payment_collection'),
(90, 25, 'Bank Expense', 'Expense/bank_expense'),
(91, 21, 'Order List', 'Order_list'),
(92, 23, 'Credit Voucher', 'vouchers/credit_vouchers'),
(93, 23, 'Debit Voucher', 'vouchers/payments'),
(94, 23, 'Journal voucher', 'vouchers/journal_list'),
(95, 23, 'Account Holders ', 'payee'),
(96, 31, 'Estimate', 'estimate'),
(97, 31, 'Sales receipt', 'sales_receipt'),
(99, 23, 'Opening Balances', 'vouchers/open_user_account'),
(100, 31, 'Testimonials', 'testamonial'),
(101, 25, 'Services', 'service'),
(102, 31, 'Some Words', 'somewords'),
(103, 31, 'Pharmacists', 'pharmacist'),
(104, 31, 'Prescriptions Requested ', 'orders/order_history');

-- --------------------------------------------------------

--
-- Table structure for table `mp_multipleroles`
--

CREATE TABLE `mp_multipleroles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_Id` int(11) NOT NULL,
  `role` int(1) NOT NULL,
  `agentid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_multipleroles`
--

INSERT INTO `mp_multipleroles` (`id`, `user_id`, `menu_Id`, `role`, `agentid`) VALUES
(117, 1, 12, 0, 1),
(118, 1, 1, 1, 1),
(119, 1, 2, 1, 1),
(120, 1, 5, 1, 1),
(121, 1, 6, 1, 1),
(124, 1, 18, 1, 1),
(125, 1, 20, 1, 1),
(126, 1, 21, 1, 1),
(127, 1, 22, 1, 1),
(128, 1, 23, 1, 1),
(129, 1, 24, 1, 1),
(130, 1, 25, 1, 1),
(134, 1, 26, 1, 1),
(135, 3, 1, 1, 1),
(136, 3, 6, 1, 1),
(137, 3, 12, 1, 1),
(139, 3, 18, 1, 1),
(140, 3, 20, 1, 1),
(141, 3, 23, 1, 1),
(142, 3, 24, 1, 1),
(143, 3, 26, 1, 1),
(144, 3, 27, 1, 1),
(148, 1, 31, 1, 1),
(149, 4, 1, 1, 1),
(150, 4, 5, 1, 1),
(151, 4, 6, 1, 1),
(152, 4, 18, 1, 1),
(153, 4, 20, 1, 1),
(154, 4, 21, 1, 1),
(155, 4, 22, 1, 1),
(156, 4, 23, 1, 1),
(157, 4, 24, 1, 1),
(162, 4, 31, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_orders`
--

CREATE TABLE `mp_orders` (
  `id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(11,3) NOT NULL,
  `discount` decimal(11,3) NOT NULL,
  `shippedcharges` decimal(11,3) NOT NULL,
  `status` int(1) NOT NULL,
  `shippinaddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_order_list_total`
--

CREATE TABLE `mp_order_list_total` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `agentid` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL,
  `total_amount` decimal(11,3) NOT NULL,
  `cash` decimal(11,3) NOT NULL,
  `credit_amount` decimal(11,3) NOT NULL,
  `cheque_amount` decimal(11,3) NOT NULL,
  `schemes` decimal(11,3) NOT NULL,
  `bank_deposit` decimal(11,3) NOT NULL,
  `return_stock_val` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_payee`
--

CREATE TABLE `mp_payee` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `cus_email` varchar(50) NOT NULL,
  `cus_password` varchar(255) NOT NULL,
  `cus_address` varchar(255) NOT NULL,
  `cus_contact_1` varchar(50) NOT NULL,
  `cus_contact_2` varchar(50) NOT NULL,
  `cus_company` varchar(50) NOT NULL,
  `cus_description` varchar(100) NOT NULL,
  `cus_picture` varchar(100) NOT NULL,
  `cus_status` int(1) NOT NULL,
  `cus_region` varchar(255) NOT NULL,
  `cus_town` varchar(255) NOT NULL,
  `cus_type` varchar(50) NOT NULL,
  `cus_balance` decimal(11,3) NOT NULL,
  `cus_date` date NOT NULL,
  `customer_nationalid` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_payee`
--

INSERT INTO `mp_payee` (`id`, `customer_name`, `cus_email`, `cus_password`, `cus_address`, `cus_contact_1`, `cus_contact_2`, `cus_company`, `cus_description`, `cus_picture`, `cus_status`, `cus_region`, `cus_town`, `cus_type`, `cus_balance`, `cus_date`, `customer_nationalid`, `type`) VALUES
(10, 'Medix Demo', 'user@medix.net', '8cb2237d0679ca88db6464eac60da96345513964', 'IIth Commercial Street DHA', '923472394224', '', 'SpantikLab', 'here goes description about my self.', '04baeefc49e8747cce7cf9f835e053b2.png', 0, 'Down Town', 'New York', '', '0.000', '2019-02-10', '', 'customer'),
(11, 'Abbot', 'abc@gmail.com', '', '', '', '', '', '', '30b40b95c6ddca8f8d894a8de637f217.jpg', 0, '', '', '', '0.000', '2019-02-10', '', 'company'),
(12, 'Gsk', '', '', '', '', '', '', '', '0e5ac421f9ebe42f482ad7d8b624045c.png', 0, '', '', '', '0.000', '2019-02-10', '', 'company'),
(13, 'Electric city ltd', '', '', '', '', '', '', '', '5479a4be2cfcb3b4d93c50e6f580d5eb.jpg', 0, '', '', '', '0.000', '2019-02-10', '', ''),
(14, 'Google ads', '', '', '', '', '', '', '', '213fdcef1ef7c1348e3d7674a205f6c7.png', 0, '', '', '', '0.000', '2019-02-10', '', ''),
(15, 'Pepsico Ltd', 'pepsico@gmail.com', '', '', '', '', '', '', 'c156e0f6b85bd6758d905a23033ed2e0.png', 0, '', '', '', '0.000', '2019-02-10', '', ''),
(16, 'Jhon Doe', 'jhondoe@gmail.com', '', '', '', '', '', '', '009562242fff704bcbb4b3d7f6dbdfa4.png', 0, '', '', '', '0.000', '2019-02-10', '', ''),
(17, 'Abc corp Ltd', 'abc@gmail.com', '', '', '', '', '', 'here goes description about bedana', 'e5ea05e0e886498b308f9b2718a9bb2f.png', 0, '', '', '', '0.000', '2019-02-10', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mp_payment_voucher`
--

CREATE TABLE `mp_payment_voucher` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `payee_id` int(11) NOT NULL,
  `receipt_date` date NOT NULL,
  `memo` varchar(255) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `user` varchar(50) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_pharmacist`
--

CREATE TABLE `mp_pharmacist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linked` varchar(255) NOT NULL,
  `googleplus` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_pharmacist`
--

INSERT INTO `mp_pharmacist` (`id`, `name`, `post_title`, `description`, `cus_picture`, `facebook`, `twitter`, `linked`, `googleplus`, `status`) VALUES
(1, 'Dr Annie', 'Pharmicst', 'lorum ipsum dollar sit amit.', '2ebb5234942384026af15473cb736626.jpg', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.linkedin.com/', 'https://www.googleplus.com/', 0),
(2, 'Dr Jhon', 'Pharmicst', 'lorum ipsum dollar sit amit.', 'bf94811cc67d3e69cd6d52b076739832.jpg', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.linkedin.com/', 'https://www.googleplus.com/', 0),
(3, 'Dr Sansa', 'Pharmicst', 'lorum ipsum dollar sit amit.', '757c8d87a1ba87cb602723d62ce52727.jpg', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.linkedin.com/', 'https://www.googleplus.com/', 0),
(4, 'Dr Kashmala', 'Physician', 'lorum ipsum dollar sit amit.', '4214cd0b4a27799ee4e8ebbb2975e91d.jpg', 'https://www.facebook.com/', 'https://www.twitter.com/', 'https://www.linkedin.com/', 'https://www.googleplus.com/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_printer`
--

CREATE TABLE `mp_printer` (
  `id` int(11) NOT NULL,
  `printer_name` varchar(255) NOT NULL,
  `fontsize` int(11) NOT NULL,
  `set_default` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_printer`
--

INSERT INTO `mp_printer` (`id`, `printer_name`, `fontsize`, `set_default`) VALUES
(6, 'Black Copper BC-85AC', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mp_product`
--

CREATE TABLE `mp_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `cost` decimal(11,3) NOT NULL,
  `sale_tax` decimal(11,3) NOT NULL,
  `head_id` int(11) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_productslist`
--

CREATE TABLE `mp_productslist` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `generic_name` varchar(255) NOT NULL,
  `mg` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `retail` decimal(11,3) NOT NULL,
  `expire` date NOT NULL,
  `manufacturing` date NOT NULL,
  `sideeffects` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `total_units` int(11) NOT NULL,
  `packsize` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `tax` decimal(11,3) NOT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `brand_sector_id` int(11) NOT NULL,
  `unit_type` varchar(50) NOT NULL,
  `net_weight` varchar(50) NOT NULL,
  `whole_sale` decimal(11,3) NOT NULL,
  `pack_cost` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_productslist`
--

INSERT INTO `mp_productslist` (`id`, `category_id`, `product_name`, `generic_name`, `mg`, `quantity`, `purchase`, `retail`, `expire`, `manufacturing`, `sideeffects`, `description`, `barcode`, `min_stock`, `status`, `total_units`, `packsize`, `sku`, `location`, `tax`, `type`, `image`, `brand_id`, `brand_sector_id`, `unit_type`, `net_weight`, `whole_sale`, `pack_cost`) VALUES
(1, 1, 'Flaygl', 'antamezol', '250', 231, '50.000', '70.000', '2019-11-21', '2019-08-05', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', 'default.jpg', 1, 1, 'Kg', '800', '200.000', '300.000'),
(2, 1, 'Panadol', 'Paracetamol', '20', 104, '20.000', '30.000', '2019-09-20', '2019-07-02', '', '                                ', '8964000057124', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', 'default.jpg', 1, 1, 'Kg', '2221', '50.000', '40.000'),
(14, 1, 'ACYCLOVIR TAB', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(15, 1, 'ADRENALINE INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(16, 1, 'ALBENDAZOLE TABLETS (ABZ)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(17, 1, 'AMINOPHYLINE INJCETION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(18, 1, 'AMINOPHYLINE TABLETS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(19, 1, 'ADRENALINE INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(20, 1, 'AMITRITYLINE TABLETS  (LAROXYL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(21, 1, 'AMOXICILLIN CAPS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(22, 1, 'AMOXICILLIN CAPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(23, 1, 'AMOXICILLIN  SUSPENSOIN ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(24, 1, 'AMOXICILLIN/CLAVULANIC TABS (AUGMENTIN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(25, 1, 'AMOXICILLIN/CLAVULANIC SYRUP (AUGMENTIN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(26, 1, 'AMPICLOX CAPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(27, 1, 'AMPICLOX NEONATAL DROP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(28, 1, 'AMPICLOX INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(29, 1, 'AMPICLOX SYRUP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(30, 1, 'ANALGESIC RUB-BALM ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(31, 1, 'ANTIACID TABLETS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(32, 1, 'ANTIACID MIXTURE(ACTAL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(33, 1, 'ANTIACID GEL/RELCER GEL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(34, 1, 'ANTI-HAEMORROHOIDAL SUPPOSITORIES(6 SUPOS)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(35, 1, 'ASCORIL SYRUP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(36, 1, 'ANTISEPTIC THROAT LOZENGES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(37, 1, 'ANTI-ASTHMATIC TABLETS (FRANOL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(38, 1, 'ANTEMETHER INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(39, 1, 'ANTEMETHER INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(40, 1, 'ASCORBIC ACID TABLETS (VITAMIN C)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(41, 1, 'ATROPINE INJECTION  ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(42, 1, 'ASPRIN TABLETS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(43, 1, 'BENZOHEXOL TABS 5MG    (ARTANE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(44, 1, 'BENZOIC/SALICLYICACID OINTMENT(WHITE FIELD)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(45, 1, 'BENZYL BENZOATE EMULSION     ( BBE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(46, 1, 'BISACODYL TABS      (DULCOLAX)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(47, 1, 'BORIC ACID EAR DROPS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(48, 1, 'BROMOCRIPTINE TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(49, 1, 'BUPIVACAINE INJECTION (MARCAINE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(50, 1, 'CALCIUM GLUCONATE INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(51, 1, 'CALAMINE LOTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(52, 1, 'CABIMAZOLE TABLETS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(53, 1, 'CARBAMAZEPINE TABS (TEGRETOL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(54, 1, 'CEFTRIAXONE INJECTION  ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(55, 1, 'CEFTRIAXONE  INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(56, 1, 'CEFTRIAXONE INJECTION   ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(57, 1, 'CHLORPHENIRAMINE TABS (PIRITON)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(58, 1, 'CHLORPHENIRAMINE  SYRUP (PIRITON)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(59, 1, 'CHLORPHENIRAMINE INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(60, 1, 'CHLORMPHENICOL EYE/EAR  DROPS  (CAF)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(61, 1, 'CHLORMPHENICOL INJCTION  (CAF)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(62, 1, 'CHLORPROMZINE TABS 100MG LARGCATIL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(63, 1, 'CHLORPROMZINE  INJECTION (LARGATIL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(64, 1, 'CIPROFLOXACIN EYE/EAR DROPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(65, 1, 'CIPROFLOXACIN  TABS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(66, 1, 'CIPROFLOXACIN TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(67, 1, 'CLOXACILLIN SYRUP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(68, 1, 'CLOXACILLIN   CAPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(69, 1, 'CLOXACILLIN CAPS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(70, 1, 'CLOTRIMAZOLE ORAL PAINT ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(71, 1, 'CLOTRIMAZOLE PESSARIES     ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(72, 1, 'CO-TRIMOXAZOLE SUSPEN (SEPTRIN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(73, 1, 'CO-TRIMOXAZOLE  TABS (SEPTRIN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(74, 1, 'CO-TRIMOXAZOLE TABS  (SEPTRIN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(75, 1, 'DEXAMETHASONE INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(76, 1, 'DETROSE INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(77, 1, 'DIAZEPAM INJECTION  (VALIUM)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(78, 1, 'DIAZEPAM  TABS      (VALIUM)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(79, 1, 'DICLOFENAC TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(80, 1, 'DICLOFENAC  INJECTION  ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(81, 1, 'DIGIOXIN TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(82, 1, 'DOXYCYCILLIN CAPS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(83, 1, 'EPHEDRINE NASAL DROPS (PAEDS)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(84, 1, ' EPHEDRINE NASAL DROPS (ADULT)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(85, 1, 'ERGOMETRIC INJECTIONS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(86, 1, 'ERYTHROMYCIN SYRUP', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(87, 1, 'ERYTHROMYCIN TABLETS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(88, 1, 'ERYTHROMYCIN TABLETS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(89, 1, 'FERROUS SULPHATE TABS  IFAS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(90, 1, 'FOLIC  TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(91, 1, 'FLUCLOXACILLION CAP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(92, 1, 'FRUSEMIDE INJECTION   (LASIX)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(93, 1, 'FRUSEMIDE  TABS (LASIX)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(94, 1, 'GENTAMYCIN  INJECTION   AMP(ADULT)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(95, 1, 'GENTAMYCIN  INJECTION   AMP(PAEDS)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(96, 1, 'GENTIAN VIOLET CRYSTALS (GV)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(97, 1, 'GENTAMYCIN EYE/EAR DROPS  ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(98, 1, 'GLIBENACLAMIDE TABS   ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(99, 1, 'GRISEOFULVIN TABS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(100, 1, 'HAEMATINIC CAPS(RANFERON)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(101, 1, 'HAEMATINIC    SYRUP(RANFERON    AHOLA)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(102, 1, 'HALOTHANE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(103, 1, 'HEPARINE INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(104, 1, 'HYDROCORTISONE  INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(105, 1, 'HYDROCORTISONE  CREAM ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(106, 1, 'HYDRALAZINE INJECTION  (APRESOLINE)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(107, 1, 'HYDRALAZINE TABLETS (APRESOLINE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(108, 1, 'HYOSICNE BUTYLBROMIDE INJECTION (BASCOPAIN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(109, 1, 'HYOSICNE BUTYLBROMIDE  (BASCOPAN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(110, 1, 'IBUPROFEN TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(111, 1, 'IBUPROFEN TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(112, 1, 'IBUPROFEN SUSPENSION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(113, 1, 'INDOMETHACIN CAPS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(114, 1, 'INSULIN  (MIXTARD) INJECTION ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(115, 1, 'INSULIN  (ACTRAPID) INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(116, 1, 'KETAMINE INJECTION ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(117, 1, 'KY  JELLY-STERILE ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(118, 1, 'KETOCONAZOLE TABS  (NIZEROL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(119, 1, 'LIGNOCAIN  INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(120, 1, 'LOPERAMIDE CAPS  (IMMODIUM)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(121, 1, 'MAGNESIUM SULPATE INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(122, 1, 'MEBNDAZOLE TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(123, 1, 'MELOXICUM TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(124, 1, 'METRONIDAZOLE  INJECTION  (FLAGYL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(125, 1, 'METRONIDAZOLE  TABS  (FLAGYL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(126, 1, 'METRONIDAZOLE      TABS  (FLAGYL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(127, 1, 'METRONIDAZOLE SUSPENSION (FLAGYL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(128, 1, 'METHYLDOPA TABS   (ALDOMET)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(129, 1, 'METHYLDOPA TABS (ALDOMET)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(130, 1, 'METOCLOPRAMIDE TABS   (PLASIL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(131, 1, 'METOCLOPRAMIDE INJECTION (PLASIL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(132, 1, 'MULTVITAMIN     TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(133, 1, 'MULTVITAMIN      SYRUP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(134, 1, 'NEOSTIGMINE INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(135, 1, 'NIFEDIPINE TABS     RS (ADALAT)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(136, 1, 'NITROFURANTOIN TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(137, 1, 'NORFULOXACIN TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(138, 1, 'NYSTATIN ORAL DROPS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(139, 1, 'OMERAZOLE CAPS RS  ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(140, 1, 'ORALREHYDRATION SALT 500ML SACHET', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(141, 1, 'PANCURONIUM INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(142, 1, 'PARACETAMOL INJECTION ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(143, 1, 'PARACETAMOL SUSPENSION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(144, 1, 'PARACETAMOL TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(145, 1, 'PARACETAMOL SUPPOSITORIES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(146, 1, 'PARACETAMOL JUNIOR TABLETS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(147, 1, 'PENICILLIN BENZATHINE INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(148, 1, 'PENICILLIN BENZYLE INJECTION (X-PEN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(149, 1, 'PENICILLIN BENZYLE INJECTION(X-PEN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(150, 1, 'PENICILLIN BENZYLE INJECTION(X-PEN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(151, 1, 'PENICILLIN PROCAINE FORTIFIED(PPF)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(152, 1, 'PENICILLIN TRIPPLE INJECTION(TRIPLE PEN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(153, 1, 'PETHIDINE INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(154, 1, 'PHENOBARBITONE INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(155, 1, 'PHENOBARBITONE TABS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(156, 1, 'POTASSIUM CHLORIDE INJECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(157, 1, 'PREDNISOLONE EYE DROPS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(158, 1, 'PROPRANOL (ANTENOLOL)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(159, 1, 'PREDNISOLONE TABS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(160, 1, 'PROMETHAZINE  INJECTION   (PHENERGAN)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(161, 1, 'PROMETHAZINE  SYRUP  (PHENERGAN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(162, 1, 'PROMETHAZINE TABS (PHENERGRAM)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(163, 1, 'PYRIDOXINE(VITAMIN B6) TABLETS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(164, 1, 'QUININE ORAL DROPS (PAEDS)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(165, 1, 'QUININE INJECTION IM/IV', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(166, 1, 'QUININE SULPHATE TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(167, 1, 'QUININE SULPHATE TABS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(168, 1, 'RANITIDINE INJECTION (ZANTAC)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(169, 1, 'RANITIDINE TABS (ZANTAC)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(170, 1, ' SALBUTAMOL INHALER (ZANTA)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(171, 1, 'SALBUTAMOL SYRUP (VENTALIN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(172, 1, 'SPIRINOLACTINE TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(173, 1, 'SUXAMETHONIUM INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(174, 1, 'TETRACYCLINE EYE OINTIMENT 3.5G TUBE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(175, 1, 'THIOPENTONE INJECTION  ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(176, 1, 'TINIDAZOLE TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(177, 1, 'TINIDAZOLE TABS ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(178, 1, 'TRAMADOL  CAPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(179, 1, 'TRAMADOL INJECTION ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(180, 1, 'VITAMIN B COMPLEX TABS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(181, 1, 'VITAMIN  K PAEDS INJECTION (ORAL )', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(182, 1, 'VITAMIN  K  ADULT  INJECTION ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(183, 1, 'WATER FOR INJECTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(184, 1, 'ZINC SULPATE TABS ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(185, 1, 'CHLORHEX/certrimide(SALVON)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(186, 1, 'LYSOL SOLUTIN ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(187, 1, ' HYDROGEN PEROXIDE ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(188, 1, 'METHAYLATED SPIRIT', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(189, 1, 'POVIDONE-IODINE SOLUTION Aq. 5LITRE   ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(190, 1, 'SODIUM  HYPOCHLORIDE (CONC JIK', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(191, 1, 'CREPE BANDAGE MEDIUM', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(192, 1, ' CREPE BANDAGE  SMALL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(193, 1, 'BANDAGES-GAUZE(NON-STERILE ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(194, 1, 'BANDAGES-GAUZE (NON-STERILE)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(195, 1, 'GAUZE DRESSING WITH ANTIBIOTIC(SOFRATULE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(196, 1, 'GAUZE ROLLS- B.P QUALITY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(197, 1, 'COTTON WOOL (ROLL)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(198, 1, 'PLASTER OF PARIS BANDAGE (POP)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(199, 1, 'PLASTER OF PARIS BANDAGE (POP)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(200, 1, 'PLASTER OF PARIS BANDAGE (POP)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(201, 1, 'PLASTER OF PARIS BANDAGE (POP)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(202, 1, 'STRAPPING ZINC OXIDE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(203, 1, 'STRAPPING ZINC OXIDE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(204, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(205, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(206, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(207, 1, 'FOLEY CATHETER 2 WAY : 5-15ML', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(208, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(209, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000');
INSERT INTO `mp_productslist` (`id`, `category_id`, `product_name`, `generic_name`, `mg`, `quantity`, `purchase`, `retail`, `expire`, `manufacturing`, `sideeffects`, `description`, `barcode`, `min_stock`, `status`, `total_units`, `packsize`, `sku`, `location`, `tax`, `type`, `image`, `brand_id`, `brand_sector_id`, `unit_type`, `net_weight`, `whole_sale`, `pack_cost`) VALUES
(210, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(211, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(212, 1, 'FOLEY CATHETER 2 WAY : 30ML', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(213, 1, 'ENDOTRACHEAL TUBE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(214, 1, 'ENDOTRACHEAL TUBE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(215, 1, 'ENDOTRACHEAL TUBE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(216, 1, 'ENDOTRACHEAL TUBE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(217, 1, 'ENDOTRACHEAL TUBE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(218, 1, 'ENDOTRACHEAL TUBE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(219, 1, 'ENDOTRACHEAL TUBE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(220, 1, 'ENDOTRACHEAL TUBE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(221, 1, 'ENDOTRACHEAL TUBE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(222, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(223, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(224, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(225, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(226, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(227, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(228, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(229, 1, 'NASO-GASTRIC (FEEDING) TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(230, 1, 'SUCTION TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(231, 1, 'SUCTION TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(232, 1, 'SUCTION TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(233, 1, 'SUCTION TUBES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(234, 1, 'SUCTION TUBES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(235, 1, 'SURGICAL BLADES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(236, 1, 'SURGICAL BLADES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(237, 1, 'BLOOD BAGS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(238, 1, 'BLOOD GIVING SET-WITH FILTER', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(239, 1, 'COLOSTOMY BAG-ADULT', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(240, 1, 'COLOSTOMY BAG-PEDIATRIC', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(241, 1, 'MATERNITY PADS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(242, 1, 'UMBLICAL CORD CLAMPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(243, 1, 'SURGICAL (FACE)MASKS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(244, 1, 'THERMOMETERS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(245, 1, 'URINE BAGS WITH OUTLETS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(246, 1, 'GLOVES SURGICAL -STERILE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(247, 1, 'EXAMINNATION CLEAN GLOVES (STERILE)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(248, 1, 'I.V. CANNULAS   (BRANNULAS)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(249, 1, 'I.V. CANNULAS   (BRANNULAS)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(250, 1, 'I.V. CANNULAS   (BRANNULAS)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(251, 1, 'I.V. CANNULAS   (BRANNULAS)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(252, 1, 'I.V. GIVING SET', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(253, 1, 'NEEDLES&  SYRINGES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(254, 1, 'NEEDLES DISPOABLE ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(255, 1, 'NEEDLES DISPOABLE ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(256, 1, 'NEEDLES DISPOABLE ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(257, 1, 'SPINAL NEEDLES', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(258, 1, 'SYRINGES  DISPOSABLE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(259, 1, 'SYRINGES  DISPOSABLE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(260, 1, 'SYRINGES  DISPOSABLE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(261, 1, 'SYRINGES  DISPOSABLE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(262, 1, 'SYRINGES  DISPOSABLE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(263, 1, 'DEXTROSE SOLUTION      ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(264, 1, 'DEXTROSE SOLUTION      ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(265, 1, 'DEXTROSE  IN NORMAL SALINE ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(266, 1, 'DARROW\'S HALF STRENGTH-PLAIN ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(267, 1, 'HAES-STERIL PLASMA EXPANDER SOL. ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(268, 1, 'SODIUM CHLORIDE-NORMAL ALINE ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(269, 1, 'SODIUM LACTATE SOL (hartmans) RINGER', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(270, 1, 'CHEST X-RAY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(271, 1, 'SKULL X RAY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(272, 1, 'PELVIC ANTERIO & POSTERIOR (AP)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(273, 1, 'PELVIC AP & LATERAL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(274, 1, 'ABDOMEN ANTERIO & POSTERIA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(275, 1, 'ABDOMEN AP & LATERAL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(276, 1, 'FEMUR', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(277, 1, 'UPPER ARM', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(278, 1, 'LOWER ARM', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(279, 1, 'ANKLE JOINT', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(280, 1, 'KNEE JOINT', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(281, 1, 'LEG', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(282, 1, 'FOOT', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(283, 1, 'SPINAL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(284, 1, 'REQUESTED X-RAY CHARGES', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(285, 1, 'CHEST X-RAY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(286, 1, 'SKULL X RAY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(287, 1, 'PELVIC ANTERIO & POSTERIOR (AP)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(288, 1, 'PELVIC AP & LATERAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(289, 1, 'ABDOMEN ANTERIO & POSTERIA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(290, 1, 'ABDOMEN AP & LATERAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(291, 1, 'FEMUR', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(292, 1, 'UPPER ARM', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(293, 1, 'LOWER ARM', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(294, 1, 'ANKLE JOINT', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(295, 1, 'KNEE JOINT', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(296, 1, 'LEG', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(297, 1, 'FOOT', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(298, 1, 'SPINAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(299, 1, 'BLOOD SUGER TESTS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(300, 1, 'BLOOD BLEEDING TIME', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(301, 1, 'BLOOD CLOTTING TIME', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(302, 1, 'BLOOD GROUPING', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(303, 1, 'BLOOD CROSS MATCHING', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(304, 1, 'BLOOD URINE AND ELECTROLYTE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(305, 1, 'BRUCELLA TEST', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(306, 1, 'B/S FOR MPS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(307, 1, 'BLOOD CULTRE AND SENSITIVITY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(308, 1, 'ESR&HB', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(309, 1, 'FGT & DAT (FORMAL GEL TEST)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(310, 1, 'FULL HAEMOGLOBIN & WBCC', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(311, 1, 'GRAM STAIN', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(312, 1, 'HEPATITIS B TEST', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(313, 1, 'HEPATITIS C TEST', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(314, 1, 'LIVER FUNTION TEST (SGOT, SGPT, BILIRUBIN', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(315, 1, 'PSA(PROSTATE SPECIFIC ANTIGEN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(316, 1, 'PREGNANT TEST', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(317, 1, 'RHEUMANTIC FACTOR (RHF)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(318, 1, 'SEMEN ANALYSIS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(319, 1, 'SPUTUM TEST (AAFB)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(320, 1, 'STOOL CULTURE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(321, 1, 'STOOL OVAL CYST', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(322, 1, 'THYROID FUNCTION TEST ', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(323, 1, 'URINEALYSIS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(324, 1, 'URETHRAL SMEAR', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(325, 1, 'VDRAL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(326, 1, 'HB', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(327, 1, 'FORMALIN SOLUTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(328, 1, 'POTTASIUM/SODIUM TEST', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(329, 1, 'CHROMIC CAT GUT  RBN', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(330, 1, 'VICRYL (POLYGLACTIN) RBN', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(331, 1, 'VICRYL (POLYGLACTIN) CUTTING', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(332, 1, 'VICRYL (POLYGLACTIN) RBN CUTTING', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(333, 1, 'VICRYL (POLYGLACTIN) RBN', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(334, 1, 'VICRYL (POLYGLACTIN) RBN', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(335, 1, 'VICRYL (POLYGLACTIN) RBN', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(336, 1, 'VICRYL (POLYGLACTIN) CUTTING', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(337, 1, 'VICRYL (POLYGLACTIN) CUTTING', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(338, 1, 'PROLENE CUTTING', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(339, 1, 'PROLENE RBN', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(340, 1, 'PROLENE RBN', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(341, 1, 'WOUND DRESSING', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(342, 1, 'DRESSING AT OUT PATIENT PER DAY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(343, 1, 'DRESSING IN THE WARD PER DAY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(344, 1, 'ANAL DILATION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(345, 1, 'APPENDICETOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(346, 1, 'ARTHROCENTESIS (ASPIRATION OF THE JOINT)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(347, 1, 'ARTHOTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(348, 1, 'BIOPSY    MAIN THEATER   (GA)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(349, 1, 'BIOPSY    MINOR THEATER   (LA)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(350, 1, 'BONE TUMORS GROWTH EXCISION/BIOPSY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(351, 1, 'BREAST LUMP EXCISION/BIOPSY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(352, 1, 'CAESAREAN SECTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(353, 1, 'CHOLYTECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(354, 1, 'CIRCUMCISION    GA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(355, 1, 'CIRCUMCISION    LA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(356, 1, 'COLOSTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(357, 1, 'CLOPORRAPHY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(358, 1, 'DILITATION/ CURETTAGE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(359, 1, 'DISARTICULATION/AMPUTATION OF FINGER LIMP GA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(360, 1, 'DISARTIFICATION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(361, 1, 'ELAVATION OFDISTRESSED FRACTURE SKULL', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(362, 1, 'EXAMINATION UNDER  ANAESTHESIA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(363, 1, 'EXCISION OF WART  GA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(364, 1, 'EXCISION OF WART  LA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(365, 1, 'EXPLORATION LAPARATOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(366, 1, 'FISTULECTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(367, 1, 'GASTROENTEROSTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(368, 1, 'HAEMORRHOIDECTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(369, 1, 'HERNIORAPHY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(370, 1, 'HERNIOTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(371, 1, 'HYDROCOELECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(372, 1, 'INCISION &DRAINAGE (  I&D     GA)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(373, 1, 'INCISION &DRAINAGE (  I&D     LA)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(374, 1, 'K-WIRING', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(375, 1, 'WORPANT(REMOVING)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(376, 1, 'LAPAROTOMY    FOR  ECTOPIC PREGNANCY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(377, 1, 'LAPAROTOMY    FOR  HYDATID CYST ', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(378, 1, 'LAPAROTOMY  FOR INTESTINAL OBSTRACTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(379, 1, 'LAPAROTMY  FOR PERITONITIS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(380, 1, 'LAPAROTMY  FOR ABDOMINAL MASS REMOVAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(381, 1, 'LIVER FUNCTION TEST(SGOT,SGPT,BILIRUBIN)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(382, 1, 'SODIUM TESTS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(383, 1, 'POTASSIUM TESTS', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(384, 1, 'CREATININE TEST', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(385, 1, 'MAC-DONALD STICH', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(386, 1, 'MANCHESTER OPERATION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(387, 1, 'MASTECTOMY SIMPLE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(388, 1, 'MASTECTOMY MODIFIED RADICAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(389, 1, 'MYOMECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(390, 1, 'MYRINGOPLASTY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(391, 1, 'NEPHRECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(392, 1, 'NORMAL DELIVERY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(393, 1, 'OPEN REDUCTION &INTERNAL FIXATION OF A FRACTURE/PLAT', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(394, 1, 'ORCHIDOPEXY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(395, 1, 'PERINAL TEAR REPAIR', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(396, 1, 'POLYPECTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(397, 1, 'POP LOWER LIMP', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(398, 1, 'POP UPPER LIMP', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(399, 1, 'RECTOVAGINAL REPAIR (VVF/RVF)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(400, 1, 'REDUCTION DISLOCATION (OPD)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(401, 1, 'REDUCTION DISLOCATION /FRACTURE  GA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(402, 1, 'REDUCTION OF PARAPHYMOSIS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(403, 1, 'RELEASE OF CONTRACTURE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(404, 1, 'REMOVAL OF FOREIGN BODY GA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(405, 1, 'REMOVAL OF FOREIGN BODY LA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(406, 1, 'REMOVAL OF OBSTRACTION MEATUS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(407, 1, 'REMOVAL OF PLATE', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(408, 1, 'REMOVAL OF RETAINED PLACENTA GA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(409, 1, 'REMOVAL OF RETAINED PLACENTA  LA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(410, 1, 'REMOVAL OF SMALL TUMORS SUPERFICAL,LIPOMA,ETC', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(411, 1, 'REPAIR OF vvf/rvf', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000');
INSERT INTO `mp_productslist` (`id`, `category_id`, `product_name`, `generic_name`, `mg`, `quantity`, `purchase`, `retail`, `expire`, `manufacturing`, `sideeffects`, `description`, `barcode`, `min_stock`, `status`, `total_units`, `packsize`, `sku`, `location`, `tax`, `type`, `image`, `brand_id`, `brand_sector_id`, `unit_type`, `net_weight`, `whole_sale`, `pack_cost`) VALUES
(412, 1, 'REPAIR OF  TEARS L/A(EPISIOTOMY)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(413, 1, 'REPAIR OF TEARS G/A', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(414, 1, 'REPAIR OF RUPTURED UTERUS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(415, 1, 'SALPINGO -OPHEORECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(416, 1, 'SECQUESTECTOMY IN OSTEOMYELITIS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(417, 1, 'SKIN GRAFTING', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(418, 1, 'SKIN TRACTION', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(419, 1, 'SPLENECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(420, 1, 'STOMACH WASH /MVA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(421, 1, 'SUBTOTAL THYROIDECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(422, 1, 'SUPRAPUPIC DRAINAGE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(423, 1, 'SURGICAL EXPROLATION   LA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(424, 1, 'SURGICAL EXPROLATION   GA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(425, 1, 'SURGICAL TOILET G/A', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(426, 1, 'SURGICAL TOILET L/A', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(427, 1, 'SUTURING   GA', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(428, 1, 'SUTURING MAIN THEATER   GA', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(429, 1, 'TOTAL HYSTERECTOMY (TVH)', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(430, 1, 'TOTAL HYSTERECTOMY (TVH IBSO)', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(431, 1, 'TESTICULAR EXPLORATION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(432, 1, 'THORACIC DRAINAGE UNDER WATER SEAL', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(433, 1, 'THYROIDECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(434, 1, 'TONGE  TIE RELEASE', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(435, 1, 'TONSILLECTOMY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(436, 1, 'TRACHEOTOMY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(437, 1, 'TRANS -SKELETAL TRACTION', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(438, 1, 'TUBAL OVARIAN MASS', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000'),
(439, 1, 'VACUUM DELIVERY', '', '20', 104, '20.000', '30.000', '0000-00-00', '0000-00-00', '', '                                ', '8.964E+12', 20, 0, 0, '12', '', '', '0.000', 'Finished Products', '', 1, 1, 'Kg', '2221', '50.000', '0.000'),
(440, 1, 'VAGINOPLASTY', '', '250', 231, '50.000', '70.000', '0000-00-00', '0000-00-00', 'avoid children', 'asdasdasd', '123455', 20, 0, 0, '12', 'SKU', 'TOP DOWN', '0.000', 'Finished Products', '', 1, 1, 'Kg', '800', '200.000', '0.000');

-- --------------------------------------------------------

--
-- Table structure for table `mp_purchase`
--

CREATE TABLE `mp_purchase` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `store` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `payment_type_id` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `discount` decimal(11,3) NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_purchase_order`
--

CREATE TABLE `mp_purchase_order` (
  `id` int(11) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `date` date NOT NULL,
  `expire_date` date NOT NULL,
  `user` varchar(255) NOT NULL,
  `memo` longtext NOT NULL,
  `payee_id` int(11) NOT NULL,
  `billing` varchar(255) NOT NULL,
  `invoicemessage` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_region`
--

CREATE TABLE `mp_region` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_region`
--

INSERT INTO `mp_region` (`id`, `name`, `code`) VALUES
(1, 'Down Town', '0001'),
(2, '11th avenue', '0002');

-- --------------------------------------------------------

--
-- Table structure for table `mp_return`
--

CREATE TABLE `mp_return` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cus_id` int(11) NOT NULL,
  `agent` varchar(255) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `discount_given` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_return_list`
--

CREATE TABLE `mp_return_list` (
  `id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `product_no` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `mg` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` decimal(11,3) NOT NULL,
  `mode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sales`
--

CREATE TABLE `mp_sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_no` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `mg` int(11) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `discount` int(11) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `tax` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_salesman`
--

CREATE TABLE `mp_salesman` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sales_orderlist`
--

CREATE TABLE `mp_sales_orderlist` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `opening_stock` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `product_no` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `mg` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tax` decimal(11,3) NOT NULL,
  `source` varchar(50) NOT NULL,
  `pack` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sales_receipt`
--

CREATE TABLE `mp_sales_receipt` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(255) NOT NULL,
  `payee_id` int(11) NOT NULL,
  `method` varchar(255) NOT NULL,
  `ref_no` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `total_bill` decimal(11,3) NOT NULL,
  `total_paid` decimal(11,3) NOT NULL,
  `invoicemessage` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_services`
--

CREATE TABLE `mp_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_services`
--

INSERT INTO `mp_services` (`id`, `title`, `description`, `icon`, `status`) VALUES
(1, '24 Hour Support', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'fa fa-stethoscope', 0),
(2, 'Medical Counseling', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'fa fa-user-md', 0),
(3, 'Emergency Services', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'fa fa-ambulance', 0),
(4, 'Premium Healthcare', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'fa fa-medkit', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_sessions`
--

CREATE TABLE `mp_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mp_sessions`
--

INSERT INTO `mp_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0bn1dnfqajm7aagiamrecbk0co40rf9b', '::1', 1562723256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323732333235363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39333a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204164646564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226e6577223b7d),
('0gf0sf021k94v83pml8b5ehes0mbnm8s', '::1', 1564122843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132323834333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('14dbo9mqr8aim0o1tkr2bf0t68u1uhgv', '::1', 1563476754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333437363639343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('168g6d2uevq88mfbv85j0t82i0r5rqi6', '::1', 1549833003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833333030333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('1sml356ut1rbaaikipa0phe27os8n116', '::1', 1564122525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132323532353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('1vohk7139ma0uc4dugvrreevlsgsqbaj', '::1', 1564122151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132323135313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('27ee9541s3a5kopnm4llsuq3fjv33kdl', '::1', 1553379462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333337393435353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('2c9ne76d5jva169t7uoag98g13tb4tdd', '::1', 1549834949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833343934393b),
('2h05h5qa38sm1dv2cti5ov5nkmj45m5s', '::1', 1549832695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833323639353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39353a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e2043726561746564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('3h3j6t09uk2u6eouisvhrjg2ikr7oilf', '::1', 1564085910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343038353838343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('3ud95bjf34ao2qcnpo8kdsakcfsra7kq', '::1', 1549833384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833333338343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('43dqt56g3uutjs3b92btje5hr7ibaj3r', '::1', 1564938089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343933383038393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('7hq7grtlt9mue21jk0q97bhfeio0oj0r', '::1', 1564127420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132373231313b757365725f69647c613a323a7b733a323a226964223b733a313a2234223b733a343a226e616d65223b733a363a226e6176656564223b7d),
('7j6o4hhgfu94tcdfk4gdlou6auogrhf9', '::1', 1564939881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343933393838313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('88oet0hn6oehifubd1ou0nubju3f88lu', '::1', 1561024645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313032343633333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('8n2ku0hgujt9gtqi678cbgmqet0c8cnv', '::1', 1564945739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934353733393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('8vifodu5pvqqtjmesttprsgr4sk86icp', '::1', 1564951977, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343935313937373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('99m6vd1hbap303lo635ca3ggbnlkiq4b', '::1', 1552249810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323234393831303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('9fv5c7ofplstpca5p5lu4sbtnteidlq5', '::1', 1564946049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934363034393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('9odi9o63cps22oopmqc0dsifq78q2f2p', '::1', 1549838382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833383331383b),
('9rscg4o0o83sioe812m7r9ddqo4aq6pf', '::1', 1549833806, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833333830363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('ahu9hnvar888hfs8tkd3osbnb3rkqfsd', '::1', 1564947671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934373637313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('alj2ao1qbavi8us90utm7net5kp7l7e6', '::1', 1564951461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343935313436313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('bhrnucssf63g8st917ilqukt5ticb8nq', '::1', 1561106053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313130363033303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('c15o8tobgfecu9mg0muqqt3j0ghmivu3', '::1', 1549831750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833313735303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('c5vje3vd21st814kbsko4gmski4t4ua0', '::1', 1564947349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934373334393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('cgeb6f3jboije22es5bg6puo0sjv956e', '::1', 1564940402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934303430323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('d4va8k25jlml4g1dc7gshke2hqsp19s2', '::1', 1564118579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131383537393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('dfv12old4o25fk93qn5t147qnn47fphd', '::1', 1564113354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131333335343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('f95b9as3ic79bhkjnb8dnpbn54kse9vd', '::1', 1549838318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833383331383b),
('g3jnj56qr5r81keikmpnh474i2q14fg7', '::1', 1564113682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131333638323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('g7oqedomnl3mjcoha5s4lss7etk0ttu8', '::1', 1564117632, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131373633323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('g820e4350bj6vk7pac4u0tiodtc58kd1', '::1', 1555144849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535353134343635353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('g945ga88kvcncg4p35n7m19gs6aifif9', '::1', 1552250095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323234393831303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('h17ck6esjo0c4av3760sphnmfhts3ti1', '::1', 1564107740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343130373734303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a3132313a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e20496e766f696365207375636365737366756c6c20627574206e6f207072696e746572206973206465647563746564223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('h5vksn516sdlopnouitrg9f62jfs9l26', '::1', 1561638228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536313633383135333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('jj11a3gv04807cdr69b1i8a52r1877cv', '::1', 1552248727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323234383732373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('jlr4otp7gh0oidensilu4qbkim4ntnrj', '::1', 1564952013, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343935313937373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('jtunj7lspkafm1u0dn7jnpdpmh9jo45v', '::1', 1564121841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132313834313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('k2m3bt626iains9rrlm6r4qdsb1h5uaj', '::1', 1564123455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132333435353b757365725f69647c613a323a7b733a323a226964223b733a313a2234223b733a343a226e616d65223b733a363a226e6176656564223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('llpjp44dimcrbis90mld9t2j3fqogtvi', '::1', 1564173357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343137333335363b),
('mh4q98euavh7cn5tao13ctto0jtqo25n', '::1', 1562723789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323732333738393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('mijgs6n32cpt5u2jmqhcn0kjab06b6jo', '::1', 1553029866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333032393833393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('mmtd96d1jjujj143idiode0c11i6m8dk', '::1', 1564948449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934383434393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('n0daunij1j3jrvavoilhd7hqcpn1ntbn', '::1', 1564939574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343933393537343b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('n8jg22hs7t3cfctlpf9nrucpir6949oi', '::1', 1564949733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934393733333b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('nok83pre6bm7r1sum62532urihnftrng', '::1', 1564940644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934303430323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('nrrb7p2arkac9dog7cv4n6u8p12fkuii', '::1', 1558291413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535383239313338313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('om7gns34nogc7cnd67li5649ihsnviue', '::1', 1564106642, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343130363634303b),
('ota7pl61d3r4eh95nveu86elganql3ol', '::1', 1550568730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535303536383732303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('p6brvp2nhcit6cm11esid09325cc96fv', '::1', 1553258674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535333235383635383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39343a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e204c6f67696e20205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('pmo5p1r38hh3hh3303f9ncgusv7dvu1f', '::1', 1549832382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833323338323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('q9gkbujnrqns34pe6emtlm3k1dok1bgd', '::1', 1564947000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934373030303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('qb4teb0nv8gmsft2ti0gse0blv1erd5l', '::1', 1564946368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934363336383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('rhob7n8hqcl7g8j530rbkt6frs0vj5d0', '::1', 1549832067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833323036373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('rpau7s52s7o3c125dfgdelbbb456anhk', '::1', 1552249041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323234393034313b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('rrnsbimdo371bd27vjkda5b585v5810a', '::1', 1564934203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343933333939383b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('rs056ssth2hts4ek1l82bhrve38cio6d', '::1', 1564124681, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132343638313b757365725f69647c613a323a7b733a323a226964223b733a313a2234223b733a343a226e616d65223b733a363a226e6176656564223b7d),
('sjfmbddfgleolmrjak2scv0a1oumucks', '::1', 1564112612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131323631323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('sojesvk4qh8p9qal76p12f6hbkc0fk4m', '::1', 1564946686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343934363638363b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('t1eb04etc4sl851cehndrfp5htrc98uu', '::1', 1564127211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132373231313b757365725f69647c613a323a7b733a323a226964223b733a313a2234223b733a343a226e616d65223b733a363a226e6176656564223b7d),
('tadsuddtc2epf0h19cjgjlfohvt7s055', '::1', 1564123153, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343132333135333b757365725f69647c613a323a7b733a323a226964223b733a313a2234223b733a343a226e616d65223b733a363a226e6176656564223b7d7374617475737c613a323a7b733a333a226d7367223b733a39353a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d636865636b2d636972636c652d6f2220617269612d68696464656e3d2274727565223e3c2f693e2043726561746564207375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('tf0jhjjj7gcd7mmo6qnosgp1qbc911th', '::1', 1552249435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313535323234393433353b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d7374617475737c613a323a7b733a333a226d7367223b733a39383a223c69207374796c653d22636f6c6f723a236666662220636c6173733d2266612066612d74726173682d6f2220617269612d68696464656e3d2254525545223e3c2f693e2050726976696c6567652072656d6f766564205375636365737366756c6c79223b733a353a22616c657274223b733a343a22696e666f223b7d5f5f63695f766172737c613a313a7b733a363a22737461747573223b733a333a226f6c64223b7d),
('thv07g0tb13cp6bqkkb25mqucknb2pop', '::1', 1564173406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343137333335373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('toblfra78emrd0dvoev1if1bk1912dnh', '::1', 1563438494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333433383437373b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('u21dn0kpruieebkov28guj99tiggnt4u', '::1', 1564112920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536343131323932303b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('ufvlvc2bf0gfgjs48s08ora2kgiicgvu', '::1', 1549834482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313534393833343438323b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d),
('vovl7qibpth41eqef3risjivbg0mk5b2', '::1', 1562723802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323732333738393b757365725f69647c613a323a7b733a323a226964223b733a313a2231223b733a343a226e616d65223b733a353a2241646d696e223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `mp_stock`
--

CREATE TABLE `mp_stock` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `manufacturing` date NOT NULL,
  `expiry` date NOT NULL,
  `qty` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `added` varchar(255) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `selling` decimal(11,3) NOT NULL,
  `pack_retail_price` decimal(11,3) NOT NULL,
  `pack_purchase_price` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_stock`
--

INSERT INTO `mp_stock` (`id`, `mid`, `purchase_id`, `manufacturing`, `expiry`, `qty`, `description`, `date`, `added`, `purchase`, `selling`, `pack_retail_price`, `pack_purchase_price`) VALUES
(2, 2, 1, '0000-00-00', '0000-00-00', 1, '', '2019-08-04', 'Admin', '20.000', '30.000', '50.000', '40.000');

-- --------------------------------------------------------

--
-- Table structure for table `mp_stores`
--

CREATE TABLE `mp_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_stores`
--

INSERT INTO `mp_stores` (`id`, `name`, `code`, `address`) VALUES
(1, 'Top Hills', '0001', '11th commercial Street DHA'),
(2, 'River Road', '0002', '11th commercial Street DHA');

-- --------------------------------------------------------

--
-- Table structure for table `mp_subpo_details`
--

CREATE TABLE `mp_subpo_details` (
  `id` int(11) NOT NULL,
  `estimate_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `tax` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sub_entry`
--

CREATE TABLE `mp_sub_entry` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `accounthead` int(11) NOT NULL,
  `amount` decimal(11,3) NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sub_expense`
--

CREATE TABLE `mp_sub_expense` (
  `id` int(11) NOT NULL,
  `expense_id` int(11) NOT NULL,
  `head_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sub_purchase`
--

CREATE TABLE `mp_sub_purchase` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `cost` decimal(11,3) NOT NULL,
  `retail` decimal(11,3) NOT NULL,
  `pack_cost` decimal(11,3) NOT NULL,
  `pack_retail` decimal(11,3) NOT NULL,
  `wholesale` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `manu_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `source` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_sub_receipt`
--

CREATE TABLE `mp_sub_receipt` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `tax` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_supply`
--

CREATE TABLE `mp_supply` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `region_id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `expense` decimal(11,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_barcoder_invoice`
--

CREATE TABLE `mp_temp_barcoder_invoice` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `product_no` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `mg` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `agentid` int(11) NOT NULL,
  `source` varchar(50) NOT NULL,
  `pack` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_barcoder_order`
--

CREATE TABLE `mp_temp_barcoder_order` (
  `id` int(11) NOT NULL,
  `add_date` date NOT NULL,
  `opening_stock` int(11) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `product_no` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `mg` varchar(255) NOT NULL,
  `price` decimal(11,3) NOT NULL,
  `purchase` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tax` double(11,2) NOT NULL,
  `agentid` int(11) NOT NULL,
  `source` varchar(50) NOT NULL,
  `pack` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `salesman_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_temp_purchase`
--

CREATE TABLE `mp_temp_purchase` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `cost` decimal(11,3) NOT NULL,
  `retail` decimal(11,3) NOT NULL,
  `pack_cost` decimal(11,3) NOT NULL,
  `pack_retail` decimal(11,3) NOT NULL,
  `wholesale` decimal(11,3) NOT NULL,
  `qty` int(11) NOT NULL,
  `manu_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `agentid` int(11) NOT NULL,
  `source` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mp_testamonials`
--

CREATE TABLE `mp_testamonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_testamonials`
--

INSERT INTO `mp_testamonials` (`id`, `name`, `cus_picture`, `description`, `status`) VALUES
(7, 'Jhon Doe', '45c77ac90681007e297f31e4f230a8e9.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud', 0),
(8, 'Jhon Doe', '88b56f087e5fef16df794b443ad441d0.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud', 0),
(9, 'Jhon Doe', '361285f2ed6fd9593a101be967aa8131.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Ut wisi enim ad minim veniam, quis nostrud', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_todolist`
--

CREATE TABLE `mp_todolist` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `addedby` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_todolist`
--

INSERT INTO `mp_todolist` (`id`, `title`, `date`, `addedby`, `status`) VALUES
(1, 'here goes description', '2019-02-07', 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_town`
--

CREATE TABLE `mp_town` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_town`
--

INSERT INTO `mp_town` (`id`, `name`, `region`) VALUES
(2, 'Gulshan', 'Down Town'),
(3, 'Malir', 'Down Town');

-- --------------------------------------------------------

--
-- Table structure for table `mp_units`
--

CREATE TABLE `mp_units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_units`
--

INSERT INTO `mp_units` (`id`, `name`, `symbol`) VALUES
(1, 'Kilogram', 'Kg'),
(2, 'Mililetre', 'Ml'),
(3, 'Liter', 'ltr'),
(4, 'Pieces', 'Pcs'),
(5, 'Carton', 'Crtn'),
(6, 'Grams', 'GM');

-- --------------------------------------------------------

--
-- Table structure for table `mp_users`
--

CREATE TABLE `mp_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_contact_1` varchar(50) NOT NULL,
  `user_contact_2` varchar(50) NOT NULL,
  `cus_picture` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `user_description` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_date` date NOT NULL,
  `agentname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_users`
--

INSERT INTO `mp_users` (`id`, `user_name`, `user_email`, `user_address`, `user_contact_1`, `user_contact_2`, `cus_picture`, `status`, `user_description`, `user_password`, `user_date`, `agentname`) VALUES
(1, 'Admin', 'medix@spantiklab.com', 'Gilgit Baltistan', '03112036611', '', '8dab55cd278bf6c8c0f86c004dfdce74.png', 0, 'admin', '8cb2237d0679ca88db6464eac60da96345513964', '2017-08-23', 'Admin'),
(4, 'naveed', 'naveed@gmail.com', '', '', '', 'default.jpg', 0, '', '8cb2237d0679ca88db6464eac60da96345513964', '2019-01-29', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `mp_vehicle`
--

CREATE TABLE `mp_vehicle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `vehicle_id` varchar(255) NOT NULL,
  `chase_no` varchar(255) NOT NULL,
  `engine_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mp_vehicle`
--

INSERT INTO `mp_vehicle` (`id`, `name`, `number`, `vehicle_id`, `chase_no`, `engine_no`, `date`, `status`) VALUES
(1, 'Suzuki', 'dsd', 'Ravi', 'sdas', 'sadasd', '2019-02-07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mp_words`
--

CREATE TABLE `mp_words` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `icon` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mp_banks`
--
ALTER TABLE `mp_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `bank_id` (`bank_id`);

--
-- Indexes for table `mp_bank_transaction_payee`
--
ALTER TABLE `mp_bank_transaction_payee`
  ADD PRIMARY KEY (`tran_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_barcode`
--
ALTER TABLE `mp_barcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_brand`
--
ALTER TABLE `mp_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `mp_brand_sector`
--
ALTER TABLE `mp_brand_sector`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_category`
--
ALTER TABLE `mp_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `mp_contactabout`
--
ALTER TABLE `mp_contactabout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_drivers`
--
ALTER TABLE `mp_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_estimate`
--
ALTER TABLE `mp_estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_estimate_sales`
--
ALTER TABLE `mp_estimate_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`estimate_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `mp_expense`
--
ALTER TABLE `mp_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_generalentry`
--
ALTER TABLE `mp_generalentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_head`
--
ALTER TABLE `mp_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `sales_man_id` (`sales_man_id`),
  ADD KEY `invoice_driver_fk` (`driver_id`),
  ADD KEY `invoice_region_fk` (`region_id`),
  ADD KEY `invoice_vehicle_fk` (`vehicle_id`);

--
-- Indexes for table `mp_langingpage`
--
ALTER TABLE `mp_langingpage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_menu`
--
ALTER TABLE `mp_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_menulist`
--
ALTER TABLE `mp_menulist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_Id` (`menu_Id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_orders`
--
ALTER TABLE `mp_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indexes for table `mp_order_list_total`
--
ALTER TABLE `mp_order_list_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_payee`
--
ALTER TABLE `mp_payee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_payment_voucher`
--
ALTER TABLE `mp_payment_voucher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_pharmacist`
--
ALTER TABLE `mp_pharmacist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_printer`
--
ALTER TABLE `mp_printer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_product`
--
ALTER TABLE `mp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `head_id` (`head_id`);

--
-- Indexes for table `mp_productslist`
--
ALTER TABLE `mp_productslist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `brand_sector_id` (`brand_sector_id`),
  ADD KEY `unit_type` (`unit_type`);

--
-- Indexes for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `mp_purchase_order`
--
ALTER TABLE `mp_purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_region`
--
ALTER TABLE `mp_region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_return`
--
ALTER TABLE `mp_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`return_id`),
  ADD KEY `medicine_id` (`product_id`);

--
-- Indexes for table `mp_sales`
--
ALTER TABLE `mp_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `mp_salesman`
--
ALTER TABLE `mp_salesman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_sales_orderlist`
--
ALTER TABLE `mp_sales_orderlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `mp_sales_receipt`
--
ALTER TABLE `mp_sales_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `payee_id` (`payee_id`);

--
-- Indexes for table `mp_services`
--
ALTER TABLE `mp_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_sessions`
--
ALTER TABLE `mp_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `mp_stock`
--
ALTER TABLE `mp_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `purchase_id` (`purchase_id`);

--
-- Indexes for table `mp_stores`
--
ALTER TABLE `mp_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_subpo_details`
--
ALTER TABLE `mp_subpo_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_id` (`estimate_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `mp_sub_entry`
--
ALTER TABLE `mp_sub_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`parent_id`),
  ADD KEY `accounthead` (`accounthead`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `mp_sub_expense`
--
ALTER TABLE `mp_sub_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_id` (`expense_id`),
  ADD KEY `head_id` (`head_id`);

--
-- Indexes for table `mp_sub_purchase`
--
ALTER TABLE `mp_sub_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `subpurchase_product_fk` (`mid`);

--
-- Indexes for table `mp_sub_receipt`
--
ALTER TABLE `mp_sub_receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id` (`sales_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `mp_supply`
--
ALTER TABLE `mp_supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`);

--
-- Indexes for table `mp_temp_barcoder_order`
--
ALTER TABLE `mp_temp_barcoder_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `agentid` (`agentid`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `salesman_id` (`salesman_id`);

--
-- Indexes for table `mp_temp_purchase`
--
ALTER TABLE `mp_temp_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_testamonials`
--
ALTER TABLE `mp_testamonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_todolist`
--
ALTER TABLE `mp_todolist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addedby` (`addedby`);

--
-- Indexes for table `mp_town`
--
ALTER TABLE `mp_town`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_units`
--
ALTER TABLE `mp_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `mp_users`
--
ALTER TABLE `mp_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `user_name_2` (`user_name`);

--
-- Indexes for table `mp_vehicle`
--
ALTER TABLE `mp_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mp_words`
--
ALTER TABLE `mp_words`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mp_banks`
--
ALTER TABLE `mp_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_bank_transaction_payee`
--
ALTER TABLE `mp_bank_transaction_payee`
  MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_barcode`
--
ALTER TABLE `mp_barcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_brand`
--
ALTER TABLE `mp_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mp_brand_sector`
--
ALTER TABLE `mp_brand_sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_category`
--
ALTER TABLE `mp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_contactabout`
--
ALTER TABLE `mp_contactabout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_drivers`
--
ALTER TABLE `mp_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_estimate`
--
ALTER TABLE `mp_estimate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_estimate_sales`
--
ALTER TABLE `mp_estimate_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_expense`
--
ALTER TABLE `mp_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_generalentry`
--
ALTER TABLE `mp_generalentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_head`
--
ALTER TABLE `mp_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_langingpage`
--
ALTER TABLE `mp_langingpage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_menu`
--
ALTER TABLE `mp_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `mp_menulist`
--
ALTER TABLE `mp_menulist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `mp_orders`
--
ALTER TABLE `mp_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_order_list_total`
--
ALTER TABLE `mp_order_list_total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_payee`
--
ALTER TABLE `mp_payee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mp_payment_voucher`
--
ALTER TABLE `mp_payment_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_pharmacist`
--
ALTER TABLE `mp_pharmacist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mp_printer`
--
ALTER TABLE `mp_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mp_product`
--
ALTER TABLE `mp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_productslist`
--
ALTER TABLE `mp_productslist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- AUTO_INCREMENT for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_purchase_order`
--
ALTER TABLE `mp_purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_region`
--
ALTER TABLE `mp_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mp_return`
--
ALTER TABLE `mp_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sales`
--
ALTER TABLE `mp_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_salesman`
--
ALTER TABLE `mp_salesman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sales_orderlist`
--
ALTER TABLE `mp_sales_orderlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sales_receipt`
--
ALTER TABLE `mp_sales_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_services`
--
ALTER TABLE `mp_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mp_stock`
--
ALTER TABLE `mp_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mp_stores`
--
ALTER TABLE `mp_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mp_subpo_details`
--
ALTER TABLE `mp_subpo_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sub_entry`
--
ALTER TABLE `mp_sub_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sub_expense`
--
ALTER TABLE `mp_sub_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sub_purchase`
--
ALTER TABLE `mp_sub_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_sub_receipt`
--
ALTER TABLE `mp_sub_receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_supply`
--
ALTER TABLE `mp_supply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_temp_barcoder_order`
--
ALTER TABLE `mp_temp_barcoder_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mp_temp_purchase`
--
ALTER TABLE `mp_temp_purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_testamonials`
--
ALTER TABLE `mp_testamonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mp_todolist`
--
ALTER TABLE `mp_todolist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_town`
--
ALTER TABLE `mp_town`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mp_units`
--
ALTER TABLE `mp_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mp_users`
--
ALTER TABLE `mp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mp_vehicle`
--
ALTER TABLE `mp_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mp_words`
--
ALTER TABLE `mp_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mp_bank_opening`
--
ALTER TABLE `mp_bank_opening`
  ADD CONSTRAINT `opening_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `mp_banks` (`id`);

--
-- Constraints for table `mp_bank_transaction`
--
ALTER TABLE `mp_bank_transaction`
  ADD CONSTRAINT `bankid_bank_fk` FOREIGN KEY (`bank_id`) REFERENCES `mp_banks` (`id`),
  ADD CONSTRAINT `transaction_general_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_bank_transaction_payee`
--
ALTER TABLE `mp_bank_transaction_payee`
  ADD CONSTRAINT `bank_general_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`),
  ADD CONSTRAINT `payee_bank_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_brand`
--
ALTER TABLE `mp_brand`
  ADD CONSTRAINT `brand_company_fk` FOREIGN KEY (`company_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_estimate`
--
ALTER TABLE `mp_estimate`
  ADD CONSTRAINT `estimate_payee_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_estimate_sales`
--
ALTER TABLE `mp_estimate_sales`
  ADD CONSTRAINT `estimate_parent_id` FOREIGN KEY (`estimate_id`) REFERENCES `mp_estimate` (`id`);

--
-- Constraints for table `mp_expense`
--
ALTER TABLE `mp_expense`
  ADD CONSTRAINT `general_expense_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`),
  ADD CONSTRAINT `payee_expense_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_invoices`
--
ALTER TABLE `mp_invoices`
  ADD CONSTRAINT `invoice_payee_fk` FOREIGN KEY (`cus_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `invoice_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_multipleroles`
--
ALTER TABLE `mp_multipleroles`
  ADD CONSTRAINT `roles_agentid_fk` FOREIGN KEY (`agentid`) REFERENCES `mp_users` (`id`),
  ADD CONSTRAINT `roles_menuid_fk` FOREIGN KEY (`menu_Id`) REFERENCES `mp_menu` (`id`),
  ADD CONSTRAINT `roles_user_fk` FOREIGN KEY (`user_id`) REFERENCES `mp_users` (`id`);

--
-- Constraints for table `mp_orders`
--
ALTER TABLE `mp_orders`
  ADD CONSTRAINT `mp_orders_payee_fk` FOREIGN KEY (`cus_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_payment_voucher`
--
ALTER TABLE `mp_payment_voucher`
  ADD CONSTRAINT `payment_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`),
  ADD CONSTRAINT `pv_payee_id` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_product`
--
ALTER TABLE `mp_product`
  ADD CONSTRAINT `product_head_fk` FOREIGN KEY (`head_id`) REFERENCES `mp_head` (`id`);

--
-- Constraints for table `mp_productslist`
--
ALTER TABLE `mp_productslist`
  ADD CONSTRAINT `product_brand_fk` FOREIGN KEY (`brand_id`) REFERENCES `mp_brand` (`id`),
  ADD CONSTRAINT `product_brand_section_fk` FOREIGN KEY (`brand_sector_id`) REFERENCES `mp_brand_sector` (`id`),
  ADD CONSTRAINT `product_unit_fk` FOREIGN KEY (`unit_type`) REFERENCES `mp_units` (`symbol`);

--
-- Constraints for table `mp_purchase`
--
ALTER TABLE `mp_purchase`
  ADD CONSTRAINT `purchase_payee_fk` FOREIGN KEY (`supplier_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `purchase_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_purchase_order`
--
ALTER TABLE `mp_purchase_order`
  ADD CONSTRAINT `po_payee_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`);

--
-- Constraints for table `mp_return`
--
ALTER TABLE `mp_return`
  ADD CONSTRAINT `return_customer_fk` FOREIGN KEY (`cus_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `return_transaction_general_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_return_list`
--
ALTER TABLE `mp_return_list`
  ADD CONSTRAINT `return_item_fk` FOREIGN KEY (`return_id`) REFERENCES `mp_return` (`id`),
  ADD CONSTRAINT `return_product_fk` FOREIGN KEY (`product_id`) REFERENCES `mp_productslist` (`id`);

--
-- Constraints for table `mp_sales`
--
ALTER TABLE `mp_sales`
  ADD CONSTRAINT `sales_invoice_fk` FOREIGN KEY (`order_id`) REFERENCES `mp_invoices` (`id`),
  ADD CONSTRAINT `sales_productlist_fk` FOREIGN KEY (`product_id`) REFERENCES `mp_productslist` (`id`);

--
-- Constraints for table `mp_sales_receipt`
--
ALTER TABLE `mp_sales_receipt`
  ADD CONSTRAINT `salesreceipt_payee_fk` FOREIGN KEY (`payee_id`) REFERENCES `mp_payee` (`id`),
  ADD CONSTRAINT `salesreceipt_transaction_fk` FOREIGN KEY (`transaction_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_stock`
--
ALTER TABLE `mp_stock`
  ADD CONSTRAINT `stock_product_fk` FOREIGN KEY (`mid`) REFERENCES `mp_productslist` (`id`);

--
-- Constraints for table `mp_subpo_details`
--
ALTER TABLE `mp_subpo_details`
  ADD CONSTRAINT `po_sub_fk` FOREIGN KEY (`estimate_id`) REFERENCES `mp_purchase_order` (`id`);

--
-- Constraints for table `mp_sub_entry`
--
ALTER TABLE `mp_sub_entry`
  ADD CONSTRAINT `sub_entry_fk` FOREIGN KEY (`parent_id`) REFERENCES `mp_generalentry` (`id`);

--
-- Constraints for table `mp_sub_expense`
--
ALTER TABLE `mp_sub_expense`
  ADD CONSTRAINT `subexpense_fk` FOREIGN KEY (`expense_id`) REFERENCES `mp_expense` (`id`),
  ADD CONSTRAINT `subexpense_head_fk` FOREIGN KEY (`head_id`) REFERENCES `mp_head` (`id`);

--
-- Constraints for table `mp_sub_purchase`
--
ALTER TABLE `mp_sub_purchase`
  ADD CONSTRAINT `sub_purchase_fk` FOREIGN KEY (`purchase_id`) REFERENCES `mp_purchase` (`id`),
  ADD CONSTRAINT `subpurchase_product_fk` FOREIGN KEY (`mid`) REFERENCES `mp_productslist` (`id`);

--
-- Constraints for table `mp_sub_receipt`
--
ALTER TABLE `mp_sub_receipt`
  ADD CONSTRAINT `sales_receipt_fk` FOREIGN KEY (`sales_id`) REFERENCES `mp_sales_receipt` (`id`),
  ADD CONSTRAINT `sub_productlist_fk` FOREIGN KEY (`product_id`) REFERENCES `mp_product` (`id`);

--
-- Constraints for table `mp_supply`
--
ALTER TABLE `mp_supply`
  ADD CONSTRAINT `supply_driver_fk` FOREIGN KEY (`driver_id`) REFERENCES `mp_drivers` (`id`),
  ADD CONSTRAINT `supply_region_fk` FOREIGN KEY (`region_id`) REFERENCES `mp_region` (`id`),
  ADD CONSTRAINT `supply_town_fk` FOREIGN KEY (`town_id`) REFERENCES `mp_town` (`id`),
  ADD CONSTRAINT `supply_vehicle_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `mp_vehicle` (`id`);

--
-- Constraints for table `mp_temp_barcoder_invoice`
--
ALTER TABLE `mp_temp_barcoder_invoice`
  ADD CONSTRAINT `temp_agentid_fk` FOREIGN KEY (`agentid`) REFERENCES `mp_users` (`id`),
  ADD CONSTRAINT `temp_product_fk` FOREIGN KEY (`product_id`) REFERENCES `mp_productslist` (`id`);

--
-- Constraints for table `mp_temp_barcoder_order`
--
ALTER TABLE `mp_temp_barcoder_order`
  ADD CONSTRAINT `order_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `mp_brand` (`id`);

--
-- Constraints for table `mp_todolist`
--
ALTER TABLE `mp_todolist`
  ADD CONSTRAINT `todo_agent_fk` FOREIGN KEY (`addedby`) REFERENCES `mp_users` (`user_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
