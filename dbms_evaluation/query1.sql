
SELECT * 
FROM   member 
WHERE  expiry_date < Date_add(Curdate(), INTERVAL 1 month) 
       AND expiry_date > (SELECT Curdate()) 
ORDER  BY Concat(first_name, last_name);