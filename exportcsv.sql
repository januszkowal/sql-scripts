set colsep ,
set pagesize 0
set trimspool on
set headsep off
Set feedback off
column CCC newline

ALTER SESSION SET NLS_NUMERIC_CHARACTERS=',.';, 

SET termout on

PROMPT Start creating output file: data.csv

SET termout off

SPOOL data.csv

SELECT '"'||table1.text_field||'",'||table1.number_field CCC
from table table1
/

SPOOL OFF

SET termout on

PROMPT Finished creating file: data.csv
