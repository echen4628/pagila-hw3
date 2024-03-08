/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT first_name, last_name FROM actor where actor_id not in (SELECT actor_id from actor join film_actor using (actor_id) join film using (film_id) join film_category using (film_id) join category using (category_id) where category.name = 'Horror') and actor_id in (SELECT actor_id from actor join film_actor using (actor_id) join film using (film_id) join film_category using (film_id) join category using (category_id) where category.name = 'Children') ORDER BY last_name, first_name;
