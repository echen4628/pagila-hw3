/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */
SELECT film2.title from film_actor join actor on film_actor.actor_id = actor.actor_id join film on film_actor.film_id = film.film_id join film_actor as film_actor2 on actor.actor_id = film_actor2.actor_id join film as film2 on film_actor2.film_id = film2.film_id WHERE film.title='AMERICAN CIRCUS' ORDER BY film2.title;
