DROP TABLE f_bde_te_departement;

CREATE TABLE f_bde_te_departement (
  departement NUMBER(2),
  nom VARCHAR(50),
  population NUMBER(10)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024data
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
characterset UTF8
BADFILE nf26p024tmp:'departementsInsee2003.txt.bad'
LOGFILE nf26p024tmp:'departementsInsee2003.txt.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('departementsInsee2003.txt'))
REJECT LIMIT UNLIMITED;