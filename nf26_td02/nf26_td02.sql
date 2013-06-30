/* BDE */

@f_bde_catalogue.sql
@f_bde_directories.sql
@f_bde_te_departement.sql
@f_bde_te_marketing.sql
@f_bde_te_data.sql

/* BDT */

DROP TABLE f_bdt_ventes;

@f_bdt_catalogue.sql
@f_bdt_magasin.sql
@f_bdt_date.sql
@f_bdt_vente.sql
@f_bdt_import.sql
@f_bdt_import_call.sql

/* Methodes */

@f_bdt_bodies.sql

/* DW */

DROP TABLE f_dw_ventes;
DROP TABLE f_dw_produit;
DROP TABLE f_dw_magasin;
DROP TABLE f_dw_date;

@f_dw_produit.sql
@f_dw_magasin.sql
@f_dw_date.sql
@f_dw_ventes.sql
@f_dw_import.sql


