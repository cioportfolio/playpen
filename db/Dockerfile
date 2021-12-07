FROM postgres
WORKDIR /docker-entrypoint-initdb.d
COPY ./import ./import.sh
WORKDIR /var
COPY --chown=postgres ./data/ ./data
WORKDIR /bin
COPY ./import ./
RUN chmod +x import
COPY ./export ./
RUN chmod +x export
