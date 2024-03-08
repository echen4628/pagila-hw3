/* 
 * Finding movies with similar categories still gives you too many options.
 *
 * Write a SQL query that lists all movies that share 2 categories with AMERICAN CIRCUS and 1 actor.
 *
 * HINT:
 * It's possible to complete this problem both with and without set operations,
 * but I find the version using set operations much more intuitive.
 */
SELECT film2.title FROM category JOIN film_category USING (category_id) JOIN film USING (film_id) JOIN film_category as film_category2 on film_category.category_id = film_category2.category_id JOIN film as film2 on film_category2.film_id = film2.film_id WHERE film.title='AMERICAN CIRCUS' GROUP BY film2.title HAVING count(*) >= 2 INTERSECT SELECT film2.title from film_actor join actor on film_actor.actor_id = actor.actor_id join film on film_actor.film_id = film.film_id join film_actor as film_actor2 on actor.actor_id = film_actor2.actor_id join film as film2 on film_actor2.film_id = film2.film_id WHERE film.title='AMERICAN CIRCUS' order by title;
