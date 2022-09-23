USE sakila;

SHOW tables;

#1
SELECT * FROM actor;

#2
SELECT last_name
FROM actor 
WHERE first_name = "JOHN";

#3
SELECT first_name, last_name
FROM actor
WHERE last_name = "NEESON";

#4
SELECT first_name, last_name
FROM actor
WHERE actor_id%10 = 0;
#mod maths for the win!!

#5
SELECT description
FROM film 
WHERE film_id = "100";

#6
SELECT title
FROM film
WHERE rating = "R";

#7
SELECT title
FROM film
WHERE rating != "R";

#8
SELECT title
FROM film
ORDER BY length 
ASC LIMIT 10;

#9
SELECT title, length
FROM film
WHERE length = (SELECT MAX(length) FROM film);

#10
SELECT title
FROM film 
WHERE special_features LIKE "%Deleted Scenes%";

#11
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1
ORDER BY last_name DESC;

#12
SELECT last_name, COUNT(last_name) AS namec
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > "1"
ORDER BY namec DESC;

#13
SELECT actor.actor_id, first_name, last_name, COUNT(film_actor.actor_id) AS fcount
FROM film_actor JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY film_actor.actor_id 
ORDER BY fcount 
DESC LIMIT 1;
#GINA DEGENERES ON 42

SELECT* FROM film_actor JOIN actor ON film_actor.actor_id = actor.actor_id;

#testing code
SELECT * FROM rental r JOIN inventory i on r.inventory_id=i.inventory_id;
select * from inventory; #inventory film store
select * from rental;#rental inventory
select * from film; #film 
SELECT * #rental_date, film_id, rental_date
FROM inventory i
JOIN rental r on r.inventory_id=i.inventory_id
JOIN film f on f.film_id = i.film_id;

#14
SELECT f.film_id, i.inventory_id, r.rental_date, f.rental_duration, f.title, DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY) AS duedate
FROM inventory i
JOIN rental r on r.inventory_id=i.inventory_id
JOIN film f on f.film_id = i.film_id
WHERE title = "ACADEMY DINOSAUR"
ORDER BY rental_date
DESC LIMIT 1;


#15
SELECT AVG(length) 
FROM film; #115.27

#16 
SELECT category, AVG(Length) AS catag
FROM film_list
GROUP BY category;

#17
SELECT title
FROM film
WHERE description LIKE "%robot%";

#18 
SELECT COUNT(release_year)
FROM film 
WHERE release_year = "2010";

#19
SELECT title
FROM film_list 
WHERE category = "Horror";

#20
SELECT first_name, last_name
FROM staff
WHERE staff_id = "2"; #Jon Stephens

#20 (FOR FUN)
SELECT CONCAT(first_name, " ", last_name) AS full
FROM staff
WHERE staff_id = "2";

#21
SELECT title
FROM film_list
WHERE actors LIKE "%Fred Costner%";

#22
SELECT COUNT(DISTINCT country)
FROM country;

#22 pt2
SELECT COUNT(country) 
FROM country;

#23
SELECT DISTINCT name 
FROM language
ORDER BY name DESC;

#24
SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE "%son%"
ORDER BY first_name;

#24 pt 2
SELECT CONCAT(first_name, " ", last_name) AS Fulln
FROM actor
WHERE last_name LIKE "%son%"
ORDER BY first_name;

#25
SELECT category, count(title) as catcount
FROM film_list
GROUP BY category
ORDER BY catcount
DESC LIMIT 1;


