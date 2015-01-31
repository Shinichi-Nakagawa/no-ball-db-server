# ************************************************************
# Sequel Pro SQL dump
# バージョン 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# ホスト: 127.0.0.1 (MySQL 5.5.41-0ubuntu0.14.04.1)
# データベース: sean_lahman
# 作成時刻: 2015-01-31 09:48:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ AllstarFull
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AllstarFull`;

CREATE TABLE `AllstarFull` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `gameNum` int(11) NOT NULL DEFAULT '0',
  `gameID` varchar(12) DEFAULT NULL,
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `GP` int(11) DEFAULT NULL,
  `startingPos` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`gameNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Appearances
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Appearances`;

CREATE TABLE `Appearances` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) NOT NULL DEFAULT '',
  `lgID` varchar(2) DEFAULT NULL,
  `playerID` varchar(9) NOT NULL DEFAULT '',
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



# テーブルのダンプ AwardsManagers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AwardsManagers`;

CREATE TABLE `AwardsManagers` (
  `playerID` varchar(10) NOT NULL DEFAULT '',
  `awardID` varchar(75) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `tie` varchar(1) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`awardID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ AwardsPlayers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AwardsPlayers`;

CREATE TABLE `AwardsPlayers` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `awardID` varchar(255) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `tie` varchar(1) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`awardID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ AwardsShareManagers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AwardsShareManagers`;

CREATE TABLE `AwardsShareManagers` (
  `awardID` varchar(25) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `playerID` varchar(10) NOT NULL DEFAULT '',
  `pointsWon` int(11) DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` int(11) DEFAULT NULL,
  PRIMARY KEY (`awardID`,`yearID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ AwardsSharePlayers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AwardsSharePlayers`;

CREATE TABLE `AwardsSharePlayers` (
  `awardID` varchar(25) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `pointsWon` double DEFAULT NULL,
  `pointsMax` int(11) DEFAULT NULL,
  `votesFirst` double DEFAULT NULL,
  PRIMARY KEY (`awardID`,`yearID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Batting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Batting`;

CREATE TABLE `Batting` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `stint` int(11) NOT NULL DEFAULT '0',
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



# テーブルのダンプ BattingPost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BattingPost`;

CREATE TABLE `BattingPost` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `round` varchar(10) NOT NULL DEFAULT '',
  `playerID` varchar(9) NOT NULL DEFAULT '',
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



# テーブルのダンプ CollegePlaying
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CollegePlaying`;

CREATE TABLE `CollegePlaying` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `schoolID` varchar(15) NOT NULL,
  `yearID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerID`,`schoolID`,`yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Fielding
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Fielding`;

CREATE TABLE `Fielding` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `stint` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `POS` varchar(2) NOT NULL DEFAULT '',
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



# テーブルのダンプ FieldingOF
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FieldingOF`;

CREATE TABLE `FieldingOF` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `stint` int(11) NOT NULL DEFAULT '0',
  `Glf` int(11) DEFAULT NULL,
  `Gcf` int(11) DEFAULT NULL,
  `Grf` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearID`,`stint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ FieldingPost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FieldingPost`;

CREATE TABLE `FieldingPost` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) DEFAULT NULL,
  `lgID` varchar(2) DEFAULT NULL,
  `round` varchar(10) NOT NULL DEFAULT '',
  `POS` varchar(2) NOT NULL DEFAULT '',
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



# テーブルのダンプ HallOfFame
# ------------------------------------------------------------

DROP TABLE IF EXISTS `HallOfFame`;

CREATE TABLE `HallOfFame` (
  `playerID` varchar(10) NOT NULL DEFAULT '',
  `yearid` int(11) NOT NULL DEFAULT '0',
  `votedBy` varchar(64) NOT NULL DEFAULT '',
  `ballots` int(11) DEFAULT NULL,
  `needed` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `inducted` varchar(1) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `needed_note` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`playerID`,`yearid`,`votedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Managers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Managers`;

CREATE TABLE `Managers` (
  `playerID` varchar(10) DEFAULT NULL,
  `yearID` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) NOT NULL DEFAULT '',
  `lgID` varchar(2) DEFAULT NULL,
  `inseason` int(11) NOT NULL DEFAULT '0',
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `plyrMgr` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`inseason`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ ManagersHalf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ManagersHalf`;

CREATE TABLE `ManagersHalf` (
  `playerID` varchar(10) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) NOT NULL DEFAULT '',
  `lgID` varchar(2) DEFAULT NULL,
  `inseason` int(11) DEFAULT NULL,
  `half` int(11) NOT NULL DEFAULT '0',
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`playerID`,`half`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Master`;

CREATE TABLE `Master` (
  `playerID` varchar(10) NOT NULL,
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
  `nameGiven` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `bats` varchar(1) DEFAULT NULL,
  `throws` varchar(1) DEFAULT NULL,
  `debut` datetime DEFAULT NULL,
  `finalGame` datetime DEFAULT NULL,
  `retroID` varchar(9) DEFAULT NULL,
  `bbrefID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Pitching
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pitching`;

CREATE TABLE `Pitching` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `stint` int(11) NOT NULL DEFAULT '0',
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



# テーブルのダンプ PitchingPost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PitchingPost`;

CREATE TABLE `PitchingPost` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
  `round` varchar(10) NOT NULL DEFAULT '',
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



# テーブルのダンプ Salaries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Salaries`;

CREATE TABLE `Salaries` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `teamID` varchar(3) NOT NULL DEFAULT '',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`lgID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Schools
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Schools`;

CREATE TABLE `Schools` (
  `schoolID` varchar(15) NOT NULL,
  `name_full` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`schoolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ SeriesPost
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SeriesPost`;

CREATE TABLE `SeriesPost` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `round` varchar(5) NOT NULL DEFAULT '',
  `teamIDwinner` varchar(3) DEFAULT NULL,
  `lgIDwinner` varchar(2) DEFAULT NULL,
  `teamIDloser` varchar(3) DEFAULT NULL,
  `lgIDloser` varchar(2) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `ties` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`round`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ Teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Teams`;

CREATE TABLE `Teams` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `teamID` varchar(3) NOT NULL DEFAULT '',
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



# テーブルのダンプ TeamsFranchises
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TeamsFranchises`;

CREATE TABLE `TeamsFranchises` (
  `franchID` varchar(3) NOT NULL,
  `franchName` varchar(50) DEFAULT NULL,
  `active` varchar(2) DEFAULT NULL,
  `NAassoc` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`franchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# テーブルのダンプ TeamsHalf
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TeamsHalf`;

CREATE TABLE `TeamsHalf` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `lgID` varchar(2) NOT NULL DEFAULT '',
  `teamID` varchar(3) NOT NULL DEFAULT '',
  `Half` varchar(1) NOT NULL DEFAULT '',
  `divID` varchar(1) DEFAULT NULL,
  `DivWin` varchar(1) DEFAULT NULL,
  `Rank` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `L` int(11) DEFAULT NULL,
  PRIMARY KEY (`yearID`,`teamID`,`lgID`,`Half`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
