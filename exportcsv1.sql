ALTER SESSION SET NLS_NUMERIC_CHARACTERS=',.';

set newp none
set markup csv on quote off
SET termout off
Set feedback off

PROMPT Start creating output file: data.csv
SPOOL data.csv

@query.sql

SPOOL OFF

SET termout on

PROMPT Finished creating file: data.csv
