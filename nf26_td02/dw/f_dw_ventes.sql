CREATE TABLE f_dw_ventes (
mag char(4),      
dat date,      
pro char(13)
);

ALTER TABLE f_dw_ventes 
ADD CONSTRAINT f_dw_ventes_fkpro 
FOREIGN KEY (pro) REFERENCES f_dw_produit(isbn);

ALTER TABLE f_dw_ventes 
ADD CONSTRAINT f_dw_ventes_fkdat 
FOREIGN KEY (dat) REFERENCES f_dw_date(dat);

ALTER TABLE f_dw_ventes 
ADD CONSTRAINT f_dw_ventes_fkmag 
FOREIGN KEY (mag) REFERENCES f_dw_magasin(mag);