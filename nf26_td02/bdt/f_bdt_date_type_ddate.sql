CREATE OR REPLACE TYPE ddate AS OBJECT (
date_data char(10),
MEMBER FUNCTION getDat RETURN date,
MEMBER FUNCTION getJds RETURN varchar2,
MEMBER FUNCTION getSem RETURN number,
MEMBER FUNCTION getMon RETURN number,
MEMBER FUNCTION getTri RETURN number
);