SHOW DATABASES;

CREATE DATABASE publications;

USE publications;

CREATE TABLE classics (
 author VARCHAR(128),
 title VARCHAR(128),
 type VARCHAR(16),
 year CHAR(4)) ENGINE MyISAM;


DESCRIBE classics;


ALTER TABLE classics ADD id INT UNSIGNED NOT NULL AUTO_INCREMENT KEY;


ALTER TABLE classics DROP id;


INSERT INTO classics(author, title, type, year) VALUES('Mark Twain','The Adventures of Tom Sawyer','Fiction','1876');
INSERT INTO classics(author, title, type, year) VALUES('Jane Austen','Pride and Prejudice','Fiction','1811');
INSERT INTO classics(author, title, type, year) VALUES('Charles Darwin','The Origin of Species','Non-Fiction','1856');
INSERT INTO classics(author, title, type, year) VALUES('Charles Dickens','The Old Curiosity Shop','Fiction','1841');
INSERT INTO classics(author, title, type, year) VALUES('William Shakespeare','Romeo and Juliet','Play','1594');


SELECT * FROM classics;

ALTER TABLE classics CHANGE type category VARCHAR(16);


CREATE TABLE new(trash INT); DESCRIBE new; DROP TABLE new; SHOW tables;

ALTER TABLE classics ADD INDEX(author(20));
ALTER TABLE classics ADD INDEX(title(20));
ALTER TABLE classics ADD INDEX(category(4));
ALTER TABLE classics ADD INDEX(year);
DESCRIBE classics;


ALTER TABLE classics ADD isbn CHAR(13);
UPDATE classics SET isbn='9781598184891' WHERE year='1876';
UPDATE classics SET isbn='9780582506206' WHERE year='1811';
UPDATE classics SET isbn='9780517123201' WHERE year='1856';
UPDATE classics SET isbn='9780099533474' WHERE year='1841';
UPDATE classics SET isbn='9780192814968' WHERE year='1594';
ALTER TABLE classics ADD PRIMARY KEY(isbn);
DESCRIBE classics;

ALTER TABLE classics ADD FULLTEXT(author,title);

SELECT author,title FROM classics;

SELECT title,isbn FROM classics;

SELECT COUNT(*) FROM classics;

INSERT INTO classics(author, title, category, year, isbn) VALUES('Charles Dickens','Little Dorrit','Fiction','1857', '9780141439969');

SELECT author FROM classics;

SELECT DISTINCT author FROM classics;

DELETE FROM classics WHERE title='Little Dorrit';

SELECT author,title FROM classics WHERE author="Mark Twain";

SELECT author,title FROM classics WHERE isbn="9781598184891 ";

SELECT author,title FROM classics WHERE author LIKE "Charles%";

SELECT author,title FROM classics WHERE title LIKE "%Species";

SELECT author,title FROM classics WHERE title LIKE "%and%";

SELECT author,title FROM classics LIMIT 3,1;

SELECT author,title FROM classics WHERE MATCH(author,title) AGAINST('old shop');

SELECT author,title FROM classics WHERE MATCH(author,title) AGAINST('tom sawyer');

SELECT author,title FROM classics ORDER BY author;

SELECT author,title FROM classics ORDER BY title DESC;

SELECT category,COUNT(author) FROM classics GROUP BY category;

CREATE TABLE customers (
name VARCHAR(128),
isbn VARCHAR(13),
PRIMARY KEY (isbn)) ENGINE MyISAM;
INSERT INTO customers(name,isbn) VALUES('Joe Bloggs','9780099533474');
INSERT INTO customers(name,isbn) VALUES('Mary Smith','9780582506206');
INSERT INTO customers(name,isbn) VALUES('Jack Wilson','9780517123201');
SELECT * FROM customers;

SELECT name,author,title from customers,classics
WHERE customers.isbn=classics.isbn;

SELECT name,author,title FROM customers
JOIN classics ON customers.isbn=classics.isbn;

SELECT name,author,title from
customers AS cust, classics AS class
WHERE cust.isbn=class.isbn;

SELECT author,title FROM classics WHERE author LIKE "Charles%" AND author NOT LIKE "%Darwin";