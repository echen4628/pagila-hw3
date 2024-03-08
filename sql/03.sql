/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */
SELECT country, sum(amount) as "total_payments" FROM customer join payment using (customer_id) join address using (address_id) join city using (city_id) join country using (country_id) GROUP BY country ORDER BY sum(amount) DESC, country;
