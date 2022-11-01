/* Level : Easy

Company : Visa

Visa is analysing its partnership with Apply Pay. Calculate the total transaction volume for each merchant where the transaction was performed via Apple Pay.

Output the merchant ID and the total transactions. For merchants with no Apple Pay transactions, output their total transaction volume as 0. Display the result in descending order of the transaction volume.

Tip: You might want to check the spelling of the payment methods... just sayin' 👀

transactions Table:
Column Name		Type
merchant_id		integer
transaction_amount	integer
payment_method		varchar

transactions Example Input:

merchant_id	transaction_amount	payment_method
1		600			Contactless Chip
1		850			apple pay
1		500			Apple Pay
2		560			Magstripe
2		400			Samsung Pay
4		1200			apple pay
Example Output:

merchant_id	total_transaction
1		1350
4		1200
2		0

Explanation

Merchant 1 has made two Apple Pay purchases totalling $1,350, Merchant 4 has completed one Apple Pay transaction costing $1,200, and Merchant 2 has not completed any Apple Pay transactions.

The dataset you are querying against may have different input & output - this is just an example!

*/

DataLemur Question Link: https://datalemur.com/questions/apple-pay-volume

Solution:

SELECT 
  merchant_id,
  SUM(CASE WHEN payment_method ~* 'apple pay' THEN transaction_amount ELSE 0 END) AS total_transaction
FROM transactions
GROUP BY merchant_id
ORDER BY total_transaction DESC;