/*
CIS 353 - Database Design Project.

Authors:
  - Cole Sellers.
  - Lauren Defrancesco.
  - Hai Duong.
  - Eli Anderson.
*/

SPOOL project.out
SET ECHO ON

-----------------------------------------------------------------------
-- Drop the tables (in case they already exist)
-----------------------------------------------------------------------
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE vehicle CASCADE CONSTRAINTS;
DROP TABLE model CASCADE CONSTRAINTS;
DROP TABLE dealership CASCADE CONSTRAINTS;
DROP TABLE dealerPhoneNum CASCADE CONSTRAINTS;

-----------------------------------------------------------------------
-- CREATING THE TABLES  (Still need to add the changes prof made)
-- --------------------------------------------------------------------
CREATE TABLE  employee
(
ssn         INTEGER PRIMARY KEY NOT NULL,
phoneNum    VARCHAR(12), 
commish     FLOAT,
rate        FLOAT,
dId         INTEGER
);

CREATE TABLE  customer
(
ssn         INTEGER PRIMARY KEY NOT NULL,
PhoneNum    VARCHAR(12), 
name        CHAR(20),
email       VARCHAR(320),
eSsn        INTEGER,
contactDate  DATE 
);

CREATE TABLE  vehicle
(
vin         INTEGER PRIMARY KEY NOT NULL,
cost        INTEGER, 
color       CHAR(15),
dId         INTEGER,
rId         INTEGER
);

CREATE TABLE model 
(
name        CHAR(20) NOT NULL,
year        INTEGER NOT NULL,
vin         INTEGER,
PRIMARY KEY (name, year)
);

CREATE TABLE dealership 
(
dId         INTEGER PRIMARY KEY NOT NULL,
name        VARCHAR(20),
address     VARCHAR(100),
vin         INTEGER
);

CREATE TABLE dealerPhoneNum 
(
phoneNum     VARCHAR(12) NOT NULL,
dId          INTEGER NOT NULL,
PRIMARY KEY(phoneNum, dId)
);

CREATE TABLE sale 
(
  purchaseDate DATE NOT NULL,
  regPrice     INTEGER,
  salePrice    INTEGER 
);

-----------------------------------------------------------------------
-- Add Forign Keys (In the DDL, every IC must have a unique name; e.g. IC5, IC10, IC15, etc.)
----------------------------------------------------------------------
 

SET FEEDBACK OFF
-----------------------------------------------------------------------
-- Populate the Database (Keep the number of rows in each table small enough so that the results of your queries can be verified by hand.)
-----------------------------------------------------------------------


SET FEEDBACK ON
COMMIT;
-----------------------------------------------------------------------
-- < One query (per table) of the form: SELECT * FROM table; in order to print out your database >
-- < The SQL queries>. Include the following for each query:
--    1. A comment line stating the query number and the feature(s) it demonstrates (e.g. – Q25 –     correlated subquery).
--    2. A comment line stating the query in English.
--    3. The SQL code for the query.
-----------------------------------------------------------------------




COMMIT;
  
SPOOL OFF

