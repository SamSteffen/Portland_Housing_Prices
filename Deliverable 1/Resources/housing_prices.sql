-- Check to make sure all the columns & rows in table housing_prices were imported correctly from Pandas to PostgreSQL
SELECT * FROM housing_prices;

-- Check to make sure all the columns & rows in table median_income were imported correctly to PostgreSQL
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
	ALTER COLUMN date_sold TYPE DATE;
ALTER TABLE merged_table
	ALTER COLUMN price TYPE NUMERIC (12,2);
ALTER TABLE merged_table
	ALTER COLUMN zestimate TYPE NUMERIC (12,2);
ALTER TABLE merged_table
	ALTER COLUMN median_income TYPE NUMERIC (12,2);