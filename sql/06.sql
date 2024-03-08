/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */
--SELECT DISTINCT actor2.first_name || ' ' || actor2.last_name as "Actor Name" FROM film join film_actor using (film_id) join actor using (actor_id) join film_actor as film_actor2 on film.film_id = film_actor2.film_id join actor as actor2 on film_actor2.actor_id = actor2.actor_id WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL' and actor2.first_name != 'RUSSELL' and actor2.last_name != 'RUSSELL' ORDER BY "Actor Name";
--SELECT DISTINCT actor2.first_name || ' ' || actor2.last_name as "Actor Name" FROM film join film_actor using (film_id) join actor using (actor_id) join film_actor as film_actor2 on film.film_id = film_actor2.film_id join actor as actor2 on film_actor2.actor_id = actor2.actor_id WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL' and actor2.first_name != 'RUSSELL' and actor2.last_name != 'BACALL' ORDER BY "Actor Name";
SELECT DISTINCT actor2.first_name || ' ' || actor2.last_name as "Actor Name" FROM film join film_actor using (film_id) join actor using (actor_id) join film_actor as film_actor2 on film.film_id = film_actor2.film_id join actor as actor2 on film_actor2.actor_id = actor2.actor_id WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL' AND actor2.first_name || ' ' || actor2.last_name != 'RUSSELL BACALL' ORDER BY "Actor Name";
