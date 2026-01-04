-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2026 at 07:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `purpose_reels_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('purposereels-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:3;', 1767418034),
('purposereels-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1767418034;', 1767418034);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 1000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent`, `ordering`, `created_at`, `updated_at`) VALUES
(3, 'PR-Phase-01', 'pr-phase-01', 1, 2, '2025-12-02 16:45:25', '2025-12-09 03:30:50'),
(7, 'LP-Season-01', 'lp-season-01', 3, 1000, '2025-12-03 03:04:41', '2025-12-12 07:20:29'),
(13, 'Makala', 'makala', 0, 1000, '2025-12-12 09:01:07', '2025-12-12 09:02:08');

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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'fa4efa8b-db62-477c-be99-19f1d22418b2', 'database', 'default', '{\"uuid\":\"fa4efa8b-db62-477c-be99-19f1d22418b2\",\"displayName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"command\":\"O:26:\\\"App\\\\Jobs\\\\SendNewsletterJob\\\":2:{s:16:\\\"subscriber_email\\\";s:22:\\\"amedeusedgar@gmail.com\\\";s:11:\\\"currentPost\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Post\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1767428064,\"delay\":null}', 'Error: Undefined constant \"post_url\" in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(123): require()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::{closure:Illuminate\\Filesystem\\Filesystem::getRequire():120}()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#43 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#44 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"post_url\" (View: /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/resources/views/email-templates/newsletter-post-templates.blade.php) in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#43 {main}', '2026-01-03 05:16:05'),
(2, 'de3fd563-2e8e-4257-8b0d-c058e7fee775', 'database', 'default', '{\"uuid\":\"de3fd563-2e8e-4257-8b0d-c058e7fee775\",\"displayName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"command\":\"O:26:\\\"App\\\\Jobs\\\\SendNewsletterJob\\\":2:{s:16:\\\"subscriber_email\\\";s:16:\\\"smiles2@mail.com\\\";s:11:\\\"currentPost\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Post\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1767428064,\"delay\":null}', 'Error: Undefined constant \"post_url\" in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(123): require()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::{closure:Illuminate\\Filesystem\\Filesystem::getRequire():120}()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#43 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#44 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"post_url\" (View: /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/resources/views/email-templates/newsletter-post-templates.blade.php) in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#43 {main}', '2026-01-03 05:16:05');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(3, 'b5dd798d-5a9d-4fba-994f-367d3a1c622c', 'database', 'default', '{\"uuid\":\"b5dd798d-5a9d-4fba-994f-367d3a1c622c\",\"displayName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"command\":\"O:26:\\\"App\\\\Jobs\\\\SendNewsletterJob\\\":2:{s:16:\\\"subscriber_email\\\";s:23:\\\"teamkoda.koda@gmail.com\\\";s:11:\\\"currentPost\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Post\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1767428064,\"delay\":null}', 'Error: Undefined constant \"post_url\" in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(123): require()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::{closure:Illuminate\\Filesystem\\Filesystem::getRequire():120}()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#43 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#44 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"post_url\" (View: /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/resources/views/email-templates/newsletter-post-templates.blade.php) in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#43 {main}', '2026-01-03 05:16:05'),
(4, '208e7640-e607-4b03-8890-c97cc1b84541', 'database', 'default', '{\"uuid\":\"208e7640-e607-4b03-8890-c97cc1b84541\",\"displayName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendNewsletterJob\",\"command\":\"O:26:\\\"App\\\\Jobs\\\\SendNewsletterJob\\\":2:{s:16:\\\"subscriber_email\\\";s:14:\\\"user@email.com\\\";s:11:\\\"currentPost\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\Post\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"},\"createdAt\":1767428522,\"delay\":null}', 'Error: Undefined constant \"post_url\" in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(123): require()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(124): Illuminate\\Filesystem\\Filesystem::{closure:Illuminate\\Filesystem\\Filesystem::getRequire():120}()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(57): Illuminate\\Filesystem\\Filesystem->getRequire()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#43 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#44 {main}\n\nNext Illuminate\\View\\ViewException: Undefined constant \"post_url\" (View: /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/resources/views/email-templates/newsletter-post-templates.blade.php) in /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/storage/framework/views/fa2f2e307ccc5c39afcd6d399924533d.php:80\nStack trace:\n#0 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(58): Illuminate\\View\\Engines\\CompilerEngine->handleViewException()\n#1 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/PhpEngine.php(59): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->handleViewException()\n#2 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(22): Illuminate\\View\\Engines\\PhpEngine->evaluatePath()\n#3 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(76): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->evaluatePath()\n#4 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/livewire/livewire/src/Mechanisms/ExtendBlade/ExtendedCompilerEngine.php(10): Illuminate\\View\\Engines\\CompilerEngine->get()\n#5 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(208): Livewire\\Mechanisms\\ExtendBlade\\ExtendedCompilerEngine->get()\n#6 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(191): Illuminate\\View\\View->getContents()\n#7 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/View/View.php(160): Illuminate\\View\\View->renderContents()\n#8 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/app/Jobs/SendNewsletterJob.php(38): Illuminate\\View\\View->render()\n#9 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendNewsletterJob->handle()\n#10 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#11 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#12 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#13 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#14 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(129): Illuminate\\Container\\Container->call()\n#15 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->{closure:Illuminate\\Bus\\Dispatcher::dispatchNow():126}()\n#16 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#17 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then()\n#18 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#19 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->{closure:Illuminate\\Queue\\CallQueuedHandler::dispatchThroughMiddleware():127}()\n#20 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->{closure:Illuminate\\Pipeline\\Pipeline::prepareDestination():178}()\n#21 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#22 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#23 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#24 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(451): Illuminate\\Queue\\Jobs\\Job->fire()\n#25 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(401): Illuminate\\Queue\\Worker->process()\n#26 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(187): Illuminate\\Queue\\Worker->runJob()\n#27 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#28 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#29 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#30 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::{closure:Illuminate\\Container\\BoundMethod::call():35}()\n#31 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#32 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#33 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Container/Container.php(836): Illuminate\\Container\\BoundMethod::call()\n#34 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call()\n#35 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Command/Command.php(318): Illuminate\\Console\\Command->execute()\n#36 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Console/Command.php(180): Symfony\\Component\\Console\\Command\\Command->run()\n#37 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(1073): Illuminate\\Console\\Command->run()\n#38 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#39 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#40 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(197): Symfony\\Component\\Console\\Application->run()\n#41 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#42 /home/koda/laravelProjects/CLIENT-PROJECTS/WEB-SITES MANAGED/purpose-reels-app/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#43 {main}', '2026-01-03 05:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `site_meta_keywords` varchar(255) DEFAULT NULL,
  `site_meta_description` text DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_favicon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_email`, `site_phone`, `site_meta_keywords`, `site_meta_description`, `site_logo`, `site_favicon`, `created_at`, `updated_at`) VALUES
(2, 'Purpose Reels', 'info@purposereels.com', '0752832590', 'mafunzo, filamu, mafunzo katika filamu , purpose, purpose reels, kusudi', 'Purpose Reels ni jukwaa la maudhui linalotumia filamu kufundisha mafunzo ya maisha, uongozi, nidhamu, na kuishi kwa kusudi. Kupitia uchambuzi wa filamu na simulizi zenye maana, Purpose Reels inalenga kuhamasisha tafakari, mabadiliko chanya, na ukuaji binafsi.', 'logo_6929ee4e1e95b.png', 'favicon_6929ee4feb2f0.png', NULL, '2025-12-17 10:59:17');

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
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_25_043921_create_user_social_links_table', 2),
(5, '2025_11_26_041937_create_general_settings_table', 3),
(6, '2025_11_29_105205_create_parent_categories_table', 4),
(7, '2025_11_29_105233_create_categories_table', 4),
(8, '2025_12_04_074612_create_posts_table', 5),
(9, '2025_12_27_050116_create_slides_table', 6),
(10, '2026_01_03_053537_create_news_letter_subscribers_table', 7),
(11, '2026_01_03_063752_add_is_notified_to_posts_table', 8),
(12, '2026_01_04_170624_create_site_social_links_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `news_letter_subscribers`
--

CREATE TABLE `news_letter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_letter_subscribers`
--

INSERT INTO `news_letter_subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(8, 'user@email.com', '2026-01-03 05:20:44', '2026-01-03 05:20:44');

-- --------------------------------------------------------

--
-- Table structure for table `parent_categories`
--

CREATE TABLE `parent_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 1000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_categories`
--

INSERT INTO `parent_categories` (`id`, `name`, `slug`, `ordering`, `created_at`, `updated_at`) VALUES
(1, 'Mafunzo Katika Filamu', 'mafunzo-katika-filamu', 1, '2025-11-30 03:04:15', '2025-12-03 00:42:06'),
(3, 'Life Proofs', 'life-proofs', 2, '2025-11-30 03:37:23', '2025-12-12 07:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@email.com', 'QUtVZGN2SWJmTlJaQ3JlMWVsWVRiaU5EV01MSlJHdlRkN1F1MWZqOTE0MnJ5THoyUm5kMUI1ZmZ0Z2hONDNwbw==', '2025-11-20 16:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `is_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category`, `title`, `slug`, `content`, `featured_image`, `tags`, `meta_keywords`, `meta_description`, `visibility`, `is_notified`, `created_at`, `updated_at`) VALUES
(16, 1, 3, 'Mafunzo 5 Katika Filamu ya \"Remember The Titans\"', 'mafunzo-5-katika-filamu-ya-remember-the-titans', '<p><strong>KUHUSU FILAMU</strong></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:10pt\">Remember the Titans ni filamu ya mwaka 2000 inayosimulia hadithi ya kweli ya kimichezo. </span></span></span><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\">Inasimulia yale yaliyotokea miaka ya 1970 katika shule ya umma ya TC Williams. Kipindi ambacho shule za umma zilianza kuchanganya wanafunzi weupe na weusi kwa mara ya kwanza.<br />\r\n<br />\r\nKocha Herman</span></span></span><em><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\"> Boone</span></span></span></em><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\">, kocha mweusi anapewa jukumu la kuiongoza timu ya shule iliyounganishwa kwa mara ya kwanza. Wakati chuki na ubaguzi vikitawala, anatumia mchezo huo wenye mithili Raga (yaani American Football) kama darasa la maisha &mdash; kuwafundisha vijana hao kwamba ushindi wa kweli haupimwi kwa magoli, bali kwa jinsi tunavyoheshimiana, kuungana, na kukua pamoja.</span></span></span></p>\r\n\r\n<p><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\">Filamu hii imetayarishwa na <strong>Jerry Bruckheimer</strong> na kuongozwa na<strong> Boaz Yakin</strong>.&nbsp;</span></span></span><br />\r\n<span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\">Waigizaji wakuu ndani ya filamu hii ni:&nbsp;</span></span></span><br />\r\n<span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\"><strong>Denzel Washington</strong> akicheza kama <strong>Kocha mkuu Herman Boone</strong>.&nbsp;</span></span></span><br />\r\n<span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\"><strong>Will Patton</strong> akicheza kama <strong>Kocha msaidizi Bill Yoast</strong>.</span></span></span></p>\r\n\r\n<p><em><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"><span style=\"font-size:12pt\">Pamoja na vijana wa timu waliopitia mabadiliko makubwa ya maisha.</span></span></span></em></p>', '1765533831_01-Thumbnail-Remember he Titans.png', 'Perspiciatis impedi', 'Mafunzo 5 Katika Filamu Ya Remember The Titans, remember the titans, mafunzo, filamu', 'Remember the Titans ni filamu ya mwaka 2000 inayosimulia hadithi ya kweli ya kimichezo.  Inasimulia yale yaliyotokea miaka ya 1970 katika shule ya umma ya TC Williams. Kipindi ambacho shule za umma zilianza kuchanganya wanafunzi weupe na weusi kwa mara ya kwanza.', 1, 0, '2025-12-09 05:22:42', '2025-12-12 07:08:08'),
(17, 1, 3, 'Mafunzo 5 Katika Filamu ya \"Big George Foreman\"', 'mafunzo-5-katika-filamu-ya-big-george-foreman', '<p><strong><span style=\"color:#024f7a\"><span style=\"font-family:Courier New,serif\"><u><strong>KUITAMBULISHA FILAMU</strong></u></span></span></strong><br />\r\n<span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\">Kama wewe ni mpenzi wa ndondi, basi jina George Foreman si geni masikioni mwako. Filamu ya mwaka 2023 yenye jina </span></span><em><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\">Big George Foreman</span></span></em><span style=\"color:#000000\"><span style=\"font-family:Courier New,serif\"> inasimulia historia ya kweli ya bondia huyu aliyefanya maajabu kwa kuwa bingwa wa dunia mara mbili katika uzito wa juu.</span></span><br />\r\n<br />\r\n<span style=\"font-family:Courier New,serif\">Mara ya kwanza alitwaa ubingwa wa dunia akiwa na umri wa </span><strong><span style=\"font-family:Courier New,serif\">miaka 24</span></strong><span style=\"font-family:Courier New,serif\">, baada ya kumshinda </span><strong><span style=\"font-family:Courier New,serif\">Joe Frazier</span></strong><span style=\"font-family:Courier New,serif\"> mwaka </span><strong><span style=\"font-family:Courier New,serif\">1973</span></strong><span style=\"font-family:Courier New,serif\">. Baadaye, alipoteza taji hilo kwa</span><span style=\"font-family:Courier New,serif\"><strong> </strong></span><strong><span style=\"font-family:Courier New,serif\"><strong>Muhammad Ali</strong></span></strong><span style=\"font-family:Courier New,serif\"> mwaka </span><strong><span style=\"font-family:Courier New,serif\"><strong>1974</strong></span></strong><span style=\"font-family:Courier New,serif\">, kisha akaacha kabisa ndondi na kujitosa katika huduma ya </span><strong><span style=\"font-family:Courier New,serif\">uuhubiri</span></strong><span style=\"font-family:Courier New,serif\">.</span></p>\r\n\r\n<p><span style=\"font-family:Courier New,serif\">Miaka </span><strong><span style=\"font-family:Courier New,serif\">20</span></strong><span style=\"font-family:Courier New,serif\"> baadaye, akiwa na umri wa </span><strong><span style=\"font-family:Courier New,serif\">miaka </span></strong><strong><span style=\"font-family:Courier New,serif\"><strong>45</strong></span></strong><span style=\"font-family:Courier New,serif\">, aliushangaza ulimwengu kwa kurejea ulingoni na kufanikiwa tena kutwaa ubingwa wa dunia mwaka </span><strong><span style=\"font-family:Courier New,serif\"><strong>1994</strong></span></strong><span style=\"font-family:Courier New,serif\">, akimshinda bondia kijana mwenye umri wa </span><strong><span style=\"font-family:Courier New,serif\">miaka 26</span></strong><span style=\"font-family:Courier New,serif\">, aliyekuwa akihofiwa sana kwa wakati huo &mdash; </span><strong><span style=\"font-family:Courier New,serif\"><strong>Michael Moorer</strong></span></strong><span style=\"font-family:Courier New,serif\"><strong>.</strong></span><br />\r\n<br />\r\n<em><span style=\"font-family:Courier New,serif\">Filamu hii imeongozwa na </span></em><strong><span style=\"font-family:Courier New,serif\">George Tillman Jr.</span></strong><br />\r\n<em><span style=\"font-family:Courier New,serif\">ikiwahusisha :</span></em><br />\r\n<strong><span style=\"font-family:Courier New,serif\">Khris Davis</span></strong><em><span style=\"font-family:Courier New,serif\"> akicheza kama </span></em><em><span style=\"font-family:Courier New,serif\"><strong>George Foreman.</strong></span></em><br />\r\n<strong><span style=\"font-family:Courier New,serif\">Forest Whitaker </span></strong><em><span style=\"font-family:Courier New,serif\">akicheza kama </span></em><em><span style=\"font-family:Courier New,serif\"><strong>Doc Broadus</strong></span></em><em><span style=\"font-family:Courier New,serif\"> kocha mlezi wa Foreman.</span></em><br />\r\n<span style=\"font-family:Courier New,serif\">Pamoja na waigizaji wengine mahiri</span><em><span style=\"font-family:Courier New,serif\"> wanaoipa uzito na uhalisia wa kipekee filamu hii.</span></em></p>', '1765534656_02-Thumbnail-Big George Forman.png', NULL, 'mafunzo 5 katika filamu ya big george foreman, big george foreman, george foreman, mohamed ali', 'Filamu ya mwaka 2023 yenye jina Big George Foreman inasimulia historia ya kweli ya bondia huyu aliyefanya maajabu kwa kuwa bingwa wa dunia mara mbili katika uzito wa juu.', 1, 0, '2025-12-12 07:17:36', '2025-12-12 07:17:36'),
(18, 1, 7, 'Mguu Wangu Umekanyaga', 'mguu-wangu-umekanyaga', '<p style=\"text-align:justify\">&ldquo;<span style=\"font-family:Times New Romans,serif\">Kila mahali mtakapokanyaga kwa nyayo za miguu yenu patakuwa kwenu; tokea hilo jangwa, naLebanoni, na tokea mto wa Frati, mpaka bahari ya magharibi, itakuwa ndiyo mipaka yenu.&rdquo; Hayo yalikuwa ni maneno ya Mungu kwa mtumishi wake Musa na baadae kumkumbusha mrithi wke Yoshua. Ni maneno ambayo yamebariki maisha yangu. Nitakwambia kwanini: Ila sasa mimi ni fundi gereji maridadi sana hapa mjini Dodoma. Mwanzo au mwisho wa safari hauna maana yeyote kama mtu anayesafiri hapa katikakati ya safari hakufurahia safari yake, na kwenye maisha vivyo hivyo. Songa nami.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Mwaka 1978 nikiwa na umri miaka 4 nililetwa mjini Dodoma makao makuu ya nchi yetu hii nikitokea mjini Moshi na nikawa naishi na mjomba wangu. Siwezi kumlaaumu mjomba kwani ndiye aliyenipa chakula, mahali pakulala, nguo za kuvaa na kufanya vitu vyote ambavyo mtoto wa rika langu angefanya lakini baadae nilivyopevuka na nikagundua kuwa mjomba hakujali sana kuhusu elimu yangu.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Nikamjua Mungu na nikiwa na umri wa miaka 18 na nikafanya uamuzi wa kuokoka. Ndio Kuokoka. Hiyo ni kwa upande wangu, vipi wako? Kulingana na dini uliyopo, je unafikiri kuna wakati sahihi wa kuanza kufuata njia za Mungu. Mimi sidhani na ninachojua Mungu amekupa vyote tangu ungali mdogo na ni uamuzi wako umfuate au la!</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Haukua uamuzi mgumu kuokoka kwa maana nilimtumikia Mungu na nilikuwa nina furaha. Kimbembe kilikuja kwa mjomba ambaye alighadhabika kitendo kilichopelekea kufukuzwa nyumbani. Unakumbuka nilikwambia mimi ni fundi gereji maridadi sana mjini Dodoma? Mambo yalianzia hapa.</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Pia nilikwambia kuhusu kufurahia safari na sio kuianza au kuimaliza tu, sikumaanisha furaha kama furaha. Unajua njia unayopita inaweza isiwe rahisi, kunaweza kukawa na makorongo, mawe makubwa makubwa yanayoziba, pia milima ya kupanda na kushuka na wakati mweningine kukawa na njia zaidi ya moja uchanganyikiwe ipi ni njia sahihi. Wakati mwingine bila kutegemea barabara ikawa ni ya kuteleza mwanzo mwisho.</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Baada ya kufukuzwa nyumbani kwa kuchagua njia bora maishani, nilifanikiwa kupata kibarua cha ufundi gereji kwa kuwa ndoto za kusoma zilikuwa zimekwisha tena. Ilinibidi nijipambanie na hatimaye nikapanga chumba. Pamoja na kubahatika kupata kibarua hicho ila nikagundua baraka hazitanifuata nikikaa na kundi lile hivyo nikaamua kutoka kwenye gereji hiyo na kutafuta sehemu yangu binafsi ya kazi. Nilikuwa nina ujuzi tayari kwa kuwa katika kazi hii miaka yote hiyo hivyo nilijiamini na kumtanguliza Mungu.</span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Katika harakati za kutoka kwenye gereji ile nikafanikiwa kupata chumba Bahi Road hapa hapa Dodoma. Sehemu hii ilikuwa ndiyo Kaanani yangu ya biashara. Imani yangu imenitendea makuu na nikaamini pia itanitendea makuu hapa.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Kwenye Biblia tunajua fika kwamba Musa hakufika Kaanani nchi ambayo Mungu aliwaahidi Waisraeli kwa sababu Mussa hakukanyaga Kaanani. Alituma watu huko akiwemo Yoshua na ndipo Mungu alipomwambia Yoshua: &ldquo;Kila mahali mtakapokanyaga kwa nyayo za miguu yenu patakuwa kwenu; tokea hilo jangwa, na Lebanoni, na tokea mto wa Frati, mpaka Bahari ya Magharibi, itakuwa ndiyo mipaka yenu.&rdquo; Na ndivyo ilivyokuwa kwangu.</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Siku ilipofika ya kwenda kwenye chumba hicho nilisema maneno haya kwa Imani &ldquo;Kila mahali zitakapokanyaga nyayo za miguu yangu nimepewa mimi.&rdquo; nikiamini kuwa sehemu hio itakuwa ni mji wangu wa biashara. Kusema hivyo hakumaanishi ndiyo barabara iliyonyooka ila ndio mwanzo kupita barabara yenye vikwazo vingi.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Nilipohamia sio kila mtu alipenda nilichokuwa nafanya, changamoto kama kukatiwa umeme na wapangaji wenzangu ili nisifanye kazi na kuibiwa vifaa vya kazi na vijana wangu wa kazi vilikuwa ni vya kupita na moyoni nilikumbuka azimio langu la mahali hapo na mwaka 2015 hatimaye nilianza mazungumzo</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">na mzee mwenye eneo hilo niweze kununua eneo hilo lakini alikataa. </span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Pia sikukata moto, kusali na kufunga hatimaye mzee alianza kuonyesha muelekeo nikaona hapa bila mbinu za ziada nitakuwa natwanga maji kwenye kinu, ikanibidi nichape kazi sana na nilipopata hela nikanunua kiwanja ili kumvutia mzee kwasababu wakati mwingine muuzaji akiona mnunuzi anashida</span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">sana ndipo naye anapatia pa kulia tonge. Mzee akaona najiweza, ili asinyang&rsquo;anywe tonge mdomoni mwaka 2020 alikubali kuniuzia nyumba.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Pia haikuwa kirahisi, kumbe kiwanja kile hakikuwa na hati na katika harakati za kufanya biashara ikagundulika kiwanja kile alipewa tu kwenye karatasi na marehemu rafiki yake. Ili vitu viende kisheria na kutoleta changamoto au matatizo yeyote mbeleni ilibidi atafute watoto wa marehemu ili wawe mbadala wa baba yao kuthibitisha kuwa alipewa sehemu hiyo.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Kumsaidia mzee na changamoto ambazo watoto wale wangeweza kuona ni mwanya wa wao kuchukua eneo ambalo halikuwa haliwahusu nikawapoza kwa shilingi millioni 9. Mzee akaanza kuingiwa na fikira mbaya kwamba ninataka kumdhulumu hivyo akaamua kunipeleka polisi. </span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Kesi ilivyofika polisi mzee akaitwa ili aeleze kinaga ubaga ni nini kinachoendelea. Baada ya ukweli wote kuwekwa wazi yule mzee akabaki njia panda haeleweki anataka nini. Pengine labda na zile milioni 9 alitaka ziwe zake. Askari akamwambia inabidi ashukuru kwasababu sikutakiwa kufanya hata nilichofanya. Yaani ni kama nimelipa zaidi na kiasi ambacho nilikubaliana naye.</span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Baada ya kumalizana na mzozo ule biashara yangu ikawa bora zaidi. Chumba kimoja kimegeuka kuwa nyumba kubwa ya biashara yenye eneo za mita za mraba 845, fremu 5 kubwa za biashara, sehemu ya kufanyia kazi (workshop), vyumba vya kutosha vya kuweka bidhaa (warehouse), na sehemu ya kuegesha magari 5. Na sasa sio fundi gereji wa kawaida bali ni fundi mwenye ujuzi na mwenye jina kubwa jijini Dodoma. Nafanya kazi na mabasi makubwa hapa Tanzania na nina wateja nje na ndani ya jiji. </span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-family:Times New Romans,serif\">Licha ya kutengeneza magari ya watu tu nami nina gari langu sasa, na sio nyumba moja tu bali tatu. Mungu amenijalia mke mzuri, watoto watatu wa kiume na mmoja wa kike. Wote wana maarifa ya Mungu na wanajitoa kwake. Mguu wangu umekanyaga na maisha yangu yamebadilika.</span></p>', '1765535196_kid-circus-7vSlK_9gHWA-unsplash.jpg', NULL, NULL, NULL, 1, 0, '2025-12-12 07:26:37', '2025-12-12 07:26:37'),
(19, 1, 13, 'Understanding', 'understanding', '<p><a name=\"_GoBack\"></a> A choice involves decision making. It can include judging the merits of multiple options and selecting one or more of them. The following are factors influencing any choice;</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Understanding</p>\r\n	</li>\r\n	<li>\r\n	<p>Needs and wants</p>\r\n	</li>\r\n	<li>\r\n	<p>Freedom</p>\r\n	</li>\r\n	<li>\r\n	<p>Existence of number of options to satisfy the needs and wants.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Without these there can never be any act of choosing.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>The choices we make in life entails the direction to different outcomes yet to be experienced by us. Hence our experiences in life are as result of our own choices or other people&rsquo;s choices.</p>\r\n\r\n<p>Every choice one makes in life has consequences or outcomes. These outcomes might be of good or bad effect on one&rsquo;s life.</p>\r\n\r\n<p>Our understanding about the world and nature also our understanding about GOD and his kingdom and his powers informs us about the outcomes of any choice we make in our lives. Therefore understanding is the major pillar of choices in life.</p>\r\n\r\n<p>In order for a person to make good choices which come with good outcomes in life, he or she should make sure or should make an effort to understand (have knowledge) of most good things and make the mind healthy.</p>\r\n\r\n<p>Our understanding is through two major sensory organs which are;</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>The eyes</p>\r\n	</li>\r\n	<li>\r\n	<p>The ears</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Therefore have control over these two crucial organs, by seeing good things and hearing good news you will always make the best choices in your life and regrets will never be part of your life.</p>\r\n\r\n<p style=\"text-align:center\"><br />\r\n&nbsp;</p>', '1765541020_web-g022e41034_1920.jpg', 'makala,uelewa', NULL, NULL, 1, 0, '2025-12-12 09:03:40', '2025-12-15 05:23:16'),
(23, 1, 3, 'LOREM IPSUM', 'lorem-ipsum', '<p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:</p>\r\n\r\n<blockquote>\r\n<p>&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.&rdquo;</p>\r\n</blockquote>\r\n\r\n<p>The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn&#39;t distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.</p>', '1767429660_VRSVGACTZVHW7AFFIGWY5JIWKU.jpg', NULL, NULL, NULL, 1, 1, '2026-01-03 05:41:01', '2026-01-03 05:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0XThU6xlyQz5OrPSW5YPK3vDfgL1UgAK73gf1jTz', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoic2xPclhxeDVtM3lYYVJVcTVZelo4ZlJXZGh0amE3RTJ6VlBJMUUwRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zZXR0aW5ncz90YWI9Z2VuZXJhbF9zZXR0aW5ncyI7czo1OiJyb3V0ZSI7czoxNDoiYWRtaW4uc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1767511421),
('1jCxv3kQS8xbEoJpTMM4B8r0DwkyCmzdlhBpr3Bw', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV1dveTBvNmNoOFlRN3hmSlJ5NzVlOU5maGhsaDl5bDdiMkxyUzFETyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9wb3N0LzIzL2VkaXQiO3M6NToicm91dGUiO3M6MTU6ImFkbWluLmVkaXRfcG9zdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1767429709),
('d9XCqZunyX85A6Doi9hYpEACJe8pPOaii9tN2O5e', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNFVIT3U5aTg5OU8xMnVnalYyQlQwZmxTVUJFRHNGRUNRTWltVGlRdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1767549181);

-- --------------------------------------------------------

--
-- Table structure for table `site_social_links`
--

CREATE TABLE `site_social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_social_links`
--

INSERT INTO `site_social_links` (`id`, `facebook_url`, `instagram_url`, `linkedin_url`, `created_at`, `updated_at`) VALUES
(1, '', 'https://www.instagram.com/purposereeels', 'https://www.linkedin.com/purposereeels', '2026-01-04 14:28:14', '2026-01-04 14:44:32');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `image`, `heading`, `link`, `status`, `ordering`, `created_at`, `updated_at`) VALUES
(2, 'SLD_20260103052616.png', 'Kila hadithi kubwa huanzia nyumbani.', NULL, 1, 100, '2025-12-30 02:34:25', '2026-01-03 02:26:16'),
(3, 'SLD_20251230053559.jpg', 'Kabla ya shujaa kuzaliwa kulikuwa na mtu aliyemwamini.', NULL, 0, 100, '2025-12-30 02:35:59', '2026-01-02 04:04:30'),
(4, 'SLD_20251230053754.webp', 'Safari ni ngumu, lakini ushindi una maana zaidi ukiwa na KUSUDI.', NULL, 0, 100, '2025-12-30 02:37:54', '2026-01-03 03:16:28'),
(5, 'SLD_20260103052640.png', 'Tambua thamani yako. Simama katika KUSUDI lako.', NULL, 1, 100, '2025-12-30 02:39:20', '2026-01-03 02:26:40'),
(6, 'SLD_20260103052653.png', 'Hakuna NDOTO iliyo mbali sana kwa yule mwenye KUSUDI.', NULL, 1, 100, '2025-12-30 02:40:11', '2026-01-03 02:26:53'),
(7, 'SLD_20260102064330.webp', 'Tambua KUSUDI lako kuptia mfanzo ndani ya filamu na makala - Updated', NULL, 0, 100, '2025-12-30 03:01:05', '2026-01-02 04:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'admin',
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `picture`, `bio`, `type`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Davies Amedeus', 'admin@email.com', 'daviesamedeus', NULL, '$2y$12$92oPuS26e5IHWfnFo0mxoeefihy4kViFSyDXm.kI1ahIF8rZd/F.O', 'IMG_6942bfa56b5fb.png', 'Mimi ni mmoja wa waanzalishi wa Purpose Reels, jukwaa linalochambua filamu na kutoa mafunzo ya maisha yanayohamasisha ukuaji binafsi, nidhamu, na kuishi kwa kusudi. Kupitia simulizi na uchambuzi wa kina, Purpose Reels inaonyesha namna filamu zinavyoweza kuwa darasa la maisha na chanzo cha msukumo wa mabadiliko chanya.', 'superAdmin', 'active', NULL, '2025-11-18 00:59:45', '2025-12-17 11:35:17'),
(2, 'Amanda', 'user@email.com', 'user', NULL, '123456', NULL, NULL, 'admin', 'active', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_social_links`
--

CREATE TABLE `user_social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook_url` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(255) DEFAULT NULL,
  `youtube_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `github_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_social_links`
--

INSERT INTO `user_social_links` (`id`, `user_id`, `facebook_url`, `instagram_url`, `youtube_url`, `twitter_url`, `linkedin_url`, `github_url`, `created_at`, `updated_at`) VALUES
(2, 1, 'https://www.facebook.com/profile.php?id=100077414981947', 'https://www.instagram.com/daviesamedeus/', 'https://www.youtube.com/@daviesamedeus', NULL, 'https://www.linkedin.com/in/davies-amedeus', 'https://github.com/DaviesAmedeus', NULL, '2025-12-17 11:13:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_letter_subscribers`
--
ALTER TABLE `news_letter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_letter_subscribers_email_unique` (`email`);

--
-- Indexes for table `parent_categories`
--
ALTER TABLE `parent_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_categories_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `site_social_links`
--
ALTER TABLE `site_social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_social_links`
--
ALTER TABLE `user_social_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_social_links_user_id_unique` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `news_letter_subscribers`
--
ALTER TABLE `news_letter_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `parent_categories`
--
ALTER TABLE `parent_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `site_social_links`
--
ALTER TABLE `site_social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_social_links`
--
ALTER TABLE `user_social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
