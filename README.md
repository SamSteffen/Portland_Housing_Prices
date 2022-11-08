# Portland_Housing_Prices
An analysis of housing prices in Portland, Oregon using Python's pandas library, SQL, Tableau, and linear regression machine learning.

### The Team (and their roles)
- [Robin Foster](https://github.com/rloufoster)
    >**Roles:** Data recruiter, cleaner; Exploratory data analyst; Linear regression machine learning co-architect; Scikitlearn library specialist; co-presenter. ("Triangle" Role, responsible for creating a simple machine learning model, helping the team better understand where and how a machine learning model will fit into the project.)

- [Laura Hemydin](https://github.com/L-Hmd)
    >**Roles:** Data recruiter, cleaner; Exploratory data analyst; Primary SQL author and PostgreSQL specialist; Database architect; co-presenter. ("Circle" Role, in charge of the mockup database, using a SQL-based database, including an ERD of the database, documentation in this README pointing out how it is integrated into the database and how it works with the code)

- [Kayla Howell](https://github.com/kbowling74)
    >**Roles:** Data recruiter, cleaner; Exploratory data analyst; Documentation author; Linear regression machine learning co-architect; Scikitlearn library specialist; visualization collaborator; co-presenter. ("Triangle" Role, responsible for creating a simple machine learning model, helping the team better understand where and how a machine learning model will fit into the project.)

- [Sam Steffen](https://github.com/SamSteffen)
    >**Roles:** Data recruiter, cleaner; Exploratory data analyst; Python enthusiast; GitHub repository manager; co-presenter. ("Square" Role, responsible for setting up the repository; this includes naming the repository and adding team members.)

- [Marty Thompson](https://github.com/martyet1)
    >**Roles:** Data recruiter, cleaner; Exploratory data analyst; Tableau specialist; Primary dashboard architect; co-presenter. ("X" Role, focusing on the technology of the project, considering: Which tools are the best fit for the project? What will be used for each section? How will the dashboard be built?, etc.)

# Overview
## What We're Trying To Solve
Zillow's 'zestimator' is a well-known and widely-used machine learning algorithm that predicts house price for site-users based on a variety of features. This project is an attempt to create a home price estimator similar to the one used by Zillow, to predict housing prices based on regional median income by zipcode. Below we have documented the creation of a linear regression machine learning model that draws on known sale prices of homes in Portland, Oregon to predict future sale prices based on number of bedrooms, number of bathrooms, lot size, zip code and median income for each zip code.

## Tools
To analyze and prepare our data for our machine learning model, we plan to use the following tools:
- **Excel** - Most of our data will be downloaded from an online source in csv format, from which it will be imported to a jupyter notebook for initial cleaning
- **Python** - Using Python's pandas library, we will create dataframes from our dataset and prepare it for importing to our SQL database.
- **PostgreSQL** - We will use SQL to merge multiple datasets into a single database.
- **Tableau** - We will use Tableau Public to create visualizations of cleaned, merged data, taken from our PostgreSQL database. 
- **GitHub** - GitHub will host our repository.

## Strategy and Metrics
The goals of this analysis include:
- Utilize recent housing data to reflect current market trends.
- Develop a linear regression machine learning model capable of predicting housing sale price (target variable) using number of bedrooms, number of bathrooms, lot size and median household income by zipcode, with an accuracy score of 90% or higher.

## Data Artifacts
Data products this project will produce include:
- Visualizations of housing price, average interest rate, average income over a given time period, within a specified location, available on a shareable storyboard (Tableau Public).
- Confusion Matrix
- Accuracy score summary reports
- Evidence of our discovered insights will be available in the summary section of this README.

## Data Sources
The data for this project was sourced from the following locations:
- [Portland house price data (Kaggle.com)](https://www.kaggle.com/datasets/threnjen/portland-housing-prices-sales-jul-2020-jul-2021?select=portland_housing.csv)
- [Income data (zipatlas.com)](http://zipatlas.com/us/or/portland/zip-code-comparison/median-household-income.htm) 
- [Portland Census data (census.gov)](https://www.census.gov/quickfacts/fact/table/portlandcityoregon/INC110220#INC110220)
- [Portland Zip Code data (google.com/maps)](https://www.google.com/maps/@45.5427139,-122.6544011,11z)

# Procedure
## Preprocessing and Initial Findings:
>Dataset 1: Portland Housing Data
- Our first dataset was downloaded from Kaggle.com, containing information pertaining to the housing market, regional to Portland, Oregon. The initial dimensions included 348 columns and more than 25,000 unique rows of data.

After pairing the columns down from 348 to 13, we were yielded 21,168 rows of usable data that provided housing prices and Zillow estimates for homes in Portland and the surrounding area, between the dates of June 12, 2020 to July 15, 2021.

![df_image](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%201/images/df.jpg)

The final features of this cleaned dataset include:    
    - Address (abbreviated)       
    - City    
    - Zipcode    
    - Latitude coordinates    
    - Longitude coordinates    
    - Days on Zillow    
    - Date Sold    
    - Price (what the house actually sold for, US dollar amount)    
    - Zestimate (what Zillow predicted the house would sell for, US dollar amount)    
    - Rent Zestimate (what Zillow predicted the house could be rented for, US dollar amount)    
    - Property tax rate    
    - Tax assessed value (what the value is deemed worth according to the taxing authorities)    
    - Tax assessed year    

Further exploration of this dataset showed that there were 62 unique zip codes present, with value counts ranging from 1 to 1,001 per zipcode. To make sure our data was more evenly distributed from the outset, we filtered this data to return only data for zip codes that included more than 500 rows of data. This left us with 17 unique zip codes, and 11,854 rows of data.

![cleaned_data_csv](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%201/images/cleaned_data_csv.jpg)

>Dataset 2: Combined Income, Census, and Zipcode Data
- Our second dataset was compiled from zipatlas.com, census.gov and google.com/maps websites. These sources were combined to generate a dataset of median household income for zipcodes that were available in our first dataset.

![median_incomes_csv](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%201/images/median_income_by_zip.jpg)


## Transforming and Loading the Data into the Database (PostgreSQL)
Once the raw data was compiled, it was cleaned using Python's pandas library (using Jupyter notebook) and loaded into PostgreSQL where it was joined together using the Portland zipcodes in the first dataset as the primary key to retrieve and append the median household income from the second. The image below depicts the entity relationship diagram (ERD) of the data:

![ERD_image](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%203/images/updated_database_schema.png)

The datasets were merged using a left join to generate a new table that contained the target variable (housing prices) and the independent variables (number of bedrooms, number of bathrooms, lot size, and median household income). The image below depicts the results of this SQL join query:

![SQL_table_image](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%201/images/Merged_Table.png)      


## Multivariate Linear Regression Machine Learning Model

Multivariate Regression is an extension of simple linear regression.  It is used when we want to predict the value of a variable based on the value of two or more different variables.  The variable we want to predict is housing price, which is the dependent variable and the target in our model. The variables that we used to calculate the target are the independent variables (# of bedrooms, # of bathrooms, zipcode, lotsize, school_rating_0, school_rating_1, garage, school_rating_2, yearbuilt and median income) which are the features in our model.  

 * **The following libraries and dependencies were imported into Jupyter Notebook:**
Multivariate Regression is an extension of simple linear regression.  It is used when we want to predict the value of a variable based on the value of two or more different variables.  The variable we want to predict is housing price, which is the dependent variable and the target in our model. The variables that we used to calculate the target are the independent variables (# of bedrooms, # of bathrooms, zipcode, lotsize, median income) and the features in our model.  

  * **Input Data** - A connection string was used to access the SQL database (Portland_Housing_Prices) and import the merged table into        Jupyter Notebook.  See code below.
  
  ![ConnectionString](https://github.com/SamSteffen/Portland_Housing_Prices/blob/main/Deliverable%202/Images/ConnectionString.png)
  
  * **Libraries and Dependencies**
  
   - Sklern.preprocessing/StandardScaler
   - Pandas
   - numpy
   - matplotlib.pyplot
   - sklern.model_selection/train_test_split
   - collections/counter
   - sklearn/metrics
   - sklearn.linear_model/LinearRegression
   - sklearn.metrics/r2_score
   - sklearn.ensemble/RandomForestRegressor
   - sklearn.decomposition/PCA
   - scipy.stats/spearmanr, pearsonr
   - Seaborn

  * **Input Data** - A connection string was used to access the SQL database (Portland_Housing_Prices) and import the merged table into        Jupyter Notebook. The imported table was converted into a Python dataframe and defined as merged_table_df. See code below.
  
  ![ConnectionString]()
  
 
### Exploratory Analysis and Feature Selection


The merged_table_df consisted of 18 columns. The following columns were immediately dropped because it was determined that they provided no value to this analysis: abbreviatedaddress, city, latitude, longtitude, date_sold, zestimate. 

![Updated_Feature Selection]()

After deciding on zipcode, bathrooms, bedroomms, price, garage, school_rating_0, school rating_1, school_rating_2, date_sold, ave_income, year_built and lotsize as our features, we ran descriptive statistics on the new dataframe, House_FT_df. 

![Updated_DescriptiveStats]()

After a preliminary investigation of the newly created HouseFT_DF, it was determined that the bedrooms, yearbuilt and bathrooms features all contained zeros for minimum values.  Since homes with zero bedrooms and/or bathrooms and zero for yearbuilt would likely not be valid data points, we dropped the records with zero values.

![Updated_DropZeros]()

### Preprocessing

**Handling Outliers and Skewness**
A box and whisker plot revealed that there was an outlier in the price column.  

![BoxandWhis_PriceOutlier_ML]()

The price outlier was dropped from the distribution.

![DropPriceOutlier_ML]()


**Handling Zipcodes**
Since we determined that zipcodes shoule be classified as categorical, rather than continuous data. We applied Dummies to encode the zipcode data.

![DummiesEncoding_ML]()

In order for the model to accept the garage data, True/False needed to be converted to integer values.

![Garagetypeconvert_ML]()

**Normalization of Data**
A StandardScaler was applied to the House_FT dataframe to normalize the data across all variables.

![StandardScaler_ML]()

### Model Building
- Run and evaluate linear regression model

The data was split into target(y) and features(x).

![Updated_ModelSplit]()

Split the data into test and train sets using the standard (75/25) split. Then instantiate the model.

![testtrainsplit_instantiate_ML]()

Run the model and print results.

![runmodel_printresults_ML]()

Compare robustness.

![Updated_Robustness]()

### Problems and Adjustments to the Model (talk to Kayla about insights here)
- Ran the model without scaling data, got the same exact r score.
- Ran a model with encoded zip codes and no lat/long, and no scaled data and got r score of 46.
- Using the get dummies or hot one encoding isn't going to work for lat/long because we'll get a column for individual occurrences of them,   so that would be 1000's of columns. I'm not sure how to handle that.
- Our data for price, bed, bath, and lot size is heavily skewed so this could be a reason the models so low, also not sure how to handle     that
- Created a random forest regression model with PCA, got a .561 r score, Spearman correlation of .75, and pearson correlation of .75 (not     sure exactly what those mean for the random forest models) but could be good?


# Visualizing the Data
A dashboard for this dataset is available on [Tableau Public.](https://public.tableau.com/app/profile/marty.thompson/viz/Portland_Housing_Prices_Analysis/Averagepricebyzipcode2)

# Presentation
A GoogleSlides slide deck for the presentation of this project is available [here.](https://docs.google.com/presentation/d/1iFqnaFCaYSpY7JOiGFFUvDmQ8k29ZH2TL70giCf6V0w/edit?usp=sharing)
