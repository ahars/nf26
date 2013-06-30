/* ---- PARTIE 1 ---- */

/* Total des ventes en fonction du jour de la semaine */
SELECT d.jds, COUNT(*)
FROM f_dw_ventes v, f_dw_date d
where d.dat = v.dat
group by d.jds
order by count(*) desc;

/* Moyenne journalière des ventes hors samedi */
SELECT avg(cnt)
FROM (
SELECT d.jds, COUNT(*) as cnt
FROM f_dw_ventes v, f_dw_date d
WHERE d.dat = v.dat
GROUP BY d.jds
HAVING d.jds NOT LIKE 'samedi%'
);

/* Requête équivalente */
SELECT avg(cnt)
FROM (
SELECT d.jds, COUNT(*) as cnt
FROM f_dw_ventes v, f_dw_date d
WHERE d.dat = v.dat
GROUP BY d.jds
)
WHERE jds NOT LIKE 'samedi%';

CREATE OR REPLACE VIEW ventes_par_jours AS
SELECT d.jds, COUNT(*) as cnt
FROM f_dw_ventes v, f_dw_date d
WHERE d.dat = v.dat
GROUP BY d.jds;

CREATE OR REPLACE VIEW ventes_moyennes_hors_samedi AS
SELECT avg(cnt) as moyenne
FROM (
SELECT d.jds, COUNT(*) as cnt
FROM f_dw_ventes v, f_dw_date d
WHERE d.dat = v.dat
GROUP BY d.jds
HAVING d.jds NOT LIKE 'samedi%'
);

CREATE OR REPLACE VIEW ratio_ventes_samedi AS
SELECT round(cnt / moyenne, 2) as ratio
FROM ventes_par_jours, ventes_moyennes_hors_samedi
WHERE jds LIKE 'samedi%';


/* Total des ventes par rayon (Information inutile car on ne connait pas la
proportion des rayons */
CREATE OR REPLACE VIEW total_vente_par_rayon AS
SELECT ray, count(*) as cnt
FROM f_dw_magasin m, f_dw_ventes v
WHERE m.mag = v.mag
GROUP BY m.ray;

/* Nombre total de ventes (Non demandé) */
CREATE OR REPLACE VIEW total_ventes AS
SELECT count(*) as total
FROM f_dw_ventes;

/* Ratio des ventes par rayon (Non demandé) */
SELECT ray, round(cnt / total,2) as ratio
FROM (
SELECT m.ray, count(*) as cnt, total as total
FROM f_dw_magasin m, f_dw_ventes v, total_ventes t
WHERE m.mag = v.mag
GROUP BY m.ray, total
);

/* Nombre de rayon de chaque type */
CREATE OR REPLACE VIEW nb_rayon_par_type AS
SELECT ray, count(ray) as total
FROM f_dw_magasin
GROUP BY ray;

/* Nombre moyen de ventes par rayon */
SELECT v1.ray, cnt, total, round(cnt / total,0)
FROM total_vente_par_rayon v1, nb_rayon_par_type v2
WHERE v1.ray = v2.ray;

/* Total ventes par semaine */
CREATE OR REPLACE VIEW total_ventes_semaine AS
SELECT sem, count(*) as total
FROM f_dw_ventes v, f_dw_date d
WHERE v.dat = d.dat
GROUP BY sem
ORDER BY sem;

-- exécution du script /tmp/exportCsv.sql
@/volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/scripts/exportCsv.sql

/* ---- PARTIE 2 ---- */

/* Hiérarchie date / mois / trimestre */
SELECT d.tri, d.mon, d.dat, count(*)
FROM f_dw_date d, f_dw_ventes v
WHERE v.dat = d.dat
GROUP BY ROLLUP (d.tri, d.mon, d.dat);

SELECT p.isbn, count(p.isbn) as cnt, RANK() OVER (ORDER BY count(p.isbn) desc) as rank
FROM f_dw_ventes v, f_dw_produit p
WHERE v.pro = p.isbn
GROUP BY p.isbn;

/* nb ventes par livre */
DROP VIEW rank_bs;

CREATE VIEW rank_bs AS
SELECT p.isbn, count(p.isbn) as cnt, RANK() OVER (ORDER BY count(p.isbn) desc) as rank
FROM f_dw_ventes v, f_dw_produit p
WHERE v.pro = p.isbn
GROUP BY p.isbn;

/* bs */
CREATE OR REPLACE VIEW f_dw_produit_bs AS
SELECT r.isbn,
CASE WHEN r.rank < 9 THEN '1'
ELSE '0'
END bs,
CASE WHEN r.rank < 30 THEN '1'
ELSE '0'
END top30
FROM rank_bs r;

/* Analyse des ventes en fonction des rayons bs et exportation csv */

CREATE OR REPLACE VIEW ventes_magasins_bs AS
SELECT p.bs as produit_bs, m.bs as magasin_bs, count(*) as cnt
FROM f_dw_ventes v, f_dw_produit_bs p, f_dw_magasin m
WHERE v.pro = p.isbn AND v.mag = m.mag
GROUP BY CUBE (p.bs, m.bs);

@/volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/scripts/export_ventes_magasins_bs.sql

/* Total cumulé des ventes en fonction de la semaine de l'année
et exportation du résultat en csv pour exploitation sous tableur*/

CREATE OR REPLACE VIEW ventes_cumul_semaine AS
SELECT d.sem, SUM(COUNT(*)) OVER (ORDER BY d.sem ROWS UNBOUNDED PRECEDING) as total_cumule
FROM f_dw_ventes v, f_dw_date d
WHERE v.dat = d.dat
GROUP BY d.sem;

@/volsme/user1x/uvs/nf26/nf26p024/Desktop/td03/scripts/export_ventes_cumul_semaine.sql

/* Etudier l'eventuelle influence des magasins (certains sont-ils plus performants ?)
et de l'implantation dans les départements (certains sont-ils plus propices ?)*/