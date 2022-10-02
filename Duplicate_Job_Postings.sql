-- Duplicate Job Listings

This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings (two jobs at the same company with the same title and description).

job_listings   Table:
Column_Name	        Type
job_id	            integer
company_id	        integer
title	            string
description	        string
job_listings Example Input:
job_id	    company_id	        title	            description
248	        827	                Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
149	        845	                Business Analyst	Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations.
945	        345	                Data Analyst	    Data analyst reviews data to identify key insights into a businesss customers and ways the data can be used to solve problems.
164	        345	                Data Analyst	    Data analyst reviews data to identify key insights into a businesss customers and ways the data can be used to solve problems.
172	        244	                Data Engineer	    Data engineer works in a variety of settings to build systems that collect, manage, and convert raw data into usable information for data scientists and business analysts to interpret.

Example Output:
duplicate_companies
1

Explanation
Because job_ids 945 and 164 are at the same company (345), and the jobs have the same title and description, there is exactly one company with a duplicate job.


--Solution

SELECT COUNT(*) AS DUPLICATE_COMPANIES
FROM 
(
    SELECT COMPANY_ID, TITLE, DESCRIPTION 
    FROM job_listings
    GROUP BY COMPANY_ID, TITLE, DESCRIPTION 
    HAVING COUNT(*) > 1
) AS A

