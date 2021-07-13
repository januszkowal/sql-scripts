ALTER SESSION SET NLS_NUMERIC_CHARACTERS=',.';
PROMPT Start creating output file: data.csv
set newp none
set markup csv on quote off
SET termout off
Set feedback off
SPOOL data.csv

@query.sql

SPOOL OFF

SET termout on

PROMPT Finished creating file: data.csv
