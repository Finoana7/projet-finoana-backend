-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 18 déc. 2023 à 07:29
-- Version du serveur : 11.2.2-MariaDB
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_electronique_des_documents`
--

-- --------------------------------------------------------

--
-- Structure de la table `confirmer`
--

DROP TABLE IF EXISTS `confirmer`;
CREATE TABLE IF NOT EXISTS `confirmer` (
  `numero_sortie` int(11) NOT NULL,
  `numero_portail` int(11) NOT NULL,
  `etat_sortie` varchar(10) NOT NULL,
  `date_sortie_portail` datetime NOT NULL,
  PRIMARY KEY (`numero_sortie`,`numero_portail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entree_depot`
--

DROP TABLE IF EXISTS `entree_depot`;
CREATE TABLE IF NOT EXISTS `entree_depot` (
  `numero_entree` int(11) NOT NULL AUTO_INCREMENT,
  `date_entree` datetime NOT NULL,
  `facture_entree` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`numero_entree`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `portail`
--

DROP TABLE IF EXISTS `portail`;
CREATE TABLE IF NOT EXISTS `portail` (
  `numero_portail` int(11) NOT NULL,
  PRIMARY KEY (`numero_portail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `numero_poste` int(11) NOT NULL AUTO_INCREMENT,
  `nom_poste` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_poste`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `securiser`
--

DROP TABLE IF EXISTS `securiser`;
CREATE TABLE IF NOT EXISTS `securiser` (
  `numero_portail` int(11) NOT NULL,
  `numero_securite` int(11) NOT NULL,
  PRIMARY KEY (`numero_portail`,`numero_securite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `securite`
--

DROP TABLE IF EXISTS `securite`;
CREATE TABLE IF NOT EXISTS `securite` (
  `numero_securite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_securite` varchar(50) NOT NULL,
  `prenom_securite` varchar(50) NOT NULL,
  PRIMARY KEY (`numero_securite`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sortie_depot`
--

DROP TABLE IF EXISTS `sortie_depot`;
CREATE TABLE IF NOT EXISTS `sortie_depot` (
  `numero_sortie` int(11) NOT NULL AUTO_INCREMENT,
  `date_sortie` datetime NOT NULL,
  `facture_sortie` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `numero_immatricule` varchar(10) NOT NULL,
  PRIMARY KEY (`numero_sortie`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transport_depot`
--

DROP TABLE IF EXISTS `transport_depot`;
CREATE TABLE IF NOT EXISTS `transport_depot` (
  `numero_immatricule` varchar(10) NOT NULL,
  `designe_transport` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_immatricule`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tusers`
--

DROP TABLE IF EXISTS `tusers`;
CREATE TABLE IF NOT EXISTS `tusers` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `numero_poste` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `profile` int(10) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `function` varchar(100) NOT NULL,
  `company` int(5) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `custom1` varchar(100) NOT NULL,
  `custom2` varchar(100) NOT NULL,
  `disable` int(1) NOT NULL,
  `chgpwd` int(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_pwd_chg` date NOT NULL,
  `auth_attempt` int(2) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `skin` varchar(10) NOT NULL,
  `default_ticket_state` varchar(10) NOT NULL,
  `dashboard_ticket_order` varchar(200) NOT NULL,
  `limit_ticket_number` int(5) NOT NULL,
  `limit_ticket_days` int(5) NOT NULL,
  `limit_ticket_date_start` date NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'fr_FR',
  `ldap_guid` varchar(50) NOT NULL,
  `ldap_sid` varchar(64) NOT NULL,
  `azure_ad_id` varchar(64) NOT NULL,
  `planning_color` varchar(7) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `company` (`company`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `tusers`
--

INSERT INTO `tusers` (`id_user`, `numero_poste`, `login`, `password`, `salt`, `firstname`, `lastname`, `profile`, `mail`, `phone`, `mobile`, `fax`, `function`, `company`, `address1`, `address2`, `zip`, `city`, `custom1`, `custom2`, `disable`, `chgpwd`, `last_login`, `last_pwd_chg`, `auth_attempt`, `ip`, `skin`, `default_ticket_state`, `dashboard_ticket_order`, `limit_ticket_number`, `limit_ticket_days`, `limit_ticket_date_start`, `language`, `ldap_guid`, `ldap_sid`, `azure_ad_id`, `planning_color`) VALUES
(0, 0, 'aucun', '', '', '', 'Aucun', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 1, 0, '2016-10-21 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '2016-10-21', 'fr_FR', '', '', '', ''),
(1, 0, 'admin', '$2y$10$.3a9/Xpa.B/SkyZag2LUUeXStwB4gveaJ9plcRxzRlD9RU.Wt4Gt2', 'salt', 'RANAIVOARISOA ANDRIAMBOAVONJY', 'Hery', 4, 'vonjyandriah@live.com', '', '+261344748990', '0', 'Chef de département SI ', 0, '', '', '', '', '', '', 0, 0, '2023-05-25 12:12:41', '2023-03-14', 0, '192.168.100.179', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(5, 0, '1244', '$2y$10$EHn66ShuOzNXiGL6EXcbxebK44s30D3VYXs9yyqEXlUNHhLw5RlK6', 'salt', 'Njara', 'RAFIDISON', 0, 'njara.rafidison@mellis.mg', '', '+261344948010', '', 'TechIT Mon Badge est à mettre à jour', 1, '', '', '', '', '', '', 0, 0, '2023-05-30 12:34:33', '2023-03-21', 0, '192.168.100.145', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(6, 0, 'delete_user_gs', '', '', 'Utilisateur', 'Supprimé', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(8, 0, '1425', '$2y$10$5NddZer3RX//.QBYRybR3.CSgYVuA0m/oBXfpWwxNFn1PqaxviVki', '', 'RATONIRINA ANDRIANAVALONA', 'Elie Radotiana Zo', 0, 'zo.andrianavalona@mellis.mg', '', '+261344948033', '', 'Assistant informatique', 1, 'Lot ITZ 65bis Behenjy Itaosy', '', '101', 'Antananarivo', '', '', 0, 0, '2023-03-30 12:29:00', '2023-03-15', 0, '192.168.100.231', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(9, 0, '1410', '$2y$10$VbiXhplcIBA2tJ7axwotsOHNLm97e5uPqjWAN32i6Ajm3xR4.dtIO', '', 'RAKOTONIRINA', 'Nicco', 2, 'sup.compta@mellis.mg', '0344748515', '0344748515', '', 'Superviseur Comptabilité', 1, 'Lot IV Y Anosipatrana Ouest', 'Lot IV Y Anosipatrana Ouest', '101', 'ANTANANARIVO', '', '', 0, 0, '0000-00-00 00:00:00', '2023-03-15', 0, '', 'skin-1', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(10, 0, 'Manda', '$2y$10$5HPSPEgvVrt1OYS6.ewQQ.5QQmGI/76glbobaMGwGx0L05iqeUXI6', '', 'RANARIVELO', 'Manda Tiavina', 2, 'admin@desinfectpro.com', '', '0344948205', '', '', 2, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '2023-03-21', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(11, 0, '', '', '', 'Softwell', 'Sitraka Softwell', 2, '', '', '', '', '', 4, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(12, 0, '1286', '$2y$10$Hb3eU3pi4NKzdRUexXpBAO3iJCdBgIb1GuP6MT1GnSSwm.LaRNM7C', '', 'VONIFANJA', 'Ninah Fanirisoa', 2, 'assistrh@mellis.mg', '', '034 49 480 47', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '2023-03-21', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(13, 0, 'José', '$2y$10$4kz8Az3.Y5Uj.ghxfPsYkeHS6faBVoumHipwBX0obcQCn8336LimC', '', 'RAVONJISON JEAN', 'José Bruno', 2, 'jose.ravonjison@ibrandi.mg', '', '034 47 486 06', '', '', 3, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '2023-03-21', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(14, 0, 'Sandy', '$2y$10$XYYbSvNFP.ECqC5F8UAXauUBC4DgQihN0TUzhaeVuI6lwp3ooqGUa', '', 'RAKOTMALALA', 'Sandy Herizo', 0, 'sandy.info@dzama.mg', '', '034 47 001 01', '', '', 5, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '2023-03-21', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(15, 0, '', '', '', 'RAHAGAHARITIANA', 'Valisoa Safidy', 2, 'safidy.rahaga@ibrandi.mg', '', '034 47 48 870', '', '', 3, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(16, 0, '', '', '', 'RAHARINIAINA', 'Jeannot', 2, 'jeannot.rahariniaina@mellis.mg', '', '034 49 480 11', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(17, 0, '', '', '', 'RANDRIANJAFY', 'Miora', 2, '', '', '', '', '', 11, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(18, 0, '', '', '', 'RAHARSON ', 'Larissa', 2, '', '', '', '', '', 6, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(19, 0, '', '', '', 'Mamenosoa', '', 2, 'gpsmellis@mellis.mg', '0344748827', '0344748827', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(20, 0, '', '', '', 'RAZAZAMAHANDRISOA', 'Adelle', 2, '', '', '+261 34 47 485 73', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(21, 0, '', '', '', 'Pina', '', 2, '', '0344748627', '0344748627', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(22, 0, '', '', '', 'Rojo', 'Dépôt Nosy Be', 2, 'depot.nosybehv@mellis.mg', '', '034 47 487 96', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(23, 0, '', '', '', 'ANDRIAMAROMIZAH', 'Mirana Z.', 2, 'comm@mellis.mg', '', '034 47 484 44', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(24, 0, '', '', '', 'Lova Tiana', 'MALALARISOA', 2, 'mlovatiana@gmail.com', '', '034 47 488 47', '', '', 3, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(25, 0, '', '', '', 'Rakotoarison', 'Sarindraniaina', 2, 'sarindraniaina@dzama.mg', '', '034 47 484 34', '', '', 5, '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(26, 0, '', '', '', 'Harilala', '', 2, '', '0344909935', '0344909935', '', '', 1, '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(27, 0, 'V2661', '$2y$10$1BTLyKd6lrW33PoZ26.9SOBMKbzgqmqxNmWoGRlvFHPXtOtesWL4.', '', 'RAKOTOARIMALALA', 'Dinot', 0, '', '', '034 47 484 36', '', '', 5, '', '', '', '', '', '', 0, 0, '2023-04-04 16:38:01', '2023-03-31', 0, '192.168.100.231', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(28, 0, '', '', '', 'Oly', '', 2, '', '0344748556', '0344748556', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(29, 0, '', '', '', 'RAKOTONIAINA', 'Rova (Haingompahatsiarovana)', 2, 'raf@maboisson.mg', '', '034 47 484 72 ', '', '', 7, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(30, 0, '', '', '', 'RAJOELISON', 'Haja', 2, 'haja.rajoelison@ibrandi.mg', '', '034 47 001 81', '', '', 3, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(31, 0, '', '', '', '', 'Lanto', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(32, 0, '', '', '', '', 'Avotra', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(33, 0, '', '', '', '', 'Mialy', 2, '', '', '', '', '', 8, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(34, 0, '', '', '', '', 'José', 2, '', '', '', '', '', 8, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(35, 0, '', '', '', 'RAKOTOSON', 'Hasina', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(36, 0, '', '', '', 'RANAIVOARISOA', 'Andry', 2, 'andry.ranaivoarisoa@mellis.mg', '', '034 47 485 06', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(37, 0, '', '', '', 'ANDRIANJAFIARISON', 'Elias', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(38, 0, '', '', '', 'RAHARISON', 'Avoko', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(39, 0, '1481', '$2y$10$QVd8AEo4JZ53ioheCneCaujEv4hoPJ10WsGom6MF4VO4QhrxdCz2i', '', 'RAKOTONIAINA', 'Harilala', 2, '', '', '+261 34 49 099 35', '', '', 1, '', '', '', '', '', '', 0, 0, '2023-04-13 10:34:40', '2023-04-11', 0, '192.168.100.10', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(40, 0, '', '', '', 'RAZAFIMAHATRATRA', 'Prisca Felaniaina ', 2, '', '', '+261 34 47 48 714', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(41, 0, '', '', '', 'RAKOTOMAMPIANINA', 'Tiana', 2, '', '', '034 47 48 505', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(42, 0, '', '', '', '', 'Rijavola', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(43, 0, '', '', '', '', 'André', 2, '', '', '', '', '', 5, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(44, 0, 'V1594', '$2y$10$bcs3YE9rWDH1im83LKAM.u1OFGGCXKPY7DKZ4GCEi08dPQDE2sYBK', '', 'Rakotoarison', 'Sarindraniaina', 0, 'sarindraniaina@dzama.mg', '', '034 47 484 34', '', '', 5, '', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', '2023-05-02', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(45, 0, '', '', '', '', 'Voahirana', 2, '', '', '', '', '', 5, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(46, 0, '', '', '', 'RAOBELINA', 'Fanja', 2, 'admin@dzama.mg', '', ' +261 34 47 484 05', '', '', 5, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(47, 0, '', '', '', '', 'Thonny', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(48, 0, '', '', '', '', 'Toky', 2, '', '', '', '', '', 10, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(49, 0, '', '', '', '', 'Rina', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(50, 0, '', '', '', '', 'Santatra ', 2, '', '', '+261 34 47 48 554', '', '', 12, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(51, 0, '', '', '', '', 'Fitiavana', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(52, 0, '', '', '', 'RAVAOARISOA', 'Lalaina', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(53, 0, '', '', '', 'ACM', 'Denis', 2, 'deni_acm@mellis.mg', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(54, 0, '', '', '', 'ACM', 'Kanto', 2, '', '', '', '', '', 0, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(55, 0, 'stage', '$2y$10$L4Dt.XtIo6vCJD/BwZapV.Hm6whvkdJZsNXHn7pm4gY0S.2IVuL7C', '', 'stage', 'stage', 0, '', '', '', '', '', 0, '', '', '', '', '', '', 0, 0, '2023-05-08 15:44:47', '2023-05-08', 0, '192.168.100.209', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(56, 0, '', '', '', 'Lucie', 'Lucie', 2, '', '', '034 47 488 48', '', '', 7, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(57, 0, '', '', '', 'RETOURVIDE', 'Narindra', 2, '', '', '034 47 488 32', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(58, 0, '', '', '', 'RAKOTOSON', 'Hasina', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(59, 0, '', '', '', 'ACHAT', 'Vola', 2, 'admincom@mellis.mg', '', '034 47 48802', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(60, 0, '', '', '', 'Maelle', 'Maelle', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(61, 0, '', '', '', 'Malagasy Boisson', 'Ursulla', 2, '', '', '', '', '', 7, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(62, 0, '', '', '', 'Malagasy Boisson', 'Nasandratra', 2, '', '', '', '', '', 7, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(63, 0, '', '', '', 'Malagasy Boisson', 'Mahefa', 2, '', '', '', '', '', 7, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(64, 0, '', '', '', 'Mamisoa', 'DEPOT ANTSIRABE', 2, '', '', '', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(65, 0, '', '', '', 'Rasofomanana', 'Zo', 2, '', '', '034 47 488 35', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(66, 0, '', '', '', 'ECONOMAT', 'Faniry', 2, '', '', '034 49 480 06', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', ''),
(67, 0, '', '', '', 'RAFANOMEZANTSOA', 'Billy', 2, 'rh@mellis.mg', '', '034 47 488 05', '', '', 1, '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00', 0, '', '', '', '', 0, 0, '0000-00-00', 'fr_FR', '', '', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
