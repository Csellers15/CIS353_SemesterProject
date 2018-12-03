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
DROP TABLE sale CASCADE CONSTRAINTS;

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

ALTER TABLE employee ADD CONSTRAINT IC1 FOREIGN KEY (ssn) references customer(eSsn)
ALTER TABLE dealership ADD CONSTRAINT IC2 FOREIGN KEY (dId) references employee(dId)
ALTER TABLE dealership ADD CONSTRAINT IC3 FOREIGN KEY (dId) references vehicle(dId)
ALTER TABLE model ADD CONSTRAINT IC4 FOREIGN KEY (vin) references model(vin)

--No idea how to do the weak key ones, also dont know how to add the contact date to the IC betwen employee and customer

SET FEEDBACK OFF
-----------------------------------------------------------------------
-- Populate the Database (Keep the number of rows in each table small enough so that the results of your queries can be verified by hand.)
-----------------------------------------------------------------------
insert into employee values (123456789, 5438889543, 0.1, 20.1, 4);
insert into employee values (333445555, 5432341121, 0.08, 18.75, 3);
insert into employee values (999887777, 9893245555, 0.08, 18.75, 4);
insert into employee values (987654321, 9897340921, 0.04, 15.5, 2);
insert into employee values (666884444, 6772779889, 0.09, 19.5, 2);
insert into employee values (453453453, 6770012345, 0.15, 22.0, 2);
insert into employee values (987987987, 5439901234, 0.1, 20.1, 1);
insert into employee values (888665555, 8531928443, 0.07, 17.0, 1);
--
--
insert into customer values (759302988, 2695540094, 'Sally', 'sally94@hotmail.com', 999887777, '2018-01-05');
insert into customer values (637449923, 2698847293, 'John', 'john@gmail.com', 453453453, '2018-09-07');
insert into customer values (904092348, 2698750028, 'Michael', 'mik221@gmail.com', 999887777, '2018-11-23');
insert into customer values (783029485, 2319847398, 'Alice', 'allycat@live.com', 333445555, '2017-12-01');
insert into customer values (648201857, 2319587392, 'Liz', 'liz893@live.com', 888665555, '2017-08-22');
insert into customer values (098485737, 2340058390, 'Cooper', 'coop88@hotmail.com', 888665555, '2016-04-23');
insert into customer values (123123928, 6168932677, 'Diane', 'diane57@gmail.com', 666884444, '2017-05-05');
insert into customer values (756892434, 6165554345, 'Brandon', 'nodnarb@hotmail.com', 987654321, '2018-01-29');
--
--
insert into vehicle values (665, 200000, 'black', 1);
insert into vehicle values (434, 23000, 'black', 2);
insert into vehicle values (887, 45000, 'silver', 1);
insert into vehicle values (223, 30000, 'dark gray', 1);
insert into vehicle values (432, 20000, 'red', 3);
insert into vehicle values (987, 10000, 'red', 4);
insert into vehicle values (999, 35000, 'yellow', 4);
--
--
insert into model values ('Charger', 2018, 434);
insert into model values ('Evoque', 2017, 223);
insert into model values ('X Type', 2017, 432);
insert into model values ('Explorer', 2018, 999);
insert into model values ('Crossover', 2014, 999);
insert into model values ('Convertible', 1980, 887);
--
--
insert into dealership values (1, 'dealership 1', '44 northride ave', 77);
insert into dealership values (2, 'dealership 2', '686 cherry road', 256);
insert into dealership values (3, 'dealership 3', '70 fulton street ne', 30);
insert into dealership values (4, 'dealership 4', '900 broadway road', 62);
--
--
insert into dealerPhoneNum values (7568398273, 1);
insert into dealerPhoneNum values (9983229918, 2);
insert into dealerPhoneNum values (2332039987, 3);
insert into dealerPhoneNum values (5654573323, 4);
--
--
insert into sale values ();
insert into sale values ();
insert into sale values ();
insert into sale values ();
insert into sale values ();
insert into sale values ();







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
