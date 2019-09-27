SELECT o.order_id,
       o.order_date,
       Concat(first_name, ',', last_name) AS name,
       Concat(address_line1, ',', address_line2, ',', country_name, ',',
       state_name,
       ',', street, ',', zipcode) AS 'billing address',
       subtotal,
       total_tax AS 'total tax',
       total_discount AS 'total discount'
FROM   order1 AS o
       JOIN customer c
         ON o.customer_id = c.customer_id
       JOIN address a
         ON a.address_id = o.billing_address_id
       JOIN country c1
         ON c1.country_id = a.country_id
       JOIN state s1
         ON s1.state_id = a.state_id;  