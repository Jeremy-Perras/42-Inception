-- https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');


--  set root pwd
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_PASSWORD');

--  create wordpress assets
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_LOCAL_HOME.* TO $MYSQL_USER@'%';

--  take effects
FLUSH PRIVILEGES;
