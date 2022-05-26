# Data_Bootcamp_Project
Cordel, Gibbs, Miller, Ross

# Overview

## Topic
In our collaborative project, we aimed to build a machine learning model to predict whether a medical patient has COVID-19 based on a variety of factors. We'll be utilizing a Supervised Machine Learning Algorithm (RandomForestClassifier) to analyze existing COVID-19 patient data.

## Reason for selecting this topic
With the critical periods of the Pandemic behind us, what we've learned about the illness has become increasingly concrete. With the massive surge of COVID-19 data being released to the public as a means for exploring this illness during the pandemic, our group finds it both practical and relevant to employ our own skills to analyze the probability that somebody has the illness based on various features.

## Resources
- Data Source: [CDC COVID-19 Data Tracker](https://covid.cdc.gov/covid-data-tracker/?CDC_AA_refVal=https%3A%2F%2Fwww.cdc.gov%2Fcoronavirus%2F2019-ncov%2Fcases-updates%2Fcases-in-us.html#cases_casesper100klast7days)
- Data Source: [COVID-19 Data GitHub - nytimes](https://github.com/nytimes/covid-19-data)
- Data Source: [COVID-19 Data GitHub - owid](https://github.com/owid/covid-19-data/tree/master/public/data)

- Software: Python 3.8.8, Visual Studio Code 1.66.2, Jupyter Notebook 6.4.5, Conda 4.12.0

## Plan
- Determine which datasets work best for our proposed topic and subsequent questions
- Build a relational dataset of at least 2 tables using PostgreSQL
- ETL our data into a Google CoLab file
- Clean & Preprocess our Data so that it works well with our model
- Build our Machine Learning Model
- Evaluate Machine Learning Model Results
- Optimize Machine Learning Model
- Evaluate Machine Learning Model Results
- Report Findings

## Questions We Hope To Answer
1) Can we determine the probability that someone has COVID-19 based on a variety of input factors?
2) Is a Random Forest Classifier the best means for creating this analysis? Is a Neural Network better in this case?
3) Does the input data that we provide work well for/in our machine learning model?
4) Can we determine what trends best indicate whether someone has or does not have COVID-19?


# Process
1) Sourcing Data:
- The data sourcing process included intensive trial and error of searching for COVID-19 and health related data on google and popular dataset websites such as Kaggle. While our first dataset was numerous and dense, it had too many null values and little data that could allow us to create conclusive results or conclusions. Via an instructor's helpful suggestion, we decided to use alternative data sources that were known to be more credible in terms of producing numerous, credible, and dynamic COVID-19 data. Ultimately, our data came from sources such as the CDC's published COVID-19 Datasets, as well as credible datasets from GitHub users and organizations that had reliable data that was being updated daily. 


2) Cleaning Our Data
- We cleaned our data using multiple methods over time. Our initial prescreening and understanding of the original dataset was done in Excel with some utilization of pandas. Once we found our second, better dataset, we primarily utilized a python notebook and used pandas, sqlalchemy, and numpy to reorganize and clean our data.
- When it came to ETLing data to and from the database, we ultimately used our then pandas & sqlalchemy cleaned datasets and imported them into our PostgreSql database. From there our cleaning exclusively used SQL to organize our datasets into a singular, merged dataset/database. 
- After SQL and data organization we would complete the remaineder of our cleaning within the cleaning and preprocessing phases/segments of the machine learning model (found in "Final_DBFP_Machine_Learning_Model_v1.ipynb")


3) Building Our Model
- Our model was orginial built with the idea that we would be predicting likelihood of having contracted COVID-19 based on nutritional data and global COVID-19 data. This would result in the need for a classifier algorithm which would process data and produce a "Yes" or "No" Classified result. In that case it would predict whther "Yes, this person has COVID-19" or "No, this person does not have COVID-19"
- In the end however, we realized that the data we had to work with couldn't give any accurate or credible classifications in that way. Instead, the data could more interestingly deliver correlations of outcomes to input factors such as nutritional value factors and COVID-19 medical record factors. As such our model evolved into a Multilinear Regression model that would predict a correlative numerical value that represents how likely the COVID-19 would be fatal to an individual given nutritional data about them and COVID-19 record data from their country or various countries. The model delivers on its purpose.

- Our model was built using Scikit-Learn's model machine learning model building dependencies:
        - We utilize:
                • sklearn.linear_model > LinearRegression
                • sklearn.model_selection > train_test_split
                • sklearn.preprocessing > StandardScaler

- The model includes:
        - fully integrated data cleaning and preprocessing cells
        - CSV read-in integration and compatibility
        - Database connectivity via psycopg2
        - Model evaluation scoring and metrics (fully integrated)
        - A written summary of original project results
        - An exporting function for a final, revised dataset csv with appended model-results/predictions column

- The preprocessing portion of the model includes:
        - The discovery and revision of categorical columns within the imported dataset [A.K.A column identification]
        - Reconfiguraion of dataframe columns (ommission of unneeded columns or unhelpful categorical columns)
        - The inclusion of a LabelEncoder cell for categorical value encoding (not-needed for our project but still included)
        - X & y dataframe creation
        - Train_test_splitting (75%/25%)
        - Cross-column value standardization using Scikit-Learn's StandardScaler()

- Feature engineering was based on:
        - What columns produced numerical values
        - What categorical-value columns were pertinent to the problem we were trying to solve
        - What categorical columns would further confuse the model and the muddy purpose of what was being correlated if included?
        - What features would be needed for a valuable conclusion from our model.

- Training and Testing sets were set with 75% of data used for training and the remaining 25% of data used for testing

- Our reason for choosing a multilinear regression is included above ^. In terms of limitations and benefits, multilinear regression machine learning models are limited by their ability to interpret very complex patterns from data (this is where dynamic neural networks would be more capable), and Multilinear Regressions expect a correlation instead of determining if there even is a correlation in the first place (which an unsupervised machine learning model such as K-Means Clustering would be able to ascertain first). The benefits, however, are that the results of a Multilinear Regression are exceptionally straightforward and interpretable, data is easy to manage and integrate into the model, and the model can be adapted and reconfigured quite easily. As a result, correlations between factors can be relaibly and easily determined without too much CPU of computer demand.

- Explanations in changes in model choice are included above^

- The model has be trained across the data of 129 different countries with 33 features considered. The model could additionaly be trained on any additional COVID-19 or nutritional data provided by countries who have not or had not reported on their COVID-19 medical records previously (Russia, Iceland, Africa, etc.).

- The current and most optimal accuracy score that our model was able to achieve is a ~60% R^2 score. The R62 score is a statistical metric that explains how much of the outcome result's variability is explained by the input factors. The model, as it is with its current input features, is able to predict an outcome in which the input data accounts for 60% of the outcome's result. The remaining 40% is not explained by the data we've used in our model. This ultimately means that either A) there are too many input factors included that are inconsequential to the model that need to be removed [which we've tested - removing statistically insignificant factors actually only seems to REDUCE the R^2 score, making the model less viable, so this is not the issue at hand] or B) there are other input factors or metrics not included in the model so far that account for the remaining 40% of the outcome variance [The most likely reasoning and method for an increased accuracy score].


4) Interpretting/Visualizing Our Findings


# Results
- Our model produces an R^2 score of 0.603. This means that input features used within the model account for about %60 of the variance withing the model's results. This means that of all of the factors used to caluculate and predict Case_Fatality_Ratio, only 60% of the result can be explained by the factors used as inputs in the model. This can mean one of two things, either there are too many ineffective input factors being used int he model (to which we delete all factors who's significance levels are < .05) or there are input factors not accounted for in our data that contribute more prominantly to the resulting Case_Fatality_Ratio (to which we would need to find those factors and include them within our dataset).

- Our calculations of significance levels for each input factors indicate that very few factors have a significant affect on the resulting Case_Fatality_Ratio. In fact, the only input factors proven to be statistically significant to our model are "Cases - cumulative total per 100000 population", "Deaths - cumulative total", "Deaths - cumulative total per 100000 population", and "PERSONS_BOOSTER_ADD_DOSE_PER100". As such, running the model again with only those 4 columns may potentially result in significantly more accurate results being produced.


# Summary
- In summary, our multilinear model to predict COVID-19 fatality probability based on nutrition and zcountry's COVID-19 record creates probability results with 60% "accuracy" (R^2 variance accountability which basically serves as accuracy for a linear regression model). Results can be viewed via the document "final_covid_nutrition_fatality_calculations.csv".
