# US_Housing_Prices
An analysis of US housing prices using Python's pandas library, SQL, Tableau, and linear regression machine learning.

### The Team
- [Robin Foster](https://github.com/rloufoster)
- [Laura Hemydin](https://github.com/L-Hmd)
- [Kayla Howell](https://github.com/kbowling74)
- [Sam Steffen](https://github.com/SamSteffen)
- [Marty Thompson](https://github.com/martyet1)

# Overview
## What We're Trying To Solve
This repository documents the creation of a linear regression machine learning model that predicts housing prices based on average city income, average mortgage rates and other features.

## Data Sources
The data for this project was taken from the following sources:
- All_housing_Data: https://www.kaggle.com/datasets/paultimothymooney/zillow-house-price-data?select=City_Zhvi_AllHomes.csv
- National Realtor data: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset?resource=download
- Portland_data: https://www.kaggle.com/datasets/threnjen/portland-housing-prices-sales-jul-2020-jul-2021?select=portland_housing.csv


## Initial Findings:
- The initial dataset for this project was found on Kaggle, and was scraped using Python. As a downloaded csv, it contained over 900,000 rows of data from several US states (but not all of them). To hone the focus of our analysis, we reduced the size of our dataset by filtering for data that was collected from the state of Masschussettes, which contained a robust number of rows, and specified our pull to the parameters of the last five years (2018-2022). Upon initial exploratory data analysis, the earliest date in the dataset ("min") was listed as having taken place in 1900, while the "maximum" date for the dataset was listed as 12/1/2022, indicating potential error (as 12/1/2022 has not yet transpired). When the data was sorted, it was also discovered to contain multiple duplicates. When removed, the resulting dataset was a little over 400 rows, which proved unsuitable for our purposes.

- Next we tried a Kaggle dataset of housing data that was regional to Portland, OR. After pairing it down from an initial 348 columns to 10, we were yielded 23,135 rows of usable data that provides housing prices and Zillow estimates for homes in Portland, Oregon and the surrounding area, between the dates of June 12, 2020 to July 15, 2021.
    * The final features of this cleaned dataset include:
        - Address (abbreviated)
        - City
        - Zip
        - latitutde coordinates
        - longitude coordinates
        - Days on Zillow
        - Date Sold
        - Price (what the house actually sold for, US dollar amount)
        - Zestimate (what Zillow predicted the house would sell for, US dollar amount)
        - Rent Zestimate (what Zillow predicted the house could be rented for, US dollar amount)
        - Property tax rate
        - Tax assessed value (what the value is deemed worth according to the taxing authorities)
        - Tax assessed year

## Strategy and Metrics
List some goals of your analysis, ideally in the form of testable hypothesis, or via well-defined success metrics. These can be tentative, and you don’t need to stick to them throughout your project. Again, since you haven’t done any exploratory analysis yet, you might assume that the data has structure that it doesn’t, and you might not have seen other interesting patterns in the data. But you should always approach the data with some expectations so that your efforts are focused.

## Tools
To analyze and prepare our data for our machine learning model, we plan to use the following tools:
- **Excel** - Most of our data will be downloaded from an online source in csv format, from which it will be imported to a jupyter notebook for initial cleaning
- **Python** - Using Python's pandas library, we will create dataframes from our dataset and prepare it for importing to our SQL database.
- **PostgreSQL** - We will use SQL to merge multiple datasets into a single database.
- **Tableau** - We will use Tableau Public to create visualizations of cleaned, merged data, taken from our PostgreSQL database. 
- **GitHub** - GitHub will host our repository.

## Data Artifacts
Data products this project will produce include:
- Visualizations of housing price, average interest rate, average income over a given time period, within a specified location, available on a shareable storyboard (Tableau Public).
- Confusion Matrix
- Accuracy Score
- Evidence of our discovered insights will be available in the summary section of this README.
