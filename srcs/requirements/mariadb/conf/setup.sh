service mariadb start

mariadb -e "CREATE DATABASE ${DB_NAME};"
mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "user=mysql" >> /etc/mysql/my.cnf

chown -R mysql:mysql /var/lib/mysql/
