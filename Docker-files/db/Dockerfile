FROM mysql:8.4.7
LABEL "Project"="vprofile"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

COPY db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
