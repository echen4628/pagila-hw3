/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */
SELECT film2.title
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_actor as film_actor2 ON actor.actor_id = film_actor2.actor_id
JOIN film as film2 ON film_actor2.film_id = film2.film_id
WHERE (film.title='AMERICAN CIRCUS')

INTERSECT

SELECT film2.title
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_actor as film_actor2 ON actor.actor_id = film_actor2.actor_id
JOIN film as film2 ON film_actor2.film_id = film2.film_id
WHERE (film.title='ACADEMY DINOSAUR')INTERSECT

SELECT film2.title
FROM film_actor
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_actor as film_actor2 ON actor.actor_id = film_actor2.actor_id
JOIN film as film2 ON film_actor2.film_id = film2.film_id
WHERE (film.title='AGENT TRUMAN')

ORDER BY 1;
