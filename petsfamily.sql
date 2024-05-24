-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2024 a las 03:57:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petsfamily`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Django', 1, 'Administración de Django', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'administradores'),
(6, 'bodeguero'),
(7, 'contador'),
(1, 'usuario'),
(2, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(64, 1, 32),
(65, 1, 36),
(66, 1, 40),
(67, 1, 44),
(68, 1, 48),
(69, 2, 29),
(70, 2, 30),
(71, 2, 31),
(72, 2, 32),
(73, 2, 33),
(74, 2, 34),
(75, 2, 35),
(76, 2, 36),
(77, 2, 37),
(78, 2, 38),
(79, 2, 39),
(80, 2, 40),
(81, 2, 41),
(82, 2, 42),
(83, 2, 43),
(84, 2, 44),
(85, 2, 45),
(86, 2, 46),
(87, 2, 47),
(88, 2, 48),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 3, 4),
(20, 3, 5),
(21, 3, 6),
(22, 3, 7),
(23, 3, 8),
(24, 3, 9),
(25, 3, 10),
(26, 3, 11),
(27, 3, 12),
(28, 3, 13),
(29, 3, 14),
(30, 3, 15),
(31, 3, 16),
(32, 3, 17),
(33, 3, 18),
(34, 3, 19),
(35, 3, 20),
(36, 3, 21),
(37, 3, 22),
(38, 3, 23),
(39, 3, 24),
(40, 3, 25),
(41, 3, 26),
(42, 3, 27),
(43, 3, 28),
(44, 3, 29),
(45, 3, 30),
(46, 3, 31),
(47, 3, 32),
(48, 3, 33),
(49, 3, 34),
(50, 3, 35),
(51, 3, 36),
(52, 3, 37),
(53, 3, 38),
(54, 3, 39),
(55, 3, 40),
(56, 3, 41),
(57, 3, 42),
(58, 3, 43),
(59, 3, 44),
(60, 3, 45),
(61, 3, 46),
(62, 3, 47),
(63, 3, 48),
(109, 6, 1),
(110, 6, 2),
(111, 6, 3),
(112, 6, 4),
(113, 6, 5),
(114, 6, 6),
(115, 6, 7),
(116, 6, 8),
(117, 6, 9),
(118, 6, 10),
(119, 6, 11),
(120, 6, 12),
(121, 6, 13),
(122, 6, 14),
(123, 6, 15),
(124, 6, 16),
(125, 6, 17),
(126, 6, 18),
(127, 6, 19),
(128, 6, 20),
(129, 6, 21),
(130, 6, 22),
(131, 6, 23),
(132, 6, 24),
(133, 6, 25),
(134, 6, 26),
(135, 6, 27),
(136, 6, 28),
(137, 6, 29),
(138, 6, 30),
(139, 6, 31),
(140, 6, 32),
(141, 6, 33),
(142, 6, 34),
(143, 6, 35),
(144, 6, 36),
(145, 6, 37),
(146, 6, 38),
(147, 6, 39),
(148, 6, 40),
(149, 6, 41),
(150, 6, 42),
(151, 6, 43),
(152, 6, 44),
(153, 6, 45),
(154, 6, 46),
(155, 6, 47),
(156, 6, 48),
(157, 7, 1),
(158, 7, 2),
(159, 7, 3),
(160, 7, 4),
(161, 7, 5),
(162, 7, 6),
(163, 7, 7),
(164, 7, 8),
(165, 7, 9),
(166, 7, 10),
(167, 7, 11),
(168, 7, 12),
(169, 7, 13),
(170, 7, 14),
(171, 7, 15),
(172, 7, 16),
(173, 7, 17),
(174, 7, 18),
(175, 7, 19),
(176, 7, 20),
(177, 7, 21),
(178, 7, 22),
(179, 7, 23),
(180, 7, 24),
(181, 7, 25),
(182, 7, 26),
(183, 7, 27),
(184, 7, 28),
(185, 7, 29),
(186, 7, 30),
(187, 7, 31),
(188, 7, 32),
(189, 7, 33),
(190, 7, 34),
(191, 7, 35),
(192, 7, 36),
(193, 7, 37),
(194, 7, 38),
(195, 7, 39),
(196, 7, 40),
(197, 7, 41),
(198, 7, 42),
(199, 7, 43),
(200, 7, 44),
(201, 7, 45),
(202, 7, 46),
(203, 7, 47),
(204, 7, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(25, 'Can add carro item', 7, 'add_carroitem'),
(26, 'Can change carro item', 7, 'change_carroitem'),
(27, 'Can delete carro item', 7, 'delete_carroitem'),
(28, 'Can view carro item', 7, 'view_carroitem'),
(29, 'Can add compra', 8, 'add_compra'),
(30, 'Can change compra', 8, 'change_compra'),
(31, 'Can delete compra', 8, 'delete_compra'),
(32, 'Can view compra', 8, 'view_compra'),
(33, 'Can add tipo producto', 9, 'add_tipoproducto'),
(34, 'Can change tipo producto', 9, 'change_tipoproducto'),
(35, 'Can delete tipo producto', 9, 'delete_tipoproducto'),
(36, 'Can view tipo producto', 9, 'view_tipoproducto'),
(37, 'Can add producto', 10, 'add_producto'),
(38, 'Can change producto', 10, 'change_producto'),
(39, 'Can delete producto', 10, 'delete_producto'),
(40, 'Can view producto', 10, 'view_producto'),
(41, 'Can add compra item', 11, 'add_compraitem'),
(42, 'Can change compra item', 11, 'change_compraitem'),
(43, 'Can delete compra item', 11, 'delete_compraitem'),
(44, 'Can view compra item', 11, 'view_compraitem'),
(45, 'Can add carro compras', 12, 'add_carrocompras'),
(46, 'Can change carro compras', 12, 'change_carrocompras'),
(47, 'Can delete carro compras', 12, 'delete_carrocompras'),
(48, 'Can view carro compras', 12, 'view_carrocompras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$sIHtAFt5U8LT$81am4FFhswhzwP0Xy4iAo080YHqc2TjBs/kCy+ibfEE=', '2024-05-13 23:02:25.115226', 1, 'admin', '', '', 'mat.quezadap@duocuc.cl', 1, 1, '2023-06-07 13:20:58.000000'),
(3, 'pbkdf2_sha256$216000$GdG2XYp9Z4gm$Q5LLN+j+1PSn8JdrDtbCyIwJhxZf+sUd3Km+oeFJJac=', '2023-07-11 02:38:58.025826', 0, 'cliente', '', '', '', 0, 1, '2023-06-16 14:12:08.000000'),
(4, 'pbkdf2_sha256$216000$Xmrm88fTM7WL$bP2JoMQ6XdlPco/2dAyd5BfG4EVdv1JHAhPkKjSfK74=', '2023-06-26 02:29:14.862506', 0, 'vendedor', '', '', '', 0, 1, '2023-06-16 14:13:46.000000'),
(5, 'pbkdf2_sha256$216000$iryMXhaq3wAJ$8jLv3nuu3e1DmGlF4xU2Dxtu2Yqe+htXIOIAx49SbeA=', '2023-06-26 02:29:47.707859', 0, 'administrador', '', '', '', 0, 1, '2023-06-16 14:14:57.000000'),
(6, 'pbkdf2_sha256$216000$7PkGGf0qYkul$x82T/nhVfLU90z7VeMG5J/V0eLutM6wYGfSjCEXYOHI=', NULL, 0, 'suscriptor', '', '', '', 0, 1, '2023-06-25 21:37:48.000000'),
(32, 'pbkdf2_sha256$216000$dZWuzPHyDC3M$TZtoSXyCIDCF3qZhdtXpF83xWA5Noa8MBz0AUQ17A8s=', NULL, 0, 'matias', '', '', 'matiasquezada01@gmail.com', 0, 1, '2024-05-13 21:30:06.208873'),
(33, 'pbkdf2_sha256$216000$TGq30fVCeb71$UY9ncbb4Plg2r2hyAsDQ4AfLSMghMR9c2t4CiLasWtw=', '2024-05-13 21:30:42.505979', 0, 'matias1', '', '', 'matiasquez01@gmail.com', 0, 1, '2024-05-13 21:30:29.201853'),
(34, 'pbkdf2_sha256$216000$6clNxbPJdvAq$gcsYTOsL3MJQ6RffkhVLlhPBHPonxR8x3WdE2wO/KCM=', '2024-05-13 22:32:37.839209', 0, 'javier', '', '', 'julio@gmail.cl', 0, 1, '2024-05-13 21:36:08.769154'),
(35, 'pbkdf2_sha256$216000$rRG6ZfjrB2RC$Eok8jot7sVi3BLIxvCIGa7swyC8ZtIzEalNiBnFcOSc=', '2024-05-13 23:14:50.258547', 0, 'mathias', '', '', 'matiasqueza1@gmail.com', 0, 1, '2024-05-13 23:14:29.574271'),
(36, 'pbkdf2_sha256$216000$yzGIWOmfs4o8$gQThyUhWqwDPUSgCx+uusnyjO+O5DNAOeiVWEzkK8PM=', '2024-05-22 23:34:26.170856', 0, 'maty', '', '', 'mati.dominguez@duocuc.cl', 0, 1, '2024-05-22 23:34:07.307279');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, 1),
(4, 4, 2),
(5, 5, 3),
(25, 32, 1),
(26, 33, 1),
(27, 34, 1),
(28, 35, 1),
(29, 36, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrocompras`
--

CREATE TABLE `core_carrocompras` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_carrocompras`
--

INSERT INTO `core_carrocompras` (`id`, `created_at`, `updated_at`, `compra_id`, `usuario_id`) VALUES
(2, '2023-06-16 14:20:46.143100', '2023-07-11 02:44:02.919109', NULL, 3),
(3, '2023-06-25 21:32:16.087932', '2023-06-25 21:32:16.098011', NULL, 4),
(5, '2024-05-13 21:39:52.449637', '2024-05-13 22:35:12.034467', NULL, 34),
(6, '2024-05-22 23:34:28.730494', '2024-05-24 01:53:26.468668', NULL, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrocompras_items`
--

CREATE TABLE `core_carrocompras_items` (
  `id` int(11) NOT NULL,
  `carrocompras_id` int(11) NOT NULL,
  `carroitem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_carrocompras_items`
--

INSERT INTO `core_carrocompras_items` (`id`, `carrocompras_id`, `carroitem_id`) VALUES
(113, 5, 40),
(133, 6, 47);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carroitem`
--

CREATE TABLE `core_carroitem` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id_api` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_carroitem`
--

INSERT INTO `core_carroitem` (`id`, `cantidad`, `created_at`, `updated_at`, `usuario_id`, `producto_id_api`) VALUES
(40, 1, '2024-05-13 22:23:05.248270', '2024-05-13 22:35:18.757855', 34, '0'),
(47, 1, '2024-05-24 01:53:18.124307', '2024-05-24 01:53:18.124307', 36, 'FER-82521');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_cliente`
--

CREATE TABLE `core_cliente` (
  `group_ptr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_compra`
--

CREATE TABLE `core_compra` (
  `id` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_compraitem`
--

CREATE TABLE `core_compraitem` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `carro_item_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_entrega`
--

CREATE TABLE `core_entrega` (
  `id` int(11) NOT NULL,
  `fecha_entrega` datetime(6) NOT NULL,
  `entregado_por_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `recibido_por_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_orden`
--

CREATE TABLE `core_orden` (
  `id` int(11) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `descripcion` longtext NOT NULL,
  `bodeguero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_ordenb`
--

CREATE TABLE `core_ordenb` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_pago`
--

CREATE TABLE `core_pago` (
  `id` int(11) NOT NULL,
  `fecha_pago` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_pedido`
--

CREATE TABLE `core_pedido` (
  `id` int(11) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--

CREATE TABLE `core_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL CHECK (`stock` >= 0),
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `nombre`, `precio`, `stock`, `descripcion`, `imagen`, `created_at`, `updated_at`, `tipo_id`) VALUES
(8, 'Alimento para perro', 21990, 19931, 'Alimento para perro adulto', 'alimento_mascota_g2NaRtZ.jpg', '2023-07-04 01:32:43.276524', '2024-05-13 22:35:28.757778', 1),
(9, 'abrigo para perro', 4990, 985, 'chaleco para perro celeste', 'abrigo_perro_YyGs0RC.jpg', '2023-07-11 02:29:21.082864', '2023-07-11 19:44:51.304464', 2),
(10, 'Bandana', 2990, 984, 'Bandana para perro de color negro', 'bandanasola_T33S41M.jpg', '2023-07-11 02:29:50.914668', '2024-05-13 20:26:42.280861', 2),
(11, 'correa para perro', 2990, 986, 'correa para perro celeste', 'Correaaaa_6rhILjn_uml8XBQ_cqirwX8.jpg', '2023-07-11 02:32:41.910777', '2023-07-11 20:18:16.515703', 2),
(12, 'identificador para perro', 2990, 1981, 'identificador para perro', 'Identificador_morado_xDZdKkP_RZuZUTF_dK2tYkI.webp', '2023-07-11 19:29:02.359958', '2023-07-11 20:06:32.001881', 2),
(13, 'juguete para perro', 1990, 867, 'juguete para perro', 'pelotascolores_5THCb5j.png', '2023-07-11 19:29:34.504645', '2023-07-11 20:18:22.683145', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_subscrito`
--

CREATE TABLE `core_subscrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--

CREATE TABLE `core_tipoproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `descripcion`) VALUES
(1, 'Alimento'),
(2, 'Accesorio'),
(3, 'juguete');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_vendedor`
--

CREATE TABLE `core_vendedor` (
  `group_ptr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-25 21:30:31.764769', '1', 'Alimento para perro', 1, '[{\"added\": {}}]', 11, 1),
(2, '2023-06-25 21:31:01.018925', '2', 'Alimento para perro', 1, '[{\"added\": {}}]', 11, 1),
(3, '2023-06-25 21:31:43.404469', '3', 'chaleco para perro', 1, '[{\"added\": {}}]', 11, 1),
(4, '2023-06-25 21:36:10.599945', '4', 'suscritos', 1, '[{\"added\": {}}]', 4, 1),
(5, '2023-06-25 21:36:29.987857', '4', 'suscritos', 3, '', 4, 1),
(6, '2023-06-25 21:37:48.593033', '6', 'suscriptor', 1, '[{\"added\": {}}]', 5, 1),
(7, '2023-06-25 21:38:27.532042', '3', 'juguete', 1, '[{\"added\": {}}]', 10, 1),
(8, '2023-06-26 02:26:45.175943', '3', 'administradores', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 4, 1),
(9, '2023-06-26 02:27:41.482700', '1', 'cliente', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 4, 1),
(10, '2023-06-26 02:28:02.727289', '2', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 4, 1),
(11, '2023-06-26 02:28:37.232398', '5', 'administrador', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(12, '2023-06-26 02:28:50.664191', '3', 'cliente', 2, '[]', 5, 1),
(13, '2023-06-26 02:28:56.083306', '4', 'vendedor', 2, '[]', 5, 1),
(14, '2023-07-06 00:01:39.875097', '8', 'julio', 3, '', 5, 1),
(15, '2023-07-09 18:37:05.222693', '5', 'subscritos', 1, '[{\"added\": {}}]', 4, 1),
(16, '2023-07-09 18:37:24.395385', '6', 'suscriptor', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 5, 1),
(17, '2023-07-09 19:55:44.334758', '5', 'subscritos', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 4, 1),
(18, '2023-07-10 22:56:29.637811', '10', 'javier1', 3, '', 5, 1),
(19, '2023-07-10 22:56:34.327092', '9', 'javier', 3, '', 5, 1),
(20, '2023-07-10 23:24:02.081438', '12', 'pavel', 3, '', 5, 1),
(21, '2023-07-10 23:24:08.041056', '11', 'javier', 3, '', 5, 1),
(22, '2023-07-10 23:24:12.109928', '7', 'benjamin', 3, '', 5, 1),
(23, '2023-07-10 23:29:05.411584', '14', 'javier1', 3, '', 5, 1),
(24, '2023-07-10 23:29:13.710675', '13', 'javier', 3, '', 5, 1),
(25, '2023-07-10 23:58:51.733190', '1', 'usuario', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1),
(26, '2023-07-11 02:00:10.125317', '15', 'javier1', 2, '[]', 5, 1),
(27, '2023-07-11 02:28:38.696078', '8', 'Alimento para perro', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 11, 1),
(28, '2023-07-11 02:28:57.711871', '8', 'Alimento para perro', 2, '[{\"changed\": {\"fields\": [\"Imagen\"]}}]', 11, 1),
(29, '2023-07-11 02:29:21.083860', '9', 'abrigo para perro', 1, '[{\"added\": {}}]', 11, 1),
(30, '2023-07-11 02:29:50.915665', '10', 'Bandana', 1, '[{\"added\": {}}]', 11, 1),
(31, '2023-07-11 02:53:27.962840', '1', 'usuario', 2, '[]', 4, 1),
(32, '2023-07-11 02:58:37.166726', '17', 'agustin', 3, '', 5, 1),
(33, '2023-07-11 02:58:47.338913', '18', 'olaaa', 3, '', 5, 1),
(34, '2023-07-11 02:58:51.738249', '15', 'javier1', 3, '', 5, 1),
(35, '2023-07-11 02:58:56.676214', '16', 'sebastian', 3, '', 5, 1),
(36, '2023-07-11 03:11:36.584941', '19', 'javier', 3, '', 5, 1),
(37, '2023-07-11 03:12:24.176178', '20', 'javier', 2, '[]', 5, 1),
(38, '2023-07-11 19:04:41.341366', '22', 'antonia', 3, '', 5, 1),
(39, '2023-07-11 19:06:37.704528', '23', 'antonia', 3, '', 5, 1),
(40, '2023-07-11 19:06:44.592757', '21', 'agustin', 3, '', 5, 1),
(41, '2023-07-11 19:12:52.486103', '24', 'agustin', 3, '', 5, 1),
(42, '2023-07-11 19:16:06.184765', '20', 'javier', 3, '', 5, 1),
(43, '2023-07-11 19:16:10.252208', '25', 'antonia', 3, '', 5, 1),
(44, '2023-07-11 19:17:59.776829', '26', 'javier', 3, '', 5, 1),
(45, '2023-07-11 19:38:35.426142', '1', 'usuario', 2, '[]', 4, 1),
(46, '2024-05-13 20:48:42.829254', '27', 'julio', 3, '', 5, 1),
(47, '2024-05-13 20:48:47.509065', '2', 'matias', 3, '', 5, 1),
(48, '2024-05-13 21:28:34.327868', '30', 'benjamin', 3, '', 5, 1),
(49, '2024-05-13 21:28:37.859209', '29', 'mathias', 3, '', 5, 1),
(50, '2024-05-13 21:28:43.203388', '28', 'olaa', 3, '', 5, 1),
(51, '2024-05-13 21:28:46.233855', '31', 'olaq', 3, '', 5, 1),
(52, '2024-05-13 22:41:57.760591', '5', 'subscritos', 3, '', 4, 1),
(53, '2024-05-13 22:42:12.676661', '6', 'Bodeguero', 1, '[{\"added\": {}}]', 4, 1),
(54, '2024-05-13 22:42:27.364444', '7', 'contador', 1, '[{\"added\": {}}]', 4, 1),
(55, '2024-05-13 22:42:33.084124', '6', 'bodeguero', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(6, 'contenttypes', 'contenttype'),
(13, 'core', 'carrocompras'),
(8, 'core', 'carroitem'),
(9, 'core', 'compra'),
(12, 'core', 'compraitem'),
(11, 'core', 'producto'),
(10, 'core', 'tipoproducto'),
(7, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-25 21:20:59.012157'),
(2, 'auth', '0001_initial', '2023-06-25 21:20:59.113885'),
(3, 'admin', '0001_initial', '2023-06-25 21:20:59.586621'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-25 21:20:59.679881'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-25 21:20:59.701822'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-06-25 21:20:59.777620'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-06-25 21:20:59.913763'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-06-25 21:20:59.934707'),
(9, 'auth', '0004_alter_user_username_opts', '2023-06-25 21:20:59.944680'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-06-25 21:21:00.009018'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-06-25 21:21:00.013007'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-25 21:21:00.020986'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-06-25 21:21:00.070852'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-25 21:21:00.091796'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-06-25 21:21:00.124708'),
(16, 'auth', '0011_update_proxy_permissions', '2023-06-25 21:21:00.140666'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-25 21:21:00.169589'),
(18, 'core', '0001_initial', '2023-06-25 21:21:00.565549'),
(19, 'core', '0002_subscrito', '2023-07-09 19:40:42.019716'),
(20, 'core', '0002_detallepedido_pedido', '2023-07-11 02:57:50.363542'),
(21, 'core', '0003_cliente_vendedor', '2023-07-11 03:09:20.393735'),
(22, 'core', '0004_auto_20230710_2313', '2023-07-11 03:13:19.529150'),
(23, 'core', '0005_pedido', '2023-07-11 18:26:02.191752'),
(24, 'core', '0006_delete_pedido', '2023-07-11 18:44:33.932678'),
(25, 'core', '0002_entrega_pago_pedido', '2024-05-23 00:54:17.883246'),
(26, 'core', '0003_orden', '2024-05-23 00:54:18.035560'),
(27, 'core', '0004_orden_remitente', '2024-05-23 00:54:18.076323'),
(28, 'core', '0005_remove_orden_remitente', '2024-05-23 00:54:18.087917'),
(29, 'core', '0006_ordenb', '2024-05-23 00:54:18.107192'),
(30, 'core', '0007_auto_20240518_2125', '2024-05-23 00:54:18.213604'),
(31, 'core', '0008_auto_20240522_2054', '2024-05-23 00:54:18.273408'),
(32, 'core', '0009_auto_20240523_2034', '2024-05-24 00:34:59.873167'),
(33, 'core', '0010_auto_20240523_2054', '2024-05-24 00:54:12.257251');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('zoh1vp2151l9i6p1de2tp2u86j5y99gf', '.eJxVjMEOwiAQRP-FsyGlCwt49O43ENhFqRpISnsy_rtt0oPeJvPezFuEuC4lrD3PYWJxFkqcfrsU6ZnrDvgR671JanWZpyR3RR60y2vj_Loc7t9Bib1sa4tsIXmMSRENqJWGNGhww-jZZUKlsmIATaM3uEVnbHY3SBGADJIVny_HRTc_:1qAAKs:OgqvqZM0SQE5j32XYZZmf2towt4k5_AYpXbcgq3QRdg', '2023-06-30 14:21:58.113875'),
('ev3kqqdpqlg4xtbq038c3geppddjdl6i', '.eJxVjDsOwjAQBe_iGlny7mJjSnrOYPmziwPIluKkQtwdIqWA9s3Me6kQ16WGdfAcpqLOCtThd0sxP7htoNxju3Wde1vmKelN0Tsd-toLPy-7-3dQ46jfmjhDtpKsL5ijtxZPBA5QMJExIHKE4lgcWeLCaJKDxOjFcWYRiur9Aey_OKU:1qDXT9:-a9gWXjPE6XgOrVvQsPNPUof3ByRzA9kzabTYv0YCTY', '2023-07-09 21:40:27.482689'),
('7d5he9g02e1r1oo6h4r4mptucha42v0l', '.eJxVjDsOwjAQBe_iGlny7mJjSnrOYPmziwPIluKkQtwdIqWA9s3Me6kQ16WGdfAcpqLOCtThd0sxP7htoNxju3Wde1vmKelN0Tsd-toLPy-7-3dQ46jfmjhDtpKsL5ijtxZPBA5QMJExIHKE4lgcWeLCaJKDxOjFcWYRiur9Aey_OKU:1qDXt1:p9JzYZgCOnwTENAGiPAAuHOaf9fCWFJouguE03yD0Dk', '2023-07-09 22:07:11.647063'),
('zoh1vp2151l9i6p1de2tp2u86j5y99gf', '.eJxVjMEOwiAQRP-FsyGlCwt49O43ENhFqRpISnsy_rtt0oPeJvPezFuEuC4lrD3PYWJxFkqcfrsU6ZnrDvgR671JanWZpyR3RR60y2vj_Loc7t9Bib1sa4tsIXmMSRENqJWGNGhww-jZZUKlsmIATaM3uEVnbHY3SBGADJIVny_HRTc_:1qAAKs:OgqvqZM0SQE5j32XYZZmf2towt4k5_AYpXbcgq3QRdg', '2023-06-30 14:21:58.113875'),
('zoh1vp2151l9i6p1de2tp2u86j5y99gf', '.eJxVjMEOwiAQRP-FsyGlCwt49O43ENhFqRpISnsy_rtt0oPeJvPezFuEuC4lrD3PYWJxFkqcfrsU6ZnrDvgR671JanWZpyR3RR60y2vj_Loc7t9Bib1sa4tsIXmMSRENqJWGNGhww-jZZUKlsmIATaM3uEVnbHY3SBGADJIVny_HRTc_:1qAAKs:OgqvqZM0SQE5j32XYZZmf2towt4k5_AYpXbcgq3QRdg', '2023-06-30 14:21:58.113875'),
('9ab3sib13qlpq669pe6slda8e4khwwzu', '.eJxVjDsOwjAQBe_iGlny7mJjSnrOYPmziwPIluKkQtwdIqWA9s3Me6kQ16WGdfAcpqLOCtThd0sxP7htoNxju3Wde1vmKelN0Tsd-toLPy-7-3dQ46jfmjhDtpKsL5ijtxZPBA5QMJExIHKE4lgcWeLCaJKDxOjFcWYRiur9Aey_OKU:1qJJG2:Boi2mnmgePvSWoZDuzH1iXBwzq0f0KaRIXpHchZwUCQ', '2023-07-25 19:42:46.135244'),
('017zwdmwgscysjqa139bu4d64gxgy994', '.eJxVjDsOwjAQBe_iGlny7mJjSnrOYPmziwPIluKkQtwdIqWA9s3Me6kQ16WGdfAcpqLOCtThd0sxP7htoNxju3Wde1vmKelN0Tsd-toLPy-7-3dQ46jfmjhDtpKsL5ijtxZPBA5QMJExIHKE4lgcWeLCaJKDxOjFcWYRiur9Aey_OKU:1qJK5W:_4umBukJjsQzvH1D7usMmtZsLw3EdGYUKQf82_yAA7c', '2023-07-25 20:35:58.091963'),
('85u15iupgbn7lq0c31763tg36paj72rl', '.eJxVjMsOwiAQRf-FtSFDeQgu3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mL0FacfseE-cFtJ3THdptlntu6TEnuijxol-NM_Lwe7t9BxV6_NfiBUj6TA53JsFbGGWRAw8pmtKo4UBYDaGDyJmjtYCjoC2UmDobE-wMHjzhT:1s6esc:4Wouj2lKvsoPlAb9sgbWxGFRdsmOfYm8PHE0XQE6lkQ', '2024-05-27 23:14:50.261539'),
('263gkp8tn56w8png03e25y4m2dzzzzaz', '.eJxVjMEOwiAQRP-FsyEQylI8evcbyHZ3kaqhSWlPjf9um_Sgx5n3ZjaVcF1KWpvMaWR1VQ7U5bcckF5SD8JPrI9J01SXeRz0oeiTNn2fWN630_07KNjKvkZvvedM2YAVAeociemAgzPkAHoyFvoQc2TJQCGyjxYsOgN5zy6qzxcNcjfy:1s9vTW:jRzkQuK5nNrXoDYFyFuNNPFGDGeS1EZl8Bx7lkrGfGs', '2024-06-05 23:34:26.171865');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `core_carrocompras`
--
ALTER TABLE `core_carrocompras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD KEY `core_carrocompras_compra_id_4247f6eb_fk_core_compra_id` (`compra_id`);

--
-- Indices de la tabla `core_carrocompras_items`
--
ALTER TABLE `core_carrocompras_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_carrocompras_items_carrocompras_id_carroite_e87d53f2_uniq` (`carrocompras_id`,`carroitem_id`),
  ADD KEY `core_carrocompras_it_carroitem_id_b2949f98_fk_core_carr` (`carroitem_id`);

--
-- Indices de la tabla `core_carroitem`
--
ALTER TABLE `core_carroitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_carroitem_usuario_id_751c9b5d_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD PRIMARY KEY (`group_ptr_id`);

--
-- Indices de la tabla `core_compra`
--
ALTER TABLE `core_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_compra_usuario_id_ddc04a7f_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_compraitem`
--
ALTER TABLE `core_compraitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_compraitem_carro_item_id_e0dac575_fk_core_carroitem_id` (`carro_item_id`),
  ADD KEY `core_compraitem_compra_id_332505f6_fk_core_compra_id` (`compra_id`);

--
-- Indices de la tabla `core_entrega`
--
ALTER TABLE `core_entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_entrega_entregado_por_id_94b1267c_fk_auth_user_id` (`entregado_por_id`),
  ADD KEY `core_entrega_pedido_id_31283388_fk_core_pedido_id` (`pedido_id`),
  ADD KEY `core_entrega_recibido_por_id_0f3ab077_fk_auth_user_id` (`recibido_por_id`);

--
-- Indices de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_orden_bodeguero_id_333f71d5_fk_auth_user_id` (`bodeguero_id`);

--
-- Indices de la tabla `core_ordenb`
--
ALTER TABLE `core_ordenb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_ordenb_vendedor_id_3b527c73_fk_auth_user_id` (`vendedor_id`);

--
-- Indices de la tabla `core_pago`
--
ALTER TABLE `core_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pago_pedido_id_24c64bf7_fk_core_pedido_id` (`pedido_id`),
  ADD KEY `core_pago_usuario_id_bec73968_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pedido_usuario_id_2aebb526_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

--
-- Indices de la tabla `core_subscrito`
--
ALTER TABLE `core_subscrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_subscrito_usuario_id_6717ec4e_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_vendedor`
--
ALTER TABLE `core_vendedor`
  ADD PRIMARY KEY (`group_ptr_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_carrocompras`
--
ALTER TABLE `core_carrocompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `core_carrocompras_items`
--
ALTER TABLE `core_carrocompras_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT de la tabla `core_carroitem`
--
ALTER TABLE `core_carroitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `core_compra`
--
ALTER TABLE `core_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_compraitem`
--
ALTER TABLE `core_compraitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_entrega`
--
ALTER TABLE `core_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_ordenb`
--
ALTER TABLE `core_ordenb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_pago`
--
ALTER TABLE `core_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `core_subscrito`
--
ALTER TABLE `core_subscrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_carrocompras`
--
ALTER TABLE `core_carrocompras`
  ADD CONSTRAINT `core_carrocompras_compra_id_4247f6eb_fk_core_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `core_compra` (`id`),
  ADD CONSTRAINT `core_carrocompras_usuario_id_1ac6a68f_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_carrocompras_items`
--
ALTER TABLE `core_carrocompras_items`
  ADD CONSTRAINT `core_carrocompras_it_carrocompras_id_532a17c5_fk_core_carr` FOREIGN KEY (`carrocompras_id`) REFERENCES `core_carrocompras` (`id`),
  ADD CONSTRAINT `core_carrocompras_it_carroitem_id_b2949f98_fk_core_carr` FOREIGN KEY (`carroitem_id`) REFERENCES `core_carroitem` (`id`);

--
-- Filtros para la tabla `core_carroitem`
--
ALTER TABLE `core_carroitem`
  ADD CONSTRAINT `core_carroitem_usuario_id_751c9b5d_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_cliente`
--
ALTER TABLE `core_cliente`
  ADD CONSTRAINT `core_cliente_group_ptr_id_3371a13e_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `core_compra`
--
ALTER TABLE `core_compra`
  ADD CONSTRAINT `core_compra_usuario_id_ddc04a7f_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_compraitem`
--
ALTER TABLE `core_compraitem`
  ADD CONSTRAINT `core_compraitem_carro_item_id_e0dac575_fk_core_carroitem_id` FOREIGN KEY (`carro_item_id`) REFERENCES `core_carroitem` (`id`),
  ADD CONSTRAINT `core_compraitem_compra_id_332505f6_fk_core_compra_id` FOREIGN KEY (`compra_id`) REFERENCES `core_compra` (`id`);

--
-- Filtros para la tabla `core_entrega`
--
ALTER TABLE `core_entrega`
  ADD CONSTRAINT `core_entrega_entregado_por_id_94b1267c_fk_auth_user_id` FOREIGN KEY (`entregado_por_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `core_entrega_pedido_id_31283388_fk_core_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `core_pedido` (`id`),
  ADD CONSTRAINT `core_entrega_recibido_por_id_0f3ab077_fk_auth_user_id` FOREIGN KEY (`recibido_por_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD CONSTRAINT `core_orden_bodeguero_id_333f71d5_fk_auth_user_id` FOREIGN KEY (`bodeguero_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_ordenb`
--
ALTER TABLE `core_ordenb`
  ADD CONSTRAINT `core_ordenb_vendedor_id_3b527c73_fk_auth_user_id` FOREIGN KEY (`vendedor_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_pago`
--
ALTER TABLE `core_pago`
  ADD CONSTRAINT `core_pago_pedido_id_24c64bf7_fk_core_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `core_pedido` (`id`),
  ADD CONSTRAINT `core_pago_usuario_id_bec73968_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  ADD CONSTRAINT `core_pedido_usuario_id_2aebb526_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

--
-- Filtros para la tabla `core_subscrito`
--
ALTER TABLE `core_subscrito`
  ADD CONSTRAINT `core_subscrito_usuario_id_6717ec4e_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_vendedor`
--
ALTER TABLE `core_vendedor`
  ADD CONSTRAINT `core_vendedor_group_ptr_id_9a905a76_fk_auth_group_id` FOREIGN KEY (`group_ptr_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
