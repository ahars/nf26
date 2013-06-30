DROP TABLE f_bde_te_marketing;

CREATE TABLE f_bde_te_marketing (
  dpt NUMBER(2),
  rayonnage CHAR(1),
  ray_nom VARCHAR(10),
  magasin VARCHAR(4),
  rayon_bs NUMBER(1)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024data
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
SKIP 1
characterset UTF8
BADFILE nf26p024tmp:'marketing.csv.bad'
LOGFILE nf26p024tmp:'marketing.csv.log'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('marketing.csv'))
REJECT LIMIT UNLIMITED;

SELECT * from f_bde_te_marketing;