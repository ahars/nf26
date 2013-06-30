CREATE OR REPLACE TYPE magasin AS OBJECT (
mag VARCHAR2(10),
dpt NUMBER(2),
dptnom VARCHAR2(50),
dptpopulation NUMBER(10),
rayonnage CHAR(1),
ray_nom VARCHAR2(10),
rayon_bs NUMBER(1),

MEMBER FUNCTION getDpt RETURN NUMBER,
MEMBER FUNCTION getDptnom RETURN VARCHAR2,
MEMBER FUNCTION getDptpopulation RETURN NUMBER,
MEMBER FUNCTION getRayonnage RETURN VARCHAR2,
MEMBER FUNCTION getRaynom RETURN VARCHAR2,
MEMBER FUNCTION getMagasin RETURN VARCHAR2,
MEMBER FUNCTION getRayonBs RETURN NUMBER
);