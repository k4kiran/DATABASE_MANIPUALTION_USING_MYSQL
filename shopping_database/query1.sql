select p.product_name,c.category_name,s.subcategory_name,s1.seller_name,p1.price as seller_price
from products as p
inner join subcategory as s
on p.subcategory_id = s.subcategory_id
inner join category c on 
c.category_id = s.category_id
join product_sellar p1 on
p1.product_id = p.product_id
inner join seller s1 
on s1.seller_id = p1.seller_id
where p1.active_status = 1
order by seller_name,price desc,category_name,subcategory_name,product_name;