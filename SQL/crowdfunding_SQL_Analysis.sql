-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT campaign.backers_count, campaign.cf_id
FROM campaign
WHERE campaign.outcome='live'
ORDER BY campaign.backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT COUNT(backers.backer_id), backers.cf_id
FROM backers
GROUP BY backers.cf_id
ORDER BY COUNT(backers.backer_id) DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

CREATE TABLE email_contacts_remaining_goal_amount AS
SELECT contacts.first_name, contacts.last_name, contacts.email, (campaign.goal-campaign.pledged) AS Remaining_Goal_Amount
FROM campaign
JOIN contacts
ON campaign.contact_id=contacts.contact_id
WHERE campaign.outcome='live'
ORDER BY Remaining_Goal_Amount DESC;

-- Check the table

SELECT * FROM email_backers_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

CREATE TABLE email_backers_remaining_goal_amount  AS
SELECT backers.email, backers.first_name, backers.last_name, campaign.cf_id, campaign.company_name, campaign.description, campaign.end_date, (campaign.goal-campaign.pledged) AS Left_of_Goal
FROM campaign
JOIN backers
ON campaign.cf_id=backers.cf_id
WHERE campaign.outcome='live'
ORDER BY backers.email DESC;


-- sorts by last name with first name tie breaker
CREATE TABLE email_backers_remaining_goal_amount  AS
SELECT backers.email, backers.first_name, backers.last_name, campaign.cf_id, campaign.company_name, campaign.description, campaign.end_date, (campaign.goal-campaign.pledged) AS Left_of_Goal
FROM campaign
JOIN backers
ON campaign.cf_id=backers.cf_id
WHERE campaign.outcome='live'
ORDER BY backers.last_name, backers.first_name ASC;



-- Check the table

SELECT * FROM email_backers_remaining_goal_amount;



