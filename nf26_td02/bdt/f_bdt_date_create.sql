CREATE TABLE f_bdt_date OF ddate;
CREATE UNIQUE INDEX f_bdt_date_idx ON f_bdt_date(date_data);

ALTER TABLE f_bdt_date
ADD CONSTRAINT f_bdt_date_pk PRIMARY KEY (date_data);