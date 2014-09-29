-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Host: mysql.baseballarchive.org
-- Generation Time: Dec 06, 2013 at 08:14 PM
-- Server version: 5.1.56
-- PHP Version: 5.3.27

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `lahman_bbdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `AllstarFull`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `AllstarFull` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `gameNum` int(11) NOT NULL,
  `gameID` varchar(12) DEFAULT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `GP` int(11) DEFAULT NULL,
  `startingPos` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`gameNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Appearances`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Appearances` (
  `yearID` int(11) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `playerID` varchar(9) NOT NULL,
  `G_all` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `G_batting` int(11) DEFAULT NULL,
  `G_defense` int(11) DEFAULT NULL,
  `G_p` int(11) DEFAULT NULL,
  `G_c` int(11) DEFAULT NULL,
  `G_1b` int(11) DEFAULT NULL,
  `G_2b` int(11) DEFAULT NULL,
  `G_3b` int(11) DEFAULT NULL,
  `G_ss` int(11) DEFAULT NULL,
  `G_lf` int(11) DEFAULT NULL,
  `G_cf` int(11) DEFAULT NULL,
  `G_rf` int(11) DEFAULT NULL,
  `G_of` int(11) DEFAULT NULL,
  `G_dh` int(11) DEFAULT NULL,
  `G_ph` int(11) DEFAULT NULL,
  `G_pr` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AwardsManagers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `AwardsManagers` (
  `playerID` varchar(9) NOT NULL,
  `awardID` varchar(25) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `tie` varchar(1) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`awardID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AwardsPlayers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `AwardsPlayers` (
  `playerID` varchar(9) NOT NULL,
  `awardID` varchar(255) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `tie` varchar(1) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`awardID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AwardsShareManagers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `AwardsShareManagers` (
  `awardID` varchar(25) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `playerID` varchar(9) NOT NULL,
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardID`,`yearID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `AwardsSharePlayers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `AwardsSharePlayers` (
  `awardID` varchar(25) NOT NULL,
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `playerID` varchar(9) NOT NULL,
  `pointsWon` double DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` double DEFAULT NULL,
  PRIMARY KEY (`awardID`,`yearID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Batting`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Batting` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stint` int(11) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `G_batting` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `SH` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `GIDP` int(11) DEFAULT NULL,
  `G_old` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`stint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BattingPost`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `BattingPost` (
  `yearID` int(11) NOT NULL,
  `round` varchar(10) NOT NULL,
  `playerID` varchar(9) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `RBI` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `SH` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `GIDP` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`round`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Fielding`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Fielding` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stint` int(11) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `POS` varchar(2) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `PB` int(11) DEFAULT NULL,
  `WP` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `ZR` double DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`stint`,`POS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FieldingOF`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `FieldingOF` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stint` int(11) NOT NULL,
  `Glf` int(11) DEFAULT NULL,
  `Gcf` int(11) DEFAULT NULL,
  `Grf` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`stint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `FieldingPost`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `FieldingPost` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `round` varchar(10) NOT NULL,
  `POS` varchar(2) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `InnOuts` int(11) DEFAULT NULL,
  `PO` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `TP` int(11) DEFAULT NULL,
  `PB` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`round`,`POS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `HallOfFame`
--
-- Creation: Dec 06, 2013 at 10:48 AM
--

CREATE TABLE IF NOT EXISTS `HallOfFame` (
  `playerID` varchar(9) NOT NULL,
  `yearid` int(11) NOT NULL,
  `votedBy` varchar(64) NOT NULL DEFAULT '',
  `ballots` int(11) DEFAULT NULL,
  `needed` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `inducted` varchar(1) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `needed_note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearid`,`votedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Managers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Managers` (
  `playerID` varchar(9) DEFAULT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `inseason` int(11) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `plyrMgr` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`inseason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ManagersHalf`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `ManagersHalf` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `inseason` int(11) DEFAULT NULL,
  `half` int(11) NOT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`playerID`,`half`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Master`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Master` (
  `playerID` varchar(9) DEFAULT NULL,
  `hofID` varchar(10) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `birthMonth` int(11) DEFAULT NULL,
  `birthDay` int(11) DEFAULT NULL,
  `birthCountry` varchar(50) DEFAULT NULL,
  `birthState` varchar(2) DEFAULT NULL,
  `birthCity` varchar(50) DEFAULT NULL,
  `deathYear` int(11) DEFAULT NULL,
  `deathMonth` int(11) DEFAULT NULL,
  `deathDay` int(11) DEFAULT NULL,
  `deathCountry` varchar(50) DEFAULT NULL,
  `deathState` varchar(2) DEFAULT NULL,
  `deathCity` varchar(50) DEFAULT NULL,
  `nameFirst` varchar(50) DEFAULT NULL,
  `nameLast` varchar(50) DEFAULT NULL,
  `nameNote` varchar(255) DEFAULT NULL,
  `nameGiven` varchar(255) DEFAULT NULL,
  `nameNick` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `bats` varchar(1) DEFAULT NULL,
  `throws` varchar(1) DEFAULT NULL,
  `debut` varchar(10) DEFAULT NULL,
  `finalGame` varchar(10) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `lahman40ID` varchar(9) DEFAULT NULL,
  `lahman45ID` varchar(9) DEFAULT NULL,
  `retroID` varchar(9) DEFAULT NULL,
  `holtzID` varchar(9) DEFAULT NULL,
  `bbrefID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Pitching`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Pitching` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `stint` int(11) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `BAOpp` double DEFAULT NULL,
  `ERA` double DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `WP` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `BK` int(11) DEFAULT NULL,
  `BFP` int(11) DEFAULT NULL,
  `GF` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `SH` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `GIDP` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`stint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PitchingPost`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `PitchingPost` (
  `playerID` varchar(9) NOT NULL,
  `yearID` int(11) NOT NULL,
  `round` varchar(10) NOT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `GS` int(11) DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `BAOpp` double DEFAULT NULL,
  `ERA` double DEFAULT NULL,
  `IBB` int(11) DEFAULT NULL,
  `WP` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `BK` int(11) DEFAULT NULL,
  `BFP` int(11) DEFAULT NULL,
  `GF` int(11) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `SH` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `GIDP` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Salaries`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Salaries` (
  `yearID` int(11) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `playerID` varchar(9) NOT NULL,
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Schools`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Schools` (
  `schoolID` varchar(15) NOT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `schoolCity` varchar(55) DEFAULT NULL,
  `schoolState` varchar(55) DEFAULT NULL,
  `schoolNick` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SchoolsPlayers`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `SchoolsPlayers` (
  `playerID` varchar(9) NOT NULL,
  `schoolID` varchar(15) NOT NULL,
  `yearMin` int(11) DEFAULT NULL,
  `yearMax` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SeriesPost`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `SeriesPost` (
  `yearID` int(11) NOT NULL,
  `round` varchar(5) NOT NULL,
  `teamIDwinner` varchar(3) DEFAULT NULL,
  `lgIDwinner` varchar(2) DEFAULT NULL,
  `teamIDloser` varchar(3) DEFAULT NULL,
  `lgIDloser` varchar(2) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `ties` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Teams`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `Teams` (
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `franchID` varchar(3) DEFAULT NULL,
  `divID` varchar(1) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `Ghome` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `DivWin` varchar(1) DEFAULT NULL,
  `WCWin` varchar(1) DEFAULT NULL,
  `LgWin` varchar(1) DEFAULT NULL,
  `WSWin` varchar(1) DEFAULT NULL,
  `R` int(11) DEFAULT NULL,
  `AB` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `HR` int(11) DEFAULT NULL,
  `BB` int(11) DEFAULT NULL,
  `SO` int(11) DEFAULT NULL,
  `SB` int(11) DEFAULT NULL,
  `CS` int(11) DEFAULT NULL,
  `HBP` int(11) DEFAULT NULL,
  `SF` int(11) DEFAULT NULL,
  `RA` int(11) DEFAULT NULL,
  `ER` int(11) DEFAULT NULL,
  `ERA` double DEFAULT NULL,
  `CG` int(11) DEFAULT NULL,
  `SHO` int(11) DEFAULT NULL,
  `SV` int(11) DEFAULT NULL,
  `IPouts` int(11) DEFAULT NULL,
  `HA` int(11) DEFAULT NULL,
  `HRA` int(11) DEFAULT NULL,
  `BBA` int(11) DEFAULT NULL,
  `SOA` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `DP` int(11) DEFAULT NULL,
  `FP` double DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `park` varchar(255) DEFAULT NULL,
  `attendance` int(11) DEFAULT NULL,
  `BPF` int(11) DEFAULT NULL,
  `PPF` int(11) DEFAULT NULL,
  `teamIDBR` varchar(3) DEFAULT NULL,
  `teamIDlahman45` varchar(3) DEFAULT NULL,
  `teamIDretro` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`lgID`,`teamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TeamsFranchises`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `TeamsFranchises` (
  `franchID` varchar(3) NOT NULL,
  `franchName` varchar(50) DEFAULT NULL,
  `active` varchar(2) DEFAULT NULL,
  `NAassoc` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`franchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TeamsHalf`
--
-- Creation: Dec 06, 2013 at 06:43 AM
--

CREATE TABLE IF NOT EXISTS `TeamsHalf` (
  `yearID` int(11) NOT NULL,
  `lgID` varchar(2) NOT NULL,
  `teamID` varchar(3) NOT NULL,
  `Half` varchar(1) NOT NULL,
  `divID` varchar(1) DEFAULT NULL,
  `DivWin` varchar(1) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`lgID`,`Half`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
