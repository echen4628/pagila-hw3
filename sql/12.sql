/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
SELECT
        c.first_name,
        c.last_name,
        category.name,
        count(*)
FROM customer c
LEFT JOIN LATERAL (
  SELECT film.film_id
  FROM rental
  JOIN inventory using (inventory_id)
  JOIN film using (film_id)
  WHERE customer_id = c.customer_id
  ORDER BY rental_date DESC
  LIMIT 5
) r ON true
JOIN film_category ON r.film_id = film_category.film_id
JOIN category USING (category_id)
WHERE category.name = 'Action'
GROUP BY c.first_name, c.last_name, category.name
HAVING count(*) >= 4
ORDER BY c.first_name, c.last_name;
