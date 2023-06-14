FROM ghcr.io/dbt-labs/dbt-bigquery:latest
ARG branch
WORKDIR /
COPY . .
ENV DBT_PROFILES_DIR=/
WORKDIR /
RUN dbt deps
RUN dbt build --target ${branch}
ENTRYPOINT ["dbt", "build"]