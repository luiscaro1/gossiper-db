FROM postgres:alpine

COPY addSchema.sh sql/

WORKDIR sql/

ENV POSTGRES_PASSWORD "postgres"
POSTGRES_USER "postgres"
POSTGRES_DB "gossiper:1.0-db"

VOLUMES /var/lib/postgresql/data


RUN --bind 0.0.0.0:PORT
