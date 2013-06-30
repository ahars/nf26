/* BDE */

@l_bde_directories.sql;
@l_bde_store.sql;
@l_bde_planet.sql;
@l_bde_solar.sql;
@l_bde_sector.sql;
@l_bde_customer.sql;
@l_bde_licence.sql;
@l_bde_vente.sql;

/* BDT */

@ utlexcpt.sql;
@l_bdt_type_vente.sql;
@l_bdt_type_store.sql;
@l_bdt_type_customerlicence.sql;
@l_bdt_type_date.sql;
@l_bdt_store.sql;
@l_bdt_customerlicence.sql;
@l_bdt_date.sql;
@l_bdt_vente.sql;

@l_bdt_insert.sql;

/* Bodies */

@l_bdt_typestore_body.sql;
@l_bdt_typedate_body.sql;
@l_bdt_typecustomerlicence.sql;
@l_bdt_typevente_body.sql;

/* DW */

DROP TABLE l_dw_vente;
@l_dw_store.sql;
@l_dw_customerlicence.sql;
@l_dw_date.sql;
@l_dw_vente.sql;
@l_dw_insert.sql;