-- 1. List top 10 highest rental rate
SELECT * FROM film 
ORDER BY rental_rate DESC LIMIT 10;

-- 2.  List films with rating G and PG and with Trailers 
SELECT * FROM film
WHERE rating IN ('G','PG') AND special_features = 'Trailers';

-- 3.  Display the number of films for each Film Category 
SELECT  category_id 'Film Category', count(film_id) 'No. of Films' FROM film_category fc
GROUP BY fc.category_id;
 
 -- 4.  Insert a new record to actor table. Include that new actor in the Movie "Academy Dinosaur"

INSERT INTO actor (first_name, last_name)
VALUES ('TOM', 'HOLAND');
 
INSERT INTO film_actor (actor_id, film_id)
VALUES (200, 1); 
 
-- 5.  Display the most frequently rented movies in descending order. ??
SELECT f.title, count(r.inventory_id) as Most_Rented FROM rental r
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
group by f.title order by Most_Rented desc;

-- 6.  Summarize the average sale amount by store
SELECT  s.store_id, AVG(amount) ave_sale FROM payment p
INNER JOIN staff s ON s.staff_id = p.staff_id
GROUP BY s.store_id;

-- 7.  Display the total payment in year 2006 for each store
SELECT SUM(amount), s.store_id FROM payment p
INNER JOIN staff s ON s.staff_id = p.staff_id
WHERE payment_date LIKE '2006%'
GROUP BY s.store_id
order by s.store_id;

-- 8.  How many copies of the film "AGENT TRUMAN" exist in the inventory system?
SELECT f.title as TITLE, COUNT(i.inventory_id) as COPIES  FROM  inventory i
INNER JOIN film f ON f.film_id = i.film_id
WHERE i.film_id = (
	SELECT f.film_id FROM film f
		WHERE f.title = 'Agent Truman');
        
-- 9.  Write a query to display how much business, in dollars, each store brought in.
SELECT s.store_id, CONCAT('$', SUM(p.amount)) as 'Total Amount' FROM payment p
INNER JOIN staff s ON s.staff_id = p.staff_id
GROUP BY s.store_id;


--  10. Run an email marketing campaign in Japan for which you will need the names and email addresses of all customers in Japan. Use joins to retrieve this information.
SELECT concat(c.first_name, ' ', c.last_name) as Name, c.email, c.address_id, ct.city, cy.country FROM customer c
INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city ct ON ct.city_id = a.city_id
INNER JOIN country cy ON cy.country_id = ct.country_id
WHERE cy.country = 'Japan';

  
 

 

