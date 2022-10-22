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
		hp.lotSize, 
		hp.date_sold, 
		hp.price, 
		hp.zestimate, 
		me.avg_income
INTO merged_table
FROM housing_prices AS hp
LEFT JOIN median_income AS me
ON (hp.zipcode = me.zipcode)

SELECT * FROM merged_table;

-- Dropping null values from merged_table tables
SELECT 	abbreviatedaddress,
		city, 
		zipcode, 
		latitude, 
		longitude, 
		bathrooms, 
		bedrooms, 
		lotsize, 
		date_sold, 
		price, 
		zestimate, 
		avg_income
INTO clean_merged_table
FROM merged_table
WHERE avg_income IS NOT NULL;

SELECT * FROM clean_merged_table;