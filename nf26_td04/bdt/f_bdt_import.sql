CREATE OR REPLACE PROCEDURE f_bdt_import
IS
BEGIN

INSERT INTO f_bdt_catalogue
(SELECT *
FROM f_bde_catalogue
);

INSERT INTO f_bdt_magasin
(
SELECT v.magasin, d.departement, d.nom, d.population, v.rayonnage, v.ray_nom, v.rayon_bs
FROM
(SELECT u.magasin, m.dpt, m.rayonnage, m.ray_nom, m.rayon_bs FROM (
SELECT distinct(magasin) as magasin FROM f_bde_te_data
UNION
SELECT magasin FROM f_bde_te_marketing) u, f_bde_te_marketing m
WHERE u.magasin = m.magasin (+)) v, f_bde_te_departement d
WHERE v.dpt = d.departement (+)
);

INSERT INTO f_bdt_date
(SELECT DISTINCT date_data
FROM f_bde_te_data
);

INSERT INTO f_bdt_ventes
(SELECT ticket, date_data AS fk_date, magasin AS fk_magasin, isbn AS fk_livre
FROM f_bde_te_data
);

END;