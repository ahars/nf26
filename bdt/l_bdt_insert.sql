/*ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fkmag;*/
ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fklicence;
ALTER TABLE l_bdt_vente DISABLE CONSTRAINT l_bdt_vente_fkdate;

/*ALTER TABLE l_bdt_store DISABLE CONSTRAINT l_bdt_store_pk;*/
ALTER TABLE l_bdt_date DISABLE CONSTRAINT l_bdt_date_pk;
ALTER TABLE l_bdt_customerlicence DISABLE CONSTRAINT l_bdt_customerlicence_pk;

/*DROP INDEX l_bdt_store_idx;*/
DROP INDEX l_bdt_date_idx;
DROP INDEX l_bdt_customerlicence_idx;

INSERT INTO l_bdt_store
(SELECT st.mag, st.dateOpening, st.planet, se.sector, p.population, p.solarSystem, so.quadran
FROM l_bde_store st, l_bde_planet p, l_bde_sector se, l_bde_solar so
WHERE st.planet = p.planet
AND p.planet = se.planet
AND p.solarSystem = so.solarSystem
);

/* TODO 1: expliquer le choix du rejet dans le rapport (108 enregistrements
avec une date nulle sur 10470 au total; créer une copie du DW pour y stocker les
données rejetées ? */
INSERT INTO l_bdt_date
(SELECT DISTINCT(date_vente)
FROM l_bde_vente v
WHERE v.date_vente IS NOT NULL
);

/* TODO 2: ajouter toutes les licences des trois tables */
INSERT INTO l_bdt_customerlicence
(SELECT cu.licence, li.name, li.date_naiss, cu.grade, cu.gender
FROM l_bde_customer cu, l_bde_licence li
WHERE li.licence = cu.licence
);

/* v.date_vente IS NOT NULL: see TODO 1
jointure nécessaire car: see TODO 2*/
INSERT INTO l_bdt_vente
(SELECT v.date_vente, v.mag, v.licence
FROM l_bde_vente v, l_bde_customer cu, l_bde_licence li
WHERE v.date_vente IS NOT NULL
AND v.licence = cu.licence AND v.licence = li.licence
);

/*CREATE UNIQUE INDEX l_bdt_store_idx ON l_bdt_store(mag);*/
CREATE UNIQUE INDEX l_bdt_customerlicence_idx ON l_bdt_customerlicence(licence);
CREATE UNIQUE INDEX l_bdt_date_idx ON l_bdt_date(ddate);

/*ALTER TABLE l_bdt_store ENABLE CONSTRAINT l_bdt_store_pk EXCEPTIONS into exceptions;*/
ALTER TABLE l_bdt_date ENABLE CONSTRAINT l_bdt_date_pk EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_customerlicence ENABLE CONSTRAINT l_bdt_customerlicence_pk EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fklicence EXCEPTIONS into exceptions;
ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fkdate EXCEPTIONS into exceptions;
/*ALTER TABLE l_bdt_vente ENABLE CONSTRAINT l_bdt_vente_fkmag EXCEPTIONS into exceptions;*/