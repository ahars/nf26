ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fkmag;
ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fklicence;
ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fkdate;

ALTER TABLE l_bdt_store DISABLE CONSTRAINT l_bdt_store_pk;
ALTER TABLE l_bdt_date DISABLE CONSTRAINT l_bdt_date_pk;
ALTER TABLE l_bdt_customerlicence DISABLE CONSTRAINT l_bdt_customerlicence_pk;

DROP INDEX l_bdt_store_idx;
DROP INDEX l_bdt_date_idx;
DROP INDEX l_bdt_customerlicence_idx;

/* Jointure externe => Résolution du problème: Système solaire de la planète non présent dans la table des systèmes solaires */
INSERT INTO l_bdt_store
(SELECT st.mag, st.dateOpening, st.planet, se.sector, p.population, p.solarSystem, so.quadran
FROM l_bde_store st, l_bde_planet p, l_bde_sector se, l_bde_solar so
WHERE st.planet = p.planet
AND p.planet = se.planet
AND p.solarSystem = so.solarSystem (+)
);

/* Résolution du problème: stores avec planète nulle */
INSERT INTO l_bdt_store (mag, dateopening, planet)
(SELECT mag, dateOpening, planet
FROM l_bde_store
WHERE planet is null);

/* Résolution du problème: Ventes dans des stores non référencés */
INSERT INTO l_bdt_store (mag)
SELECT DISTINCT mag FROM l_bde_vente WHERE mag NOT IN (SELECT DISTINCT mag FROM l_bde_store);

/* Résolution du problème: Planètes de même nom dans deux systèmes solaires différents */
UPDATE l_bdt_store
SET sector = null, population = null, solarsystem = null, quadran = null
WHERE mag IN (
SELECT DISTINCT mag
FROM l_bdt_store l
GROUP BY l.mag
HAVING count(l.mag) > 1
);
DELETE FROM l_bdt_store
WHERE rowid not in
(SELECT MIN(rowid)
FROM l_bdt_store
GROUP BY mag);
/* ---- */

/*
108 enregistrements avec une date nulle sur 10470 au total.
Il ne faut pas rejeter ces enregistrements.
Il faut transférer toutes les données entre le bde et le bdt, puis si possible, déclarer explicitement les contraintes.
Si ce n'est pas possible, on ne déclare pas ces contraintes.
*/
INSERT INTO l_bdt_date
(SELECT DISTINCT(date_vente)
FROM l_bde_vente v
WHERE v.date_vente IS NOT NULL
);

/* Résolution du problème: Incohérence des licences entre les tables customer, licence et vente */
INSERT INTO l_bdt_customerlicence
(SELECT l.licence, li.name, li.date_naiss, cu.grade, cu.gender from (
SELECT licence
FROM l_bde_customer cu
UNION
SELECT licence
FROM l_bde_licence li
UNION
SELECT distinct licence
FROM l_bde_vente v) l, l_bde_customer cu, l_bde_licence li
WHERE l.licence = cu.licence (+)
AND l.licence = li.licence (+)
AND l.licence IS NOT NULL
);

INSERT INTO l_bdt_vente
(SELECT v.date_vente, v.mag, v.licence
FROM l_bde_vente v
);

CREATE UNIQUE INDEX l_bdt_store_idx ON l_bdt_store(mag);
CREATE UNIQUE INDEX l_bdt_customerlicence_idx ON l_bdt_customerlicence(licence);
CREATE UNIQUE INDEX l_bdt_date_idx ON l_bdt_date(ddate);

ALTER TABLE l_bdt_store ENABLE CONSTRAINT l_bdt_store_pk EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_date ENABLE CONSTRAINT l_bdt_date_pk EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_customerlicence ENABLE CONSTRAINT l_bdt_customerlicence_pk EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fklicence EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fkdate EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fkmag EXCEPTIONS into exceptions;