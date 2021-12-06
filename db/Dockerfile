FROM postgres
WORKDIR /docker-entrypoint-initdb.d
COPY ./import ./import.sh
WORKDIR /data
RUN chown postgres /data
COPY ./data/ ./
WORKDIR /bin
COPY ./import ./
RUN chmod +x import
COPY ./export ./
RUN chmod +x export
