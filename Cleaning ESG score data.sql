-- Selecting first 10 rows from the ESG_SCORE table
SELECT
  *
FROM
  ESG_SCORE
LIMIT
  10;

-- Deleting the rows where the RANK column is null
DELETE FROM ESG_SCORE
WHERE RANK is null;

-- Showing all rows in the ESG_SCORE table after deletion
SELECT * 
FROM ESG_SCORE;

-- Adding a new column called TempScore2050 to the ESG_SCORE table
ALTER TABLE ESG_SCORE
ADD COLUMN TempScore2050 FLOAT;

-- Converting TEMPERATURESCOREIN2050 column values to a useful measure in the TempScore2050 column
UPDATE ESG_SCORE
SET TempScore2050 = CASE
    -- If the value contains '>', remove it and convert to float
    WHEN TEMPERATURESCORE2050 LIKE '%>%' THEN
        CAST(REPLACE(TEMPERATURESCORE2050, '>', '') AS FLOAT)
    -- If the value doesn't contain '>', retain the value of TEMPERATURESCOREIN2050 as float
    ELSE 
        CAST(TEMPERATURESCORE2050 AS FLOAT)
END;

-- Showing all rows in the ESG_SCORE table after conversion
SELECT *
FROM ESG_SCORE;

-- Removing the TEMPERATURESCORE2050 column
ALTER TABLE ESG_SCORE
DROP TEMPERATURESCORE2050;

-- Adding a new column called CO2SC1AND2 to the ESG_SCORE table
ALTER TABLE ESG_SCORE
ADD COLUMN CO2SC1AND2 VARCHAR(10000);

-- Converting EMISSIONSTONNESCO2SCOPE1AND2 column values to float and storing in CO2SC1AND2 column
UPDATE ESG_SCORE
SET CO2SC1AND2 = CASE
    -- If the value contains both comma and dot, remove comma and asterisk and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE1AND2 LIKE '%,%' AND EMISSIONSTONNESCO2SCOPE1AND2 LIKE '%.%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE1AND2, ',', ''), '*', '')
    -- If the value contains comma but no dot, replace comma with dot and remove asterisk and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE1AND2 LIKE '%,%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE1AND2, ',', '.'), '*', '')
    -- If the value contains asterisk, remove asterisk and any comma and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE1AND2 LIKE '%*%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE1AND2, '*', ''), ',', '')
    -- If the value contains multiple dots, remove all dots except the first one and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE1AND2 LIKE '%.%.%' THEN
        REPLACE(SUBSTRING(EMISSIONSTONNESCO2SCOPE1AND2, 1, CHARINDEX('.', EMISSIONSTONNESCO2SCOPE1AND2) + 3), '.', '')
    -- If the value doesn't contain any unwanted characters, it's already in the desired format
    ELSE
        REPLACE(EMISSIONSTONNESCO2SCOPE1AND2, ',', '')
END;

-- Converting CO2SC1AND2 column values to float
UPDATE ESG_SCORE
SET CO2SC1AND2 = CASE
    -- If the value contains both comma and dot, remove dot and convert to float
    WHEN CO2SC1AND2 LIKE '%.%.%'THEN
        CAST(REPLACE(REPLACE(CO2SC1AND2, '.', ''), '.', '') AS FLOAT)
    -- If the value doesn't contain any unwanted characters, it's already in the desired format
    ELSE 
        CAST(CO2SC1AND2 AS FLOAT)
    END;

-- Showing all rows in the ESG_SCORE table after conversion
SELECT * 
FROM ESG_SCORE;

-- Converting CO2SCO3 column values to float
ALTER TABLE ESG_SCORE
ADD COLUMN CO2SCO3 VARCHAR(100000);

-- Converting EMISSIONSTONNESCO2SCOPE3 column values to float and storing in CO2SCO3 column
UPDATE ESG_SCORE
SET CO2SCO3 = CASE
    -- If the value contains both comma and dot, remove comma and asterisk and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE3 LIKE '%,%' AND EMISSIONSTONNESCO2SCOPE3 LIKE '%.%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE3, ',', ''), '*', '')
    -- If the value contains comma but no dot, replace comma with dot and remove asterisk and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE3 LIKE '%,%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE3, ',', '.'), '*', '')
    -- If the value contains asterisk, remove asterisk and any comma and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE3 LIKE '%*%' THEN
        REPLACE(REPLACE(EMISSIONSTONNESCO2SCOPE3, '*', ''), ',', '')
    -- If the value contains multiple dots, remove all dots except the first one and convert to float
    WHEN EMISSIONSTONNESCO2SCOPE3 LIKE '%.%.%' THEN
        REPLACE(SUBSTRING(EMISSIONSTONNESCO2SCOPE3, 1, CHARINDEX('.', EMISSIONSTONNESCO2SCOPE3) + 3), '.', '')
    -- If the value contains '-', replace it with null
    WHEN EMISSIONSTONNESCO2SCOPE3 LIKE '-' THEN
        REPLACE(EMISSIONSTONNESCO2SCOPE3,'-',null)
    -- If the value doesn't contain any unwanted characters, it's already in the desired format
    ELSE
        REPLACE(EMISSIONSTONNESCO2SCOPE3, ',', '')
END;

-- Converting CO2SCO3 column values to float
UPDATE ESG_SCORE
SET CO2SCO3 = CASE
    -- If the value contains both comma and dot, remove dot and convert to float
    WHEN CO2SCO3 LIKE '%.%.%'THEN
        CAST(REPLACE(REPLACE(CO2SCO3, '.', ''), '.', '') AS FLOAT)
    -- If the value doesn't contain any unwanted characters, it's already in the desired format
    ELSE 
        CAST(CO2SCO3 AS FLOAT)
    END;

-- Removing the EMISSIONSTONNESCO2SCOPE3 and EMISSIONSTONNESCO2SCOPE1AND2 columns
ALTER TABLE ESG_SCORE
DROP COLUMN EMISSIONSTONNESCO2SCOPE3,EMISSIONSTONNESCO2SCOPE1AND2;
