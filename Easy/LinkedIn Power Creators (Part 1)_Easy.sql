/* Level : Easy

Company : LinkedIn

The LinkedIn Creator team is looking for power creators who use their personal profile as a company or influencer page. If someone's LinkedIn page has more followers than the company they work for, we can safely assume that person is a power creator.

Write a query to return the IDs of these LinkedIn power creators ordered by the IDs.

Assumption:

    Each person with a LinkedIn profile in this database works at one company only.

personal_profiles Table:

Column Name	Type
profile_id	integer
name		string
followers	integer
employer_id	integer

personal_profiles Example Input:

profile_id	name		followers	employer_id
1		Nick Singh	92,000		4
2		Zach Wilson	199,000		2
3		Daliana Liu	171,000		1
4		Ravit Jain	107,000		3
5		Vin Vashishta	139,000		6
6		Susan Wojcicki	39,000		5

company_pages Table:

Column Name	Type
company_id	integer
name		string
followers	integer

company_pages Example Input:

company_id	name				followers
1		The Data Science Podcast	8,000
2		Airbnb				700,000
3		The Ravit Show			6,000
4		DataLemur			200
5		YouTube				1,6000,000
6		DataScience.Vin			4,500

Example Output:

profile_id
1
3
4
5

This output shows that profile IDs 1-5 are all power creators, meaning that they have more followers than their company page.

The dataset you are querying against may have different input & output - this is just an example!

*/

DataLemur Question Link : https://datalemur.com/questions/linkedin-power-creators

Solution:

SELECT profile_id FROM(
SELECT pp.profile_id, pp.followers AS personal, cp.followers AS company FROM personal_profiles pp
INNER JOIN company_pages cp
ON pp.employer_id = cp.company_id
) powercreators
WHERE personal > company
ORDER BY profile_id;