-- Check to make sure all columns & rows were imported correctly to PostgreSQL
SELECT * FROM housing_prices;
SELECT * FROM median_income;

-- Joining housing prices and median income tables
SELECT 	hp.abbreviatedaddress,
		hp.city, 
		hp.zipcode, 
		hp.latitude, 
		hp.longitude, 
		hp.bathrooms, 
		hp.bedrooms, 
		hp.lotsize,
		hp.garage,
		hp.school_rating_0,
		hp.school_rating_1,
		hp.school_rating_2,
		hp.yearbuilt,
		hp.date_sold, 
		hp.price, 
		hp.zestimate,
		me.median_income
INTO merged_table
FROM housing_prices AS hp
LEFT JOIN median_income AS me
ON (hp.zipcode = me.zipcode)
WHERE median_income IS NOT NULL
ORDER BY zipcode ASC;

SELECT * FROM merged_table;

-- Change the data types of columns in merged_table
ALTER TABLE merged_table 
	ALTER COLUMN abbreviatedaddress TYPE VARCHAR;
ALTER TABLE merged_table 
	ALTER COLUMN city TYPE VARCHAR;
ALTER TABLE merged_table
	ALTER COLUMN zipcode TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN latitude TYPE FLOAT8;
ALTER TABLE merged_table
	ALTER COLUMN longitude TYPE FLOAT8;
ALTER TABLE merged_table
	ALTER COLUMN bathrooms TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN bedrooms TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN lotsize TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN school_rating_0 TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN school_rating_1 TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN school_rating_2 TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN yearbuilt TYPE INT;
ALTER TABLE merged_table
	ALTER COLUMN price TYPE NUMERIC (12,2);
ALTER TABLE merged_table
	ALTER COLUMN zestimate TYPE NUMERIC (12,2);
ALTER TABLE merged_table
	ALTER COLUMN median_income TYPE NUMERIC (12,2);

-- List column names and datatypes of a merged_table
SELECT
    column_name,
    data_type
FROM
    information_schema.columns
WHERE
    table_name = 'merged_table';