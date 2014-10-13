# coding: utf-8
from sqlalchemy import Column, Float, Integer, String, text
from sqlalchemy.ext.declarative import declarative_base


Base = declarative_base()
metadata = Base.metadata


class AllstarFull(Base):
    __tablename__ = u'AllstarFull'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    gameNum = Column(Integer, primary_key=True, nullable=False)
    gameID = Column(String(12))
    teamID = Column(String(3))
    lgID = Column(String(2))
    GP = Column(Integer)
    startingPos = Column(Integer)


class Appearance(Base):
    __tablename__ = u'Appearances'

    yearID = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    lgID = Column(String(2))
    playerID = Column(String(9), primary_key=True, nullable=False)
    G_all = Column(Integer)
    GS = Column(Integer)
    G_batting = Column(Integer)
    G_defense = Column(Integer)
    G_p = Column(Integer)
    G_c = Column(Integer)
    G_1b = Column(Integer)
    G_2b = Column(Integer)
    G_3b = Column(Integer)
    G_ss = Column(Integer)
    G_lf = Column(Integer)
    G_cf = Column(Integer)
    G_rf = Column(Integer)
    G_of = Column(Integer)
    G_dh = Column(Integer)
    G_ph = Column(Integer)
    G_pr = Column(Integer)


class AwardsManager(Base):
    __tablename__ = u'AwardsManagers'

    playerID = Column(String(9), primary_key=True, nullable=False)
    awardID = Column(String(25), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    tie = Column(String(1))
    notes = Column(String(100))


class AwardsPlayer(Base):
    __tablename__ = u'AwardsPlayers'

    playerID = Column(String(9), primary_key=True, nullable=False)
    awardID = Column(String(255), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    tie = Column(String(1))
    notes = Column(String(100))


class AwardsShareManager(Base):
    __tablename__ = u'AwardsShareManagers'

    awardID = Column(String(25), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    playerID = Column(String(9), primary_key=True, nullable=False)
    pointsWon = Column(Integer)
    pointsMax = Column(Integer)
    votesFirst = Column(Integer)


class AwardsSharePlayer(Base):
    __tablename__ = u'AwardsSharePlayers'

    awardID = Column(String(25), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    playerID = Column(String(9), primary_key=True, nullable=False)
    pointsWon = Column(Float(asdecimal=True))
    pointsMax = Column(Integer)
    votesFirst = Column(Float(asdecimal=True))


class Batting(Base):
    __tablename__ = u'Batting'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    G = Column(Integer)
    G_batting = Column(Integer)
    AB = Column(Integer)
    R = Column(Integer)
    H = Column(Integer)
    _2B = Column(u'2B', Integer)
    _3B = Column(u'3B', Integer)
    HR = Column(Integer)
    RBI = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    IBB = Column(Integer)
    HBP = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)
    G_old = Column(Integer)


class BattingPost(Base):
    __tablename__ = u'BattingPost'

    yearID = Column(Integer, primary_key=True, nullable=False)
    round = Column(String(10), primary_key=True, nullable=False)
    playerID = Column(String(9), primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    G = Column(Integer)
    AB = Column(Integer)
    R = Column(Integer)
    H = Column(Integer)
    _2B = Column(u'2B', Integer)
    _3B = Column(u'3B', Integer)
    HR = Column(Integer)
    RBI = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    IBB = Column(Integer)
    HBP = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)


class BattingTotal(Base):
    __tablename__ = u'BattingTotal'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    G = Column(Integer)
    G_batting = Column(Integer)
    AB = Column(Integer)
    R = Column(Integer)
    H = Column(Integer)
    _2B = Column(u'2B', Integer)
    _3B = Column(u'3B', Integer)
    HR = Column(Integer)
    RBI = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    IBB = Column(Integer)
    HBP = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)
    G_old = Column(Integer)


class Fielding(Base):
    __tablename__ = u'Fielding'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    POS = Column(String(2), primary_key=True, nullable=False)
    G = Column(Integer)
    GS = Column(Integer)
    InnOuts = Column(Integer)
    PO = Column(Integer)
    A = Column(Integer)
    E = Column(Integer)
    DP = Column(Integer)
    PB = Column(Integer)
    WP = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)
    ZR = Column(Float(asdecimal=True))


class FieldingOF(Base):
    __tablename__ = u'FieldingOF'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    Glf = Column(Integer)
    Gcf = Column(Integer)
    Grf = Column(Integer)


class FieldingPost(Base):
    __tablename__ = u'FieldingPost'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    round = Column(String(10), primary_key=True, nullable=False)
    POS = Column(String(2), primary_key=True, nullable=False)
    G = Column(Integer)
    GS = Column(Integer)
    InnOuts = Column(Integer)
    PO = Column(Integer)
    A = Column(Integer)
    E = Column(Integer)
    DP = Column(Integer)
    TP = Column(Integer)
    PB = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)


class HallOfFame(Base):
    __tablename__ = u'HallOfFame'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearid = Column(Integer, primary_key=True, nullable=False)
    votedBy = Column(String(64), primary_key=True, nullable=False, server_default=text("''"))
    ballots = Column(Integer)
    needed = Column(Integer)
    votes = Column(Integer)
    inducted = Column(String(1))
    category = Column(String(20))
    needed_note = Column(String(20))


class Manager(Base):
    __tablename__ = u'Managers'

    playerID = Column(String(9))
    yearID = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    lgID = Column(String(2))
    inseason = Column(Integer, primary_key=True, nullable=False)
    G = Column(Integer)
    W = Column(Integer)
    L = Column(Integer)
    rank = Column(Integer)
    plyrMgr = Column(String(1))


class ManagersHalf(Base):
    __tablename__ = u'ManagersHalf'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    lgID = Column(String(2))
    inseason = Column(Integer)
    half = Column(Integer, primary_key=True, nullable=False)
    G = Column(Integer)
    W = Column(Integer)
    L = Column(Integer)
    rank = Column(Integer)


class Master(Base):
    __tablename__ = u'Master'

    playerID = Column(String(9), primary_key=True, server_default=text("''"))
    hofID = Column(String(10))
    birthYear = Column(Integer)
    birthMonth = Column(Integer)
    birthDay = Column(Integer)
    birthCountry = Column(String(50))
    birthState = Column(String(2))
    birthCity = Column(String(50))
    deathYear = Column(Integer)
    deathMonth = Column(Integer)
    deathDay = Column(Integer)
    deathCountry = Column(String(50))
    deathState = Column(String(2))
    deathCity = Column(String(50))
    nameFirst = Column(String(50))
    nameLast = Column(String(50))
    nameNote = Column(String(255))
    nameGiven = Column(String(255))
    nameNick = Column(String(255))
    weight = Column(Integer)
    height = Column(Float(asdecimal=True))
    bats = Column(String(1))
    throws = Column(String(1))
    debut = Column(String(10))
    finalGame = Column(String(10))
    college = Column(String(50))
    lahman40ID = Column(String(9))
    lahman45ID = Column(String(9))
    retroID = Column(String(9))
    holtzID = Column(String(9))
    bbrefID = Column(String(9))


class Pitching(Base):
    __tablename__ = u'Pitching'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    W = Column(Integer)
    L = Column(Integer)
    G = Column(Integer)
    GS = Column(Integer)
    CG = Column(Integer)
    SHO = Column(Integer)
    SV = Column(Integer)
    IPouts = Column(Integer)
    H = Column(Integer)
    ER = Column(Integer)
    HR = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    BAOpp = Column(Float(asdecimal=True))
    ERA = Column(Float(asdecimal=True))
    IBB = Column(Integer)
    WP = Column(Integer)
    HBP = Column(Integer)
    BK = Column(Integer)
    BFP = Column(Integer)
    GF = Column(Integer)
    R = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)


class PitchingPost(Base):
    __tablename__ = u'PitchingPost'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    round = Column(String(10), primary_key=True, nullable=False)
    teamID = Column(String(3))
    lgID = Column(String(2))
    W = Column(Integer)
    L = Column(Integer)
    G = Column(Integer)
    GS = Column(Integer)
    CG = Column(Integer)
    SHO = Column(Integer)
    SV = Column(Integer)
    IPouts = Column(Integer)
    H = Column(Integer)
    ER = Column(Integer)
    HR = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    BAOpp = Column(Float(asdecimal=True))
    ERA = Column(Float(asdecimal=True))
    IBB = Column(Integer)
    WP = Column(Integer)
    HBP = Column(Integer)
    BK = Column(Integer)
    BFP = Column(Integer)
    GF = Column(Integer)
    R = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)


class PitchingTotal(Base):
    __tablename__ = u'PitchingTotal'

    playerID = Column(String(9), primary_key=True, nullable=False)
    yearID = Column(Integer, primary_key=True, nullable=False)
    stint = Column(Integer, primary_key=True, nullable=False)
    W = Column(Integer)
    L = Column(Integer)
    G = Column(Integer)
    GS = Column(Integer)
    CG = Column(Integer)
    SHO = Column(Integer)
    SV = Column(Integer)
    IPouts = Column(Integer)
    H = Column(Integer)
    ER = Column(Integer)
    HR = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    IBB = Column(Integer)
    WP = Column(Integer)
    HBP = Column(Integer)
    BK = Column(Integer)
    BFP = Column(Integer)
    GF = Column(Integer)
    R = Column(Integer)
    SH = Column(Integer)
    SF = Column(Integer)
    GIDP = Column(Integer)


class Salary(Base):
    __tablename__ = u'Salaries'

    yearID = Column(Integer, primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    playerID = Column(String(9), primary_key=True, nullable=False)
    salary = Column(Float(asdecimal=True))


class SalariesTotal(Base):
    __tablename__ = u'SalariesTotal'

    yearID = Column(Integer, primary_key=True, nullable=False)
    playerID = Column(String(9), primary_key=True, nullable=False)
    salary = Column(Float(asdecimal=True))


class School(Base):
    __tablename__ = u'Schools'

    schoolID = Column(String(15), primary_key=True)
    schoolName = Column(String(255))
    schoolCity = Column(String(55))
    schoolState = Column(String(55))
    schoolNick = Column(String(55))


class SchoolsPlayer(Base):
    __tablename__ = u'SchoolsPlayers'

    playerID = Column(String(9), primary_key=True, nullable=False)
    schoolID = Column(String(15), primary_key=True, nullable=False)
    yearMin = Column(Integer)
    yearMax = Column(Integer)


class SeriesPost(Base):
    __tablename__ = u'SeriesPost'

    yearID = Column(Integer, primary_key=True, nullable=False)
    round = Column(String(5), primary_key=True, nullable=False)
    teamIDwinner = Column(String(3))
    lgIDwinner = Column(String(2))
    teamIDloser = Column(String(3))
    lgIDloser = Column(String(2))
    wins = Column(Integer)
    losses = Column(Integer)
    ties = Column(Integer)


class Team(Base):
    __tablename__ = u'Teams'

    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    franchID = Column(String(3))
    divID = Column(String(1))
    Rank = Column(Integer)
    G = Column(Integer)
    Ghome = Column(Integer)
    W = Column(Integer)
    L = Column(Integer)
    DivWin = Column(String(1))
    WCWin = Column(String(1))
    LgWin = Column(String(1))
    WSWin = Column(String(1))
    R = Column(Integer)
    AB = Column(Integer)
    H = Column(Integer)
    _2B = Column(u'2B', Integer)
    _3B = Column(u'3B', Integer)
    HR = Column(Integer)
    BB = Column(Integer)
    SO = Column(Integer)
    SB = Column(Integer)
    CS = Column(Integer)
    HBP = Column(Integer)
    SF = Column(Integer)
    RA = Column(Integer)
    ER = Column(Integer)
    ERA = Column(Float(asdecimal=True))
    CG = Column(Integer)
    SHO = Column(Integer)
    SV = Column(Integer)
    IPouts = Column(Integer)
    HA = Column(Integer)
    HRA = Column(Integer)
    BBA = Column(Integer)
    SOA = Column(Integer)
    E = Column(Integer)
    DP = Column(Integer)
    FP = Column(Float(asdecimal=True))
    name = Column(String(50))
    park = Column(String(255))
    attendance = Column(Integer)
    BPF = Column(Integer)
    PPF = Column(Integer)
    teamIDBR = Column(String(3))
    teamIDlahman45 = Column(String(3))
    teamIDretro = Column(String(3))


class TeamsFranchise(Base):
    __tablename__ = u'TeamsFranchises'

    franchID = Column(String(3), primary_key=True)
    franchName = Column(String(50))
    active = Column(String(2))
    NAassoc = Column(String(3))


class TeamsHalf(Base):
    __tablename__ = u'TeamsHalf'

    yearID = Column(Integer, primary_key=True, nullable=False)
    lgID = Column(String(2), primary_key=True, nullable=False)
    teamID = Column(String(3), primary_key=True, nullable=False)
    Half = Column(String(1), primary_key=True, nullable=False)
    divID = Column(String(1))
    DivWin = Column(String(1))
    Rank = Column(Integer)
    G = Column(Integer)
    W = Column(Integer)
    L = Column(Integer)
