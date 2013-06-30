DROP TABLE l_bde_solar;

CREATE TABLE l_bde_solar (
  solarSystem VARCHAR(50),
  quadran VARCHAR(3)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024lightsaberdatafile
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024lightsabertmp:'solar.csv.bad'
LOGFILE nf26p024lightsabertmp:'solar.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('SolarSystem'))
REJECT LIMIT UNLIMITED;


