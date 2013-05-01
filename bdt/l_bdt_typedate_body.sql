CREATE OR REPLACE TYPE BODY typeDate
IS

MEMBER FUNCTION getDat RETURN date
IS
  l_date DATE;
BEGIN
  l_date := TO_DATE(ddate, 'yyyy-mm-dd');
  RETURN l_date;
  EXCEPTION
    WHEN others THEN
      RETURN to_date ('9999-01-01', 'yyyy-mm-dd');
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