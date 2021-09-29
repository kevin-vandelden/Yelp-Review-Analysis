## Author: Kevin VanDelden
Contact: kevinrvandelden@gmail.com
LinkedIn: https://www.linkedin.com/in/kevin-vandelden/

The general purpose of this project is to create a database of yelp reviews to query off of
and show proficiency in Python, SQL, and various methods of analysis.

One of the starting ideas of the project was to make a trip-planner that could suggest the "worst" places to stop
given a start and ending destination. There are a million lists of the best places, 
optimizing the opposite goal I think could be individual in itself, 
proving not to have copied someone elses analysis, as well as have some comedic value as well.

the yelp dataset is available for download for personal, educational and academic purposes
and is comprised of JSON files of reviews, businesses, users, and others
- DOWNLOAD YELP DATASET: https://www.yelp.com/dataset

The project also involves using a MYSQL database, and those links and instructions are available here: 
- DOWNLOAD MySQL Community Server: https://dev.mysql.com/downloads/mysql/
- DOWNLOAD MySQL Workbench: https://dev.mysql.com/downloads/workbench/

The weather aspect of this project will be sourced from a Kaggle dataset, it's one of the larger complete sets I have found, and ~71% of reviews from the working-sample of the review dataset take place from 2012-2017.
- DOWNLOAD KAGGLE WEATHER DATASET: https://www.kaggle.com/selfishgene/historical-hourly-weather-data?select=temperature.csv
- - solution for matching weather -> review: find nearest record of weather for that day and accept if it's under x distance away (to assume similar weather within some boundary)

## IDEAS/OPTIMIZATIONS ##

- some immediate optimizations that come to mind would be matching review/business/user records and then limiting the results for computation speed afterwards. 
Right now i'm just reading the first x lines of the file and getting whatever records match across the board

- maybe read the business file first, get x number of businesses for each state and then fetch the reviews 
and users for those businesses
- or re-ordering the review-file so that the first x lines I write to the db comprises an even split per state.
- word cloud generation for specified category/attribute of business
- read in weather data from an API and see if there's correlation between weather and review
- - Calling historic weather data for specific dates/locations would most likely require a paid-for API subscription
- - alternatively could use API to see "what city is best/worst for placing an order right now?" based on correlation found (current weather data is more commonly available via API)

yelp_database_creation.ipynb creates the MySQL database and makes some plots of reviews/review stars per state, from the query: state_reviews.sql

![alt text](https://github.com/kevin-vandelden/Yelp-Review-Analysis/blob/main/reviews_per_state.png?raw=true)
![alt text](https://github.com/kevin-vandelden/Yelp-Review-Analysis/blob/main/low_reviews_per_state.png?raw=true)
