select customer_id,first_name,last_name,phone_number,email,zipcode
from customer as c
join address a
on a.address_id = c.address_id
where a.zipcode = 752071
order by first_name; 