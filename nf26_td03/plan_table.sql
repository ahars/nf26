DROP TABLE plan_table;
CREATE TABLE plan_table (
  statement_id VARCHAR2(30),
  timestamp DATE,
  remarks VARCHAR2(80),
  operation VARCHAR2(30),
  options VARCHAR2(30),
  object_node VARCHAR2(128),
  object_owner VARCHAR2(30),
  objet_name VARCHAR2(30),
  object_instance NUMBER(38),
  object_type VARCHAR2(30),
  optimizer VARCHAR2(255),
  search_columns NUMBER,
  id NUMBER(38),
  parent_id NUMBER(38),
  position NUMBER(38),
  cost NUMBER(38),
  cardinality NUMBER(38),
  bytes NUMBER(38),
  other_tag VARCHAR2(255),
  partition_start VARCHAR2(255),
  partition_stop VARCHAR2(255),
  partition_id NUMBER(38),
  other LONG,
  distribution VARCHAR2(30)
);

SET autotrace ON;

ANALYZE TABLE f_dw_ventes COMPUTE STATISTICS;
ANALYZE TABLE f_dw_produit COMPUTE STATISTICS;