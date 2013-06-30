-- script /volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/scripts/export_ventes_magasins_bs.sql
SET HEADING OFF
SET FEEDBACK OFF
SET TRIMSPOOL ON
SET ECHO OFF
SET PAGESIZE 0
SPOOL /volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/ventesMagasinsBs.dat
SELECT '"' || v.produit_bs || '";"' || v.magasin_bs || '";"' || v.cnt || '"' FROM ventes_magasins_bs v;
SPOOL OFF