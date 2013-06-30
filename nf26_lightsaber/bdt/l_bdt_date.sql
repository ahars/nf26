CREATE TABLE l_bdt_date OF typeDate;

CREATE UNIQUE INDEX l_bdt_date_idx ON l_bdt_date(ddate);

ALTER TABLE l_bdt_date
ADD CONSTRAINT l_bdt_date_pk PRIMARY KEY (ddate);
