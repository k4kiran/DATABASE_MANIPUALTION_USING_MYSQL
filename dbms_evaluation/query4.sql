
SELECT bm.book_count                             AS 'taken books', 
       Concat_ws(' ', m.first_name, m.last_name) AS name, 
       b.book_id                                 AS 'book id', 
       c.category_name                           AS category, 
       a.author_name                             AS author, 
       p.publisher_name                          AS publisher, 
       b.name                                    AS 'book name', 
       b.page_number                             AS 'page number', 
       b.published_on                            AS 'published date', 
       b.copies_count                            AS 'total copies', 
       b.available_count                         AS 'available books' 
FROM   books_member bm 
       JOIN member m 
         ON bm.member_id = m.member_id 
       JOIN books b 
         ON b.book_id = bm.book_id 
       JOIN category c 
         ON c.category_id = b.category_id 
       JOIN author a 
         ON a.author_id = b.author_id 
       JOIN publisher p 
         ON p.publisher_id = b.publisher_id 
ORDER  BY name DESC; 