
/*update available_count*/
UPDATE books SET available_count = copies_count - borrowed_count;
