-- Create a new database designated as "layoffs_wordl"

CREATE DATABASE layoffs_world;

USE layoffs_world;

-- Create an emptly table containing the column names of the kaggle original teble;
-- The type of data was selected according to visual insepction of the original table:

CREATE TABLE layoff_table(
			company text,
            location text,
            industry text,
            total_laid_off INT,
            percentage_laid_off text,
            `date` text,
            stage text,
            country text,
            funds_raised_millions text
            );

SELECT *
FROM layoff_table;

/*
Open terminal in the directort of cagle csv and writh the command lines:

>> mysql --local-infile=1 -h 127.0.0.1 -u root -p
>> USE layoffs_world;
>> LOAD DATA LOCAL INFILE 'layoffs.csv'

>> INTO TABLE layoff_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
*/
