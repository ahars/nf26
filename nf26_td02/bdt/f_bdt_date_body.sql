CREATE OR REPLACE TYPE BODY ddate 
IS

MEMBER FUNCTION getDat RETURN date
IS
BEGIN
  RETURN TO_DATE(date_data, 'yyyy-mm-dd');
END;

MEMBER FUNCTION getJds RETURN varchar2
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'day');
END;

MEMBER FUNCTION getSem RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'ww');
END;

MEMBER FUNCTION getMon RETURN number
IS
BEGIN
  RETURN TO_CHAR(self.getDat(),'mm');
END;

MEMBER FUNCTION getTri RETURN number
IS
BEGIN
  RETURN CEIL(TO_CHAR(self.getDat(),'mm') / 3);
END;

END;