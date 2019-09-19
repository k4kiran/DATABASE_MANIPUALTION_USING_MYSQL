select o.order_id, o.order_date, concat(first_name,',',last_name) as name,
concat(address_line1,',',address_line2,',',country_name,',' ,state_name,',',street,',',zipcode) as 'billing address',
subtotal,total_tax as 'total tax',total_discount as 'total discount'
from order1 as o
join customer c 
on o.customer_id = c.customer_id
join address a
on a.address_id = o.billing_address_id
join country c1
on c1.country_id = a.country_id 
join state s1
on s1.state_id = a.state_id;