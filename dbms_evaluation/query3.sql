
SELECT Concat(m.first_name, ' ', m.last_name) AS NAME, 
       b.NAME                                 AS 'book name', 
       a.author_name                          AS author, 
       b1.issued_date                         AS 'order date' 
FROM   member AS m 
       JOIN booking b1 
         ON b1.member_id = m.member_id 
       JOIN books b 
         ON b.book_id = b1.book_id 
       JOIN author a 
         ON a.author_id = b.author_id 
       JOIN member_status AS ms 
         ON m.member_status_id = ms.member_status_id 
       JOIN booking_status bs 
         ON bs.status_id = b1.status_id 
WHERE  ms.status = 'expired' 
       AND bs.status = 'booked'; 