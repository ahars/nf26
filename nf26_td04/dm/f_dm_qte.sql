CREATE TABLE f_dm_qte (
fk_date date,
fk_mag VARCHAR2(10),
qte NUMBER(2)
);

ALTER TABLE f_dm_qte
ADD CONSTRAINT f_dm_qte_fkdat
FOREIGN KEY (fk_date) REFERENCES f_dw_date(dat);

ALTER TABLE f_dm_qte
ADD CONSTRAINT f_dm_qte_fkmag
FOREIGN KEY (fk_mag) REFERENCES f_dw_magasin(mag);