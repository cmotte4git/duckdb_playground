SELECT * FROM read_csv_auto('./data/netflix_daily_top_10.csv') limit 10;

CREATE TABLE netflix_daily_top_10 AS FROM read_csv_auto('./data/netflix_daily_top_10.csv');
COPY netflix_daily_top_10 TO 'output.csv' (HEADER, DELIMITER ',');
COPY netflix_daily_top_10 TO 'output.parquet' (FORMAT PARQUET);

SELECT * FROM read_parquet('output.parquet');
SHOW tables;

SELECT * FROM duckdb_extensions();

INSTALL httpfs;

LOAD httpfs;