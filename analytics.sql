INSTALL httpfs;
LOAD httpfs;
SET s3_region='us-east-1';
-- Create a table from s3 parquet file
CREATE TABLE netflix AS SELECT * FROM read_parquet('s3://duckdb-md-dataset-121/netflix_daily_top_10.parquet');
FROM netflix;
SHOW netflix;
-- Display the most popular TV Shows
SELECT Title, max("Days In Top 10") from netflix
where Type='TV Show'
GROUP BY Title
ORDER BY max("Days In Top 10") desc
limit 5;
-- Display the most popular TV Shows
SELECT Title, max("Days In Top 10") from netflix
where Type='Movie'
GROUP BY Title
ORDER BY max("Days In Top 10") desc
limit 5;

--- export to output.csv

COPY(
    SELECT Title, max("Days In Top 10") from netflix
where Type='TV Show'
GROUP BY Title
ORDER BY max("Days In Top 10") desc
limit 5
) TO 'ouput.csv' (HEADER, DELIMITER ',');