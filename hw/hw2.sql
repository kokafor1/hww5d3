--q1
select customer, address
from customer
join address
on customer.address_id  = address.address_id
where address.district  = 'Texas';
--5 ppl

--q2
select customer.first_name , customer.last_name , payment.amount
from customer
join payment 
on customer.customer_id = payment.customer_id 
where payment.amount > 7.00;

--q3
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175 
);

--q4
select c.customer_id, c.first_name , a.actor_id, a.first_name , a.last_name
from customer c 
join actor a 
on a.actor_id = a.actor_id 
join country c2 
on c2.country_id = c2.country_id 
where c2.country = 'Argentina';

--q5
select c.category_id , c."name" , count(fc.film_id) as film_count 
from category c 
left join film_category fc 
on c.category_id = fc.category_id
group by c.category_id , c."name" 
order by film_count desc;

--q6
select f.film_id , f.title , count(fa.actor_id) as actor_count 
from film f 
join film_actor fa 
on f.film_id  = fa.film_id 
group by f.film_id , f.title 
order by actor_count desc;

--q7
select a.actor_id , a.first_name , a.last_name ,count(fa.film_id) as movie_count
from actor a 
left join film_actor fa 
on a.actor_id = fa.actor_id 
group by a.actor_id , a.first_name , a.last_name 
order by movie_count
limit 1;

--q8
select c.country_id , c.country , count(c2.city_id) as city_count
from country c 
join city c2 
on c.country_id = c2.country_id 
group by c.country_id , c.country 
order by city_count desc 
limit 1;

--q9
select a.actor_id , a.first_name , a.last_name , count(fa.film_id) as film_count 
from actor a 
join film_actor fa 
on a.actor_id = fa.actor_id 
group by a.actor_id , a.first_name , a.last_name 
having count(fa.film_id) between 20 and 25; 
