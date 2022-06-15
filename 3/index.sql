USE library;

# ALTER TABLE book2 RENAME COLUMN name_of_book to book_name;

UPDATE book2 SET author_prizes = 'International prize' WHERE id IN (2, 8);

DELETE FROM book2 WHERE isbn = 1115;

SELECT * FROM book2;

UPDATE book2 SET author_last_name = 'Kotlyarevskiy' WHERE id = 1;

UPDATE book2 SET author_last_name = 'Stefanyk' WHERE id = 2;

SELECT COUNT(*) FROM book2 WHERE author_prizes IS NOT NULL;

SELECT * FROM book2 WHERE amount_of_pages = (SELECT MIN(amount_of_pages) FROM book2);

SELECT MAX(amount_of_pages) FROM book2;

ALTER TABLE book2 ADD book_price INT NOT NULL;

UPDATE book2 SET book_price = 350 WHERE id IN (2, 4, 6);
UPDATE book2 SET book_price = 240 WHERE id IN (1, 5, 9);
UPDATE book2 SET book_price = 425 WHERE id IN (7, 8, 10);

SELECT AVG(book_price) FROM book2;

SELECT SUM(book_price) FROM book2 WHERE category = 'роман';

SELECT MIN(book_price) FROM book2;

SELECT * FROM book2 WHERE book_price = (SELECT MIN(book_price) FROM book2);

SELECT * FROM book2 WHERE book_price LIKE '2%';
SELECT * FROM book2 WHERE category LIKE 'п__%';
SELECT * FROM book2 WHERE author_first_name LIKE '_а%';

SELECT * FROM book2 WHERE book_price BETWEEN 50 AND 120;
SELECT * FROM book2 WHERE book_price NOT BETWEEN 200 AND 600;

DELETE FROM book2 WHERE id = 5;
DELETE FROM book2 WHERE book_name = 'Захар Беркут';
DELETE FROM book2 WHERE isbn = 7859;