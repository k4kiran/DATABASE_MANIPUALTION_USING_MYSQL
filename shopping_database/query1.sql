SELECT p.product_name,
       c.category_name,
       s.subcategory_name,
       s1.seller_name,
       p1.price AS seller_price
FROM   products AS p
       INNER JOIN subcategory AS s
               ON p.subcategory_id = s.subcategory_id
       INNER JOIN category c
               ON c.category_id = s.category_id
       JOIN product_sellar p1
         ON p1.product_id = p.product_id
       INNER JOIN seller s1
               ON s1.seller_id = p1.seller_id
WHERE  p1.active_status = 1
ORDER  BY seller_name,
          price DESC,
          category_name,
          subcategory_name,
          product_name;