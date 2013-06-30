DROP TABLE l_dw_date;

CREATE TABLE l_dw_date (
ddate date,
jds VARCHAR2(8),
sem NUMBER(2),
mon NUMBER(2),
tri NUMBER(1)
);

CREATE UNIQUE INDEX l_dw_date_idx ON l_dw_date(ddate);

ALTER TABLE l_dw_date
ADD CONSTRAINT l_dw_date_pk PRIMARY KEY (ddate);