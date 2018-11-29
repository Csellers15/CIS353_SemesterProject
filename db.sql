/*
Author: Cole, Eli, Hai, Lauren
CREDITS: 
*/

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
ssn         INTEGER PRIMARY KEY,
phoneNum    VARCHAR(12), 
commish     FLOAT,
rate        FLOAT,
dId         INTEGER
);

CREATE TABLE  customer
(
ssn         INTEGER PRIMARY KEY,
PhoneNum    VARCHAR(12), 
name        CHAR(20),
email       VARCHAR(320),
eSsn        INTEGER,
contactDate  DATE 
);

CREATE TABLE  vehicle
(
vin         INTEGER PRIMARY KEY,
cost        INTEGER, 
color       CHAR(15),
dId         INTEGER
rId         INTEGER

);

CREATE TABLE model 
(
name        CHAR(20),
year        INTEGER,
vin         INTEGER
PRIMARY KEY (name, year)
);

CREATE TABLE dealership 
(
dId         INTEGER PRIMARY KEY,
name        VARCHAR(20),
address     VARCHAR(100),
vin         INTEGER
);

CREATE TABLE dealerPhoneNum 
(
phoneNum     VARCHAR(12),
dId          INTEGER
PRIMARY KEY(phoneNum, dId)
);


-----------------------------------------------------------------------
-- Add Forign Keys
----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Populate the Database
-----------------------------------------------------------------------

-- Now, if no violations were detected, COMMIT all the commands in this file
COMMIT;