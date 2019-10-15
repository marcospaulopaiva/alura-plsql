CREATE USER cursoplsql IDENTIFIED BY cursoplsql
    DEFAULT tablespace users;

--Permissão
GRANT connect, resource TO cursoplsql;