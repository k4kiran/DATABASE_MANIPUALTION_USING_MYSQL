/*source D:/users/kiran_bal/work/git/KIRAN BAL/SQL/Database_Manipulation_Using_MYSQL/dbms_evaluation/queries_create/create_table1.sql*/
/*create category table*/

CREATE TABLE category
(category_id INT AUTO_INCREMENT,
category_name VARCHAR(50) NOT NULL,
PRIMARY KEY(category_id));

/*create author table*/

CREATE TABLE author
(author_id INT AUTO_INCREMENT,
author_name VARCHAR(50) NOT NULL,
PRIMARY KEY(author_id));

/*create publisher table*/

CREATE TABLE publisher
(publisher_id INT AUTO_INCREMENT,
publisher_name VARCHAR(50) NOT NULL,
PRIMARY KEY(publisher_id));

/*create booking_status table*/

CREATE TABLE booking_status
(status_id INT AUTO_INCREMENT,
status VARCHAR(20) NOT NULL,
PRIMARY KEY(status_id));

/*create roles table*/

CREATE TABLE roles
(role_id INT AUTO_INCREMENT,
role_name VARCHAR(50) NOT NULL UNIQUE,
description TEXT,
PRIMARY KEY(role_id));

/*create member_status table*/

CREATE TABLE member_status
(member_status_id INT AUTO_INCREMENT,
status VARCHAR(20) NOT NULL,
PRIMARY KEY(member_status_id));

/*create permission table*/

CREATE TABLE permission
(id INT AUTO_INCREMENT,
role_id INT REFERENCES roles(role_id),
view_access TINYINT(1) NOT NULL,
edit_access TINYINT(1) NOT NULL,
PRIMARY KEY(id));

/*create login table*/

CREATE TABLE login
(login_id INT AUTO_INCREMENT,
role_id INT REFERENCES roles(role_id),
user_name VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(50) NOT NULL,
PRIMARY KEY(login_id));

/*create books table*/

CREATE TABLE books
(book_id INT AUTO_INCREMENT,
category_id INT REFERENCES category(category_id),
author_id INT REFERENCES author(author_id),
publisher_id INT REFERENCES publisher(publisher_id),
name VARCHAR(50) NOT NULL,
page_number INT NOT NULL,
published_on DATETIME,
copies_count INT,
borrowed_count INT,
available_count INT,
PRIMARY KEY(book_id));

/*create books_member table*/

CREATE TABLE books_member
(books_member_id INT AUTO_INCREMENT,
book_id INT REFERENCES books(book_id),
member_id INT REFERENCES member(member_id),
book_count INT NOT NULL,
PRIMARY KEY(books_member_id));

/*create member table*/

CREATE TABLE member
(member_id INT AUTO_INCREMENT,
login_id INT REFERENCES login(login_id),
member_status_id INT REFERENCES member_status(member_status_id),
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
email VARCHAR(50),
phone BIGINT NOT NULL,
age TINYINT NOT NULL,
membership_id VARCHAR(30) NOT NULL,
expiry_date DATETIME NOT NULL,
PRIMARY KEY(member_id));

/*create booking table*/

CREATE TABLE booking
(booking_id INT AUTO_INCREMENT,
book_id INT REFERENCES books(book_id),
member_id INT REFERENCES member(member_id),
status_id INT REFERENCES booking_status(status_id),
issued_date DATETIME,
return_date DATETIME,
PRIMARY KEY(booking_id));
