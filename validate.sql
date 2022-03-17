REM*********************************************************
REM File        : valid.sql (for PLSQL)
REM Function    : This PLSQL script creates a script for the
REM               compilation of all invalid objects of the
REM               current user and starts the script after
REM Author      : Janusz Kowal
REM*********************************************************SET ECHO OFF
SET FEEDBACK OFF
SET TERMOUT OFF
SET PAGESIZE 0
column nl newline
SPOOL valid.tmp
SELECT 'SET FEEDBACK ON'  FROM DUAL;
SELECT 'PROMPT Compile '||OBJECT_TYPE||' '|| OBJECT_NAME || ' ...' NL,
       'ALTER '||DECODE(OBJECT_TYPE,'PACKAGE BODY','PACKAGE',OBJECT_TYPE)||' "'||OBJECT_NAME||
       '" COMPILE'||DECODE(OBJECT_TYPE,'PACKAGE BODY',' BODY')||';' NL, 'SHOW ERRORS' NL
  FROM USER_OBJECTS WHERE STATUS <> 'VALID'
 ORDER BY DECODE(OBJECT_TYPE,'VIEW',1,
                             'TRIGGER',2,
                             'PROCEDURE',3,
                             'FUNCTION',4,
                             'PACKAGE',5,
                             'PACKAGE BODY',6,
                             'JAVA CLASS',7,8), OBJECT_NAME;
SPOOL OFF
SET TERMOUT ON
SET ECHO OFF
SET FEEDBACK OFF
SELECT '>>> Invalid objects of current user'  FROM DUAL;
SELECT OBJECT_TYPE || ': ' || OBJECT_NAME  FROM USER_OBJECTS
 WHERE STATUS <> 'VALID' ORDER BY OBJECT_TYPE, OBJECT_NAME;
SELECT '>>> Total: ' || COUNT(*)  FROM USER_OBJECTS WHERE STATUS <> 'VALID';
START valid.tmp
