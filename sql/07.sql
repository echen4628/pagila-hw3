/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
--SELECT DISTINCT actor3.first_name || ' ' || actor3.last_name as "Actor Name" FROM film join film_actor using (film_id) join actor using (actor_id) join film_actor as film_actor2 on film.film_id = film_actor2.film_id join actor as actor2 on film_actor2.actor_id = actor2.actor_id join film as film2 on film_actor2.film_id = film2.film_id join film_actor as film_actor3 on film2.film_id = film_actor3.film_id join actor as actor3 on film_actor3.actor_id = actor3.actor_id WHERE actor.first_name = 'RUSSELL' AND actor.last_name = 'BACALL' AND actor2.first_name || ' ' || actor2.last_name != 'RUSSELL BACALL' ORDER BY "Actor Name";
/*
SELECT
DISTINCT
actor2.first_name || ' ' || actor2.last_name as "Actor Name"
FROM actor
JOIN film_actor using (actor_id)
JOIN film_actor as film_actor2 on film_actor.film_id = film_actor2.film_id
JOIN film_actor as film_actor3 on film_actor2.actor_id = film_actor3.actor_id
JOIN film_actor as film_actor4 on film_actor3.film_id = film_actor4.film_id
JOIN actor as actor2 on film_actor4.actor_id = actor2.actor_id
WHERE actor.first_name || ' ' || actor.last_name = 'RUSSELL BACALL'
EXCEPT
SELECT
DISTINCT
actor2.first_name || ' ' || actor2.last_name as "Actor Name"
FROM actor
JOIN film_actor using (actor_id)
JOIN film_actor as film_actor2 on film_actor.film_id = film_actor2.film_id
JOIN actor as actor2 on film_actor2.actor_id = actor2.actor_id
WHERE actor.first_name || ' ' || actor.last_name = 'RUSSELL BACALL'

ORDER BY "Actor Name";
*/


SELECT
DISTINCT
actor2.first_name || ' ' || actor2.last_name as "Actor Name"
FROM actor
JOIN film_actor using (actor_id)
JOIN film_actor as film_actor2 on film_actor.film_id = film_actor2.film_id
JOIN film_actor as film_actor3 on film_actor2.actor_id = film_actor3.actor_id
JOIN film_actor as film_actor4 on film_actor3.film_id = film_actor4.film_id
JOIN actor as actor2 on film_actor4.actor_id = actor2.actor_id
WHERE actor.first_name || ' ' || actor.last_name = 'RUSSELL BACALL'
AND actor2.actor_id NOT IN (
SELECT
DISTINCT
actor2.actor_id
FROM actor
JOIN film_actor using (actor_id)
JOIN film_actor as film_actor2 on film_actor.film_id = film_actor2.film_id
JOIN actor as actor2 on film_actor2.actor_id = actor2.actor_id
WHERE actor.first_name || ' ' || actor.last_name = 'RUSSELL BACALL'
)
ORDER BY "Actor Name";
