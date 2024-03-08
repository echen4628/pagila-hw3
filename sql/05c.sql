/* 
 * You also like the acting in the movies ACADEMY DINOSAUR and AGENT TRUMAN,
 * and so you'd like to see movies with actors that were in either of these movies or AMERICAN CIRCUS.
 *
 * Write a SQL query that lists all movies where at least 3 actors were in one of the above three movies.
 * (The actors do not necessarily have to all be in the same movie, and you do not necessarily need one actor from each movie.)
 */
SELECT film2.title from film_actor join actor on film_actor.actor_id = actor.actor_id join film on film_actor.film_id = film.film_id join film_actor as film_actor2 on actor.actor_id = film_actor2.actor_id join film as film2 on film_actor2.film_id = film2.film_id WHERE (film.title='AMERICAN CIRCUS' OR film.title='ACADEMY DINOSAUR' or film.title='AGENT TRUMAN') GROUP BY film2.title HAVING count(*) >= 3
 ORDER BY film2.title;
