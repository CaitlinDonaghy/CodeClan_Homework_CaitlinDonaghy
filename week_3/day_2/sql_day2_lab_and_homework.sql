--MVP

-- Q1
-- (a). Find the first name, last name and team name of employees who are members of teams.

SELECT 
	e.first_name,
	e.last_name,
	t.name
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id;


-- (b). Find the first name, last name and team name of employees who are members of 
--      teams and are enrolled in the pension scheme.

SELECT 
	e.first_name,
	e.last_name,
	t.name
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id
WHERE e.pension_enrol = TRUE;


-- (c). Find the first name, last name and team name of employees who are members of teams, 
--      where their team has a charge cost greater than 80.

SELECT 
	e.first_name,
	e.last_name,
	t.name,
	t.charge_cost
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id
WHERE CAST(t.charge_cost AS int) > 80;

SELECT *
FROM teams

-- Q2
-- (a). Get a table of all employees details, together with their local_account_no and local_sort_code, if they have them.

SELECT e.*,
	pd.local_account_no,
	pd.local_sort_code
FROM employees AS e LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id;


-- (b). Amend your query above to also return the name of the team that each employee belongs to.

SELECT e.*,
	pd.local_account_no,
	pd.local_sort_code,
	t.name
FROM
	(employees AS e LEFT JOIN pay_details AS pd
	ON e.pay_detail_id = pd.id)
	RIGHT JOIN teams AS t
	ON e.team_id = t.id;


-- Q3
-- (a). Make a table, which has each employee id along with the team that employee belongs to.

SELECT 
	e.id,
	t.name
FROM
	employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id
	

-- b). Breakdown the number of employees in each of the teams	
	
SELECT 
    count(e.id),
	t.name
FROM
	employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id
GROUP BY t.name;	


-- (c). Order the table above by so that the teams with the least employees come first.

SELECT 
    count(e.id),
	t.name
FROM
	employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id
GROUP BY t.name
ORDER BY count asc;	


-- Q4
-- (a). Create a table with the team id, team name and the count of the number of employees in each team.

SELECT
	 count(e.id),
	t.name,
	t.id
FROM
	(employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id)
GROUP BY t.id
ORDER BY count asc;	


-- b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by 
--     the number of employees in the team. Calculate the total_day_charge for each team.

SELECT 
	CAST(count(e.id) AS int) * CAST(t.charge_cost AS int) AS total_day_charge,
	t.name
FROM
	(employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id)
GROUP BY t.id;	


-- (c). How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?

--SELECT  
	--t.name,
	--count(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
--FROM
  -- employees AS e INNER JOIN teams AS t
	--ON e.team_id = t.id
--GROUP BY t.id
--WHERE total_day_charge > 5000   -- didnt work as I used WHERE instead of HAVING

SELECT  
	t.name,
	count(e.id) * CAST(t.charge_cost AS INT) AS total_day_charge
FROM
   employees AS e INNER JOIN teams AS t
	ON e.team_id = t.id
GROUP BY t.id
HAVING count(e.id) * CAST(t.charge_cost AS INT) > 5000


-- Q5
-- How many of the employees serve on one or more committees?

SELECT 
	count (*) AS employees_on_multiple_comittees 
FROM (SELECT DISTINCT employee_id FROM employees_comittees;	
