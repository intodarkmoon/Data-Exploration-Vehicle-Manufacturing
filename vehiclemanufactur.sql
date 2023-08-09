SELECT * FROM PUBLIC.CARDATA C ;

-- Regional Market Insight
-- Location with the highest car prices and mileage.
SELECT DISTINCT "Location" AS Lokasi, "Price" AS Harga, "Mileage" AS "Jarak Mil" FROM PUBLIC.CARDATA C 
ORDER BY "Price", "Mileage" DESC 
LIMIT 10;

-- Location with the lowest car prices and mileage.
SELECT DISTINCT "Location" AS Lokasi, "Price" AS Harga, "Mileage" AS "Jarak Mil" FROM PUBLIC.CARDATA C 
ORDER BY "Price", "Mileage" ASC  
FETCH FIRST 10 ROW ONLY ;

-- The average price of cars sold by brand and model to understand price variations in the market.
SELECT "Brand" , "Model" , AVG("Price") AS "Average Price"  FROM PUBLIC.CARDATA C 
GROUP BY "Brand" , "Model" 
ORDER BY "Brand" ASC ;

-- The distribution of car colors and their popularity among buyers.
SELECT "Color" AS Warna, COUNT(*) AS total_count
FROM PUBLIC.CARDATA C 
GROUP BY "Color" 
ORDER BY total_count DESC;

-----------------------------------------------------------------------------------------------------------------------------

-- Price Analysis
-- The relationship between car price and brand, model, and year to identify pricing patterns in the market.
SELECT "Brand" , "Model" , "Year" , AVG("Price") AS "Average Price" FROM PUBLIC.CARDATA C
GROUP BY "Brand" , "Model" , "Year" 
ORDER BY "Brand" ASC ;

-- Analyze the average price of cars by location to understand regional pricing differences.
SELECT "Location" AS Lokasi, AVG("Price") AS "Average Price"  FROM PUBLIC.CARDATA C
GROUP BY "Location" 
ORDER BY "Location" ASC;

-----------------------------------------------------------------------------------------------------------------------------

-- Mileage Analysis
-- Calculate the average mileage of cars by brand, model, and year to understand the wear and tear of different car models over time.
SELECT "Brand" , "Model" , "Year" , AVG("Mileage") AS "Average Mileage"  FROM PUBLIC.CARDATA C 
GROUP BY "Brand" , "Model" , "Year" 
ORDER BY "Brand" ASC;

-----------------------------------------------------------------------------------------------------------------------------

-- Location Analysis 
-- Analyze the distribution of car sales across different locations to identify regions with high demand for cars.
SELECT "Location" AS Lokasi, COUNT(*) AS "Total Sales"  FROM PUBLIC.CARDATA C 
GROUP BY "Location" 
ORDER BY "Total Sales" DESC ;

-- Determine the average price and mileage of cars in each location to understand regional market dynamics.
SELECT "Location" AS Lokasi , AVG("Price") AS "Average Price", AVG("Mileage") AS "Average Mileage"  FROM PUBLIC.CARDATA C 
GROUP BY "Location" 
ORDER BY "Average Price", "Average Mileage" DESC ;

-----------------------------------------------------------------------------------------------------------------------------

-- Brand and Model Comparison
-- Compare the average price and mileage of different car brands and models to identify the best value-for-money options.
SELECT "Brand" , "Model" , AVG("Price") AS "Average Price" , AVG("Mileage") AS "Average Mileage"  FROM PUBLIC.CARDATA C
GROUP BY "Brand" , "Model" 
ORDER BY "Average Price", "Average Mileage" DESC ;

-- Analyze customer preferences for different car brands and models based on sales data.
SELECT "Brand" , "Model" , COUNT(*) AS "Total Sales"  FROM PUBLIC.CARDATA C 
GROUP BY "Brand" , "Model" 
ORDER BY "Total Sales" DESC;

-----------------------------------------------------------------------------------------------------------------------------

-- Year and Age Analysis
-- Investigate the relationship between car age (calculated from the year of manufacture) and mileage to understand how mileage accumulates over time.
SELECT "Car ID", 
       EXTRACT(YEAR FROM NOW()) - CAST("Year" AS INTEGER) AS "Car Age", 
       AVG("Mileage") AS avg_mileage 
FROM PUBLIC.CARDATA C
GROUP BY "Car ID", "Car Age"
ORDER BY "Car Age" DESC ;

-- Analyze the distribution of car ages in the dataset to identify the age of cars commonly sold.
SELECT EXTRACT(YEAR FROM NOW()) - CAST("Year" AS INTEGER) AS "Car Age", 
       COUNT(*) AS "Total Car"
FROM PUBLIC.CARDATA C
GROUP BY "Car Age"
ORDER BY "Car Age" DESC ;


