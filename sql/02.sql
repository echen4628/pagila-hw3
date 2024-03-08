/*
 * Compute the country with the most customers in it. 
 */
 SELECT country FROM customer join address using (address_id) join city using (city_id) join country using (country_id) GROUP BY
 country ORDER BY count(*) DESC LIMIT 1;
