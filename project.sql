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
ssn         INTEGER     PRIMARY KEY NOT NULL,
phoneNum    VARCHAR(12),
commish     FLOAT,
rate        FLOAT                   NOT NULL,
dId         INTEGER                 NOT NULL
);

CREATE TABLE  customer
(
ssn           INTEGER     PRIMARY KEY NOT NULL,
phoneNum      VARCHAR(12),
name          CHAR(20)                NOT NULL,
email         VARCHAR(320),
eSsn          INTEGER                 NOT NULL,nstraint (SELLERSC.SYS_C00657293) violat
contactDate   DATE                    NOT NULL
);

CREATE TABLE  vehicle
(
vin         INTEGER PRIMARY KEY NOT NULL,
cost        INTEGER             NOT NULL,
color       CHAR(15)            NOT NULL,
dId         INTEGER             NOT NULL,
mNum        INTEGER             NOT NULL
);

CREATE TABLE model
(
mNum        INTEGER PRIMARY KEY  NOT NULL,nstraint (SELLERSC.SYS_C00657293) violat
name        CHAR(20)             NOT NULL,nstraint (SELLERSC.SYS_C00657293) violat
year        INTEGER              NOT NULL
);

CREATE TABLE dealership
(
id         INTEGER        PRIMARY KEY    NOT NULL,
name       VARCHAR(20)                   NOT NULL, 
address    VARCHAR(100)                  NOT NULL
);
nstraint (SELLERSC.SYS_C00657293) violat
nstraint (SELLERSC.SYS_C00657293) violat
nstraint (SELLERSC.SYS_C00657293) violat
nstraint (SELLERSC.SYS_C00657293) violat
nstraint (SELLERSC.SYS_C00657293) violat
nstraint (SELLERSC.SYS_C00657293) violat
);

CREATE TABLE sale
(
  cSsn      INTEGER   NOT NULL,
  eSsn      INTEGER   NOT NULL,
  vin       INTEGER   NOT NULL,
  saleDate  DATE      NOT NULL,
  PRIMARY KEY(cSsn,eSsn,vin,saleDate)
);

-----------------------------------------------------------------------
-- Add Forign Keys (In the DDL, every IC must have a unique name; e.g. IC5, IC10, IC15, etc.)
----------------------------------------------------------------------

--Foreign keys--
ALTER TABLE customer ADD CONSTRAINT IC1_fk FOREIGN KEY (eSsn) REFERENCES employee(ssn);
ALTER TABLE employee ADD CONSTRAINT IC2_fk FOREIGN KEY (dId) REFERENCES dealership(id);
ALTER TABLE vehicle ADD CONSTRAINT IC3_fk FOREIGN KEY (dId) REFERENCES dealership(id);
ALTER TABLE vehicle ADD CONSTRAINT IC4_fk FOREIGN KEY (mNum) REFERENCES model(mNum);
ALTER TABLE sale ADD CONSTRAINT IC5_fk FOREIGN KEY(vin) REFERENCES vehicle(vin);
ALTER TABLE sale ADD CONSTRAINT IC6_fk FOREIGN KEY (cSsn) REFERENCES customer(ssn);
ALTER TABLE sale ADD CONSTRAINT IC7_fk FOREIGN KEY (eSsn) REFERENCES employee(ssn);
ALTER TABLE dealerPhoneNum ADD CONSTRAINT IC8_fk FOREIGN KEY (dId) REFERENCES dealership(id);

--add insert constaints--
ALTER TABLE employee ADD CONSTRAINT IC9_ddl CHECK(phoneNum not like '%[^0-9]%');
ALTER TABLE employee ADD CONSTRAINT IC10_ddl CHECK(commish >= 0  AND commish <= 100);
ALTER TABLE employee ADD CONSTRAINT IC11_ddl CHECK(rate > 0);
ALTER TABLE customer ADD CONSTRAINT IC12_ddl CHECK(phoneNum not like '%[^0-9]%');
ALTER TABLE customer ADD CONSTRAINT IC13_ddl CHECK (email LIKE '%@%');
ALTER TABLE vehicle ADD CONSTRAINT IC14_ddl CHECK (cost > 0);
ALTER TABLE dealerPhoneNum ADD CONSTRAINT IC15_ddl CHECK (phoneNum not like '%[^0-9]%');
ALTER TABLE employee ADD CONSTRAINT IC16_ddl CHECK( NOT(rate > 20.0 AND commish >= 0.1));


SET FEEDBACK OFF
-----------------------------------------------------------------------
-- Populate the Database (Keep the number of rows in each table small enough so that the results of your queries can be verified by hand.)
-----------------------------------------------------------------------
-- --
-- --
insert into dealership values (1, 'dealership 1', '44 northride ave');
insert into dealership values (2, 'dealership 2', '686 cherry road');
insert into dealership values (3, 'dealership 3', '70 fulton street ne');
insert into dealership values (4, 'dealership 4', '900 broadway road');
-- --
-- --
insert into model values (1, 'Charger', 2018);
insert into model values (2, 'Evoque', 2017);
insert into model values (3, 'X Type', 2017);
insert into model values (4, 'Explorer', 2018);
insert into model values (5, 'Crossover', 2014);
insert into model values (6, 'Convertible', 1980);
-- --
-- --
insert into vehicle values (665, 200000, 'black', 1, 1);
insert into vehicle values (434, 23000, 'black', 2, 3);
insert into vehicle values (887, 45000, 'silver', 1, 6);
insert into vehicle values (223, 30000, 'dark gray', 1, 2);
insert into vehicle values (432, 20000, 'red', 3, 4);
insert into vehicle values (987, 10000, 'red', 4, 5);
insert into vehicle values (999, 35000, 'yellow', 4, 3);
-- --
-- --
insert into employee values (123456789, 5438889543, 0.03, 20.1, 4);
insert into employee values (333445555, 5432341121, 0.08, 18.75, 3);
insert into employee values (999887777, 9893245555, 0.08, 18.75, 4);
insert into employee values (987654321, 9897340921, 0.04, 15.5, 2);
insert into employee values (666884444, 6772779889, 0.09, 19.5, 2);
insert into employee values (453453453, 6770012345, 0.01, 22.0, 2);
insert into employee values (987987987, 5439901234, 0.08, 20.1, 1);
insert into employee values (888665555, 853928443, 0.07, 17.0, 1);
-- --
-- --
insert into customer values (759302988, 2695540094, 'Sally', 'sally94@hotmail.com', 999887777, TO_DATE('05-01-2018', 'DD/MM/YYYY'));
insert into customer values (637449923, 2698847293, 'John', 'john@gmail.com', 453453453, TO_DATE('23-04-2018', 'DD/MM/YYYY'));
insert into customer values (904092348, 2698750028, 'Michael', 'mik221@gmail.com', 999887777, TO_DATE('12-09-2016', 'DD/MM/YYYY'));
insert into customer values (783029485, 2319847398, 'Alice', 'allycat@live.com', 333445555, TO_DATE('24-07-2017', 'DD/MM/YYYY'));
insert into customer values (648201857, 2319587392, 'Liz', 'liz893@live.com', 888665555, TO_DATE('23-01-2010', 'DD/MM/YYYY'));
insert into customer values (098485737, 2340058390, 'Cooper', 'coop88@hotmail.com', 888665555, TO_DATE('01-01-2004', 'DD/MM/YYYY'));
insert into customer values (123123928, 6168932677, 'Diane', 'diane57@gmail.com', 666884444, TO_DATE('04-07-2009', 'DD/MM/YYYY'));
insert into customer values (756892434, 6165554345, 'Brandon', 'nodnarb@hotmail.com', 987654321, TO_DATE('05-12-2018', 'DD/MM/YYYY'));
--
--
insert into dealerPhoneNum values (7568398273, 1);
insert into dealerPhoneNum values (9983229918, 2);
insert into dealerPhoneNum values (2332039987, 3);
insert into dealerPhoneNum values (5654573323, 4);
--
--
insert into sale values (759302988,123456789,665,TO_DATE('20-01-2018', 'DD/MM/YYYY'));
insert into sale values (904092348,987654321,434,TO_DATE('12-05-2017', 'DD/MM/YYYY'));
insert into sale values (756892434,123456789,887,TO_DATE('01-03-2016', 'DD/MM/YYYY'));
insert into sale values (648201857,987987987,223,TO_DATE('30-10-2017', 'DD/MM/YYYY'));
insert into sale values (123123928,888665555,432,TO_DATE('17-11-2018', 'DD/MM/YYYY'));
insert into sale values (637449923,333445555,987,TO_DATE('07-03-2018', 'DD/MM/YYYY'));

----------------------------------------------------------------------
-- Testing integrity Constraints 
----------------------------------------------------------------------

--Testing <IC16_ddl> Two Attributes, One Row
insert into employee values (111111111, 123456767, 0.2, 21.0, 1);

--Testing < > key on Dealership
insert into dealership values( NULL , 'dealership 1', '44 northride ave');

--Testing < > Foreign Key on employee and dealership
insert into dealership values( 5 , 'dealership 1', '44 northride ave');
insert into dealership values( 6 , 'dealership 1', '44 northride ave');
insert into employee values(22222222, 5438889543, 0.03, 20.1, 5);
insert into employee values(22222222, 5438889543, 0.03, 20.1, 6);

--Testing <IC14_ddl> Cost of a vehicle cannot be < 0.
insert into vehicle values (665, -200, 'black', 1, 1);

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
