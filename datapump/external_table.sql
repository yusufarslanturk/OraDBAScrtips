drop table DP_DUMP_LOG;

CREATE TABLE DP_DUMP_LOG (
  log_line      VARCHAR2(4000)
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY backup
  ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    FIELDS TERMINATED BY ','
    MISSING FIELD VALUES ARE NULL
    (
      log_line      CHAR(4000)
    )
  )
  LOCATION ('db_import_plsql.log')
)
PARALLEL 1
REJECT LIMIT UNLIMITED;


select * from DP_DUMP_LOG;