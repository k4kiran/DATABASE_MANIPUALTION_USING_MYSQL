SELECT Concat(m.first_name, ' ', b.name) AS name, 
       b.name                            AS 'book name', 
       a.author_name                     AS author, 
       b1.issued_date                    AS 'order date', 
       b1.return_date                    AS 'return date' 
FROM   member AS m 
       JOIN booking b1 
         ON b1.member_id = m.member_id 
       JOIN books b 
         ON b.book_id = b1.book_id 
       JOIN author a 
         ON a.author_id = b.author_id 
WHERE  return_date BETWEEN Date_add(Curdate(), INTERVAL 1 week) AND 
                           Date_add(Curdate(), INTERVAL 2 week) 
ORDER  BY name, 
          'book name' ASC; 