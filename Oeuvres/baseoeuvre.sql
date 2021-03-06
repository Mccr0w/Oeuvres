-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Ven 15 Mars 2013 à 10:48
-- Version du serveur: 5.5.27-log
-- Version de PHP: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `baseoeuvre`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE IF NOT EXISTS `adherent` (
  `id_adherent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_adherent` varchar(100) NOT NULL,
  `prenom_adherent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_adherent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `adherent`
--

INSERT INTO `adherent` (`id_adherent`, `nom_adherent`, `prenom_adherent`) VALUES
(1, 'LESSERTISSEUR', 'Christelle'),
(2, 'MARTIN', 'Laurent'),
(3, 'DUPONT', 'Didier'),
(4, 'DURANT', 'Michel'),
(5, 'CHOPIN', 'Daniel'),
(6, 'MOZART', 'Albert'),
(7, 'FRUCCI', 'Fraise');

-- --------------------------------------------------------

--
-- Structure de la table `oeuvrepret`
--

CREATE TABLE IF NOT EXISTS `oeuvrepret` (
  `id_oeuvrepret` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre_oeuvrepret` varchar(200) NOT NULL,
  `id_proprietaire` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_oeuvrepret`),
  KEY `id_proprietaire` (`id_proprietaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `oeuvrepret`
--

INSERT INTO `oeuvrepret` (`id_oeuvrepret`, `titre_oeuvrepret`, `id_proprietaire`) VALUES
(1, 'Oeuvre en pret 1', 1000),
(2, 'Oeuvre en pret 2', 1000);

-- --------------------------------------------------------

--
-- Structure de la table `oeuvrevente`
--

CREATE TABLE IF NOT EXISTS `oeuvrevente` (
  `id_oeuvrevente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre_oeuvrevente` varchar(200) NOT NULL,
  `etat_oeuvrevente` varchar(1) NOT NULL,
  `prix_oeuvrevente` float NOT NULL,
  `id_proprietaire` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_oeuvrevente`),
  KEY `id_proprietaire` (`id_proprietaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10007 ;

--
-- Contenu de la table `oeuvrevente`
--

INSERT INTO `oeuvrevente` (`id_oeuvrevente`, `titre_oeuvrevente`, `etat_oeuvrevente`, `prix_oeuvrevente`, `id_proprietaire`) VALUES
(10000, 'Printemps', 'L', 200, 1000),
(10001, 'Ete', 'L', 400, 1000),
(10002, 'Automne', 'L', 10, 1000),
(10003, 'Crepuscule', 'R', 111, 1001),
(10004, 'Hiver', 'R', 234, 1000),
(10005, 'Aurore', 'L', 654, 1002),
(10006, 'Nuit de printemps', 'L', 789, 1001);

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE IF NOT EXISTS `proprietaire` (
  `id_proprietaire` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_proprietaire` varchar(100) CHARACTER SET latin1 NOT NULL,
  `prenom_proprietaire` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id_proprietaire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1003 ;

--
-- Contenu de la table `proprietaire`
--

INSERT INTO `proprietaire` (`id_proprietaire`, `nom_proprietaire`, `prenom_proprietaire`) VALUES
(1000, 'DUPONT', 'Isabelle'),
(1001, 'DUPUIS', 'Valerie'),
(1002, 'MOZART', 'Albert');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id_oeuvrevente` int(10) unsigned NOT NULL,
  `id_adherent` int(10) unsigned NOT NULL,
  `date_reservation` date NOT NULL,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`id_oeuvrevente`,`id_adherent`),
  UNIQUE KEY `id_oeuvrevente` (`id_oeuvrevente`),
  KEY `reservation_ibfk_2` (`id_adherent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`id_oeuvrevente`, `id_adherent`, `date_reservation`, `statut`) VALUES
(10003, 3, '2013-02-22', 'A'),
(10004, 7, '2013-02-22', 'A');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `oeuvrepret`
--
ALTER TABLE `oeuvrepret`
  ADD CONSTRAINT `oeuvrepret_ibfk_1` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`);

--
-- Contraintes pour la table `oeuvrevente`
--
ALTER TABLE `oeuvrevente`
  ADD CONSTRAINT `oeuvrevente_ibfk_1` FOREIGN KEY (`id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_oeuvrevente`) REFERENCES `oeuvrevente` (`id_oeuvrevente`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
