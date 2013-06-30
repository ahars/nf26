CREATE OR REPLACE TYPE vente AS OBJECT (
fk_date char(10),
fk_magasin varchar2(4),
fk_isbn char(13),
MEMBER FUNCTION getMagasin RETURN varchar2,
MEMBER FUNCTION getDate RETURN date,
MEMBER FUNCTION getIsbn RETURN varchar2
);