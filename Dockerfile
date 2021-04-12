FROM postgres:alpine

COPY addSchema.sh sql/

WORKDIR sql/

ENV POSTGRES_PASSWORD "postgres"
ENV POSTGRES_USER "postgres"
ENV POSTGRES_DB "gossiper:1.0-db"

VOLUME /var/lib/postgresql/data


EXPOSE $PORT
