DROP TABLE l_bdt_vente;

CREATE OR REPLACE TYPE typeVente AS OBJECT (
fk_date VARCHAR2(10),
fk_mag VARCHAR2(4),
fk_licence VARCHAR2(11),

MEMBER FUNCTION getDate RETURN varchar2,
MEMBER FUNCTION getMag RETURN varchar2,
MEMBER FUNCTION getLicence RETURN varchar2

);