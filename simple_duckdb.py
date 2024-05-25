import duckdb
duckdb.sql("SELECT 42").show()

con = duckdb.connect("file.db")
con.sql("CREATE or replace TABLE integers (i INTEGER)")
con.sql("INSERT INTO integers VALUES (42)")
con.sql("SELECT * FROM integers").show()
