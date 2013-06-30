DROP TABLE l_bdt_customerlicence;

CREATE OR REPLACE TYPE typeCustomerLicence AS OBJECT (
licence VARCHAR2(11),
name VARCHAR2(50),
date_naiss VARCHAR2(10),
grade VARCHAR2(50),
gender VARCHAR2(6),

MEMBER FUNCTION getLicence RETURN varchar2,
MEMBER FUNCTION getName RETURN varchar2,
MEMBER FUNCTION getDate_naiss RETURN date,
MEMBER FUNCTION getGender RETURN varchar2,
MEMBER FUNCTION getGrade RETURN varchar2

);