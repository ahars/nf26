CREATE TABLE f_bdt_ventes OF vente;

/*ALTER TABLE f_bdt_ventes
ADD CONSTRAINT f_bdt_ventes_fkisbn
FOREIGN KEY (fk_isbn) REFERENCES f_bdt_catalogue(isbn);*/

ALTER TABLE f_bdt_ventes
ADD CONSTRAINT f_bdt_ventes_fkdate
FOREIGN KEY (fk_date) REFERENCES f_bdt_date(date_data);

ALTER TABLE f_bdt_ventes
ADD CONSTRAINT f_bdt_ventes_fkmagasin
FOREIGN KEY (fk_magasin) REFERENCES f_bdt_magasin(mag);