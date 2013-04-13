/*ALTER TABLE l_dw_vente DISABLE CONSTRAINT l_dw_vente_fkmag;*/
ALTER TABLE l_dw_vente DISABLE CONSTRAINT l_dw_vente_fklicence;
ALTER TABLE l_dw_vente DISABLE CONSTRAINT l_dw_vente_fkdate;

/*ALTER TABLE l_dw_store DISABLE CONSTRAINT l_dw_store_pk;*/
ALTER TABLE l_dw_date DISABLE CONSTRAINT l_dw_date_pk;
ALTER TABLE l_dw_customerlicence DISABLE CONSTRAINT l_dw_customerlicence_pk;

/*DROP INDEX l_dw_store_idx;*/
DROP INDEX l_dw_date_idx;
DROP INDEX l_dw_customerlicence_idx;


INSERT INTO l_dw_store(mag, dateOpening, planet, sector, population, solarSystem, quadran)
SELECT st.getMag(), st.getDateOpening(), st.getPlanet(), st.getSector(), st.getPopulation(), st.getSolarSystem(), st.getQuadran()
FROM l_bdt_store st;

/* TODO traitement des dates. */
INSERT INTO l_dw_date (ddate, jds, sem, mon, tri)
SELECT d.getDat(), d.getJds(), d.getSem(), d.getMon(), d.getTri()
FROM l_bdt_date d;

INSERT INTO l_dw_customerlicence (licence, name, date_naiss, grade, gender)
SELECT cu.getLicence(), cu.getName(), cu.getDate_naiss(), cu.getGrade(), cu.getGender()
FROM l_bdt_customerlicence cu;

/* Erreur de date pour le mois. */
INSERT INTO l_dw_vente (fk_date, fk_mag, fk_licence)
SELECT v.getDate(), v.getMag(), v.getLicence()
FROM l_bdt_vente v;


/*CREATE UNIQUE INDEX l_dw_store_idx ON l_dw_store(mag);*/
CREATE UNIQUE INDEX l_dw_customerlicence_idx ON l_dw_customerlicence(licence);
CREATE UNIQUE INDEX l_dw_date_idx ON l_dw_date(ddate);

/*ALTER TABLE l_dw_store ENABLE CONSTRAINT l_dw_store_pk EXCEPTIONS into exceptions;*/
ALTER TABLE l_dw_date ENABLE CONSTRAINT l_dw_date_pk EXCEPTIONS into exceptions;
ALTER TABLE l_dw_customerlicence ENABLE CONSTRAINT l_dw_customerlicence_pk EXCEPTIONS into exceptions;
ALTER TABLE l_dw_vente ENABLE CONSTRAINT l_dw_vente_fklicence EXCEPTIONS into exceptions;
ALTER TABLE l_dw_vente ENABLE CONSTRAINT l_dw_vente_fkdate EXCEPTIONS into exceptions;
/*ALTER TABLE l_dw_vente ENABLE CONSTRAINT l_dw_vente_fkmag EXCEPTIONS into exceptions;*/