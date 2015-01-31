
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- --------------------------------------------------------

--
-- Table structure for table `BattingTotal`
--
-- Creation: Sep 23, 2014 at 22:54 PM
--

CREATE TABLE IF NOT EXISTS `BattingTotal` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`playerID`,`yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PitchingTotal`
--
-- Creation: Sep 23, 2014 at 22:54 PM
--

CREATE TABLE IF NOT EXISTS `PitchingTotal` (
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `yearID` int(11) NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`playerID`,`yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SalariesTotal`
--
-- Creation: Sep 23, 2014 at 22:54 PM
--

CREATE TABLE IF NOT EXISTS `SalariesTotal` (
  `yearID` int(11) NOT NULL DEFAULT '0',
  `playerID` varchar(9) NOT NULL DEFAULT '',
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`yearID`,`playerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

