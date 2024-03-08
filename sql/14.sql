/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */
/*
SELECT DISTINCT name, r.title, r.count as "total rentals"
FROM film_category as fc
LEFT JOIN LATERAL (
  SELECT film.title, film.film_id, count(*)
  FROM film
  JOIN inventory using (film_id)
  JOIN rental using (inventory_id)
  JOIN film_category using (film_id)
  WHERE film_category.category_id = fc.category_id
  GROUP BY film.title, film.film_id
  ORDER BY count(*) DESC
  LIMIT 5
) r ON true
JOIN category USING (category_id)
ORDER BY name, r.count DESC, title;
*/
SELECT DISTINCT name, r.title, r.count as "total rentals"
FROM film_category as fc
LEFT JOIN LATERAL (
  SELECT film.title, film.film_id, count(*)
  FROM film
  JOIN inventory using (film_id)
  JOIN rental using (inventory_id)
  JOIN film_category using (film_id)
  WHERE film_category.category_id = fc.category_id
  GROUP BY film.title, film.film_id
  ORDER BY count(*) DESC, film.title DESC
  LIMIT 5
) r ON true
JOIN category USING (category_id)
ORDER BY name, r.count DESC, title;
