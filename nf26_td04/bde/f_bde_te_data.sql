DROP TABLE f_bde_te_data;

CREATE TABLE f_bde_te_data (
  ticket number(13),
  magasin VARCHAR(10),
  date_data CHAR(10),
  isbn VARCHAR(13)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024datafile
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024tmp:'data2b.bad'
LOGFILE nf26p024tmp:'data2b.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('data2b'))
REJECT LIMIT UNLIMITED;