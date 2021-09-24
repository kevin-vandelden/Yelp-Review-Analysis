## Kevin VanDelden

The general purpose of this project is to create a database of yelp reviews to query off of
and show proficiency in Python, SQL, and various methods of analysis.

One of the starting ideas of the project was to make a trip-planner that could suggest the "worst" places to stop
given a start and ending destination. There are a million lists of the best places, 
optimizing the opposite goal I think could be individual in itself, 
proving not to have copied someone elses analysis, as well as have some comedic value as well.

the yelp dataset is available for download for personal, educational and academic purposes
and is comprised of JSON files of reviews, businesses, users, and others
https://www.yelp.com/dataset

The project also involves using a MYSQL database, and those links and instructions are available here: 
DOWNLOAD MySQL Community Server https://dev.mysql.com/downloads/mysql/
DOWNLOAD MySQL Workbench https://dev.mysql.com/downloads/workbench/

######### IDEAS/OPTIMIZATIONS #############
some immediate optimizations that come to mind would be matching review/business/user records and then
limiting the results for computation speed afterwards. 
Right now i'm just reading the first x lines of the file and getting whatever records match across the board

maybe read the business file first, get x number of businesses for each state and then fetch the reviews 
and users for those businesses?

yelp_database_creation.ipynb creates the MySQL database and makes some plots of reviews/review stars per state, from the query: state_reviews.sql
