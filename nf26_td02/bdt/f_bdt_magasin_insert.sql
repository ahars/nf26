INSERT INTO f_bdt_magasin
(SELECT departement, nom, population, rayonnage, ray_nom, magasin, rayon_bs
FROM f_bde_te_departement, f_bde_te_marketing
WHERE departement = dpt
);

select * from f_bdt_magasin;
