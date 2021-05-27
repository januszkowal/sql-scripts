### SQL statements dedicated to Oracle Database

Useful
* [list_of_numbers.sql](list_of_numbers.sql) - several sql statements returning list of numbers
* [validate.sql](validate.sql) - compile objects in current schema

### Connect to oracle without entry in tnsnames.ora - EZCONNECT

CONNECT username/password@[//]host[:port][/service_name]

SQLPLUS username/password@[//]host[:port][/service_name]

Examples:
sqlplus scott/tiger@//serwer.net:1521/DB
