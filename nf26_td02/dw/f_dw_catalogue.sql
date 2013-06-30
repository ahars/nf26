CREATE TABLE f_dw_catalogue (
isbn char(13),      
titre varchar2(255), 
auteur varchar2(255), 
langue char(3),       
publication char(4),  
editeur varchar2(255), 
genre varchar2(255)
);

CREATE UNIQUE INDEX f_dw_produit_idx ON f_dw_produit(isbn);

ALTER TABLE f_dw_produit
ADD CONSTRAINT f_dw_produit_pk PRIMARY KEY (isbn);