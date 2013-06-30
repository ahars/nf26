CREATE OR REPLACE TYPE magasin AS OBJECT (
dpt number(2),
dptnom varchar2(50),
dptpopulation number(10),
rayonnage char(1),
ray_nom varchar2(10),
mag varchar2(4),
rayon_bs number(1),
MEMBER FUNCTION getDpt RETURN number,
MEMBER FUNCTION getDptnom RETURN varchar2,
MEMBER FUNCTION getDptpopulation RETURN number,
MEMBER FUNCTION getRayonnage RETURN varchar2,
MEMBER FUNCTION getRaynom RETURN varchar2,
MEMBER FUNCTION getMagasin RETURN varchar2,
MEMBER FUNCTION getRayonBs RETURN number
);