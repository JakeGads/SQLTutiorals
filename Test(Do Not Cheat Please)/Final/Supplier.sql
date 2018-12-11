DROP TABLE supplier CASCADE CONSTRAINTS;

DROP TABLE part CASCADE CONSTRAINTS;

DROP TABLE contractor CASCADE CONSTRAINTS;

DROP TABLE project CASCADE CONSTRAINTS;

DROP TABLE order_t CASCADE CONSTRAINTS;

CREATE TABLE supplier (
    id        INTEGER,
    name      VARCHAR2(25),
    address   VARCHAR2(50),
    CONSTRAINT supplier_pk PRIMARY KEY ( id )
);

CREATE TABLE part (
    id      INTEGER,
    color   VARCHAR2(10),
    name    VARCHAR2(25),
    cost    NUMBER,
    CONSTRAINT part_pk PRIMARY KEY ( id )
);

CREATE TABLE contractor (
    id        INTEGER,
    name      VARCHAR2(25),
    address   VARCHAR2(50),
    CONSTRAINT contractor_pk PRIMARY KEY ( id )
);

CREATE TABLE project (
    id        INTEGER,
    cid       INTEGER,
    budget    NUMBER,
    duedate   DATE,
    CONSTRAINT project_fk FOREIGN KEY ( cid )
        REFERENCES contractor ( id ),
    CONSTRAINT project_pk PRIMARY KEY ( id )
);

CREATE TABLE order_t (
    projid     INTEGER,
    partid     INTEGER,
    suppid     INTEGER,
    quantity   INTEGER,
    CONSTRAINT order_fk0 FOREIGN KEY ( projid )
        REFERENCES project ( id ),
    CONSTRAINT order_fk1 FOREIGN KEY ( partid )
        REFERENCES part ( id ),
    CONSTRAINT order_fk2 FOREIGN KEY ( suppid )
        REFERENCES supplier ( id ),
    CONSTRAINT order_pk PRIMARY KEY ( quantity )
);

INSERT INTO supplier VALUES (
    1070,
    'Sina   Yong',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO supplier VALUES (
    1089,
    'Agnus   Samoggia',
    '882 W. Parker Street  Plymouth, MA 02360'
);

INSERT INTO supplier VALUES (
    1081,
    'Leroy   Rouchefoucauld',
    '7888 Market Rd.  Rowlett, TX 75088'
);

INSERT INTO supplier VALUES (
    240,
    'Torrie   Kline',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO supplier VALUES (
    513,
    'Thora   Breyer',
    '942 Military Street  Fredericksburg, VA 22405'
);

INSERT INTO supplier VALUES (
    185,
    'Torrie   Harding',
    '9511 Young Dr.  Mechanicsburg, PA 17050'
);

INSERT INTO supplier VALUES (
    324,
    'Marni   Osteen',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO supplier VALUES (
    212,
    'Beatrice   Hood',
    '793 Indian Spring Ave.  Trussville, AL 35173'
);

INSERT INTO supplier VALUES (
    685,
    'Joaquin   Rosania',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO supplier VALUES (
    931,
    'Remedios   Haworth',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO supplier VALUES (
    981,
    'Tamica   Greer',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO supplier VALUES (
    203,
    'Lien   Curry',
    '942 Military Street  Fredericksburg, VA 22405'
);

INSERT INTO supplier VALUES (
    106,
    'Marty   Borah',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO supplier VALUES (
    144,
    'Eugenio   Colnago',
    '574 Third Drive  Webster, NY 14580'
);

INSERT INTO supplier VALUES (
    962,
    'Domonique   Hamilton',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    292,
    'Malia   Shanks',
    '7888 Market Rd.  Rowlett, TX 75088'
);

INSERT INTO supplier VALUES (
    576,
    'Jacki   Norberg',
    '8140 Glenholme Street  West Des Moines, IA 50265'
);

INSERT INTO supplier VALUES (
    959,
    'Richard   Ascolani',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    582,
    'Janee   Ferruzza',
    '485 S. Lafayette Ave.  Saint Cloud, MN 56301'
);

INSERT INTO supplier VALUES (
    112,
    'Kristan   Corsetti',
    '7888 Market Rd.  Rowlett, TX 75088'
);

INSERT INTO supplier VALUES (
    969,
    'Rosalie   Simon',
    '630 Garden Rd.  Brainerd, MN 56401'
);

INSERT INTO supplier VALUES (
    890,
    'Margert   Zevin',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO supplier VALUES (
    120,
    'Jacki   Bates',
    '8677 Lyme Street  Fairfield, CT 06824'
);

INSERT INTO supplier VALUES (
    919,
    'Viola   Kurihara',
    '291 Westport St.  Beckley, WV 25801'
);

INSERT INTO supplier VALUES (
    1045,
    'Lashaunda   Thrainsson',
    '942 Military Street  Fredericksburg, VA 22405'
);

INSERT INTO supplier VALUES (
    729,
    'Pam   Dissanayake',
    '8791 Lafayette Road  Champaign, IL 61821'
);

INSERT INTO supplier VALUES (
    497,
    'Denese   Harding',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO supplier VALUES (
    331,
    'Andria   Tribbett',
    '291 Westport St.  Beckley, WV 25801'
);

INSERT INTO supplier VALUES (
    1003,
    'Darren   Borah',
    '8386B N. Gates St.  Kernersville, NC 27284'
);

INSERT INTO supplier VALUES (
    540,
    'Rosena   Tilney',
    '7177 Galvin Lane  Bayside, NY 11361'
);

INSERT INTO supplier VALUES (
    258,
    'Tyisha   Richer',
    '2 Walt Whitman Lane  Schererville, IN 46375'
);

INSERT INTO supplier VALUES (
    307,
    'Anabel   Stillman',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO supplier VALUES (
    830,
    'Shannan   Guereca',
    '8 Grant Ave.  Green Bay, WI 54302'
);

INSERT INTO supplier VALUES (
    963,
    'Natividad   Morgan',
    '7888 Market Rd.  Rowlett, TX 75088'
);

INSERT INTO supplier VALUES (
    170,
    'Vicenta   Mead',
    '942 Military Street  Fredericksburg, VA 22405'
);

INSERT INTO supplier VALUES (
    936,
    'Vicenta   Kafadar',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    332,
    'Camellia   Puggioni',
    '2 Walt Whitman Lane  Schererville, IN 46375'
);

INSERT INTO supplier VALUES (
    784,
    'Jacki   Brinkmann',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    531,
    'Gema   Paul',
    '23 Stonybrook Street  Coventry, RI 02816'
);

INSERT INTO supplier VALUES (
    443,
    'Tia   Curry',
    '2 Walt Whitman Lane  Schererville, IN 46375'
);

INSERT INTO supplier VALUES (
    688,
    'Shad   Carmichael',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    683,
    'Chana   Castillo',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO supplier VALUES (
    245,
    'Bao   Mead',
    '9036 Shub Farm St.  Ooltewah, TN 37363'
);

INSERT INTO supplier VALUES (
    724,
    'Isidra   Hollander',
    '574 Third Drive  Webster, NY 14580'
);

INSERT INTO supplier VALUES (
    216,
    'Shasta   Borah',
    '291 Westport St.  Beckley, WV 25801'
);

INSERT INTO supplier VALUES (
    484,
    'Elfrieda   Dicesare',
    '8791 Lafayette Road  Champaign, IL 61821'
);

INSERT INTO supplier VALUES (
    124,
    'Leroy   Andrews',
    '485 S. Lafayette Ave.  Saint Cloud, MN 56301'
);

INSERT INTO supplier VALUES (
    446,
    'Agnus   Usseglio',
    '8791 Lafayette Road  Champaign, IL 61821'
);

INSERT INTO supplier VALUES (
    236,
    'Cherly   Ge',
    '8677 Lyme Street  Fairfield, CT 06824'
);

INSERT INTO part VALUES (
    1053,
    'red',
    'groin',
    8481.82
);

INSERT INTO part VALUES (
    263,
    'blue',
    'lips',
    9876.70
);

INSERT INTO part VALUES (
    686,
    'red',
    'big toe',
    3724.00
);

INSERT INTO part VALUES (
    904,
    'green',
    'teeth',
    8504.67
);

INSERT INTO part VALUES (
    538,
    'green',
    'index finger',
    1828.16
);

INSERT INTO part VALUES (
    651,
    'black',
    'finger',
    9735.60
);

INSERT INTO part VALUES (
    804,
    'red',
    'shin',
    4603.26
);

INSERT INTO part VALUES (
    224,
    'red',
    'teeth',
    4452.90
);

INSERT INTO part VALUES (
    251,
    'blue',
    'mouth',
    8374.38
);

INSERT INTO part VALUES (
    1029,
    'red',
    'shoulder',
    8614.15
);

INSERT INTO part VALUES (
    515,
    'blue',
    'shoulder',
    2510.01
);

INSERT INTO part VALUES (
    874,
    'blue',
    'ear',
    7257.91
);

INSERT INTO part VALUES (
    693,
    'red',
    'hip',
    1010.16
);

INSERT INTO part VALUES (
    502,
    'black',
    'lower leg',
    6739.06
);

INSERT INTO part VALUES (
    787,
    'blue',
    'index finger',
    1969.68
);

INSERT INTO part VALUES (
    158,
    'yellow',
    'upper arm',
    263.79
);

INSERT INTO part VALUES (
    306,
    'red',
    'shoulder',
    7744.07
);

INSERT INTO part VALUES (
    472,
    'yellow',
    'eyelashes',
    3863.92
);

INSERT INTO part VALUES (
    927,
    'red',
    'groin',
    4913.00
);

INSERT INTO part VALUES (
    628,
    'green',
    'eyelashes',
    2529.91
);

INSERT INTO part VALUES (
    882,
    'red',
    'upper arm',
    2264.87
);

INSERT INTO part VALUES (
    809,
    'blue',
    'lower leg',
    9160.02
);

INSERT INTO part VALUES (
    191,
    'blue',
    'big toe',
    7556.78
);

INSERT INTO part VALUES (
    367,
    'green',
    'forearm',
    4989.36
);

INSERT INTO part VALUES (
    737,
    'black',
    'eyebrow',
    2627.64
);

INSERT INTO part VALUES (
    721,
    'green',
    'knee',
    1374.80
);

INSERT INTO part VALUES (
    742,
    'green',
    'upper arm',
    439.17
);

INSERT INTO part VALUES (
    941,
    'green',
    'eyebrow',
    892.74
);

INSERT INTO part VALUES (
    308,
    'black',
    'big toe',
    8923.60
);

INSERT INTO part VALUES (
    747,
    'red',
    'index finger',
    1008.65
);

INSERT INTO part VALUES (
    100,
    'green',
    'legs',
    7705.20
);

INSERT INTO part VALUES (
    266,
    'green',
    'index finger',
    867.26
);

INSERT INTO part VALUES (
    207,
    'green',
    'lower leg',
    770.61
);

INSERT INTO part VALUES (
    428,
    'green',
    'shin',
    5366.52
);

INSERT INTO part VALUES (
    147,
    'green',
    'finger',
    6594.25
);

INSERT INTO part VALUES (
    1027,
    'blue',
    'hip',
    6443.52
);

INSERT INTO part VALUES (
    238,
    'green',
    'shin',
    3200.22
);

INSERT INTO part VALUES (
    169,
    'blue',
    'big toe',
    6160.62
);

INSERT INTO part VALUES (
    711,
    'green',
    'ear',
    7495.36
);

INSERT INTO part VALUES (
    957,
    'red',
    'hip',
    6795.73
);

INSERT INTO part VALUES (
    946,
    'green',
    'upper arm',
    1167.44
);

INSERT INTO part VALUES (
    320,
    'green',
    'shoulder',
    4764.13
);

INSERT INTO part VALUES (
    704,
    'yellow',
    'finger',
    5237.92
);

INSERT INTO part VALUES (
    956,
    'yellow',
    'big toe',
    6061.38
);

INSERT INTO part VALUES (
    199,
    'green',
    'teeth',
    6124.79
);

INSERT INTO part VALUES (
    178,
    'red',
    'shin',
    5843.50
);

INSERT INTO part VALUES (
    439,
    'red',
    'lips',
    9271.09
);

INSERT INTO contractor VALUES (
    660,
    'Josphine   Arbia',
    '23 Stonybrook Street  Coventry, RI 02816'
);

INSERT INTO contractor VALUES (
    356,
    'Charlyn   Carrier',
    '90 8th Ave.  Shelton, CT 06484'
);

INSERT INTO contractor VALUES (
    377,
    'Reinaldo   Chackel',
    '8791 Lafayette Road  Champaign, IL 61821'
);

INSERT INTO contractor VALUES (
    1063,
    'Vina   Guereca',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO contractor VALUES (
    959,
    'Kiley   Novoa',
    '291 Westport St.  Beckley, WV 25801'
);

INSERT INTO contractor VALUES (
    397,
    'Cathi   Greenwald',
    '8677 Lyme Street  Fairfield, CT 06824'
);

INSERT INTO contractor VALUES (
    804,
    'Joaquin   Mcneil',
    '2 Walt Whitman Lane  Schererville, IN 46375'
);

INSERT INTO contractor VALUES (
    949,
    'Leonard   Zmijewski',
    '8386B N. Gates St.  Kernersville, NC 27284'
);

INSERT INTO contractor VALUES (
    750,
    'Loretta   Guereca',
    '9036 Shub Farm St.  Ooltewah, TN 37363'
);

INSERT INTO contractor VALUES (
    391,
    'Elise   Spooner',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    607,
    'Rod   Leopold',
    '485 S. Lafayette Ave.  Saint Cloud, MN 56301'
);

INSERT INTO contractor VALUES (
    262,
    'Darren   Torelli',
    '90 8th Ave.  Shelton, CT 06484'
);

INSERT INTO contractor VALUES (
    100,
    'Agnus   Zok',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    526,
    'Samual   Corsetti',
    '548 Cleveland Avenue  Belmont, MA 02478'
);

INSERT INTO contractor VALUES (
    849,
    'Torrie   Kitchin',
    '574 Third Drive  Webster, NY 14580'
);

INSERT INTO contractor VALUES (
    286,
    'Charlyn   Kissinger',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    878,
    'Alva   Pitfield',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO contractor VALUES (
    399,
    'Simone   Ophir',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    469,
    'Shela   Borah',
    '291 Westport St.  Beckley, WV 25801'
);

INSERT INTO contractor VALUES (
    732,
    'Bao   Lampe',
    '9511 Young Dr.  Mechanicsburg, PA 17050'
);

INSERT INTO contractor VALUES (
    456,
    'Rocco   Bisbee',
    '7177 Galvin Lane  Bayside, NY 11361'
);

INSERT INTO contractor VALUES (
    328,
    'Gwyneth   Perko',
    '640 Birchwood Drive  Hanover, PA 17331'
);

INSERT INTO contractor VALUES (
    575,
    'Lorinda   Scholl',
    '9511 Young Dr.  Mechanicsburg, PA 17050'
);

INSERT INTO contractor VALUES (
    298,
    'Yoshiko   Dhebar',
    '8791 Lafayette Road  Champaign, IL 61821'
);

INSERT INTO contractor VALUES (
    984,
    'Heidi   Usseglio',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    307,
    'Micaela   Carmichael',
    '2 Walt Whitman Lane  Schererville, IN 46375'
);

INSERT INTO contractor VALUES (
    669,
    'Giovanni   Markham',
    '942 Military Street  Fredericksburg, VA 22405'
);

INSERT INTO contractor VALUES (
    869,
    'Kenyatta   Jagger',
    '9036 Shub Farm St.  Ooltewah, TN 37363'
);

INSERT INTO contractor VALUES (
    689,
    'Remedios   Puggioni',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO contractor VALUES (
    654,
    'Rod   Queen',
    '23 Stonybrook Street  Coventry, RI 02816'
);

INSERT INTO contractor VALUES (
    258,
    'Clifford   Lemon',
    '8140 Glenholme Street  West Des Moines, IA 50265'
);

INSERT INTO contractor VALUES (
    323,
    'Pearlie   Puggioni',
    '9036 Shub Farm St.  Ooltewah, TN 37363'
);

INSERT INTO contractor VALUES (
    184,
    'Rhiannon   Schneiderman',
    '46 Anderson Street  Dallas, GA 30132'
);

INSERT INTO contractor VALUES (
    405,
    'Kiley   Markham',
    '8 Grant Ave.  Green Bay, WI 54302'
);

INSERT INTO contractor VALUES (
    444,
    'Stephine   Zorich',
    '485 S. Lafayette Ave.  Saint Cloud, MN 56301'
);

INSERT INTO contractor VALUES (
    686,
    'Tressie   Kitchin',
    '793 Indian Spring Ave.  Trussville, AL 35173'
);

INSERT INTO contractor VALUES (
    266,
    'Donnell   Black',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO contractor VALUES (
    964,
    'Rickey   Maller',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO contractor VALUES (
    327,
    'Beatrice   Zevin',
    '9036 Shub Farm St.  Ooltewah, TN 37363'
);

INSERT INTO contractor VALUES (
    933,
    'Anabel   Siphron',
    '8 Grant Ave.  Green Bay, WI 54302'
);

INSERT INTO contractor VALUES (
    482,
    'Eugenio   Gulley',
    '8140 Glenholme Street  West Des Moines, IA 50265'
);

INSERT INTO contractor VALUES (
    681,
    'Leonard   Pestana',
    '793 Indian Spring Ave.  Trussville, AL 35173'
);

INSERT INTO contractor VALUES (
    430,
    'Janee   Bronars',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO contractor VALUES (
    1019,
    'Versie   Waterfield',
    '92 Border Ave.  Little Rock, AR 72209'
);

INSERT INTO contractor VALUES (
    734,
    'Pilar   Bartholet',
    '7302 Summit Ave.  Potomac, MD 20854'
);

INSERT INTO contractor VALUES (
    367,
    'Van   Wiatrowsky',
    '8 Grant Ave.  Green Bay, WI 54302'
);

INSERT INTO contractor VALUES (
    226,
    'Francie   Power',
    '7888 Market Rd.  Rowlett, TX 75088'
);

INSERT INTO project VALUES (
    960,
    1063,
    6498.62,
    TO_DATE('28/2/2015', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    943,
    307,
    5281.52,
    TO_DATE('4/8/2014', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    331,
    258,
    1150.22,
    TO_DATE('26/12/2006', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    929,
    397,
    824.65,
    TO_DATE('17/7/2005', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    433,
    964,
    6863.05,
    TO_DATE('5/4/2016', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    411,
    262,
    4672.82,
    TO_DATE('6/5/2016', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    674,
    405,
    503.94,
    TO_DATE('4/10/2017', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    126,
    689,
    2652.36,
    TO_DATE('11/1/2007', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    709,
    734,
    1016.13,
    TO_DATE('12/11/2004', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    990,
    526,
    7238.99,
    TO_DATE('19/7/2010', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    583,
    266,
    7040.34,
    TO_DATE('4/4/2004', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    205,
    226,
    3189.77,
    TO_DATE('4/10/2003', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    662,
    849,
    6868.31,
    TO_DATE('2/3/2015', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    159,
    734,
    7687.88,
    TO_DATE('18/11/2008', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    370,
    984,
    2085.46,
    TO_DATE('22/5/2005', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    588,
    575,
    4586.64,
    TO_DATE('28/8/2011', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    743,
    734,
    5663.91,
    TO_DATE('1/3/2015', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    364,
    933,
    3491.96,
    TO_DATE('23/6/2009', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    908,
    686,
    2735.68,
    TO_DATE('16/12/2001', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    970,
    869,
    5173.89,
    TO_DATE('26/8/2003', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    495,
    933,
    5972.98,
    TO_DATE('19/12/2013', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    448,
    654,
    2306.82,
    TO_DATE('11/11/2003', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    148,
    1063,
    4053.44,
    TO_DATE('29/8/2001', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    1088,
    469,
    8384.26,
    TO_DATE('28/6/2008', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    759,
    430,
    7136.05,
    TO_DATE('23/6/2003', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    713,
    399,
    7014.72,
    TO_DATE('18/2/2012', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    280,
    669,
    2292.37,
    TO_DATE('28/11/2004', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    742,
    607,
    8331.60,
    TO_DATE('13/11/2007', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    389,
    456,
    901.76,
    TO_DATE('1/10/2016', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    289,
    526,
    7131.29,
    TO_DATE('5/3/2006', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    798,
    323,
    4742.22,
    TO_DATE('28/9/2006', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    893,
    399,
    4840.20,
    TO_DATE('14/1/2002', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    472,
    469,
    5401.75,
    TO_DATE('10/1/2011', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    878,
    526,
    8195.44,
    TO_DATE('8/2/2015', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    386,
    184,
    9512.64,
    TO_DATE('2/9/2009', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    639,
    686,
    8500.06,
    TO_DATE('18/4/2014', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    1035,
    430,
    8046.73,
    TO_DATE('19/6/2010', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    609,
    878,
    2144.29,
    TO_DATE('15/4/2014', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    247,
    660,
    8864.58,
    TO_DATE('20/9/2007', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    959,
    732,
    5635.11,
    TO_DATE('5/6/2009', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    475,
    681,
    5327.88,
    TO_DATE('28/9/2000', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    774,
    298,
    7494.45,
    TO_DATE('12/4/2014', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    276,
    849,
    7344.07,
    TO_DATE('28/6/2014', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    796,
    444,
    2558.90,
    TO_DATE('5/4/2005', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    924,
    184,
    2197.15,
    TO_DATE('10/8/2000', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    111,
    405,
    9291.15,
    TO_DATE('19/8/2013', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    466,
    226,
    9633.60,
    TO_DATE('6/10/2012', 'DD/MM/YYYY')
);

INSERT INTO project VALUES (
    712,
    849,
    2869.59,
    TO_DATE('8/8/2017', 'DD/MM/YYYY')
);

INSERT INTO order_t VALUES (
    796,
    809,
    245,
    480
);

INSERT INTO order_t VALUES (
    674,
    957,
    112,
    391
);

INSERT INTO order_t VALUES (
    609,
    502,
    969,
    89
);

INSERT INTO order_t VALUES (
    364,
    367,
    936,
    653
);

INSERT INTO order_t VALUES (
    929,
    809,
    124,
    832
);

INSERT INTO order_t VALUES (
    247,
    308,
    292,
    293
);

INSERT INTO order_t VALUES (
    364,
    207,
    936,
    318
);

INSERT INTO order_t VALUES (
    148,
    693,
    919,
    413
);

INSERT INTO order_t VALUES (
    205,
    191,
    724,
    115
);

INSERT INTO order_t VALUES (
    111,
    1027,
    203,
    860
);

INSERT INTO order_t VALUES (
    364,
    308,
    112,
    261
);

INSERT INTO order_t VALUES (
    712,
    628,
    484,
    660
);

INSERT INTO order_t VALUES (
    674,
    428,
    258,
    243
);

INSERT INTO order_t VALUES (
    126,
    191,
    724,
    656
);

INSERT INTO order_t VALUES (
    411,
    1029,
    307,
    827
);

INSERT INTO order_t VALUES (
    466,
    957,
    1081,
    972
);

INSERT INTO order_t VALUES (
    364,
    941,
    531,
    233
);

INSERT INTO order_t VALUES (
    924,
    191,
    292,
    962
);

INSERT INTO order_t VALUES (
    959,
    169,
    170,
    593
);

INSERT INTO order_t VALUES (
    924,
    502,
    446,
    409
);

INSERT INTO order_t VALUES (
    386,
    804,
    685,
    898
);

INSERT INTO order_t VALUES (
    472,
    199,
    963,
    893
);

INSERT INTO order_t VALUES (
    495,
    927,
    688,
    114
);

INSERT INTO order_t VALUES (
    386,
    874,
    240,
    156
);

INSERT INTO order_t VALUES (
    433,
    147,
    582,
    574
);

INSERT INTO order_t VALUES (
    472,
    320,
    963,
    917
);

INSERT INTO order_t VALUES (
    924,
    308,
    331,
    761
);

INSERT INTO order_t VALUES (
    908,
    308,
    292,
    32
);

INSERT INTO order_t VALUES (
    148,
    882,
    446,
    129
);

INSERT INTO order_t VALUES (
    472,
    169,
    484,
    250
);

INSERT INTO order_t VALUES (
    970,
    686,
    1070,
    207
);

INSERT INTO order_t VALUES (
    990,
    100,
    576,
    48
);

INSERT INTO order_t VALUES (
    639,
    428,
    582,
    637
);

INSERT INTO order_t VALUES (
    639,
    946,
    106,
    400
);

INSERT INTO order_t VALUES (
    583,
    742,
    729,
    591
);

INSERT INTO order_t VALUES (
    712,
    266,
    120,
    941
);

INSERT INTO order_t VALUES (
    126,
    538,
    170,
    876
);

INSERT INTO order_t VALUES (
    662,
    742,
    688,
    762
);

INSERT INTO order_t VALUES (
    448,
    874,
    936,
    621
);

INSERT INTO order_t VALUES (
    472,
    946,
    484,
    939
);

INSERT INTO order_t VALUES (
    674,
    158,
    1045,
    378
);

INSERT INTO order_t VALUES (
    759,
    367,
    981,
    449
);

INSERT INTO order_t VALUES (
    370,
    904,
    531,
    297
);

INSERT INTO order_t VALUES (
    433,
    693,
    112,
    300
);

INSERT INTO order_t VALUES (
    364,
    100,
    203,
    968
);

INSERT INTO order_t VALUES (
    713,
    191,
    1003,
    560
);

INSERT INTO order_t VALUES (
    583,
    224,
    1045,
    944
);

INSERT INTO order_t VALUES (
    709,
    1053,
    724,
    730
);

INSERT INTO order_t VALUES (
    796,
    308,
    331,
    538
);

INSERT INTO order_t VALUES (
    588,
    742,
    919,
    626
);
--3

SELECT UNIQUE
    part.name
FROM
    order_t
    INNER JOIN part ON order_t.partid = part.id;

--4

SELECT UNIQUE
    supplier.name
FROM
    supplier
    INNER JOIN order_t ON order_t.suppid = supplier.id
    INNER JOIN part ON order_t.partid = part.id
WHERE
    part.color = 'blue'
    OR part.color = 'yellow';

--5 return    


--6

SELECT
    id           project_id,
    contractor   contractor
FROM
    (
        SELECT
            project.id        id,
            contractor.name   contractor,
            project.budget
        FROM
            contractor
            INNER JOIN project ON project.cid = contractor.id
        ORDER BY
            project.budget DESC
    )
WHERE
    ROWNUM = 1;

--7

SELECT
    contractor.name   contractor
FROM
    contractor
    INNER JOIN project ON project.cid = contractor.id
WHERE
    project.budget > 10000;