
## The purpose of this script is to test the status of the yelp_db that is created in yelp_database_analysis, as well as test some simple code:

# ex: For every state, what is the most frequent reviewing name, and what is their average review? 

WITH reviews_per_name_per_state AS ( 
	SELECT DISTINCT 
	bus.state 
	,us.first_name
	,COUNT(rev.review_id) OVER(PARTITION BY rev.user_id, bus.state) as reviews_per_name
    ,AVG(rev.stars) OVER(PARTITION BY rev.user_id, bus.state) AS avg_review
 
	FROM yelp_db.users us 
	JOIN yelp_db.review rev ON rev.user_id = us.user_id 
	JOIN yelp_db.business bus ON bus.business_id = rev.business_id
	ORDER BY bus.state, reviews_per_name desc 
),

ranked_review as ( 
	SELECT DISTINCT 
	rpn.state 
	,rpn.first_name
	,rpn.reviews_per_name
	,rpn.avg_review
	,RANK() OVER(PARTITION BY rpn.state ORDER BY rpn.reviews_per_name DESC) as review_rank

	FROM reviews_per_name_per_state rpn 
) 

SELECT DISTINCT 

rr.state
,rr.first_name
,rr.reviews_per_name
,rr.avg_review

FROM ranked_review rr 
WHERE rr.review_rank = 1 
ORDER BY 3 DESC 

