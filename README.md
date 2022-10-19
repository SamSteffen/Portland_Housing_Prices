# US_Housing_Prices
An analysis of US housing prices using Python's pandas library, SQL, Tableau, and linear regression machine learning.

### The Team
- Robin Foster
- Laura Hemydin
- Kayla Howell
- Sam Steffen
- Marty Thompson

# Overview
## What We're Trying To Solve
With the emergence of COVID-19, the housing market 

This repository documents the creation of a linear regression machine learning model that predicts housing prices based on average city income, average mortgage rates and other factors.

## Data Sources
The data for this project was taken from the following sources:
- All_housing_Data: https://www.kaggle.com/datasets/paultimothymooney/zillow-house-price-data?select=City_Zhvi_AllHomes.csv
- Portland_data: https://www.kaggle.com/datasets/threnjen/portland-housing-prices-sales-jul-2020-jul-2021?select=portland_housing.csv
- National Realtor data: https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset?resource=download
- Massachusettes data:

### Initial Findings:
Year    Date_count
2022	482
2021	2034
2020	1583
2019	2591
2018	2068

- The Max date for the dataset was listed as 12/1/2022, indicating potential user input error.

## Strategy and Metrics
List some goals of your analysis, ideally in the form of testable hypothesis, or via well-defined success metrics. These can be tentative, and you don’t need to stick to them throughout your project. Again, since you haven’t done any exploratory analysis yet, you might assume that the data has structure that it doesn’t, and you might not have seen other interesting patterns in the data. But you should always approach the data with some expectations so that your efforts are focused.

## Tools
To analyze and prepare our data for our machine learning model, we plan to use the following tools:
- **Excel** - Most of our data will be downloaded from an online source in csv format, from which it will be imported to a jupyter notebook for initial cleaning
- **Python** - Using Python's pandas library, we will create dataframes from our dataset and prepare it for importing to our SQL database.
- **PostgreSQL** - We will use SQL to merge multiple datasets into a single database.
- **Tableau** - We will use Tableau Public to create visualizations of cleaned, merged data, taken from our PostgreSQL database. 
- **GitHub** - GitHub will host our repository.

# Data Artifacts
Data products this project will produce include:
- Visualizations of housing price, average interest rate, average income over a given time period, within a specified location, available on a shareable storyboard (Tableau Public).
- Confusion Matrix
- Accuracy Score
- Evidence of our discovered insights will be available in this README.
