service mariadb start
mariadb -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_MDP}'"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%'"
mariadb -e "CREATE DATABASE ${WORDPRESS_DB}"
mariadb -e "CREATE USER '${WORDPRESS_USER}'@'%' IDENTIFIED BY '${WORDPRESS_MDP}'"
mariadb -e "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB}.* TO '${WORDPRESS_USER}'@'%'"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "USE mysql"
mariadb -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_MDP_ROOT}');"
mariadb -e "FLUSH PRIVILEGES"
service mariadb stop
exec "$@"