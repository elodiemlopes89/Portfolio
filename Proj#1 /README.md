# Project 1: COVID-19 Layoffs Data Cleaning and Exploratory Data Analysis using MySQL

## Project Overview
During the COVID-19 pandemic, many companies were forced to downsize or lay off employees due to anti-pandemic measures, leading to long-lasting effects on the global economy.

## Dataset
The dataset shows the tech firms layoffs tracking arround the world, since when COVID-19 was declared as a pandemic (11 March 2020) until 20 July 2024.

Dataset columns description:
* company: name of the tech company
* location: location of the company headquarters
* industry: industry of the company
* total_laid_off: number of employees laid off 
* percentage_laid_off: percentage of employees laid off
* date: date of layoff
* stage: stage of funding
* country: company country
* funds_raised: funds raised by the company (in million $)

Dataset source: https://www.kaggle.com/datasets/swaptr/layoffs-2022/data

## Objectives
* Obj1: Finding the percentage of layoffs per company, industry, country and year;
* Obj2: Finding the layoff peak month for each year;
* Obj3: Ranking companines (Top-5) with more layoffs per year.

## Methodology
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231/Methodology.png" width="80%">

### [Create a new database and import data](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Code%20/1_Create_a_new_database%26import_data.sql)

A new database was created in MySQL (version 8.0.38) and the csv Kaggle file was imported using the Terminal.


### [Data cleaning](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Code%20/2_Data_cleaning.sql)
Data was cleaning using MySQL (version 8.0.38):
1. Duplicated rows were removed;
2. Data were standardized after visual inspection of each table column (removal of text empty spaces), text standardization, the date column was chenged from text to date format (yyyy-mm-dd));
3. Null and blank values from specific columns used in the exploratory data analysis were removed.

### [Exploratory data analysis](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Code%20/3_Exploratory_data_analysis)
Data was analyzed according to defined objectives using MySQL (version 8.0.38).


## Results

### Percentage of layoffs per [company](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/total_num_lay_COMPANY.csv), [industry](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/total_num_lay_INDUSTRY.csv), [country](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/total_num_lay_COUNTRY.csv) and [year](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/total_num_lay_YEAR.csv)

* The available data (since 03-11-2020 until 06-03-2023) indicates that the highest number of layoffs occurred in 2022 (41.93%).
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/Obj1_year_fig.png" width="40%">

* Amazon had the highest number of layoffs (18.41%).
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/Obj1_company_fig.png" width="40%">

* The industry sector "Consumer" had the highest number of layoffs (15.88%).
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/Obj1_industry_fig.png" width="40%">

 * The United States had the highest number of layoffs (70.34%).
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj1/Obj1_country_fig.png" width="40%">

### Layoff peak month
Percentage of layoffs for each month for the year of [2020](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj2/peak2020.csv), [2021](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj2/peak2021.csv), [2022](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj2/peak2022.csv) and [2023](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj2/peak2023.csv).  Values in red indicate the highest percentages.
<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj2/Obj2_fig.png" width="40%">

### [Ranking companies (Top-5) highest layoff numbers per year](https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj3/RankingCompany.csv)

<img src="https://github.com/elodiemlopes89/Portfolio/blob/main/Proj%231%20/Results%20/Obj3/Obj3_fig.png" width="40%">

# Acknowledgements
Kaggle comunity and @AlexTheAnalyst.
