-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 18 Avril 2018 à 14:40
-- Version du serveur :  5.7.21-0ubuntu0.17.10.1
-- Version de PHP :  7.1.15-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Film_database`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteurs`
--

CREATE TABLE `acteurs` (
  `id` int(10) NOT NULL,
  `id_film` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` int(10) DEFAULT NULL,
  `review` text,
  `date_review` datetime DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `acteurs`
--

INSERT INTO `acteurs` (`id`, `id_film`, `name`, `note`, `review`, `date_review`, `username`) VALUES
(2, 12, 'Robert Downey Jr', NULL, NULL, NULL, NULL),
(3, 13, 'Robert Downey Jr', NULL, NULL, NULL, NULL),
(4, 13, 'Mickey Rourke', NULL, NULL, NULL, NULL),
(5, 1, 'Matthew McConaughey', NULL, NULL, NULL, NULL),
(6, 1, 'Michel Caine', NULL, NULL, NULL, NULL),
(7, 2, 'Tom Cruise', NULL, NULL, NULL, NULL),
(8, 7, 'Jean Reno', NULL, NULL, NULL, NULL),
(9, 10, 'Leonardo Di Caprio', NULL, NULL, NULL, NULL),
(10, 10, 'Marion Cotillard', NULL, NULL, NULL, NULL),
(11, 10, 'Tom Hardy', NULL, NULL, NULL, NULL),
(12, 11, 'Henry Calvill', NULL, NULL, NULL, NULL),
(13, 11, 'Amy Adams', NULL, NULL, NULL, NULL),
(17, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(18, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(19, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(20, 11, 'Henry Calvill', 5, NULL, NULL, NULL),
(21, 11, 'Amy Adams', 4, NULL, NULL, NULL),
(22, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(23, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(24, 11, 'Amy Adams', 1, NULL, NULL, NULL),
(25, 11, 'Henry Calvill', 5, NULL, NULL, NULL),
(26, 11, 'Henry Calvill', 4, NULL, NULL, NULL),
(27, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(28, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(29, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(30, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(31, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(32, 11, 'Amy Adams', 2, NULL, NULL, NULL),
(33, 11, 'Amy Adams', 2, NULL, NULL, NULL),
(34, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(35, 11, 'Amy Adams', 3, NULL, NULL, NULL),
(36, 13, 'Robert Downey Jr', 2, NULL, NULL, NULL),
(37, 13, 'Mickey Rourke', 3, NULL, NULL, NULL),
(38, 13, 'Mickey Rourke', 3, NULL, NULL, NULL),
(39, 13, 'Robert Downey Jr', 2, NULL, NULL, NULL),
(40, 11, 'Henry Calvill', 3, NULL, NULL, NULL),
(41, 11, 'Amy Adams', 2, NULL, NULL, NULL),
(42, 11, 'Amy Adams', 2, NULL, NULL, NULL),
(43, 12, 'Robert Downey Jr', 4, NULL, NULL, NULL),
(44, 12, 'Robert Downey Jr', 3, NULL, NULL, NULL),
(45, 13, 'Robert Downey Jr', 2, NULL, NULL, NULL),
(46, 13, 'Mickey Rourke', 3, NULL, NULL, NULL),
(47, 13, 'Robert Downey Jr', 3, NULL, NULL, NULL),
(48, 13, 'Robert Downey Jr', 3, NULL, NULL, NULL),
(49, 13, 'Robert Downey Jr', 3, NULL, NULL, NULL),
(54, 16, 'Tom Hardy', NULL, NULL, NULL, NULL),
(55, 16, 'Robert Downey Jr', NULL, NULL, NULL, NULL),
(56, 1, 'Matthew McConaughey', 4, NULL, NULL, NULL),
(57, 1, 'Matthew McConaughey', 3, NULL, NULL, NULL),
(58, 16, 'Tom Hardy', 4, NULL, NULL, NULL),
(59, 16, 'Robert Downey Jr', 1, NULL, NULL, NULL),
(60, 16, 'Robert Downey Jr', 1, NULL, NULL, NULL),
(61, 16, 'Robert Downey Jr', 2, NULL, NULL, NULL),
(62, 16, 'Tom Hardy', 3, NULL, NULL, NULL),
(63, 1, 'Michel Caine', 3, 'bon acteur dans ce film. Il joue juste', NULL, NULL),
(64, 1, 'Michel Caine', 4, 'Une de ses meilleurs performances ', NULL, NULL),
(65, 1, 'Matthew McConaughey', 5, 'Une performance exeptionnelle !!!!! ', NULL, NULL),
(66, 1, 'Michel Caine', 1, 'pas terrible dans ce film...', NULL, NULL),
(67, 1, 'Matthew McConaughey', 5, 'superbe acteur dans ce film', NULL, NULL),
(68, 1, 'Matthew McConaughey', 4, 'vraiment très bon', NULL, NULL),
(69, 17, 'Nathalie Portman', NULL, NULL, NULL, NULL),
(70, 17, 'Ewan McGregor', NULL, NULL, NULL, NULL),
(71, 18, 'Nathalie Portman', NULL, NULL, NULL, NULL),
(72, 18, 'Ewan McGregor', NULL, NULL, NULL, NULL),
(73, 18, 'Hayden Christensen', NULL, NULL, NULL, NULL),
(74, 19, 'Ewan McGregor', NULL, NULL, NULL, NULL),
(75, 19, 'Nathalie Portman', NULL, NULL, NULL, NULL),
(76, 20, 'Christian Bale', NULL, NULL, NULL, NULL),
(77, 20, 'Michael Caine', NULL, NULL, NULL, NULL),
(78, 20, 'Liam Neeson', NULL, NULL, NULL, NULL),
(79, 21, 'Christian Bale', NULL, NULL, NULL, NULL),
(80, 21, 'Michael Caine', NULL, NULL, NULL, NULL),
(81, 21, 'Heath Ledger', NULL, NULL, NULL, NULL),
(82, 20, 'Michael Caine', 3, 'il fait le taf', NULL, NULL),
(83, 21, 'Heath Ledger', 4, 'super performance !!!', NULL, NULL),
(84, 11, 'Henry Calvill', 4, 'Il fait un bon Superman ', NULL, NULL),
(85, 11, 'Amy Adams', 2, 'je n\'aime pas sa performance ', NULL, NULL),
(86, 11, 'Amy Adams', 4, 'très bonne performance ', NULL, NULL),
(87, 1, 'Matthew McConaughey', 5, 'Superbe acteur ', NULL, NULL),
(88, 1, 'Michel Caine', 3, 'Bonne performance ', NULL, NULL),
(89, 1, 'Michel Caine', 3, 'bonne performance', NULL, NULL),
(90, 1, 'Michel Caine', 2, 'pas mauvais mais on a vu mieux ', NULL, NULL),
(91, 1, 'Michel Caine', 4, 'il surjoue dans ce rôle', NULL, NULL),
(92, 1, 'Michel Caine', 3, 'je dis oui !!!', NULL, NULL),
(93, 1, 'Michel Caine', 4, 'test_time', NULL, NULL),
(94, 1, 'Michel Caine', 0, 'test2_time_stamp', '2018-03-19 11:33:07', NULL),
(95, 1, 'Michel Caine', 4, 'test4_time_stamp', '2018-03-19 11:34:08', NULL),
(96, 2, 'Tom Cruise', 4, 'Super acteur', '2018-04-09 14:19:53', NULL),
(97, 19, 'Ewan McGregor', 4, 'Très bon acteur dans le 1er épisode de cette trilogie', '2018-04-12 09:51:22', NULL),
(98, 22, 'Daniel Craig', NULL, NULL, '2018-04-12 11:46:14', NULL),
(99, 22, 'Daniel Craig', 4, 'Un James bond qui en impose !!!!', '2018-04-12 11:48:24', NULL),
(100, 22, 'Daniel Craig', 4, 'le film qui l\'a fait connaitre aux yeux du grand public ', '2018-04-15 19:12:25', 'dorianjs'),
(101, 1, 'Michel Caine', 4, 'bon acteur !!!! ', '2018-04-16 12:49:34', 'dorianjs'),
(103, 10, 'Tom Hardy', 4, 'test', '2018-04-16 13:06:29', 'dorianjs');

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-03-11 21:08:20.373724'),
(2, 'auth', '0001_initial', '2018-03-11 21:08:20.840026'),
(3, 'admin', '0001_initial', '2018-03-11 21:08:20.959417'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-03-11 21:08:20.996349'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-03-11 21:08:21.084531'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-03-11 21:08:21.108198'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-03-11 21:08:21.143959'),
(8, 'auth', '0004_alter_user_username_opts', '2018-03-11 21:08:21.165747'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-03-11 21:08:21.211588'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-03-11 21:08:21.216010'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-03-11 21:08:21.238878'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-03-11 21:08:21.316967'),
(13, 'sessions', '0001_initial', '2018-03-11 21:08:21.360015');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

CREATE TABLE `films` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `realisateur` varchar(50) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `actors` text,
  `img` varchar(600) NOT NULL DEFAULT 'https://image.freepik.com/icones-gratuites/bande-de-film-arrondi-carre_318-34085.jpg',
  `note_film` float DEFAULT NULL,
  `trailer` varchar(600) DEFAULT NULL,
  `resume` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `films`
--

INSERT INTO `films` (`id`, `name`, `realisateur`, `genre`, `actors`, `img`, `note_film`, `trailer`, `resume`) VALUES
(1, 'Interstellar', 'Christopher Nolan', 'Science Fiction', 'Matthew McConaughey,Michel Caine', 'http://fr.web.img6.acsta.net/pictures/14/09/24/12/08/158828.jpg', 2.58209, 'https://youtu.be/VaOijhK3CRU', 'Le film raconte les aventures d’un groupe d’explorateurs qui utilisent une faille récemment découverte dans l’espace-temps afin de repousser les limites humaines et partir à la conquête des distances astronomiques dans un voyage interstellaire. '),
(2, 'Mission Impossible 2', 'John Woo', 'Action', 'Tom Cruise', 'http://fr.web.img6.acsta.net/medias/nmedia/18/70/64/92/19106209.jpg', 2.45455, 'https://youtu.be/vIpqpRuGrq4', 'Votre mission, monsieur Hunt, si vous décidez de l\'accepter, sera de récupérer un virus génétiquement modifié, baptisé Chimera. Sean Ambrose, qui fut votre élève avant de devenir votre ennemi juré, s\'est emparé de l\'antidote et se terre dans un laboratoire secret de Sydney. Son ex-maitresse, Nyah Hall, pourrait s\'avérer utile dans vos tentatives d\'infiltration de ce QG hautement protégé. Comme toujours, si vous ou l\'un de vos équipiers étiez capturés ou tués, le département d\'Etat nierait avoir eu connaissance de vos agissements. Ce résumé s\'autodétruira dans cinq secondes.'),
(7, 'Leon', 'Luc Besson', 'Action', 'Jean Reno', 'http://aws.vdkimg.com/film/1/0/4/6/10465_backdrop_scale_1280xauto.jpg', 1.83333, 'https://youtu.be/vSi5jdziv3I', 'Un tueur à gages répondant au nom de Léon prend sous son aile Mathilda, une petite fille de douze ans, seule rescapée du massacre de sa famille. Bientôt, Léon va faire de Mathilda une \"nettoyeuse\", comme lui. Et Mathilda pourra venger son petit frère...'),
(10, 'inception', 'Christopher Nolan', 'Science Fiction', 'Leonardo Di Caprio,Tom Hardy,Marion Cotillard', 'http://fr.web.img5.acsta.net/r_1280_720/medias/nmedia/18/72/34/14/19476652.jpg', 3.34286, 'https://youtu.be/B4nIVh1yvvc', 'Dom Cobb est un voleur expérimenté – le meilleur qui soit dans l’art périlleux de l’extraction : sa spécialité consiste à s’approprier les secrets les plus précieux d’un individu, enfouis au plus profond de son subconscient, pendant qu’il rêve et que son esprit est particulièrement vulnérable. Très recherché pour ses talents dans l’univers trouble de l’espionnage industriel, Cobb est aussi devenu un fugitif traqué dans le monde entier qui a perdu tout ce qui lui est cher. Mais une ultime mission pourrait lui permettre de retrouver sa vie d’avant – à condition qu’il puisse accomplir l’impossible : '),
(11, 'Man of Steel', 'Zack Snyder', 'Super Héros', 'Henry Calvill,Amy Adams', 'http://fr.web.img3.acsta.net/pictures/210/081/21008110_20130524125237634.jpg', 3.64286, 'https://youtu.be/Xw4VeR7tCxU', 'Un petit garçon découvre qu\'il possède des pouvoirs surnaturels et qu\'il n\'est pas né sur Terre. Plus tard, il s\'engage dans un périple afin de comprendre d\'où il vient et pourquoi il a été envoyé sur notre planète. Mais il devra devenir un héros s\'il veut sauver le monde de la destruction totale et incarner l\'espoir pour toute l\'humanité.'),
(12, 'Iron man ', 'John Favreau', 'Super Héros', 'Robert Downey Jr', 'https://image.freepik.com/icones-gratuites/bande-de-film-arrondi-carre_318-34085.jpg\r\n                                                        \r\n                                                              ', 2.6, 'https://youtu.be/r01g_W-HR4s', 'Tony Stark, inventeur de génie, vendeur d\'armes et playboy milliardaire, est kidnappé en Aghanistan. Forcé par ses ravisseurs de fabriquer une arme redoutable, il construit en secret une armure high-tech révolutionnaire qu\'il utilise pour s\'échapper. Comprenant la puissance de cette armure, il décide de l\'améliorer et de l\'utiliser pour faire régner la justice et protéger les innocents.'),
(13, 'Iron Man 2', 'John Favreau', 'Super Héros', 'Robert Downey Jr,Mickey Rourke,', 'http://fr.web.img3.acsta.net/c_215_290/medias/nmedia/18/70/45/28/19408942.jpg', 3, 'https://youtu.be/0Y7ullsUPEA', 'Le monde sait désormais que l\'inventeur milliardaire Tony Stark et le super-héros Iron Man ne font qu\'un. Malgré la pression du gouvernement, de la presse et du public pour qu\'il partage sa technologie avec l\'armée, Tony n\'est pas disposé à divulguer les secrets de son armure, redoutant que l\'information atterrisse dans de mauvaises mains. Avec Pepper Potts et James \"Rhodey\" Rhodes à ses côtés, Tony va forger de nouvelles alliances et affronter de nouvelles forces toutes-puissantes...'),
(16, 'Black Panther', 'Ryan Coogler', 'Super Héros', 'Chadwick Boseman,Michael B. Jordan', 'http://www.bullesdeculture.com/bdc-content/uploads/2018/02/affiche-black-panther.jpg', 2.66667, 'https://youtu.be/x02xX2dv6bQ', 'Après les événements qui se sont déroulés dans Captain America : Civil War, T’Challa revient chez lui prendre sa place sur le trône du Wakanda, une nation africaine technologiquement très avancée. Mais lorsqu’un vieil ennemi resurgit, le courage de T’Challa est mis à rude épreuve, aussi bien en tant que souverain qu’en tant que Black Panther. Il se retrouve entraîné dans un conflit qui menace non seulement le destin du Wakanda, mais celui du monde entier…'),
(17, 'Star Wars : Episode 3 - La Revanche des Siths', 'Georges Lucas', 'Science Fiction', 'Nathalie Portman,Ewan McGregor,', 'http://fr.web.img3.acsta.net/medias/nmedia/18/35/53/23/18423997.jpg', 4, 'https://youtu.be/ZV5LqPzoQAs', 'La Guerre des Clones fait rage. Une franche hostilité oppose désormais le Chancelier Palpatine au Conseil Jedi. Anakin Skywalker, jeune Chevalier Jedi pris entre deux feux, hésite sur la conduite à tenir. Séduit par la promesse d\'un pouvoir sans précédent, tenté par le côté obscur de la Force, il prête allégeance au maléfique Darth Sidious et devient Dark Vador.'),
(18, 'Star Wars: Episode 2 - L\'attaque des clones', 'Georges Lucas', 'Science Fiction', 'Nathalie Portman,Ewan McGregor,Hayden Christensen,', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Star_Wars_-_Episode_II_Attack_of_the_Clones_%28movie_poster%29.jpg/220px-Star_Wars_-_Episode_II_Attack_of_the_Clones_%28movie_poster%29.jpg', 0, 'https://youtu.be/DiDXCH_mWSo', 'Depuis le blocus de la planète Naboo par la Fédération du commerce, la République, gouvernée par le Chancelier Palpatine, connaît une véritable crise. Un groupe de dissidents, mené par le sombre Jedi comte Dooku, manifeste son mécontentement envers le fonctionnement du régime. Le Sénat et la population intergalactique se montrent pour leur part inquiets face à l\'émergence d\'une telle menace.'),
(19, 'Star Wars: Epiode 1 - La menace fantome', 'Georges Lucas', 'Science Fiction', 'Ewan McGregor,Nathalie Portman,', 'http://www.horreur.net/img/SWepisode1aff.jpg', 0, 'https://youtu.be/1BKYEL6WIRo', 'Avant de devenir un célèbre chevalier Jedi, et bien avant de se révéler l’âme la plus noire de la galaxie, Anakin Skywalker est un jeune esclave sur la planète Tatooine. La Force est déjà puissante en lui et il est un remarquable pilote de Podracer. Le maître Jedi Qui-Gon Jinn le découvre et entrevoit alors son immense potentiel. \r\nPendant ce temps, l’armée de droïdes de l’insatiable Fédération du Commerce a envahi Naboo, une planète pacifique, dans le cadre d’un plan secret des Sith visant à accroître leur pouvoir. Pour défendre la reine de Naboo, Amidala, les chevaliers Jedi vont devoir affronter le redoutable Seigneur Sith, Dark Maul.'),
(20, 'Batman Begins', 'Christopher Nolan', 'Super Héros', 'Christian Bale,Michael Caine,Liam Neeson,', 'https://images-na.ssl-images-amazon.com/images/I/41BorWGJegL._SX302_BO1,204,203,200_.jpg', 3.66667, 'https://youtu.be/jXrFsn9pcZY', 'Comment un homme seul peut-il changer le monde ? Telle est la question qui hante Bruce Wayne depuis cette nuit tragique où ses parents furent abattus sous ses yeux, dans une ruelle de Gotham City. Torturé par un profond sentiment de colère et de culpabilité, le jeune héritier de cette richissime famille fuit Gotham pour un long et discret voyage à travers le monde. Le but de ses pérégrinations : sublimer sa soif de vengeance en trouvant de nouveaux moyens de lutter contre l\'injustice.'),
(21, 'Batman The Dark Knight', 'Christopher Nolan', 'Super Héros', 'Christian Bale,Michael Caine,Heath Ledger,', 'http://fr.web.img2.acsta.net/medias/nmedia/18/63/97/89/18949761.jpg', 4, 'https://youtu.be/EXeTwQWrcwY', 'Dans ce nouveau volet, Batman augmente les mises dans sa guerre contre le crime. Avec l\'appui du lieutenant de police Jim Gordon et du procureur de Gotham, Harvey Dent, Batman vise à éradiquer le crime organisé qui pullule dans la ville. Leur association est très efficace mais elle sera bientôt bouleversée par le chaos déclenché par un criminel extraordinaire que les citoyens de Gotham connaissent sous le nom de Joker.'),
(22, 'Casino Royal', 'Martin Campell', 'Thriller', 'Daniel Craig', 'http://fr.web.img6.acsta.net/medias/nmedia/18/36/12/35/18674702.jpg', NULL, 'https://youtu.be/Tl9_c6wZiZU', 'Pour sa première mission, James Bond affronte le tout-puissant banquier privé du terrorisme international, Le Chiffre. Pour achever de le ruiner et démanteler le plus grand réseau criminel qui soit, Bond doit le battre lors d\'une partie de poker à haut risque au Casino Royale. La très belle Vesper, attachée au Trésor, l\'accompagne afin de veiller à ce que l\'agent 007 prenne soin de l\'argent du gouvernement britannique qui lui sert de mise, mais rien ne va se passer comme prévu.');

-- --------------------------------------------------------

--
-- Structure de la table `films_favorite`
--

CREATE TABLE `films_favorite` (
  `id` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_film` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `films_favorite`
--

INSERT INTO `films_favorite` (`id`, `id_user`, `id_film`) VALUES
(2, 1, 21),
(47, 1, 20),
(49, 2, 21),
(51, 1, 7),
(52, 1, 22),
(60, 1, 10),
(62, 3, 10),
(63, 3, 2),
(64, 6, 21),
(65, 6, 1),
(66, 1, 16),
(68, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(10) NOT NULL,
  `id_film` int(10) NOT NULL,
  `note` int(10) NOT NULL,
  `review` text,
  `date_review` datetime DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `note`
--

INSERT INTO `note` (`id`, `id_film`, `note`, `review`, `date_review`, `username`) VALUES
(1, 1, 5, 'Tres bon film, je le recommande', '2018-03-19 11:24:18', NULL),
(2, 1, 4, 'le meilleur film de ma vie', '2018-03-19 11:24:18', NULL),
(3, 1, 5, 'C\'est le meilleur film de ma vie', '2018-03-19 11:24:18', NULL),
(4, 1, 5, 'Interstellar est pour moi le film le plus ambitieux que j\'ai pu voir au cinéma', '2018-03-19 11:24:18', NULL),
(5, 1, 4, 'excellent film', '2018-03-19 11:24:18', NULL),
(6, 1, 3, 'sdffds', '2018-03-19 11:24:18', NULL),
(7, 1, 5, 'Super!', '2018-03-19 11:24:18', NULL),
(8, 1, 5, 'fdggfdg', '2018-03-19 11:24:18', NULL),
(9, 1, 1, 'h', '2018-03-19 11:24:18', NULL),
(10, 1, 1, 'gfhgfh', '2018-03-19 11:24:18', NULL),
(11, 1, 5, 'ghgfh', '2018-03-19 11:24:18', NULL),
(12, 1, 5, 'gfhgfhgh', '2018-03-19 11:24:18', NULL),
(13, 1, 0, 'fgd', '2018-03-19 11:24:18', NULL),
(14, 1, 0, 'Super !', '2018-03-19 11:24:18', NULL),
(15, 1, 5, 'Super !fg', '2018-03-19 11:24:18', NULL),
(16, 1, 0, 'oui monsieur', '2018-03-19 11:24:18', NULL),
(17, 1, 5, 'merci chrichri', '2018-03-19 11:24:18', NULL),
(18, 1, 1, 'vcbbv', '2018-03-19 11:24:18', NULL),
(19, 1, 5, 'fdgdggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', '2018-03-19 11:24:18', NULL),
(20, 1, 4, 'fdg', '2018-03-19 11:24:18', NULL),
(21, 1, 5, 'fdg', '2018-03-19 11:24:18', NULL),
(22, 1, 0, 'fdggggggggggggggggggggggfdg\nfgdfgdfg\nfgfh', '2018-03-19 11:24:18', NULL),
(23, 1, 5, 'gfhgfh\ngfhgfh\nhgjghj', '2018-03-19 11:24:18', NULL),
(24, 1, 5, 'gfngfhghgjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '2018-03-19 11:24:18', NULL),
(25, 1, 1, 'gfh', '2018-03-19 11:24:18', NULL),
(26, 1, 0, 'gfh', '2018-03-19 11:24:18', NULL),
(27, 1, 5, 'gfhgfh', '2018-03-19 11:24:18', NULL),
(28, 1, 0, 'gfdggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', '2018-03-19 11:24:18', NULL),
(29, 7, 5, 'hgfhg', '2018-03-19 11:24:18', NULL),
(30, 7, 1, 'fg', '2018-03-19 11:24:18', NULL),
(31, 7, 0, 'ghgfh', '2018-03-19 11:24:18', NULL),
(32, 7, 0, 'ghgfh', '2018-03-19 11:24:18', NULL),
(33, 10, 1, 'pas terrible...', '2018-03-19 11:24:18', NULL),
(34, 10, 4, 'le meilleur film de tous les temps', '2018-03-19 11:24:18', NULL),
(35, 10, 5, 'excellent!!!', '2018-03-19 11:24:18', NULL),
(36, 10, 2, 'assez bien ', '2018-03-19 11:24:18', NULL),
(37, 10, 3, 'magnifique', '2018-03-19 11:24:18', NULL),
(38, 10, 4, 'hgfhgf', '2018-03-19 11:24:18', NULL),
(39, 10, 4, 'bonjour voici ma critique', '2018-03-19 11:24:18', NULL),
(40, 10, 5, 'fdgdfg', '2018-03-19 11:24:18', NULL),
(41, 10, 5, 'dfgfdgfdgfdg', '2018-03-19 11:24:18', NULL),
(42, 10, 5, 'gfdgdfg', '2018-03-19 11:24:18', NULL),
(43, 10, 5, 'J\'adore!!!!', '2018-03-19 11:24:18', NULL),
(44, 10, 5, 'super bien !', '2018-03-19 11:24:18', NULL),
(45, 11, 5, 'super Film !', '2018-03-19 11:24:18', NULL),
(46, 1, 5, 'uuju', '2018-03-19 11:24:18', NULL),
(47, 1, 5, 'super film !', '2018-03-19 11:24:18', NULL),
(48, 1, 0, 'dfgfdg', '2018-03-19 11:24:18', NULL),
(49, 1, 1, 'nul', '2018-03-19 11:24:18', NULL),
(50, 1, 0, 'ret', '2018-03-19 11:24:18', NULL),
(51, 1, 0, 'bof bof...', '2018-03-19 11:24:18', NULL),
(52, 1, 5, 'bien bien...', '2018-03-19 11:24:18', NULL),
(53, 11, 5, 'tout est réactif', '2018-03-19 11:24:18', NULL),
(54, 11, 0, 'gfdg', '2018-03-19 11:24:18', NULL),
(55, 11, 5, 'dfgdfg', '2018-03-19 11:24:18', NULL),
(56, 11, 5, 'fdgfdg', '2018-03-19 11:24:18', NULL),
(57, 11, 4, 'bon', '2018-03-19 11:24:18', NULL),
(58, 11, 5, 'très bon ', '2018-03-19 11:24:18', NULL),
(59, 11, 5, 'oui', '2018-03-19 11:24:18', NULL),
(60, 2, 4, 'on va tenter une critique', '2018-03-19 11:24:18', NULL),
(61, 2, 0, 'test', '2018-03-19 11:24:18', NULL),
(62, 2, 5, 'oui', '2018-03-19 11:24:18', NULL),
(63, 2, 5, 'test', '2018-03-19 11:24:18', NULL),
(64, 2, 4, '4', '2018-03-19 11:24:18', NULL),
(65, 11, 3, 'bon', '2018-03-19 11:24:18', NULL),
(66, 11, 2, 'peu mieux faire', '2018-03-19 11:24:18', NULL),
(67, 11, 2, 'pas mal ', '2018-03-19 11:24:18', NULL),
(68, 11, 4, 'une bonne tuerie ce film !', '2018-03-19 11:24:18', NULL),
(69, 13, 4, 'bon film', '2018-03-19 11:24:18', NULL),
(70, 13, 2, 'mauvais film...', '2018-03-19 11:24:18', NULL),
(71, 12, 4, 'le meilleur des 3 !', '2018-03-19 11:24:18', NULL),
(72, 12, 2, 'bof', '2018-03-19 11:24:18', NULL),
(73, 12, 2, 'bof', '2018-03-19 11:24:18', NULL),
(74, 1, 4, 'On retrouve dans ce film toutes les qualités des films du génialissime Christopher Nolan. Après Mémento, Batman & Inception, voici son nouveau chef d\'oeuvre. Certes le début est un peu dur à suivre mais une fois l\'expédition lancée, on se délecte de chaque scène et les les 2h49 passent comme du petit lait. La fin est fantastique avec l\'apparition d\'une cinquième dimension. Ce n\'est pas le meilleur film de science fiction mais il est clairement dans le haut du panier du genre. Merci Monsieur Nolan. PS : Notons la performance de Matthew McConaughey qui sur sa deuxième partie de carrière est devenu un vrai acteur de talent. ', '2018-03-19 11:24:18', NULL),
(75, 1, 2, 'Un film long qui satisfera sans doute ceux qui n\'ont pas eu la chance de visionner les grands du genre... Interstellar, malgrés son côté épopée, se place dans la catégorie \"SF-ntelligente\" et quand on aborde ce genre, il faut y amener d\'autres grains à moudre que quelques notions pseudo-scientifiques sur les trous noirs la relativité et le fameux paradoxe temporel à la sauce métaphysique du tout en un. Avec Interstellar , on sait enfin oú l\'on en est ! Notre bonne civilisation est finalement à un niveau de connaissance toute proche du grand savoir, celui qui va résoudre notre problématique de l\'espace temps, du vouloir vivre et, bien entendu, de la place de l\'amour dans ce magnifique foure-tout écolo philosophyque... Perso, je ne vois pas ça comme celà. Quand l\'anticipation à d\'autres ambitions que de me divertir, je l\'aime mystérieuse, ambitieuse, profonde. A ce titre, ce film m\'a profondément déçu. ', '2018-03-19 11:24:18', NULL),
(76, 2, 3, 'e moins réussi de la saga car par rapport aux quatre autres opus, le scénario est beaucoup plus simpliste, mais tellement simple qu\'on en devine le dénouement dès le début... et c\'est bien dommage car ce scénario un peu trop léger est le seul point faible du film. Sinon le casting est pas mal, les décors sont beaux et les cascades sont parfaites ! C\'est quand même un bon film d\'action, mais plus proche de James Bond que de \"Mission Impossible\". ', '2018-03-19 11:24:18', NULL),
(77, 2, 1, 'Moi qui aime beaucoup la saga Mission Impossible et qui apprécie pas mal John Woo depuis Volte/Face, j\'ai été extrêmement déçu du 2ème volet de la saga. Les scènes soit disant \"Impossible\" ne sont pas transcendantes, le film est ultra lourd en terme d\'action et de délires (la course en moto et la lutte à la fin c\'est du grand n\'importe quoi). C\'est plus des soldats c\'est des héros de Marvel les gars. Et puis le film se résume à une succession d\'utilisation de masques... La mission pour empêcher un ex agent de vendre une arme biologique mortelle se révèle bien pauvre au niveau du scénario. Bref : il était impossible de rater un film sur cette saga mais John Woo a réussi ! ', '2018-03-19 11:24:18', NULL),
(78, 7, 4, 'La presse a toujours détestée Luc Besson, car il ne faisait pas du \"cinéma français\" mais du cinéma hollywoodien, du pure divertissement comme il le dit lui même, même pour le grand bleue, les critiques l\'avaient taclé à l\'époque, le film avait sévèrement bidé au festival de canne, puis tout a changé quand le public l\'a vue, énorme triomphe.\nCela n\'a pas changé, les critiques allument toujours continuellement Luc Besson, même si vue l\'évolution de sa filmographie, on peut en général aujourd\'hui être d\'accord avec eux.\nLéon a lui aussi subi cet acharnement de la presse, c\'est gratuit ca mange pas de pain.\nJe l\'ai revu récemment a l\'occasion de son portage en 4K, et même après tout ce temps, il est toujours aussi bon, probablement le meilleur de Besson..\nJe vous le conseille en directors cut, l\'autre version étant allégée de 30 précieuses minutes. Un classique 4.5/5', '2018-03-19 11:24:18', NULL),
(79, 7, 1, 'J\'ai voulu voir ce film après toutes les bonnes critiques de mon entourage. Je dois dire que j\'ai été très déçue. J\'ai trouvé ce film long et terriblement mal filmé. En outre, l\'apologie de la violence gratuite faite dans ce film m\'a beaucoup gêné tout comme la faiblesse du scénario et du jeu d\'acteur. Un navet signé Besson. Ce réalisateur a vraiment le don de passer à chaque fois à côté de son sujet. ', '2018-03-19 11:24:18', NULL),
(80, 10, 5, 'Le meilleur blockbuster de 2010 a pour thème la délicate différenciation entre les mondes réels et rêvés en créant des personnages utilisant une étrange technologie pour pénétrer, et manipuler, les rêves d\'autrui. Tout le génie scénaristique des frères Nolan repose sur l’explication qu’ils arrivent à donner à l’utilisation de cette science, afin de clarifier la vision du film à priori incompréhensible. Le réalisateur parvient en plus à faire planer un certain doute autour de la distinction entre le réel et l\'imaginaire, en particulier dans la scène de fin qui reste sujet à controverse tandis que les scènes où fusent les effets spéciaux impressionnants sont incontestablement oniriques. Cette incertitude constante aurait pu être le point de départ à une vaste interrogation philosophique, telle qu’elle fut exploitée dans Matrix, ou à la mise en place d’une sensation de paranoïa pesant, un peu comme dans Total recall, mais ici l’intrigue se révèle finalement bien trop simple pour rendre le concept efficace et ne semble finalement être que le prétexte à une série de magnifiques effets visuels. ', '2018-03-19 11:24:18', NULL),
(81, 10, 2, 'Inception rime plutôt avec déception ! Intrigué par cette avalanche de critiques (presse et spectateurs) j\'étais très (trop) confiant ! Bien mal m\'en a pris ! Que d\'agitation, de gesticulation inutiles ! Aucune émotion ! Des acteurs au jeu mécanique qui nous noient dans une avalanche de bagarres interminables ! Et pourtant l\'idée de départ était excellente que ce monde de rêves imbriqués... Malgré de bons effets spéciaux et de quelques scènes réussies, on passe le plus souvent à côté d\'un monde qui aurait pu et dû être teinté d\'originalité, d\'étrangeté, ce qui fait d\'ailleurs toute la singularité du rêve ! De plus, la confusion est ici souvent de mise et plonge le spectateur dans une certaine incompréhension. À vouloir mélanger les genres et faire toujours dans l\'excès comme ici, on essaie d\'attirer le maximum de public et ça marche ! Il y avait pourtant bien mieux à faire avec ces ingrédients ! Dommage ! ', '2018-03-19 11:24:18', NULL),
(82, 11, 4, 'Après le succès de la phénoménale trilogie Batman de Christopher Nolan, il semblait logique que DC Comics, éditeur des aventures du chevalier noir et de l’homme de fer, et Warner Bros. fassent appel à l’expertise du réalisateur pour lancer le reboot d’un Superman version 2013, après la tentative ratée de Bryan Singer et de son Superman Returns. En duo avec David S. Goyer, son co-scénariste de Batman Begins, Nolan a donc développé l’histoire de Man of Steel et supervisé le projet dont la réalisation est revenue à Zack Snyder, connu pour 300 et Watchmen. Dans la lignée des derniers Batman, Man of Steel est un film sombre, beaucoup moins lisse que la concurrence de Marvel. Ceci dit, si j’évoque l’implication de Christopher Nolan sur le projet et une ambiance assez sombre, ne vous attendez pas au même rendu que The Dark Knight, car Man of Steel choisi sa propre voie et offre ainsi le meilleur chemin possible à son héros. Réalisateur aux films très léchés, Zack Snyder prend ici le contrepied visuel des ses long-métrages précédents et privilégie cette fois les plans en mouvement et la caméra à l’épaule qui confère à ce Man of Steel un aspect très organique. Cette approche plus « brute » renforce la noirceur du film et permet de nous offrir entre autre les plus belles séquences de vol jamais vues. Pas de fond vert cheap, mais un Superman volant plus vrai que nature, tout simplement à couper le souffle. D’ailleurs cette expression « à couper le souffle » est sans doute le meilleur qualificatif du film tant Man of Steel ne s’arrête jamais de nous surprendre scène après scène. Si pendant ses 2h20 le film prend le temps qu’il faut pour s’attacher au développement de son personnage principal et aux relations de ce dernier, qu’il s’agisse de ses parents (Kevin Costner et Diane Lane parfaits) ou de Lois Lane (Amy Adams épatante), Man of Steel est avant tout un des plus impressionnants films d’action jamais fait. Non seulement le film de Zack Snyder suite un rythme totalement fou de bout en bout, mais ses séquences d’action ont surtout de quoi faire pâlir Avengers… Bataille sur Krypton, Tornade ou final démesuré au coeur de Metropolis, Man of Steel parvient à amener de l’action à n »importe quel moment et ce sans jamais perdre notre attention ou notre engouement, au contraire on en redemanderait presque tellement l’ensemble est exécuté avec brio. L’action, l’action, l’action a pour habitude de me perdre, si l’histoire ne suit pas, mais la surenchère du film de Zack Snyder est ici parfaitement à sa place pour mettre en avant toute la grandeur de Superman. Bande originale signée Hans Zimmer, casting de premier choix dont un Henry Cavill bodybuidldé, Man of Steel met sur la table les arguments qu’il faut pour nous séduire et nous offrir le meilleur spectacle possible. Véritablement conquis par cette version 2013 je suis prêt à passer l’éponge sur les quelques effets visuels ratés, et des raccourcis scénaristiques dus à un montage peut-être trop court (compte-tenu de la densité de l’histoire) tant l’engagement des cinéastes est débordant. La claque cinématographique du moment, absolument époustouflant ! ', '2018-03-19 11:24:18', NULL),
(83, 11, 2, '\"Man of steel\" démarre comme un pur produit de sciences fiction à tel point que l\'on croit s\'être trompé de salle ! Et au fond, cela semble finalement intéressant jusqu\'au moment où la sauce s\'allonge un peu trop sur cette partie de l\'histoire pour nous plonger dans des règlements de compte qui prennent à la longue trop d\'importance... De retour sur terre enfin, on assiste aux premiers exploits d\'un Superman la mâchoire crispée, le charisme en berne et le regard éteint ! C\'est en effet, le plus souvent que Superman semble plutôt empoté et maladroit, avec de surcroît un manque d\'assurance indéniable ! Les personnages secondaires ne valent guère mieux et correspondent à des caricatures en général ! Les méchants de Krypton qui viennent récupérer notre héros vont semer une belle pagaille sur la Terre; pagaille qui sera d\'ailleurs entachée de pas mal d\'incohérences et de confusions ! La fin se complait en une terrible lutte qui dure bien trop longtemps en détruisant inexorablement tout sur son passage... Au final, l\'ensemble malgré de bonnes idées et un univers pas désagréable reste plutôt indigeste et pesant, ceci sans doute à cause d\'une overdose de bagarres et d\'effets spéciaux sans compter qui se prennent très au sérieux ! Un peu d\'humour au second degré aurait alléger le menu du spectateur qui s\'en serait du coup mieux porté ! ', '2018-03-19 11:24:18', NULL),
(84, 12, 4, 'Sortit en 2008, Iron Man, avec pour acteur principal Robert Drowney Jr., m\'a fait découvrir le réalisateur Jon Favreau. En effet, la mise en scène est efficace, maîtrisée et met en valeur comme il le faut le héros de métal. Le scénario, écrit par de multiples personnalités dont je ne pourrai citer le nom et les oeuvres pour ne pas que mon analyse ne soit trop longue, ne transcende pas le genre mais, en s\'inspirant suffisamment du comics d\'origine, parvient à nous offrir des scènes spectaculaires au possible et paraît vraiment crédible lorsqu\'on y fait attention. Les divers personnages sont très approfondis et leur psychologie suffisamment bien travaillée, en plus d\'être attachants. Globalement, c\'est une excellente adaptation, qui malheureusement ne brillera pas par sa suite décevante. ', '2018-03-19 11:24:18', NULL),
(85, 12, 1, 'Mouais ... c\'est plutôt bien réalisé, les effets spéciaux sont vraiment bien foutus, c\'est même parfois drôle. A condition d\'avoir laissé ses neurones à l\'entrée, on pourrait presque trouver passionnante cette histoire de super-héro cabotin qui découvre subitement que fabriquer des armes c\'est pas bien, on pourrait presque oublier l\'apologie sous-jacente de la supériorité de la technologie américaine, et pourquoi pas tomber sous le charme d\'une Gwyneth Paltrow transformée en potiche. Dommage que dans l\'épilogue le réalisateur n\'ait pu éviter de tomber dans la surenchère pyrotechnique, le film n\'en eut été que plus digeste. ', '2018-03-19 11:24:18', NULL),
(86, 13, 4, 'Ce blockbuster remplit son contrat. Un deuxième volet plus explosif avec ses scènes d\'actions spectaculaires et moins complexe que le premier. Malgré quelques longueurs, le film reste captivant jusqu\'à la fin. Robert Downey Jr. est toujours excellent dans le rôle d\'Iron Man, Scarlett Johanson interprète la veuve noire (déjà vu dans Avengers), Mickey Rourke est crédible en russe. Bien évidemment, on attends le troisième avec impatience !! ', '2018-03-19 11:24:18', NULL),
(87, 13, 2, 'un bon film mais je reste déçu ! Autant Iron Man (le premier) était accrocheur et nous dévoilait les origines du Vengeur de Métal, autant Iron Man 2 piétine et ne s\'envole pas ! Reste la performance des acteurs (sauf Paltrow a certains moments)! Trop de Iron Man tue Iron Man: les blagues ne sont pas toujours très bonnes et il y a seulement 2 scènes d\'actions ! Mais bon espérons que le 3 gommera ses fautes ! ', '2018-03-19 11:24:18', NULL),
(89, 1, 5, 'bon film ', '2018-03-19 11:24:18', NULL),
(90, 1, 0, 'mauvais film', '2018-03-19 11:24:18', NULL),
(91, 1, 2, 'fdg', '2018-03-19 11:24:18', NULL),
(92, 16, 4, 'bon', '2018-03-19 11:24:18', NULL),
(93, 16, 1, 'jhgj', '2018-03-19 11:24:18', NULL),
(94, 1, 1, 'ytryty', '2018-03-19 11:24:18', NULL),
(95, 1, 0, 'oui', '2018-03-19 11:24:18', NULL),
(96, 1, 1, 'zer', '2018-03-19 11:24:18', NULL),
(97, 1, 2, 'dsf', '2018-03-19 11:24:18', NULL),
(98, 1, 2, 'gdfgfd', '2018-03-19 11:24:18', NULL),
(99, 1, 1, 'df', '2018-03-19 11:24:18', NULL),
(100, 1, 1, '', '2018-03-19 11:24:18', NULL),
(101, 1, 1, 'gfh', '2018-03-19 11:24:18', NULL),
(102, 1, 2, 'sdf', '2018-03-19 11:24:18', NULL),
(103, 2, 3, 'hgfh', '2018-03-19 11:24:18', NULL),
(104, 2, 2, 'ffg', '2018-03-19 11:24:18', NULL),
(105, 1, 0, 'hgj', '2018-03-19 11:24:18', NULL),
(106, 1, 0, 'yghj', '2018-03-19 11:24:18', NULL),
(107, 1, 0, 'jhhgj', '2018-03-19 11:24:18', NULL),
(108, 1, 0, 'fdg', '2018-03-19 11:24:18', NULL),
(109, 2, 0, 'rtrty', '2018-03-19 11:24:18', NULL),
(110, 2, 0, '<b>test</b>', '2018-03-19 11:24:18', NULL),
(111, 10, 0, 'très bon film', '2018-03-19 11:24:18', NULL),
(112, 10, 3, 'bien', '2018-03-19 11:24:18', NULL),
(113, 10, 3, 'gfdg', '2018-03-19 11:24:18', NULL),
(114, 10, 4, 'iiu', '2018-03-19 11:24:18', NULL),
(115, 10, 5, 'ghgfh', '2018-03-19 11:24:18', NULL),
(116, 10, 5, 'ghgfh', '2018-03-19 11:24:18', NULL),
(117, 16, 3, 'pas mal ', '2018-03-19 11:24:18', NULL),
(118, 10, 4, 'bien', '2018-03-19 11:24:18', NULL),
(119, 10, 3, 'ghgh', '2018-03-19 11:24:18', NULL),
(120, 10, 3, 'pas mal', '2018-03-19 11:24:18', NULL),
(121, 10, 3, 'fg', '2018-03-19 11:24:18', NULL),
(122, 10, 0, 'oui', '2018-03-19 11:24:18', NULL),
(123, 10, 3, 'ret', '2018-03-19 11:24:18', NULL),
(124, 10, 4, 'fg', '2018-03-19 11:24:18', NULL),
(125, 10, 3, 'sdf', '2018-03-19 11:24:18', NULL),
(126, 10, 0, 'dfgfg', '2018-03-19 11:24:18', NULL),
(127, 10, 4, 'dsfdf', '2018-03-19 11:24:18', NULL),
(128, 10, 4, 'bien', '2018-03-19 11:24:18', NULL),
(129, 10, 3, 'oui', '2018-03-19 11:24:18', NULL),
(130, 10, 4, 'koiu', '2018-03-19 11:24:18', NULL),
(131, 10, 4, 'fdg', '2018-03-19 11:24:18', NULL),
(132, 1, 4, 'nice !!', '2018-03-19 11:24:18', NULL),
(133, 1, 4, 'oui', '2018-03-19 11:24:18', NULL),
(134, 1, 3, 'fg', '2018-03-19 11:24:18', NULL),
(135, 1, 4, 'fhgfghfhgfh', '2018-03-19 11:24:18', NULL),
(136, 21, 5, 'Un chef d\'oeuvre ', '2018-03-19 11:24:18', NULL),
(137, 20, 3, 'bon film', '2018-03-19 11:24:18', NULL),
(138, 17, 4, 'super !', '2018-03-19 11:24:18', NULL),
(139, 1, 5, 'j\'aime sa performance ', '2018-03-19 11:24:18', NULL),
(140, 1, 3, 'pas mal ce film dit donc ', '2018-03-19 11:24:18', NULL),
(141, 1, 3, 'bon film, ça se regarde bien le samedi soir nottament  ', '2018-03-19 11:24:18', NULL),
(142, 1, 4, 'oui', '2018-03-19 11:24:18', NULL),
(143, 1, 2, 'passable', '2018-03-19 11:24:18', NULL),
(144, 1, 2, 'passable2', '2018-03-19 10:27:32', NULL),
(145, 1, 0, 'test3_time_stamp', '2018-03-19 10:33:36', NULL),
(146, 19, 0, 'first!!!', '2018-03-19 11:50:02', NULL),
(147, 1, 4, 'j\'aime ce film', '2018-03-26 12:14:56', NULL),
(148, 1, 3, 'yes', '2018-04-09 14:20:28', NULL),
(149, 21, 4, 'Le meilleur batman tout simplement !!!', '2018-04-14 16:21:22', 'kledOTP'),
(150, 21, 1, 'pas top comme Batman', '2018-04-14 16:33:15', 'kledOTP'),
(151, 21, 4, 'Top', '2018-04-14 16:33:40', 'dorianjs'),
(152, 21, 5, 'Je dis oui ', '2018-04-14 16:34:05', 'kledOTP'),
(153, 10, 0, 'un suspense de bout en bout', '2018-04-15 07:44:20', 'Marie'),
(154, 21, 5, 'Film hors du commun !!!!', '2018-04-15 19:09:43', 'dorianjs'),
(155, 20, 4, 'bon film batman', '2018-04-16 12:48:52', 'dorianjs'),
(156, 20, 4, 'bon film batman', '2018-04-16 12:48:52', 'dorianjs'),
(157, 1, 3, 'bon film !!!', '2018-04-17 10:39:09', 'dorianjs');

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `id_film` int(10) NOT NULL,
  `critique` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `review`
--

INSERT INTO `review` (`id`, `id_film`, `critique`) VALUES
(1, 1, 'tres bon film! Je le recommande'),
(2, 1, 'j\'ai vraiment adore');

-- --------------------------------------------------------

--
-- Structure de la table `temp_actor`
--

CREATE TABLE `temp_actor` (
  `id` int(10) NOT NULL,
  `actor_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `temp_actor`
--

INSERT INTO `temp_actor` (`id`, `actor_name`) VALUES
(1, 'Henry Calvill');

-- --------------------------------------------------------

--
-- Structure de la table `temp_di`
--

CREATE TABLE `temp_di` (
  `id` int(11) NOT NULL,
  `id_film` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `temp_di`
--

INSERT INTO `temp_di` (`id`, `id_film`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Structure de la table `temp_user`
--

CREATE TABLE `temp_user` (
  `id` int(10) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `temp_user`
--

INSERT INTO `temp_user` (`id`, `id_user`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `photo` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `photo`) VALUES
(1, 'dorianjs', 'lpdip:17', 'dkuszli@gmail.com', 'https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/17353558_1830444997224228_5043620791604605767_n.jpg?_nc_cat=0&oh=073ff8365ddfec82f97a65ea040abf34&oe=5B2B7310'),
(2, 'kledOTP', 'iutrt', 'dorian.kuszli@etu.univ-nantes.fr', 'aaaaa'),
(3, 'Marie', 'enervée', 'Marie@saint-brévin.com', 'aaaaa'),
(6, 'dorian44350', 'lpdip:17', 'kuszlid@gmail.com', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_film_actor_ex` (`id_film`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `films_favorite`
--
ALTER TABLE `films_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user` (`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_user_2` (`id_user`),
  ADD KEY `id_user_3` (`id_user`),
  ADD KEY `id_film_2` (`id_film`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_film_ex` (`id_film`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id_ex` (`id_film`);

--
-- Index pour la table `temp_actor`
--
ALTER TABLE `temp_actor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `temp_di`
--
ALTER TABLE `temp_di`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `temp_user`
--
ALTER TABLE `temp_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_temp` (`id_user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `acteurs`
--
ALTER TABLE `acteurs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `films_favorite`
--
ALTER TABLE `films_favorite`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `temp_actor`
--
ALTER TABLE `temp_actor`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `temp_di`
--
ALTER TABLE `temp_di`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `temp_user`
--
ALTER TABLE `temp_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD CONSTRAINT `acteurs_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `films_favorite`
--
ALTER TABLE `films_favorite`
  ADD CONSTRAINT `films_favorite_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`),
  ADD CONSTRAINT `films_favorite_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`);

--
-- Contraintes pour la table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
