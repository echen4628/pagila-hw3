/*
 * Management wants to rank customers by how much money they have spent in order to send coupons to the top 10%.
 *
 * Write a query that computes the total amount that each customer has spent.
 * Include a "percentile" column that contains the customer's percentile spending,
 * and include only customers in at least the 90th percentile.
 * Order the results alphabetically.
 *
 * HINT:
 * I used the `ntile` window function to compute the percentile.
 */
SELECT
t.customer_id,
t.first_name || ' ' || t.last_name as name,
t.sum as total_payment,
t.percentile
FROM
(SELECT
customer.customer_id,
customer.first_name,
customer.last_name,
SUM(payment.amount),
NTILE(100) OVER(
        ORDER BY SUM(payment.amount)
) as percentile
FROM customer
JOIN payment USING (customer_id)
GROUP BY customer.customer_id
) t
WHERE t.percentile >= 90
ORDER BY name;
