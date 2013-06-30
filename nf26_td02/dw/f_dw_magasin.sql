CREATE TABLE f_dw_magasin (
mag char(4),      
bs char(1), 
ray char(1),
dpt char(2), 
dptnom varchar2(50),       
dptpop number(7)
);

CREATE UNIQUE INDEX f_dw_magasin_idx ON f_dw_magasin(mag);

ALTER TABLE f_dw_magasin
ADD CONSTRAINT f_dw_magasin_pk PRIMARY KEY (mag);