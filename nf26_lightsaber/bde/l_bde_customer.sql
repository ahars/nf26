DROP TABLE l_bde_customer;

CREATE TABLE l_bde_customer (
  licence VARCHAR2(11),
  grade VARCHAR2(50),
  gender VARCHAR2(6)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024lightsaberdatafile
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024lightsabertmp:'customer.csv.bad'
LOGFILE nf26p024lightsabertmp:'customer.csv.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('Customer'))
REJECT LIMIT UNLIMITED;