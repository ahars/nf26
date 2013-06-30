CREATE OR REPLACE TYPE BODY livre
IS

MEMBER FUNCTION getIsbn RETURN varchar2
IS
BEGIN
  RETURN isbn;
END;

MEMBER FUNCTION getTitre RETURN varchar2
IS
BEGIN
  RETURN titre;
  -- TODO nettoyer, traiter les titres longs
END;

MEMBER FUNCTION getAuteur RETURN varchar2
IS
BEGIN
  RETURN auteur;
  -- TODO ne garder que le nom et prénom du premier auteur
END;

MEMBER FUNCTION getLangue RETURN varchar2
IS
BEGIN
  RETURN SUBSTR(langue,1,3);
END;

MEMBER FUNCTION getPublication RETURN char
IS
BEGIN
  RETURN SUBSTR(publication,1,4);
END;

MEMBER FUNCTION getEditeur RETURN varchar2
IS
BEGIN
  RETURN editeur;
  -- TODO nettoyer
END;

MEMBER FUNCTION getGenre RETURN varchar2
IS
BEGIN
  RETURN editeur;
  -- TODO nettoyer
END;

END;