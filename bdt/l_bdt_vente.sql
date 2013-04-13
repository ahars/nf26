CREATE TABLE l_bdt_vente OF typeVente;

ALTER TABLE l_bdt_vente
ADD CONSTRAINT l_bdt_vente_fklicence
FOREIGN KEY (fk_licence) REFERENCES l_bdt_customerlicence(licence);

/*ALTER TABLE l_bdt_vente
ADD CONSTRAINT l_bdt_vente_fkmag
FOREIGN KEY (fk_mag) REFERENCES l_bdt_store(mag);*/

ALTER TABLE l_bdt_vente
ADD CONSTRAINT l_bdt_vente_fkdate
FOREIGN KEY (fk_date) REFERENCES l_bdt_date(ddate);