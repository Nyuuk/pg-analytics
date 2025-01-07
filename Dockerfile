# Postgres with pg_analytocs and pg_duckdb

FROM dnanfab/pg-analytics:2.17 as source

FROM postgres:17

COPY --from=source /usr/share/postgresql/17/extension/ /usr/share/postgresql/17/extension/
COPY --from=source /usr/lib/postgresql/17/lib/ /usr/lib/postgresql/17/lib/

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    postgresql-server-dev-17 \
    postgresql-17-pg-analytics \
    postgresql-17-pg-duckdb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*