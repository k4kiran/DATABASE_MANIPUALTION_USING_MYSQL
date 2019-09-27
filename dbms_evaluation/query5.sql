DROP TRIGGER IF EXISTS book_available;
DELIMITER //
CREATE TRIGGER book_available AFTER INSERT OR UPDATE ON books_member
FOR EACH ROW
BEGIN
UPDATE books
SET available_count = available_count + 1
book_id = books_member.book_id;
END
DELIMITER ;