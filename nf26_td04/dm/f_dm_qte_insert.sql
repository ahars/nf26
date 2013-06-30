ALTER TABLE f_dm_qte DISABLE CONSTRAINT f_dm_qte_fkdat;
ALTER TABLE f_dm_qte DISABLE CONSTRAINT f_dm_qte_fkmag;

INSERT INTO f_dm_qte (fk_date, fk_mag, qte)
SELECT dat, mag, count(*) as q
FROM f_dw_ventes
GROUP BY mag, dat, ticket;

ALTER TABLE f_dm_qte ENABLE CONSTRAINT f_dm_qte_fkmag;
ALTER TABLE f_dm_qte ENABLE CONSTRAINT f_dm_qte_fkdat;