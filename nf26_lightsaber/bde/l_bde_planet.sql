DROP TABLE l_bde_planet;

CREATE TABLE l_bde_planet (
  planet VARCHAR(50),
  population VARCHAR(2),
  solarSystem VARCHAR(50)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024lightsaberdatafile
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024lightsabertmp:'planet.csv.bad'
LOGFILE nf26p024lightsabertmp:'planet.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('Planet'))
REJECT LIMIT UNLIMITED;


