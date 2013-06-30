INSERT INTO f_bdt_vente
(SELECT date_data AS fk_date, magasin AS fk_magasin, isbn AS fk_livre
FROM f_bde_te_data
);

select * from f_bdt_vente where rownum<10;