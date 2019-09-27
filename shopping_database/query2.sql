SELECT customer_id,
       first_name,
       last_name,
       phone_number,
       email,
       zipcode
FROM   customer AS c
       JOIN address a
         ON a.address_id = c.address_id
WHERE  a.zipcode = 752071
ORDER  BY first_name;  