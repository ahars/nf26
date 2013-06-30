CREATE TABLE f_bdt_catalogue OF livre;
CREATE UNIQUE INDEX f_bdt_catalogue_idx ON f_bdt_catalogue(isbn);

ALTER TABLE f_bdt_catalogue
ADD CONSTRAINT f_bdt_catalogue_pk UNIQUE (isbn);