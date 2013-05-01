DROP TABLE l_dw_store;

CREATE TABLE l_dw_store (
mag VARCHAR(4),
dateOpening VARCHAR(10),
planet VARCHAR(50),
sector VARCHAR(9),
population VARCHAR(2),
solarSystem VARCHAR(50),
quadran VARCHAR(3)
);

CREATE UNIQUE INDEX l_dw_store_idx ON l_dw_store(mag);

ALTER TABLE l_dw_store
ADD CONSTRAINT l_dw_store_pk PRIMARY KEY (mag);