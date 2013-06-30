DROP TABLE l_bde_licence;

CREATE TABLE l_bde_licence (
  licence VARCHAR2(11),
  name VARCHAR2(50),
  date_naiss VARCHAR2(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024lightsaberdatafile
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024lightsabertmp:'licence.csv.bad'
LOGFILE nf26p024lightsabertmp:'licence.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('Licence'))
REJECT LIMIT UNLIMITED;


