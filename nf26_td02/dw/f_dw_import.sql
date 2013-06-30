-- Désactivation des contraintes et index

ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkpro;
ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkdat;
ALTER TABLE f_dw_ventes DISABLE CONSTRAINT f_dw_ventes_fkmag;
ALTER TABLE f_dw_date DISABLE CONSTRAINT f_dw_date_pk;
ALTER TABLE f_dw_magasin DISABLE CONSTRAINT f_dw_magasin_pk;
ALTER TABLE f_dw_produit DISABLE CONSTRAINT f_dw_produit_pk;

DROP INDEX f_dw_date_idx;
DROP INDEX f_dw_magasin_idx;
DROP INDEX f_dw_produit_idx;

-- Insertion

INSERT INTO f_dw_produit(isbn,titre,auteur,langue,publication,editeur)
SELECT t.getIsbn(),t.getTitre(),t.getAuteur(),t.getLangue(),t.getPublication(),t.getEditeur()
FROM f_bdt_catalogue t;

INSERT INTO f_dw_magasin (mag,bs,ray,dpt,dptnom,dptpop)
SELECT m.getMagasin(),m.getRayonBs(),m.getRayonnage(),m.getDpt(),m.getDptnom(),m.getDptpopulation()
FROM f_bdt_magasin m;

INSERT INTO f_dw_date (dat, jds, sem, mon, tri)
SELECT t.getDat(), t.getJds(), t.getSem(), t.getMon(), t.getTri()
FROM f_bdt_date t;

INSERT INTO f_dw_ventes (mag,dat,pro)
SELECT t.getMagasin(),t.getDate(),t.getIsbn()
FROM f_bdt_ventes t;

-- Réactivation des index et contraintes

CREATE INDEX f_dw_date_idx ON f_dw_date(dat);
CREATE INDEX f_dw_magasin_idx ON f_dw_magasin(mag);
CREATE INDEX f_dw_produit_idx ON f_dw_produit(isbn);

ALTER TABLE f_dw_date ENABLE CONSTRAINT f_dw_date_pk;
ALTER TABLE f_dw_magasin ENABLE CONSTRAINT f_dw_magasin_pk;
ALTER TABLE f_dw_produit ENABLE CONSTRAINT f_dw_produit_pk;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkpro;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkdat;
ALTER TABLE f_dw_ventes ENABLE CONSTRAINT f_dw_ventes_fkmag;

/*SELECT count(*) FROM exceptions;*/

-- Vérification sommaire du transfert

SELECT * FROM f_dw_ventes WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_ventes;

SELECT * FROM f_dw_date WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_date;

SELECT * FROM f_dw_magasin WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_magasin;

SELECT * FROM f_dw_produit WHERE ROWNUM=1;
SELECT count(*) FROM f_bdt_catalogue;