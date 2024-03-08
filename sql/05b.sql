/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */
 SELECT film2.title from film_actor join actor on film_actor.actor_id = actor.actor_id join film on film_actor.film_id = film.film_id join film_actor as     film_actor2 on actor.actor_id = film_actor2.actor_id join film as film2 on film_actor2.film_id = film2.film_id WHERE film.title='AMERICAN CIRCUS' GROUP BY film2.title HAVING count(film2.title) >=2 ORDER BY film2.title;
