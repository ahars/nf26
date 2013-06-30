-- script /volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/scripts/export_ventes_cumul_semaine.sql
SET HEADING OFF
SET FEEDBACK OFF
SET TRIMSPOOL ON
SET ECHO OFF
SET PAGESIZE 0
SPOOL /volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/ventesCumulSemaine.dat
SELECT '"' || v.sem || '";"' || v.total_cumule || '"' FROM ventes_cumul_semaine v;
SPOOL OFF