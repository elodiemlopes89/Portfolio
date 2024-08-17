-- Data Cleaning

-- Create and work on a duplicate table

CREATE TABLE layoff_table2
LIKE layoff_table;

-- copy layoff_table to layoff_table2
INSERT layoff_table2
SELECT *
FROM layoff_table;

SELECT *
FROM layoff_table2;

-- (1) Remove duplicates
-- see duplicate raws

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_table2
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;

-- create a new table containing the row_num column, which show the duplicate rows

CREATE TABLE `layoff_table3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num`INT -- new column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO layoff_table3
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoff_table2;

-- delete the duplicate rows
DELETE 
FROM layoff_table3
WHERE row_num > 1;


-- (2) Standardize data by insepcting each column

-- company
SELECT DISTINCT company
FROM layoff_table3;
-- There are some filed with spaces before the company name. 
-- Remove these empty spaces
UPDATE layoff_table3
SET company = TRIM(company);

-- location
SELECT DISTINCT location
FROM layoff_table3
ORDER BY 1;
-- locations seem to be ok

-- industry
SELECT DISTINCT industry
FROM layoff_table3
ORDER BY 1;
-- Crypto, Crypto Currency and CryptoCurrency means the same. 
-- All "Crypto" industry should be replaced by "Crypto"

UPDATE layoff_table3
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- total_laid_off
SELECT DISTINCT total_laid_off
FROM layoff_table3;
-- There are some Null Values which will be discussed further.

-- percentage_laid_off
SELECT DISTINCT percentage_laid_off
FROM layoff_table3;
-- There are some Null Values which will be discussed further.

-- date
SELECT `date`
FROM layoff_table3;
-- dates are in text format and should be in date format.

UPDATE layoff_table3
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
-- update the column data type 
ALTER TABLE layoff_table3
MODIFY COLUMN `date`DATE;

-- stage
SELECT DISTINCT stage
FROM layoff_table3;
-- dates are in text format and should be in date format.

-- country
SELECT DISTINCT country
FROM layoff_table3;
-- there is an extre . in Unitate States which should be removed

UPDATE layoff_table3
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- funds_raised_millions
SELECT DISTINCT funds_raised_millions
FROM layoff_table3;
-- There are some Null Values which will be discussed further.


-- (3) Remove blamk and Null values

-- Identification of these raws. 

SELECT *
FROM layoff_table3
WHERE company IS NULL OR company = '';
-- there are not blank or Null values on company

SELECT *
FROM layoff_table3
WHERE location IS NULL OR location = '';
-- there are not blank or Null values on location

SELECT *
FROM layoff_table3
WHERE industry IS NULL OR industry = '';
-- Airbnb, Bally's Interactive, Carvana and Juul have industry empty or Null
-- There are any other companies on the table with these fields filled out?

SELECT *
FROM layoff_table3
WHERE company = 'Airbnb';
-- The industry name of the Airbnb company is "Travel"

SELECT *
FROM layoff_table3
WHERE company = 'Bally`s Interactive';
-- There is only one Bally's Interactive company. The industry name could not be known.

SELECT *
FROM layoff_table3
WHERE company = 'Carvana';
-- The industry name of the Carvana company is "Transportation"

SELECT *
FROM layoff_table3
WHERE company = 'Juul';
-- The industry name of the Juul company is "Consumer".

-- Add those industry names to the respective companies
UPDATE layoff_table3
SET industry = 'Travel'
WHERE company = 'Airbnb';

UPDATE layoff_table3
SET industry = 'Transportation'
WHERE company = 'Carvana';

UPDATE layoff_table3
SET industry = 'Consumer'
WHERE company = 'Juul';

-- For the exploratory data analysis we want to do, it is usefull remove Null and blank values
-- from total_laid_off and percentage_laid_off

DELETE
FROM layoff_table3
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_table3;

-- Remove the added row_num column
ALTER TABLE layoff_table3
DROP COLUMN row_num;



-- export the cleaning table (layoffs_cl.csv)
SELECT * FROM layoff_table3 
INTO OUTFILE '/Users/utilizador/Desktop/layoffs_cl.csv'
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n';



