CREATE TABLE f_bdt_magasin OF magasin;
CREATE UNIQUE INDEX f_bdt_magasin_idx ON f_bdt_magasin(mag);

ALTER TABLE f_bdt_magasin
ADD CONSTRAINT f_bdt_magasin_pk PRIMARY KEY (mag);