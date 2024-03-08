-- This query selects all columns from the table TOP1000COMPANIESCAPMARKET and limits the result to 10 rows.
SELECT *
FROM TOP1000COMPANIESCAPMARKET
LIMIT 10;

-- This query selects all columns from the table ESG_SCORE and limits the result to 10 rows.
SELECT * 
FROM ESG_SCORE
LIMIT 10;

-- This query joins the tables ESG_SCORE and TOP1000COMPANIESCAPMARKET on the COMPANY column and selects the COMPANY column from each table.
-- It aliases the COMPANY columns from each table as ES_COMPANY and TCCM_COMPANY, respectively.
SELECT ESG_SCORE.COMPANY AS ES_COMPANY, TOP1000COMPANIESCAPMARKET.COMPANY AS TCCM_COMPANY
FROM ESG_SCORE, TOP1000COMPANIESCAPMARKET
WHERE ESG_SCORE.COMPANY = TOP1000COMPANIESCAPMARKET.COMPANY;

-- This query selects the COMPANY column from the table TOP1000COMPANIESCAPMARKET.
SELECT COMPANY 
FROM TOP1000COMPANIESCAPMARKET;

-- This query selects all columns from the tables ESG_SCORE and TOP1000COMPANIESCAPMARKET, joining them on the COMPANY column.
-- It filters the result to only include rows where the COMPANY column matches between the two tables.
-- It also filters the result to only include rows where the COMPANY column matches between the two tables.
SELECT * 
FROM ESG_SCORE ES
JOIN TOP1000COMPANIESCAPMARKET TCCM
	ON ES.COMPANY = TCCM.COMPANY
WHERE ES.COMPANY = TCCM.COMPANY;

-- This query creates a new table named ESGVSCAPMARKET with the specified columns.
CREATE TABLE ESGVSCAPMARKET
(
COMPANY nvarchar(250),
COUNTRY nvarchar(250),
SECTOR nvarchar(250),
INDUSTRY nvarchar(250),
ESGSCORE numeric,
MARKETCATEGORY nvarchar(250),
STOCK nvarchar(250),
MARKET_CAP_USD numeric
);

-- This query inserts data into the table ESGVSCAPMARKET by selecting specific columns from the tables ESG_SCORE and TOP1000COMPANIESCAPMARKET and joining them on the COMPANY column.
INSERT INTO ESGVSCAPMARKET
SELECT ESG_SCORE.COMPANY, ESG_SCORE.COUNTRY, ESG_SCORE.SECTOR, ESG_SCORE.INDUSTRY, ESG_SCORE.ESGSCORE, ESG_SCORE.MARKETCAPCATEGORY, TOP1000COMPANIESCAPMARKET.STOCK, TOP1000COMPANIESCAPMARKET.MARKET_CAP_USD 
FROM ESG_SCORE 
JOIN TOP1000COMPANIESCAPMARKET 
    ON ESG_SCORE.COMPANY = TOP1000COMPANIESCAPMARKET.COMPANY
WHERE ESG_SCORE.COMPANY = TOP1000COMPANIESCAPMARKET.COMPANY;

-- This query selects all columns from the table ESGVSCAPMARKET.
SELECT * 
FROM ESGVSCAPMARKET;
