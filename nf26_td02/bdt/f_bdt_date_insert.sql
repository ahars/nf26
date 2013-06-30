INSERT INTO f_bdt_date
(SELECT DISTINCT date_data
FROM f_bde_te_data
);

select * from f_bdt_date;
