-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Host: rdbms
-- Erstellungszeit: 05. Mrz 2018 um 16:19
-- Server Version: 5.6.37-log
-- PHP-Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `DB3276584`
--
CREATE DATABASE IF NOT EXISTS `KochbuchAppDatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_german1_ci;
USE `KochbuchAppDatabase`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gruppen`
--

CREATE TABLE IF NOT EXISTS `Gruppen` (
  `gruppenId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `name` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gruppen_nutzer`
--

CREATE TABLE IF NOT EXISTS `Gruppen_nutzer` (
  `gruppenId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `nutzerId` varchar(16) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kochbuecher`
--

CREATE TABLE IF NOT EXISTS `Kochbuecher` (
  `kochbuchId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `name` text COLLATE latin1_german1_ci NOT NULL,
  `besitzer` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `bemerkung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kochbuecher_Nutzer`
--

CREATE TABLE IF NOT EXISTS `Kochbuecher_Nutzer` (
`id` int(11) NOT NULL,
  `kid` int(11) NOT NULL,
  `nid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Nutzerdaten`
--

CREATE TABLE IF NOT EXISTS `Nutzerdaten` (
  `nutzerId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `mail` text COLLATE latin1_german1_ci NOT NULL,
  `passwort` varchar(80) COLLATE latin1_german1_ci NOT NULL,
  `salt` varchar(10) COLLATE latin1_german1_ci NOT NULL,
  `name` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Plan`
--

CREATE TABLE IF NOT EXISTS `Plan` (
  `planId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `nutzerId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `rang` int(11) NOT NULL,
  `rezeptId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `portionen` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Ref_Einheiten`
--

CREATE TABLE IF NOT EXISTS `Ref_Einheiten` (
`einheitId` int(11) NOT NULL,
  `bezeichnung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Ref_Rechte`
--

CREATE TABLE IF NOT EXISTS `Ref_Rechte` (
`rechteId` int(11) NOT NULL,
  `bezeichnung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Ref_Tags`
--

CREATE TABLE IF NOT EXISTS `Ref_Tags` (
`tagId` int(11) NOT NULL,
  `bezeichnung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rezepte`
--

CREATE TABLE IF NOT EXISTS `Rezepte` (
  `rezeptId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `rechtID` int(11) NOT NULL,
  `zubereitung` text COLLATE latin1_german1_ci NOT NULL,
  `portionen` int(11) NOT NULL,
  `kosten` float NOT NULL,
  `schwierigkeitsgrad` int(11) NOT NULL,
  `zubereitungszeit` int(11) NOT NULL,
  `bewertung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SessionListe`
--

CREATE TABLE IF NOT EXISTS `SessionListe` (
  `sessionId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `nutzerId` varchar(16) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutaten`
--

CREATE TABLE IF NOT EXISTS `Zutaten` (
  `zutatenId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `rezeptId` varchar(16) COLLATE latin1_german1_ci NOT NULL,
  `menge` float NOT NULL,
  `einheitId` int(11) NOT NULL,
  `bezeichung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Gruppen`
--
ALTER TABLE `Gruppen`
 ADD PRIMARY KEY (`gruppenId`);

--
-- Indizes für die Tabelle `Kochbuecher`
--
ALTER TABLE `Kochbuecher`
 ADD PRIMARY KEY (`kochbuchId`);

--
-- Indizes für die Tabelle `Kochbuecher_Nutzer`
--
ALTER TABLE `Kochbuecher_Nutzer`
 ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `Nutzerdaten`
--
ALTER TABLE `Nutzerdaten`
 ADD PRIMARY KEY (`nutzerId`);

--
-- Indizes für die Tabelle `Plan`
--
ALTER TABLE `Plan`
 ADD PRIMARY KEY (`planId`);

--
-- Indizes für die Tabelle `Ref_Einheiten`
--
ALTER TABLE `Ref_Einheiten`
 ADD PRIMARY KEY (`einheitId`);

--
-- Indizes für die Tabelle `Ref_Rechte`
--
ALTER TABLE `Ref_Rechte`
 ADD PRIMARY KEY (`rechteId`);

--
-- Indizes für die Tabelle `Ref_Tags`
--
ALTER TABLE `Ref_Tags`
 ADD PRIMARY KEY (`tagId`);

--
-- Indizes für die Tabelle `Rezepte`
--
ALTER TABLE `Rezepte`
 ADD PRIMARY KEY (`rezeptId`);

--
-- Indizes für die Tabelle `SessionListe`
--
ALTER TABLE `SessionListe`
 ADD PRIMARY KEY (`sessionId`);

--
-- Indizes für die Tabelle `Zutaten`
--
ALTER TABLE `Zutaten`
 ADD PRIMARY KEY (`zutatenId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Kochbuecher_Nutzer`
--
ALTER TABLE `Kochbuecher_Nutzer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Ref_Einheiten`
--
ALTER TABLE `Ref_Einheiten`
MODIFY `einheitId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Ref_Rechte`
--
ALTER TABLE `Ref_Rechte`
MODIFY `rechteId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Ref_Tags`
--
ALTER TABLE `Ref_Tags`
MODIFY `tagId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
