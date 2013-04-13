CREATE OR REPLACE TYPE BODY typeStore
IS

MEMBER FUNCTION getMag RETURN varchar2
IS
BEGIN
  RETURN mag;
END;

MEMBER FUNCTION getDateOpening RETURN varchar2
IS
BEGIN
  /* TODO: traitement des dates non conformes */
  /*IF dateOpening IS NULL OR (dateOpening.length <> 10) THEN
    RETURN TO_DATE('0000-00-00', 'yyyy-mm-dd');
  ELSE
    RETURN TO_DATE(dateOpening, 'yyyy-mm-dd');
  END IF;*/
  RETURN dateOpening;
END;

MEMBER FUNCTION getPlanet RETURN varchar2
IS
BEGIN
  RETURN planet;
END;

MEMBER FUNCTION getSector RETURN varchar2
IS
BEGIN
  RETURN sector;
END;

MEMBER FUNCTION getPopulation RETURN varchar2
IS
BEGIN
  RETURN population;
END;

MEMBER FUNCTION getSolarSystem RETURN varchar2
IS
BEGIN
  RETURN solarSystem;
END;

MEMBER FUNCTION getQuadran RETURN varchar2
IS
BEGIN
  RETURN quadran;
END;

END;