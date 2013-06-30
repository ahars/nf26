DROP TABLE l_bdt_store;

CREATE OR REPLACE TYPE typeStore AS OBJECT (
mag VARCHAR(4),
dateOpening VARCHAR(10),
planet VARCHAR(50),
sector VARCHAR(9),
population VARCHAR(2),
solarSystem VARCHAR(50),
quadran VARCHAR(3),

MEMBER FUNCTION getMag RETURN varchar2,
MEMBER FUNCTION getDateOpening RETURN varchar2,
MEMBER FUNCTION getPlanet RETURN varchar2,
MEMBER FUNCTION getSector RETURN varchar2,
MEMBER FUNCTION getPopulation RETURN varchar2,
MEMBER FUNCTION getSolarSystem RETURN varchar2,
MEMBER FUNCTION getQuadran RETURN varchar2
);