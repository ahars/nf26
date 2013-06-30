CREATE TABLE l_dw_vente (
fk_date date,
fk_mag VARCHAR2(4),
fk_licence VARCHAR2(11)
);

ALTER TABLE l_dw_vente
ADD CONSTRAINT l_dw_vente_fklicence
FOREIGN KEY (fk_licence) REFERENCES l_dw_customerlicence(licence);

ALTER TABLE l_dw_vente
ADD CONSTRAINT l_dw_vente_fkmag
FOREIGN KEY (fk_mag) REFERENCES l_dw_store(mag);

ALTER TABLE l_dw_vente
ADD CONSTRAINT l_dw_vente_fkdate
FOREIGN KEY (fk_date) REFERENCES l_dw_date(ddate);