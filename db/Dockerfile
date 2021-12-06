FROM postgres
WORKDIR /docker-entrypoint-initdb.d
COPY ./import ./import.sh
WORKDIR /
USER postgres
RUN mkdir data
USER ROOT
WORKDIR /data
COPY ./data/ ./
WORKDIR /bin
COPY ./import ./
RUN chmod +x import
COPY ./export ./
RUN chmod +x export
