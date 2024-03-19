-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';  -- 2




-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*) 
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;  -- 5,606




-- 3. What films have exactly 7 copies? (search in inventory)
SELECT film_id
FROM inventory
GROUP BY film_id
HAVING COUNT(film_id) = 7;  -- See table





-- 4. How many customers have the first name ‘Willie’?
SELECT COUNT(*)
FROM customer
WHERE first_name = 'Willie'; -- 2




-- 5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC
LIMIT 1; -- staff_id = 1




-- 6. How many unique district names are there?
SELECT COUNT(DISTINCT district)
FROM address; -- 378




-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id
FROM film_actor
GROUP BY film_id 
ORDER BY count(film_id) DESC
LIMIT 1; -- film_id = 508




-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1; -- 13





-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--    with ids between 380 and 430? (use group by and having > 250)

SELECT * 
FROM payment;

SELECT amount, sum(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount 
HAVING SUM(amount) > 250; -- 8


-- 10. Within the film table, how many rating categories are there? And what rating has the most
--     movies total?

SELECT count(DISTINCT rating)
FROM film; --5

SELECT rating, count(rating) 
FROM FILM
GROUP BY rating
ORDER BY count(rating) DESC
LIMIT 1; -- pg-13

