/* Used Mavenmovies Database to solve below queries */

/* 1Q. Write a SQL query to count the number of characters except for the spaces for each actor. 
	   Return the first 10 actors' name lengths along with their names. */
 
select concat(first_name,' ',last_name) as full_name,
       length(concat(first_name,'',last_name)) as length_of_fullname from actor limit 10;

/* 2Q. List all Oscar awardees(Actors who received the Oscar award) with their full names and 
       the length of their names. */
       
select awards,concat(first_name,' ',last_name) as full_name,
	   length(concat(first_name,'',last_name)) as length_of_name from actor_award where awards like '%Oscar%';

/* 3Q. Find the actors who have acted in the film ‘Frost Head.’ */

select * from film f
left join film_actor fa
on f.film_id=fa.film_id
left join actor a
on fa.actor_id=a.actor_id
where f.title='Frost Head';

/* 4Q. Pull all the films acted by the actor ‘Will Wilson.’*/

select * from actor a
left join film_actor fa
on a.actor_id=fa.actor_id
left join film f 
on fa.film_id=f.film_id
where a.actor_id=168;

/* 5. Pull all the films which were rented and return them in the month of May.*/

SELECT * FROM RENTAL R
LEFT JOIN INVENTORY I
USING (INVENTORY_ID) 
LEFT JOIN FILM_TEXT FT
USING (FILM_ID)
WHERE monthname(return_date)='may';


/* 6Q. Pull all the films with ‘Comedy’ category.*/

select * from category c
left join film_category fc
on c.category_id=fc.category_id
left join film f
on fc.film_id=f.film_id where c.category_id=5;
