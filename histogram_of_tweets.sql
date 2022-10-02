-- Histogram of tweets 

This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below containing tweet data. Write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.

tweets Table:
Column Name	Type
tweet_id	integer
user_id	integer
msg	string
tweet_date	timestamp
tweets Example Input:
tweet_id	user_id	msg	                                                                tweet_date
214252	    111	    Am considering taking Tesla private at $420. Funding secured.	    12/30/2021 00:00:00
739252	    111	    Despite the constant negative press covfefe	                        01/01/2022 00:00:00
846402	    111	    Following @NickSinghTech on Twitter changed my life!	            02/14/2022 00:00:00
241425	    254	    If the salary is so competitive why won’t you tell me what it is?	03/01/2022 00:00:00
231574	    148	    I no longer have a manager. I cant be managed	                    03/23/2022 00:00:00

Example Output:
tweet_bucket	users_num
1	            2
2	            1
Explanation: 2 users fall under the 1 tweet bucket whereas 1 user is in the 2 tweets bucket.




--Solution 

SELECT
TWEET_CNT AS TWEET_BUCKET, 
COUNT(*) AS USERS_NUM
FROM 
(
SELECT USER_ID, COUNT(*) AS TWEET_CNT 
FROM tweets
WHERE EXTRACT(YEAR FROM TWEET_DATE) = 2022
group by USER_ID
) AS A
GROUP BY TWEET_CNT
