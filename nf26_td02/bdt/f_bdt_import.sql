CREATE OR REPLACE PROCEDURE f_bdt_import
IS
BEGIN

INSERT INTO f_bdt_catalogue
(SELECT *
FROM f_bde_catalogue
);

INSERT INTO f_bdt_magasin
(SELECT departement, nom, population, rayonnage, ray_nom, magasin, rayon_bs
FROM f_bde_te_departement, f_bde_te_marketing
WHERE departement = dpt
);

INSERT INTO f_bdt_date
(SELECT DISTINCT date_data
FROM f_bde_te_data
);

INSERT INTO f_bdt_ventes
(SELECT date_data AS fk_date, magasin AS fk_magasin, isbn AS fk_livre
FROM f_bde_te_data
);

END;