SPOOL dealership-a.out
SET ECHO ON

/*
	SELF JOIN (2)
	Get pairs of employees with the same rates
*/
SELECT 	e1.ssn, e2.ssn, e1.rate
FROM	employee e1, employee e2
WHERE	e1.ssn <> e2.ssn AND e1.rate = e2.rate;

/*
	FOUR TABLE JOIN (1)
	Get pairs of employees with the same rates
*/
#	Enter code here
#	Enter code here
#	Enter code here

/*
	SUM/AVG/MAX/MIN CALCULATIONS (4)
	Get AVG, MIN, and MAX rates for employees
	at each department
*/
SELECT 		D.dId, AVG(E.rate), MIN(E.rate), MAX(E.rate)
FROM		employee E, department D
WHERE		E.dId = D.dId
GROUP BY	D.dId;


/*
	GROUP BY (5)
	Get the average cost of a vehicle based on its
	model year, considering model years 2010+
*/
SELECT 		M.year, AVG(V.cost)
FROM		vehicle V, model M
WHERE		V.vin = M.vin
GROUP BY	M.year
HAVING		M.year > 2010
ORDER BY	M.year

/*
	RELATIONAL DIVISION / SET MINUS (3, 8)
	For every employee who works on every project that is located in 
	Stafford: Find the ssn and lname. Sort the results by lname

	TODO: 	This needs to be reworked to fit the dealership. Not sure how
			this one can be done.
*/
/*
SELECT		E.ssn, E.lname 
FROM		employee E
WHERE		NOT EXISTS(
		(SELECT  P.pnumber 
		FROM project P
		WHERE P.plocation = 'Stafford')
		MINUS
		(SELECT	P.pnumber
		FROM	works_on W, project P 
		WHERE	W.essn = E.ssn  AND 
				W.pno = P.pnumber  AND 
				P.plocation = 'Stafford')
);
*/

/*
	CORRELATED SUBQUERY (6)
	For every employee who has the highest rate 
	in his dealership: Find the dId, ssn, and 
	rate. Sort the results by dealership number.
*/
SELECT		E.dId, E.ssn, E.rate
FROM		dealership D, employee E
WHERE		E.rate = 
			(
				SELECT 		MAX(E2.rate)
				FROM 		employee E2
				WHERE		E2.dId = D.dId
			)
ORDER BY 	D.dId;


/*
	NON-CORRELATED SUBQUERY (7)
	For every employee who has not sold any vehicle
	that is blue: Find the ssn and dId. 
	Sort the results by dId
*/
/*
SELECT		E.ssn, E.dId
FROM		employee E
WHERE		NOT E.ssn IN (
	# TODO: we need to edit this to fit the dealership, after we get the
	#		sale table figured out better. It should be something like:
	#		SELECT		S.essn
	#		FROM		sale S, employee E, vehicle V
	#		WHERE		S.vin = V.vin AND V.color = 'blue' AND S.essn = E.ssn
				SELECT 		W.essn
				FROM 		works_on W, project P
				WHERE		P.plocation = 'Houston' AND p.pnumber = W.pno
			)
ORDER BY 	E.dId;
*/

/*
	RANK QUERY (10)
	Find the rank of $18.75 in the employee's rates
*/
SELECT RANK(18.75) WITHIN GROUP
	(ORDER BY rate ASC) "Rank of 18.75"
	FROM employee;


/* TOP-N QUERY (11)
For every employee whose rate is equal to 
one of the two lowest rates, Find the ssn, 
rate, and dId.
*/
SELECT 	E.ssn, E.rate, E.dId
FROM 	(
	SELECT 	rate
	FROM 	(
		SELECT 	rate
		FROM 	employee
		GROUP BY rate
		ORDER BY rate ASC
	)
	WHERE ROWNUM <= 2
) X, employee E
WHERE 	E.rate = X.rate;


SET ECHO OFF
SPOOL OFF
