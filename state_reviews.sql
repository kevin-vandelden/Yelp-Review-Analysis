SELECT DISTINCT 

bus.state
,COUNT(DISTINCT rev.review_id) as total_reviews
,COUNT(DISTINCT CASE WHEN rev.stars < 2 THEN rev.review_id END) AS low_reviews
,COUNT(DISTINCT CASE WHEN rev.stars >= 2 AND rev.stars < 4 THEN rev.review_id END) AS medium_reviews
,COUNT(DISTINCT CASE WHEN rev.stars >=4 THEN rev.review_id END) as high_reviews
,COUNT(DISTINCT CASE WHEN rev.stars < 2 THEN rev.review_id END) *100.0/COUNT(DISTINCT rev.review_id) as p_low_reviews
,COUNT(DISTINCT CASE WHEN rev.stars >= 2 AND rev.stars < 4 THEN rev.review_id END)*100.0/COUNT(DISTINCT rev.review_id) AS p_medium_reviews
,COUNT(DISTINCT CASE WHEN rev.stars >=4 THEN rev.review_id END)*100.0/COUNT(DISTINCT rev.review_id) as p_high_reviews

FROM yelp_db.review rev 
JOIN yelp_db.business bus ON bus.business_id = rev.business_id 

GROUP BY 1 ORDER BY 1,2 DESC 