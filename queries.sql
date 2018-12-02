/*
	Self-Join
	Get pairs of employees with the same rates
*/
SELECT 	e1.ssn, e2.ssn, e1.rate
FROM	employee e1, employee e2
WHERE	e1.ssn <> e2.ssn AND e1.rate = e2.rate;

/*
	Four-table join
	Get pairs of employees with the same rates
*/
#	Enter code here
#	Enter code here
#	Enter code here

/*
	Get AVG, MIN, and MAX rates for employees
	at each department
*/
SELECT 		D.dId, AVG(E.rate), MIN(E.rate), MAX(E.rate)
FROM		employee E, department D
WHERE		E.dId = D.dId
GROUP BY	D.dId;


/*
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
	For every employee who works on every project that is located in 
	Stafford: Find the ssn and lname. Sort the results by lname
*/
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

