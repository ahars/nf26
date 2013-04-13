CREATE TABLE l_bdt_customerlicence OF typeCustomerLicence;

CREATE UNIQUE INDEX l_bdt_customerlicence_idx ON l_bdt_customerlicence(licence);

ALTER TABLE l_bdt_customerlicence
ADD CONSTRAINT l_bdt_customerlicence_pk PRIMARY KEY (licence);