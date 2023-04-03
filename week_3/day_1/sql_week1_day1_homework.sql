/* MVP */
/* Q1 */

SELECT *
FROM employees
WHERE department = 'Human Resources';


/* Q2 */

SELECT
	first_name,
	last_name,
	country
FROM employees
WHERE department = 'Legal';


/* Q3 */

SELECT *
FROM employees
WHERE country = 'Portugal';
-- 29 employees


/* Q4 */

SELECT *
FROM employees
WHERE country IN ('Portugal', 'Spain');
-- 35 employees


/* Q5 */

SELECT *
FROM pay_details
WHERE local_account_no IS NULL;
-- 25 pay_details records without a local_account_no


/* Q6 */

SELECT *
FROM pay_details
WHERE 
	local_account_no IS NULL AND 
	iban IS NULL; 
-- No, there are no pay_details records missing both a local_account_no and an iban


/* Q7 */

SELECT 
	first_name,
	last_name
FROM employees
ORDER BY last_name ASC NULLS LAST;


/* Q8 */

SELECT 
	first_name,
	last_name,
	country
FROM employees
ORDER BY country ASC,
	last_name ASC NULLS LAST;


/* Q9 */

SELECT *
FROM employees
ORDER BY salary DESC NULLS LAST 
LIMIT 10;


/* Q10 */

SELECT
	first_name,
	last_name,
	salary
FROM employees
WHERE country = 'Hungary'
ORDER BY salary ASC
LIMIT 1;


/* Q11 */

SELECT *
FROM employees
WHERE first_name LIKE 'F%';
-- 30 employees with first_name beginning with F


/* Q12 */

SELECT *
FROM employees
WHERE email LIKE '%yahoo%';


/* Q13 */

SELECT *
FROM employees
WHERE pension_enrol IS TRUE 
AND country NOT IN ('France', 'Germany');


/* Q14 */

SELECT
	MAX (salary) AS max_engineering_sal
FROM employees
WHERE department = 'Engineering'
AND fte_hours = 1;
-- 83,370


/* Q15 */

SELECT
	first_name,
	last_name,
	fte_hours,
	salary,
	fte_hours * salary AS effective_yearly_salary
FROM employees;


/* Extension */
/* Q16 */

SELECT 
	first_name,
	last_name,
	department,
	concat(first_name, '-', last_name, '-', department) AS badge_label
FROM employees
WHERE first_name IS NOT NULL AND 
	last_name IS NOT NULL AND 
	department IS NOT NULL;


/* Q17 */

SELECT 
	first_name,
	last_name,
	department,
	concat(first_name, '-', last_name, '-', department, '-(joined ', start_date, ')' ) AS badge_label
FROM employees
WHERE first_name IS NOT NULL AND 
	last_name IS NOT NULL AND 
	department IS NOT NULL AND
	start_date IS NOT NULL;

-- I'm not sure how to drop and reorder parts of the timestamp


/* Q18 */

SELECT 
	first_name,
	last_name,
	salary,
CASE
	WHEN salary < 40000 THEN 'low'
	WHEN salary > 40000 THEN 'high'
	WHEN salary IS NULL THEN 'no salary information'
END AS salary_class
FROM employees

