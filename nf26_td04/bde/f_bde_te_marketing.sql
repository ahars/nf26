DROP TABLE f_bde_te_marketing;

CREATE TABLE f_bde_te_marketing (
  magasin VARCHAR(4),
  dpt NUMBER(2),
  rayonnage CHAR(1),
  ray_nom VARCHAR(10),
  rayon_bs NUMBER(1)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY nf26p024data
ACCESS PARAMETERS
(
RECORDS DELIMITED BY newline
characterset UTF8
BADFILE nf26p024tmp:'marketing.bad'
LOGFILE nf26p024tmp:'marketing.log'
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
)
LOCATION ('marketing'))
REJECT LIMIT UNLIMITED;