DROP TABLE l_dw_customerlicence;

CREATE TABLE l_dw_customerlicence (
licence VARCHAR2(11),
name VARCHAR2(50),
date_naiss date,
grade VARCHAR2(50),
gender VARCHAR2(6)
);

CREATE UNIQUE INDEX l_dw_customerlicence_idx ON l_dw_customerlicence(licence);

ALTER TABLE l_dw_customerlicence
ADD CONSTRAINT l_dw_customerlicence_pk PRIMARY KEY (licence);