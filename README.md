# Database_Manipulation_Using_MYSQL
* [INTRODUCTION](#introduction)
* [DATATYPES](https://github.com/k4kiran/Database_Manipulation_Using_MYSQL/blob/master/datatypes.md)
* [GENERAL COMMANDS](#general-commands)
* [MANAGING TABLES](#managing-tables)
* [MODIFYING DATA](#modifying-data)
* [QUERING DATA FROM A TABLE](#querying-data-from-a-table)
* [QUERING FROM MULTIPLE TABLES](#querying-from-multiple-tables)
* [SQL AGGREGATE FUNCTIONS](#sql-aggregate-functions)
* [SQL OPERATORS](#using-sql-operators)
* [SQL CONSTRAINTS](#using-sql-constraints)
* [MANAGING INDEXES](#managing-indexes)
* [MANAGING VIEWS](#managing-views)
* [MANAGING TRIGGERS](#managing-triggers)


## GENERAL COMMANDS
Show available Databases
```sql
SHOW databases;
```
Create Datbase
```sql
CREATE DATABASE <db_name>;
```
Select the database for use
```sql
USE <db_name>;
```
Delete database
```sql
DROP DATABASE <db_name>;
```
Show tables in the selected database
```sql
SHOW TABLES;
```
Display scheme of table in the current database
```sql
DESCRIBE <table_name>;
```
## MANAGING TABLES
Create a new table with three columns
```sql
CREATE TABLE t (
id INT PRIMARY KEY,
name VARCHAR NOT NULL,
price INT DEFAULT 0
);
```
Delete the table from the database
```sql
DROP TABLE t ;
```
Add a new column to the table
```sql
ALTER TABLE t ADD column;
```
Drop column c from the table  
```sql
ALTER TABLE t DROP COLUMN c ;
```
Add a constraint
```sql
ALTER TABLE t ADD constraint;
```
Drop a constraint
```sql
ALTER TABLE t DROP constraint;
```
Rename a table from t1 to t2
```sql
ALTER TABLE t RENAME TO t2;
```
Rename column c1 to c2
```sql
ALTER TABLE t1 RENAME c1 TO c2 ;
```
Remove all data in a table
```sql
TRUNCATE TABLE t;
```
## MODIFYING DATA
Insert one row into a table
```sql
INSERT INTO t(column_list)
VALUES(value_list);
```
Insert multiple rows into a table
```sql
INSERT INTO t(column_list)
VALUES (value_list),
(value_list), ….;
```
Insert rows from t2 into t1
```sql
INSERT INTO t1(column_list)
SELECT column_list
FROM t2;
```
Update new value in the column c1 for all rows
```sql
UPDATE t
SET c1 = new_value;
```
Update values in the column c1, c2 that match
the condition
```sql
UPDATE t
SET c1 = new_value,
c2 = new_value
WHERE condition;
```
Delete all data in a table
```sql
DELETE FROM t;
```
Delete subset of rows in a table
```sql
DELETE FROM t
WHERE condition;
```
## QUERYING DATA FROM A TABLE
Query data in columns c1, c2 from a table
```sql
SELECT c1, c2 FROM t;
```
Query all rows and columns from a table
```sql
SELECT * FROM t;
```
Query data and filter rows with a condition
```sql
SELECT c1, c2 FROM t
WHERE condition;
```
Query distinct rows from a table  
```sql
SELECT DISTINCT c1 FROM t
WHERE condition;
```
Sort the result setin ascending or descending order
```sql
SELECT c1, c2 FROM t
ORDER BY c1ASC [DESC];
```
Skip offsetof rows and return the next n rows
```sql
SELECT c1, c2 FROM t
ORDER BY c1
LIMIT nOFFSET offset;
```
Group rows using an aggregate function
```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1;
```
Filter groups using HAVING clause
```sql
SELECT c1, aggregate(c2)
FROM t
GROUP BY c1
HAVING condition;
```
## QUERYING FROM MULTIPLE TABLES
Inner join t1 and t2
```sql
SELECT c1, c2
FROM t1
INNER JOIN t2 ON condition;
```
Left join t1 and t1
```sql
SELECT c1, c2
FROM t1
LEFT JOIN t2 ON condition;
```
Right join t1 and t2
```sql
SELECT c1, c2
FROM t1
RIGHT JOIN t2 ON condition;
```
Perform full outer join
```sql
SELECT c1, c2
FROM t1
FULL OUTER JOIN t2 ON condition;
```
Produce a Cartesian product of rows in tables
```sql
SELECT c1, c2
FROM t1
CROSS JOIN t2;
```
Another way to perform cross join
```sql
SELECT c1, c2
FROM t1, t2;
```
Join t1 to itself using INNER JOIN clause
```sql
SELECT c1, c2
FROM t1 A
INNER JOIN t2 BON condition;
```

## SQL AGGREGATE FUNCTIONS

`AVG` returns the average of a list

`COUNT` returns the number of elements of a list

`SUM ` returns the total of a list

`MAX` returns the maximum value in a list

`MIN` creturns the minimum value in a list
## USING SQL OPERATORS
Combine rows from two queries
```sql
SELECT c1, c2 FROM t1
UNION [ALL]
SELECT c1, c2 FROM t2;
```
Return the intersection of two queries
```sql
SELECT c1, c2 FROM t1
INTERSECT
SELECT c1, c2 FROM t2;
```
Subtract a result set from another result set
```sql
SELECT c1, c2 FROM t1
MINUS
SELECTc1, c2 FROM t2;
```
Query rows using pattern matching %, _
```sql
SELECT c1, c2 FROM t1
WHERE c1[NOT] LIKE pattern; 
```
Query rows in a list
```sql
SELECT c1, c2 FROM t
WHERE c1 [NOT] IN value_list; 
```
Query rows between two values 
```sql
SELECT c1, c2 FROM t
WHERE c1 BETWEEN low AND high;
```
Check if values in a table is NULL or not
```sql
SELECT c1, c2 FROM t
WHERE c1 IS [NOT] NULL;
```
## USING SQL CONSTRAINTS
Set c1 and c2 as a primary key 
```sql
CREATE TABLE t(
c1 INT, c2 INT, c3 VARCHAR,
PRIMARY KEY (c1,c2)
);
```
Set c2 column as a foreign key
```sql
CREATE TABLE t1(
c1 INT PRIMARY KEY,
c2 INT,
FOREIGN KEY (c2) REFERENCES t2(c2)
);
```
Make the values in c1 and c2 unique
```sql
CREATE TABLE t(
c1 INT, c1 INT,
UNIQUE(c2,c3)
);
```
Ensure c1 > 0 and values in c1 >= c2
```sql
CREATE TABLE t(
c1 INT, c2 INT,
CHECK(c1> 0 AND c1 >= c2)
);
```
Set values in c2 column not NULL
```sql
CREATE TABLE t(
c1 INT PRIMARY KEY,
c2 VARCHAR NOT NULL
);
```
## MANAGING INDEXES
Create an index on c1 and c2 of the table t
```sql
CREATE INDEXidx_name
ONt(c1,c2);
```
Create a unique index on c3, c4 of the table t
```sql
CREATE UNIQUE INDEXidx_name
ONt(c3,c4);
```
Drop an index
```sql
DROP INDEX idx_name;
```
## MANAGING VIEWS
Createa new view that consists of c1 and c2
```sql
CREATE VIEW v(c1,c2)
AS
SELECT c1, c2
FROM t;
```
Create a new view with check option
```sql
CREATE VIEW v(c1,c2)
AS
SELECT c1, c2
FROM t;
WITH [CASCADED | LOCAL] CHECK OPTION;
```
Create a temporary view
```sql
CREATE TEMPORARYVIEW v
AS
SELECT c1, c2
FROM t;
```
Delete a view
```sql
DROP VIEW view_name;
```
## MANAGING TRIGGERS
Create ormodifya trigger
```sql
CREATE OR MODIFY TRIGGER trigger_name
WHEN EVENT
ON table_nameTRIGGER_TYPE
EXECUTE stored_procedure;
```
WHEN
1. BEFORE – invoke before the event occurs
2. AFTER – invoke after the event occurs

EVENT
1. INSERT –invoke for INSERT
2. UPDATE –invoke for UPDATE
3. DELETE –invoke for DELETE

TRIGGER_TYPE
1. FOR EACH ROW
2. FOR EACH STATEMENT

Create a trigger invoked before a new row is inserted into the person table
```sql
CREATE TRIGGER before_insert_person
BEFORE INSERT
ON person FOR EACH ROW
EXECUTE stored_procedure;
```
Delete a specific trigger
```sql
DROP TRIGGER trigger_name
```
## INTRODUCTION

## MySQL storage engines

* A storage engine is a software module that a database management system uses to create, read, update data from a database.
* There are two types of storage engines in MySQL: transactional and non-transactional.
* For MySQL 5.5 and later, the default storage engine is InnoDB

```sql
mysql> SHOW ENGINES\G
```
#### Finding version of MYSQL from client
```sql
SHOW VARIABLES LIKE "%version%";
```
### MySQL supported storage engines:

* [InnoDB](#innodb)
* [MyISAM](#myisam)
* [Memory](#memory)
* [CSV](#csv)
* [Merge](#merge)
* [Archive](#archive)
* [Federated](#federated)
* [Blackhole](#blackhole)


## Specifying and altering storage engines
```sql
CREATE TABLE Cars(Id INTEGER PRIMARY KEY, Name VARCHAR(50), 
-> Cost INTEGER) ENGINE='MyISAM';

SELECT ENGINE FROM information_schema.TABLES
-> WHERE TABLE_SCHEMA='mydb'
-> AND TABLE_NAME='Cars';

ALTER TABLE Cars ENGINE='MyISAM';
```
### InnoDB
InnoDB is the most widely used storage engine with transaction support. It is an ACID compliant storage engine. It supports row-level locking, crash recovery and multi-version concurrency control. It is the only engine which provides foreign key referential integrity constraint. Oracle recommends using InnoDB for tables except for specialized use cases.

### MYISAM
MyISAM is the original storage engine. It is a fast storage engine. It does not support transactions. MyISAM provides table-level locking. It is used mostly in Web and data warehousing.

### MEMORY
Memory storage engine creates tables in memory. It is the fastest engine. It provides table-level locking. It does not support transactions. Memory storage engine is ideal for creating temporary tables or quick lookups. The data is lost when the database is restarted.

### CSV
CSV stores data in CSV files. It provides great flexibility because data in this format is easily integrated into other applications.

### MERGE
Merge operates on underlying MyISAM tables. Merge tables help manage large volumes of data more easily. It logically groups a series of identical MyISAM tables, and references them as one object. Good for data warehousing environments.

### ARCHIVE
Archive storage engine is optimised for high speed inserting. It compresses data as it is inserted. It does not support transactions. It is ideal for storing and retrieving large amounts of seldom referenced historical, archived data.

### BLACKHOLE
The Blackhole storage engine accepts but does not store data. Retrievals always return an empty set. The functionality can be used in distributed database design where data is automatically replicated, but not stored locally. This storage engine can be used to perform performance tests or other testing.

### FEDERATED
Federated storage engine offers the ability to separate MySQL servers to create one logical database from many physical servers. Queries on the local server are automatically executed on the remote (federated) tables. No data is stored on the local tables. It is good for distributed environments.
