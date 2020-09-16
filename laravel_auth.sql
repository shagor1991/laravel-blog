-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2019 at 11:00 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Angular', 'angular', 'angular-2019-05-06-5ccfb39397d6f.png', '2019-05-06 03:09:56', '2019-05-06 03:09:56'),
(2, 'PHP', 'php', 'php-2019-05-06-5ccfb3ca05ca5.jpg', '2019-05-06 03:10:50', '2019-05-06 03:10:50'),
(3, 'Wordpress', 'wordpress', 'wordpress-2019-05-06-5ccfb3d391677.jpg', '2019-05-06 03:10:59', '2019-05-06 03:10:59'),
(4, 'Laravel', 'laravel', 'laravel-2019-05-06-5ccfb3e172fc4.jpg', '2019-05-06 03:11:13', '2019-05-06 03:11:13'),
(5, 'Javascript', 'javascript', 'javascript-2019-05-06-5ccfb44d16992.png', '2019-05-06 03:13:02', '2019-05-06 03:13:02'),
(6, 'Codeigniter', 'codeigniter', 'codeigniter-2019-05-06-5ccfb43971501.jpg', '2019-05-06 03:12:42', '2019-05-06 03:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2019-05-06 03:14:55', '2019-05-06 03:14:55'),
(2, 2, 3, '2019-05-06 05:10:04', '2019-05-06 05:10:04'),
(3, 3, 6, '2019-05-06 05:12:56', '2019-05-06 05:12:56'),
(4, 4, 5, '2019-05-06 05:15:17', '2019-05-06 05:15:17'),
(5, 5, 2, '2019-05-06 05:19:07', '2019-05-06 05:19:07'),
(6, 6, 1, '2019-05-06 05:21:13', '2019-05-06 05:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_14_160633_create_roles_table', 1),
(4, '2019_04_16_154836_create_tags_table', 1),
(5, '2019_04_17_092445_create_categories_table', 1),
(6, '2019_04_19_084307_create_posts_table', 1),
(7, '2019_04_19_084425_create_category_post_table', 1),
(8, '2019_04_19_084501_create_post_tag_table', 1),
(9, '2019_04_23_032753_create_subscribers_table', 1),
(10, '2019_05_12_042837_create_post_user_table', 2),
(11, '2019_05_15_090957_create_comments_table', 3),
(12, '2019_05_26_115115_create_orders_table', 3),
(13, '2019_05_26_120212_create_restaurants_table', 3),
(14, '2019_05_26_120917_create_order__products_table', 3),
(15, '2019_05_26_121244_create_restaurant__order__policies_table', 3),
(16, '2019_05_26_121320_create_user__profiles_table', 3),
(17, '2019_05_27_041044_create_policies_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `policy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `restaurant_id`, `policy_id`, `user_id`, `comment`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 100, 25, 1, 'Test Comment', 105.25, '2019-05-26 23:00:00', NULL),
(2, 101, 26, 2, 'Test Comment 2', 213.56, '2019-05-26 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order__products`
--

CREATE TABLE `order__products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `dish_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order__products`
--

INSERT INTO `order__products` (`id`, `order_id`, `dish_name`, `quantity`, `price`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tandoori Mixed Grill', 1, 10.95, 10.95, NULL, NULL),
(2, 1, 'Chicken Tikka', 1, 5.00, 5.00, NULL, NULL),
(3, 1, 'Shashlick King Prawn', 2, 12.00, 24.00, NULL, NULL),
(4, 1, 'Special Fried Rice', 1, 15.00, 15.00, NULL, NULL),
(5, 1, 'Peshwari Nan', 1, 9.00, 9.00, NULL, NULL),
(6, 2, 'Mixed Biryani', 1, 10.00, 10.00, NULL, NULL),
(7, 2, 'Prawn Biryani', 1, 10.00, 10.00, NULL, NULL),
(8, 2, 'Lamb Sikandari', 1, 10.95, 10.95, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(25, 'Delivery', NULL, NULL),
(26, 'Collection', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laravel: Web Server Configuration', 'laravel-web-server-configuration', 'web-server-configuration-laravel-2019-05-06-5ccfb4bf06932.jpg', '<h3>Pretty URLs</h3>\r\n<h4>Apache</h4>\r\n<p>Laravel includes a&nbsp;<code class=\" language-php\"><span class=\"token keyword\">public</span><span class=\"token operator\">/</span><span class=\"token punctuation\">.</span>htaccess</code>&nbsp;file that is used to provide URLs without the&nbsp;<code class=\" language-php\">index<span class=\"token punctuation\">.</span>php</code>front controller in the path. Before serving Laravel with Apache, be sure to enable the&nbsp;<code class=\" language-php\">mod_rewrite</code>&nbsp;module so the&nbsp;<code class=\" language-php\"><span class=\"token punctuation\">.</span>htaccess</code>&nbsp;file will be honored by the server.</p>\r\n<p>If the&nbsp;<code class=\" language-php\"><span class=\"token punctuation\">.</span>htaccess</code>&nbsp;file that ships with Laravel does not work with your Apache installation, try this alternative:</p>\r\n<pre class=\" language-php\"><code class=\" language-php\">Options <span class=\"token operator\">+</span>FollowSymLinks <span class=\"token operator\">-</span>Indexes\r\nRewriteEngine On\r\n\r\nRewriteCond <span class=\"token operator\">%</span><span class=\"token punctuation\">{</span><span class=\"token constant\">HTTP</span><span class=\"token punctuation\">:</span>Authorization<span class=\"token punctuation\">}</span> <span class=\"token punctuation\">.</span>\r\nRewriteRule <span class=\"token punctuation\">.</span><span class=\"token operator\">*</span> <span class=\"token operator\">-</span> <span class=\"token punctuation\">[</span>E<span class=\"token operator\">=</span><span class=\"token constant\">HTTP_AUTHORIZATION</span><span class=\"token punctuation\">:</span><span class=\"token operator\">%</span><span class=\"token punctuation\">{</span><span class=\"token constant\">HTTP</span><span class=\"token punctuation\">:</span>Authorization<span class=\"token punctuation\">}</span><span class=\"token punctuation\">]</span>\r\n\r\nRewriteCond <span class=\"token operator\">%</span><span class=\"token punctuation\">{</span><span class=\"token constant\">REQUEST_FILENAME</span><span class=\"token punctuation\">}</span> <span class=\"token operator\">!</span><span class=\"token operator\">-</span>d\r\nRewriteCond <span class=\"token operator\">%</span><span class=\"token punctuation\">{</span><span class=\"token constant\">REQUEST_FILENAME</span><span class=\"token punctuation\">}</span> <span class=\"token operator\">!</span><span class=\"token operator\">-</span>f\r\nRewriteRule <span class=\"token operator\">^</span> index<span class=\"token punctuation\">.</span>php <span class=\"token punctuation\">[</span>L<span class=\"token punctuation\">]</span></code></pre>', 0, 1, 1, '2019-05-06 03:14:55', '2019-05-06 05:16:02'),
(2, 1, 'Wordpress: The freedom to build. The freedom to change', 'wordpress-the-freedom-to-build-the-freedom-to-change', 'wordpress-the-freedom-to-build-the-freedom-to-change-2019-05-06-5ccfcfbbac876.jpg', '<section class=\"col-8\">\r\n<h1 class=\"entry-title\">Democratize Publishing</h1>\r\n<p>WordPress is software designed for everyone, emphasizing accessibility, performance, security, and ease of use. We believe great software should work with minimum set up, so you can focus on sharing your story, product, or services freely. The basic WordPress software is simple and predictable so you can easily get started. It also offers powerful features for growth and success.</p>\r\n<p>We believe in democratizing publishing and the&nbsp;<a href=\"https://opensource.org/osd-annotated\">freedoms that come with open source</a>. Supporting this idea is a large community of people collaborating on and contributing to this project. The WordPress community is welcoming and inclusive. Our contributors&rsquo; passion drives the success of WordPress which, in turn, helps you reach your goals.</p>\r\n<h2 id=\"story\">Our Story</h2>\r\n<p>WordPress started in 2003 when Mike Little and Matt Mullenweg created a&nbsp;<a href=\"https://www.whoishostingthis.com/resources/b2-cafelog/\">fork of b2/cafelog</a>. The need for an elegant, well-architected personal publishing system was clear even then. Today, WordPress is built on PHP and MySQL, and licensed under the GPLv2. It is also the platform of choice for over 33% of all sites across the web.</p>\r\n<p>The WordPress open source project has evolved in progressive ways over time &mdash; supported by skilled, enthusiastic developers, designers, scientists, bloggers, and more. WordPress provides the opportunity for anyone to create and share, from handcrafted personal anecdotes to world-changing movements. People with a limited tech experience can use it &ldquo;out of the box&rdquo;, and more tech-savvy folks can customize it in remarkable ways.</p>\r\n</section>\r\n<section class=\"col-8\">\r\n<h2 id=\"bill-of-rights\">Bill of Rights</h2>\r\n<p>WordPress is licensed under the&nbsp;<a href=\"https://wordpress.org/about/license/\">General Public License (GPLv2 or later)</a>which provides four core freedoms. Consider this the WordPress Bill of Rights:</p>\r\n</section>', 0, 1, 1, '2019-05-06 05:10:04', '2019-05-06 05:10:04'),
(3, 2, 'CodeIgniter: Model-View-Controller', 'codeigniter-model-view-controller', 'codeigniter-model-view-controller-2019-05-06-5ccfd06807de6.jpg', '<h1 style=\"box-sizing: border-box; margin-top: 0px; font-weight: bold; font-family: \'Roboto Slab\', ff-tisa-web-pro, Georgia, Arial, sans-serif; font-size: 28px; color: #404040; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #fcfcfc; text-decoration-style: initial; text-decoration-color: initial;\">Model-View-Controller</h1>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0px 0px 24px; font-size: 16px; color: #404040; font-family: Lato, proxima-nova, \'Helvetica Neue\', Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #fcfcfc; text-decoration-style: initial; text-decoration-color: initial;\">CodeIgniter is based on the Model-View-Controller development pattern. MVC is a software approach that separates application logic from presentation. In practice, it permits your web pages to contain minimal scripting since the presentation is separate from the PHP scripting.</p>\r\n<ul class=\"simple\" style=\"box-sizing: border-box; margin: 0px 0px 24px; padding: 0px; list-style: disc; line-height: 24px; color: #404040; font-family: Lato, proxima-nova, \'Helvetica Neue\', Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #fcfcfc; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; margin-left: 24px;\">The&nbsp;<strong style=\"box-sizing: border-box; font-weight: bold;\">Model</strong>&nbsp;represents your data structures. Typically your model classes will contain functions that help you retrieve, insert, and update information in your database.</li>\r\n<li style=\"box-sizing: border-box; list-style: disc; margin-left: 24px;\">The&nbsp;<strong style=\"box-sizing: border-box; font-weight: bold;\">View</strong>&nbsp;is the information that is being presented to a user. A View will normally be a web page, but in CodeIgniter, a view can also be a page fragment like a header or footer. It can also be an RSS page, or any other type of &ldquo;page&rdquo;.</li>\r\n<li style=\"box-sizing: border-box; list-style: disc; margin-left: 24px;\">The&nbsp;<strong style=\"box-sizing: border-box; font-weight: bold;\">Controller</strong>&nbsp;serves as an&nbsp;<em style=\"box-sizing: border-box;\">intermediary</em>&nbsp;between the Model, the View, and any other resources needed to process the HTTP request and generate a web page.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; line-height: 24px; margin: 0px 0px 24px; font-size: 16px; color: #404040; font-family: Lato, proxima-nova, \'Helvetica Neue\', Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #fcfcfc; text-decoration-style: initial; text-decoration-color: initial;\">CodeIgniter has a fairly loose approach to MVC since Models are not required. If you don&rsquo;t need the added separation, or find that maintaining models requires more complexity than you want, you can ignore them and build your application minimally using Controllers and Views. CodeIgniter also enables you to incorporate your own existing scripts, or even develop core libraries for the system, enabling you to work in a way that makes the most sense to you.</p>', 0, 1, 0, '2019-05-06 05:12:56', '2019-05-06 05:12:56'),
(4, 2, 'What is JavaScript, really?', 'what-is-javascript-really', 'what-is-javascript-really-2019-05-06-5ccfd0f456d1c.png', '<h2 id=\"What_is_JavaScript_really\" style=\"margin: 103px 0px 20px; padding: 0px; border: 0px; font-size: 2.33333rem; font-family: x-locale-heading-primary, zillaslab, Palatino, \'Palatino Linotype\', x-locale-heading-secondary, serif; line-height: 1.2; position: relative; color: #333333; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">What is JavaScript, really?<a class=\"local-anchor\" style=\"margin: 0px; padding: 0px; border: 0px; color: #3d7e9a; text-decoration: none;\" href=\"https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/JavaScript_basics#What_is_JavaScript_really\" data-heading-id=\"What_is_JavaScript_really\"><span style=\"margin: -1px; padding: 0px; border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; overflow: hidden; width: 1px; position: absolute !important;\">Section</span></a></h2>\r\n<p style=\"margin: 0px 0px 24px; padding: 0px; border: 0px; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\"><a class=\"glossaryLink\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-image: initial; color: inherit; text-decoration: none; cursor: help; border-color: initial initial #aaaaaa initial; border-style: initial initial dashed initial;\" title=\"JavaScript: JavaScript (JS) is a programming language mostly used to dynamically script webpages on the client side, but it is also often&nbsp;utilized on the server-side, using packages such as Node.js.\" href=\"https://developer.mozilla.org/en-US/docs/Glossary/JavaScript\">JavaScript</a>&nbsp;(\"JS\" for short) is a full-fledged&nbsp;<a class=\"glossaryLink\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-image: initial; color: inherit; text-decoration: none; cursor: help; border-color: initial initial #aaaaaa initial; border-style: initial initial dashed initial;\" title=\"dynamic programming language: A dynamic programming language&nbsp;is a programming language in which operations otherwise done at compile-time can be done at run-time. For example, in JavaScript it is possible to change the type of a variable or add new properties or methods to an object while the program is running.\" href=\"https://developer.mozilla.org/en-US/docs/Glossary/Dynamic_programming_language\">dynamic programming language</a>&nbsp;that, when&nbsp;applied to an&nbsp;<a class=\"glossaryLink\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-image: initial; color: inherit; text-decoration: none; cursor: help; border-color: initial initial #aaaaaa initial; border-style: initial initial dashed initial;\" title=\"HTML: HTML (HyperText Markup Language) is a descriptive language that specifies webpage structure.\" href=\"https://developer.mozilla.org/en-US/docs/Glossary/HTML\">HTML</a>&nbsp;document, can provide&nbsp;dynamic interactivity on websites. It was invented by Brendan Eich, co-founder of the Mozilla project, the Mozilla Foundation, and the Mozilla Corporation.</p>\r\n<p style=\"margin: 0px 0px 24px; padding: 0px; border: 0px; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">JavaScript is incredibly versatile. You can start small, with carousels, image galleries, fluctuating layouts, and responses to button clicks. With more experience, you\'ll be able to create games, animated 2D and 3D graphics, comprehensive database-driven apps, and much more!</p>\r\n<p style=\"margin: 0px 0px 24px; padding: 0px; border: 0px; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">JavaScript itself is fairly compact yet very flexible. Developers have written a large variety of tools on top of the core JavaScript language, unlocking a vast amount of extra functionality with minimum effort. These include:</p>\r\n<ul style=\"margin: 0px 0px 24px; padding: 0px 0px 0px 40px; border: 0px; list-style: disc; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<li style=\"margin: 0px 0px 6px; padding: 0px; border: 0px;\">Browser Application Programming Interfaces (<a class=\"glossaryLink\" style=\"margin: 0px; padding: 0px; border-width: 0px 0px 1px; border-image: initial; color: inherit; text-decoration: none; cursor: help; border-color: initial initial #aaaaaa initial; border-style: initial initial dashed initial;\" title=\"APIs: An API (Application Programming Interface) is a set of features and rules that exist inside a software program (the application) enabling interaction with it through software - as opposed to a human user interface. The API can be seen as a simple contract (the interface) between the application offering it and other items, such as third party software or hardware.\" href=\"https://developer.mozilla.org/en-US/docs/Glossary/API\">APIs</a>) &mdash; APIs built into web browsers, providing functionality&nbsp;like&nbsp;dynamically creating&nbsp;HTML and setting CSS styles, collecting and manipulating&nbsp;a video stream from the user\'s webcam, or generating&nbsp;3D graphics and audio samples.</li>\r\n<li style=\"margin: 0px 0px 6px; padding: 0px; border: 0px;\">Third-party APIs &mdash; Allow developers to incorporate functionality in their sites from other content providers, such as Twitter or Facebook.</li>\r\n<li style=\"margin: 0px 0px 6px; padding: 0px; border: 0px;\">Third-party frameworks and libraries&nbsp;&mdash;&nbsp;You can apply these to your HTML to allow you to rapidly build up sites and applications.</li>\r\n</ul>\r\n<p style=\"margin: 0px 0px 24px; padding: 0px; border: 0px; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">Because this article is only supposed to be a light introduction to JavaScript, we are not going to confuse you at this stage by talking in detail about what the difference is between the core JavaScript language and the different tools listed above. You can learn all that in detail later on, in our&nbsp;<a style=\"margin: 0px; padding: 0px; border: 0px; color: #3d7e9a; text-decoration: none;\" href=\"https://developer.mozilla.org/en-US/docs/Learn/JavaScript\">JavaScript learning area</a>, and in the rest of MDN.</p>\r\n<p style=\"margin: 0px 0px 24px; padding: 0px; border: 0px; box-sizing: border-box; max-width: 42rem; color: #333333; font-family: Arial, x-locale-body, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.04448px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">Below we will introduce you to some aspects of the core language, and you\'ll also play with a few browser API features too. Have fun!</p>', 0, 1, 0, '2019-05-06 05:15:17', '2019-05-06 05:15:17'),
(5, 2, 'What is PHP? Write your first PHP Program', 'what-is-php-write-your-first-php-program', 'what-is-php-write-your-first-php-program-2019-05-06-5ccfd1db2fe87.jpg', '<div class=\"page-header\" style=\"box-sizing: inherit; margin: 0.3125rem 0px; font-family: \'Source Sans Pro\', Arial, sans-serif; font-size: 1.5rem; font-weight: 300; color: #222222; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<h1 style=\"box-sizing: inherit; margin: 0px 0px 0.75rem; text-rendering: optimizelegibility; font-size: 1.95rem; font-family: \'Source Sans Pro\', Arial, sans-serif; font-weight: bold; line-height: 2.15rem; text-transform: none;\">&nbsp;</h1>\r\n</div>\r\n<div style=\"box-sizing: inherit; color: #222222; font-family: \'Source Sans Pro\', Arial, sans-serif; font-size: 18px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<h2 style=\"box-sizing: inherit; margin: 1.5rem 0px 0.75rem; text-rendering: optimizelegibility; font-size: 26.1px; font-family: \'Source Sans Pro\', Arial, sans-serif; font-weight: bold; line-height: 1.55em;\">What is PHP?</h2>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">PHP is a server side scripting language. that is used to develop Static websites or Dynamic websites or Web applications. PHP stands for Hypertext Pre-processor, that earlier stood for Personal Home Pages.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">PHP scripts can only be interpreted on a server that has PHP installed.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">The client computers accessing the PHP scripts require a web browser only.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">A PHP file contains PHP tags and ends with the extension \".php\".</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">In this tutorial, you will learn-</p>\r\n<ul style=\"box-sizing: inherit; margin-top: 1.5rem; margin-bottom: 1.5rem; margin-left: 1.5rem; padding: 0px;\">\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#2\">What is a Scripting Language?</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#1\">Scripting VS Programming Language</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#9\">What does PHP stand for?</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#10\">Php Syntax</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#3\">Why use PHP?</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#4\">What is PHP used for &amp; Market share</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#5\">PHP vs ASP.NET VS JSP VS CFML</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#6\">PHP File Extensions</a></li>\r\n<li style=\"box-sizing: inherit;\"><a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/what-is-php-first-php-program.html#7\">PHP Hello world</a></li>\r\n</ul>\r\n<h2 style=\"box-sizing: inherit; margin: 1.5rem 0px 0.75rem; text-rendering: optimizelegibility; font-size: 26.1px; font-family: \'Source Sans Pro\', Arial, sans-serif; font-weight: bold; line-height: 1.55em;\"><a id=\"2\" style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\"></a>What is a Scripting Language?</h2>\r\nA script is a set of programming instructions that is interpreted at runtime.\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">A scripting language is a language that interprets scripts at runtime. Scripts are usually embedded into other software environments.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">The purpose of the scripts is usually to enhance the performance or perform routine tasks for an application.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">Server side scripts are interpreted on the server while client side scripts are interpreted by the client application.</p>\r\n<p style=\"box-sizing: inherit; margin: 0px 0px 1.3rem;\">PHP is a server side script that is interpreted on the server while<a style=\"box-sizing: inherit; background: transparent; text-decoration: none; color: #04b8e6; transition: all 0.2s ease 0s;\" href=\"https://www.guru99.com/interactive-javascript-tutorials.html\">&nbsp;JavaScript&nbsp;</a>is an example of a client side script that is interpreted by the client browser. Both PHP and JavaScript can be embedded into HTML pages.</p>\r\n</div>', 1, 1, 0, '2019-05-06 05:19:07', '2019-05-15 03:59:57'),
(6, 1, 'Angular: Getting started', 'angular-getting-started', 'angular-getting-started-2019-05-06-5ccfd2587c8e0.png', '<ol class=\"courseUnits__i2VePgT0Kx4pYVFAZTP5G\">\r\n<li>\r\n<div class=\"flexContainer__1e-e4nnnsJpGj4xH0zZJ3e\">\r\n<div class=\"flexListItemContainer__17gUJPEXHm4PP8KmvJXDTU\">\r\n<div class=\"listItemIndex__3MnvammcWK7cyjevTg7tvM\" data-testid=\"unit-index\">\r\n<h1 id=\"getting-started\">Angular: Getting started</h1>\r\n<p>Welcome to Angular! Angular helps you build modern applications for the web, mobile, or desktop.</p>\r\n<p>This guide shows you how to build and run a simple Angular app. You\'ll use the&nbsp;<a title=\"CLI command reference\" href=\"https://angular.io/cli\">Angular CLI tool</a>&nbsp;to accelerate development, while adhering to the&nbsp;<a title=\"Angular style guide\" href=\"https://angular.io/guide/styleguide\">Style Guide</a>&nbsp;recommendations that benefit&nbsp;<em>every</em>&nbsp;Angular project.</p>\r\n<p>This guide takes less than 30 minutes to complete. At the end of this guide&mdash;as part of final code review&mdash;there is a link to download a copy of the final application code. (If you don\'t execute the commands in this guide, you can still download the final application code.)</p>\r\n<a id=\"devenv\"></a><a id=\"prerequisites\"></a>\r\n<h2 id=\"prerequisites\">Prerequisites</h2>\r\n<p>Before you begin, make sure your development environment includes&nbsp;<code>Node.js&reg;</code>&nbsp;and an npm package manager.</p>\r\n<a id=\"nodejs\"></a>\r\n<h3 id=\"nodejs\">Node.js</h3>\r\n<p>Angular requires&nbsp;<code>Node.js</code>&nbsp;version 8.x or 10.x.</p>\r\n<ul>\r\n<li>\r\n<p>To check your version, run&nbsp;<code>node -v</code>&nbsp;in a terminal/console window.</p>\r\n</li>\r\n<li>\r\n<p>To get&nbsp;<code>Node.js</code>, go to&nbsp;<a title=\"Nodejs.org\" href=\"https://nodejs.org/\">nodejs.org</a>.</p>\r\n</li>\r\n</ul>\r\n<a id=\"npm\"></a>\r\n<h3 id=\"npm-package-manager\">npm package manager</h3>\r\n<p>Angular, the Angular CLI, and Angular apps depend on features and functionality provided by libraries that are available as&nbsp;<a href=\"https://docs.npmjs.com/getting-started/what-is-npm\">npm packages</a>. To download and install npm packages, you must have an npm package manager.</p>\r\n<p>This Quick Start uses the&nbsp;<a href=\"https://docs.npmjs.com/cli/install\">npm client</a>&nbsp;command line interface, which is installed with&nbsp;<code>Node.js</code>&nbsp;by default.</p>\r\n<p>To check that you have the npm client installed, run&nbsp;<code>npm -v</code>&nbsp;in a terminal/console window.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</li>\r\n</ol>', 1, 1, 1, '2019-05-06 05:21:13', '2019-05-15 05:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-05-06 03:14:55', '2019-05-06 03:14:55'),
(2, 1, 3, '2019-05-06 03:14:55', '2019-05-06 03:14:55'),
(3, 2, 1, '2019-05-06 05:10:04', '2019-05-06 05:10:04'),
(4, 2, 3, '2019-05-06 05:10:04', '2019-05-06 05:10:04'),
(5, 2, 4, '2019-05-06 05:10:04', '2019-05-06 05:10:04'),
(6, 3, 1, '2019-05-06 05:12:56', '2019-05-06 05:12:56'),
(7, 3, 2, '2019-05-06 05:12:56', '2019-05-06 05:12:56'),
(8, 3, 5, '2019-05-06 05:12:56', '2019-05-06 05:12:56'),
(9, 4, 1, '2019-05-06 05:15:17', '2019-05-06 05:15:17'),
(10, 4, 3, '2019-05-06 05:15:17', '2019-05-06 05:15:17'),
(11, 5, 1, '2019-05-06 05:19:07', '2019-05-06 05:19:07'),
(12, 5, 3, '2019-05-06 05:19:07', '2019-05-06 05:19:07'),
(13, 6, 1, '2019-05-06 05:21:13', '2019-05-06 05:21:13'),
(14, 6, 3, '2019-05-06 05:21:13', '2019-05-06 05:21:13');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(8, 1, 1, '2019-05-13 02:09:50', '2019-05-13 02:09:50'),
(9, 5, 1, '2019-05-13 02:09:54', '2019-05-13 02:09:54'),
(11, 3, 2, '2019-05-13 05:43:38', '2019-05-13 05:43:38'),
(12, 1, 2, '2019-05-13 05:43:44', '2019-05-13 05:43:44'),
(13, 4, 1, '2019-05-15 03:27:09', '2019-05-15 03:27:09'),
(14, 2, 1, '2019-05-15 03:27:18', '2019-05-15 03:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `postcode`, `created_at`, `updated_at`) VALUES
(100, 'Bayleaf Takeaway Restaurant', 'KT6 5DB', '2019-05-27 01:03:03', NULL),
(101, 'Shad Indian Restaurant', 'SE1 2TH', '2019-05-27 02:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant__order__policies`
--

CREATE TABLE `restaurant__order__policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant__order__policies`
--

INSERT INTO `restaurant__order__policies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(25, 'Delivery', '2019-05-27 03:09:00', NULL),
(26, 'Collection', '2019-05-27 07:05:04', NULL),
(27, 'Delivery', NULL, NULL),
(28, 'Collection', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'author@gmail.com', '2019-05-08 08:02:25', '2019-05-08 08:02:25'),
(2, 'Sajjad@chefonline.co.uk', '2019-05-12 03:24:41', '2019-05-12 03:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'HTML', 'html', '2019-05-06 03:04:23', '2019-05-06 03:04:23'),
(2, 'HTML5', 'html5', '2019-05-06 03:04:30', '2019-05-06 03:04:30'),
(3, 'CSS', 'css', '2019-05-06 03:04:35', '2019-05-06 03:04:35'),
(4, 'CSS3', 'css3', '2019-05-06 03:04:40', '2019-05-06 03:04:40'),
(5, 'CSS3', 'css3', '2019-05-06 03:04:41', '2019-05-06 03:04:41'),
(6, 'Bootstrap', 'bootstrap', '2019-05-06 03:04:48', '2019-05-06 03:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `email_verified_at`, `password`, `about`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md. Admin', 'Admin', 'admin@gmail.com', NULL, '$2y$10$fOhyAJQwX4ZCfwuH5jh8weE8y8ihMNJY68sw42kRgVPDIREhQDVmO', 'Hi, I am Admin.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Quo illum quibusdam accusamus quas eaque rem nemo, quaerat tenetur officiis nulla ad fugit soluta in itaque natus dolor libero optio dolores! Dolor incidunt explicabo est nisi praesentium ut consequatur rerum. Dolore fugiat, molestias non eligendi vitae ipsum facilis ea corporis sapiente. Atque nesciunt quo, nostrum natus ipsum accusantium dolorum fugit similique dolore fugiat cum reiciendis repudiandae quisquam labore aliquam, corrupti velit.', 'md-admindd-2019-05-07-5cd11d7179ac8.jpg', NULL, NULL, '2019-05-13 03:13:21'),
(2, 2, 'Md. Author', 'author', 'author@gmail.com', NULL, '$2y$10$GRpdQe6PwRLsJnwi6.v2pOVIFnLVC.AJ8PGw3cbJo8HFkbSfRg9rO', 'Hi, I am Author.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Quo illum quibusdam accusamus quas eaque rem nemo, quaerat tenetur officiis nulla ad fugit soluta in itaque natus dolor libero optio dolores! Dolor incidunt explicabo est nisi praesentium ut consequatur rerum. Dolore fugiat, molestias non eligendi vitae ipsum facilis ea corporis sapiente. Atque nesciunt quo, nostrum natus ipsum accusantium dolorum fugit similique dolore fugiat cum reiciendis repudiandae quisquam labore aliquam, corrupti velit.', 'md-author-2019-05-12-5cd7900f71eaa.jpg', NULL, NULL, '2019-05-13 07:47:50'),
(3, 1, 'Md. Shagor Sarder', 'shagor', 'cadetshagor@gmail.com', NULL, '$2y$10$bhlPtO7Y.hZr1LKnexpdS.Xlt.3d8K5q/5qcsNO64ko4y0/TBlDs2', NULL, 'default.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user__profiles`
--

CREATE TABLE `user__profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user__profiles`
--

INSERT INTO `user__profiles` (`id`, `user_id`, `first_name`, `last_name`, `mobile`, `postcode`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md. Admin', 'Mollah', '01914564744', '1219', 'Dhaka, Bangladesh', NULL, NULL),
(2, 2, 'Md. Author', 'Mollah', '01714564744', '7800', 'Faridpur, Dhaka Division, Bangladesh', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order__products`
--
ALTER TABLE `order__products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant__order__policies`
--
ALTER TABLE `restaurant__order__policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user__profiles`
--
ALTER TABLE `user__profiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order__products`
--
ALTER TABLE `order__products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `restaurant__order__policies`
--
ALTER TABLE `restaurant__order__policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user__profiles`
--
ALTER TABLE `user__profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
