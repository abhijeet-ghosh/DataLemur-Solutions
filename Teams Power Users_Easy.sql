/* Level : Easy

Company : Microsoft

Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

Assumption:

    No two users has sent the same number of messages in August 2022.

messages Table:

Column Name	Type
message_id	integer
sender_id	integer
receiver_id	integer
content		varchar
sent_date	datetime

messages Example Input:

message_id	sender_id	receiver_id	content			sent_date
901		3601		4500		You up?			08/03/2022 00:00:00
902		4500		3601		Only if you're buying	08/03/2022 00:00:00
743		3601		8752		Let's take this offline	06/14/2022 00:00:00
922		3601		4500		Get on the call		08/10/2022 00:00:00

Example Output:
sender_id	message_count
3601		2
4500		1

The dataset you are querying against may have different input & output - this is just an example!

*/

DataLemur Question Link : https://datalemur.com/questions/teams-power-users

Solution:

SELECT sender_id, COUNT(message_id) AS message_count FROM messages
WHERE EXTRACT(MONTH from sent_date) = 8 AND EXTRACT(YEAR from sent_date) = 2022
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;
