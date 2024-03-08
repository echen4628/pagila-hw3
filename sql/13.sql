/*
 * Management wants to create a "best sellers" list for each actor.
 *
 * Write a SQL query that:
 * For each actor, reports the three films that the actor starred in that have brought in the most revenue for the company.
 * (The revenue is the sum of all payments associated with that film.)
 *
 * HINT:
 * For correct output, you will have to rank the films for each actor.
 * My solution uses the `rank` window function.
 */
/*
SELECT a.actor_id, a.first_name, a.last_name, r.film_id, r.title, r.rank, r.revenue
FROM actor a
LEFT JOIN LATERAL (
  SELECT film.title, film.film_id, sum(amount) as revenue, RANK () OVER ( ORDER BY sum(amount) DESC ) as rank
  FROM film
  JOIN film_actor using (film_id)
  JOIN inventory using (film_id)
  JOIN rental using (inventory_id)
  JOIN payment using (rental_id)
  WHERE film_actor.actor_id = a.actor_id
  GROUP BY film.title, film.film_id
  ORDER BY sum(amount) DESC
  LIMIT 3
) r ON true;
*/
SELECT a.actor_id, a.first_name, a.last_name, r.film_id, r.title, r.rank, r.revenue
FROM actor a
LEFT JOIN LATERAL (
  SELECT film.title, film.film_id, sum(amount) as revenue, RANK () OVER ( ORDER BY sum(amount) DESC, film.title ) as rank
  FROM film
  JOIN film_actor using (film_id)
  JOIN inventory using (film_id)
  JOIN rental using (inventory_id)
  JOIN payment using (rental_id)
  WHERE film_actor.actor_id = a.actor_id
  GROUP BY film.title, film.film_id
  ORDER BY sum(amount) DESC
  LIMIT 3
) r ON true;
