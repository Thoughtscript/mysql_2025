-- https://www.hackerrank.com/challenges/the-company
-- Medium 30

DROP TABLE IF EXISTS Company;

CREATE TABLE Company(
    company_code        VARCHAR(20) NOT NULL,
    founder             VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS Lead_Manager;

CREATE TABLE Lead_Manager(
    lead_manager_code        VARCHAR(20) NOT NULL,
    company_code             VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS Senior_Manager;

CREATE TABLE Senior_Manager(
    senior_manager_code      VARCHAR(20) NOT NULL,
    lead_manager_code        VARCHAR(20) NOT NULL,
    company_code             VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS Manager;

CREATE TABLE Manager(
    manager_code             VARCHAR(20) NOT NULL,
    senior_manager_code      VARCHAR(20) NOT NULL,
    lead_manager_code        VARCHAR(20) NOT NULL,
    company_code             VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee(
    employee_code            VARCHAR(20) NOT NULL,
    manager_code             VARCHAR(20) NOT NULL,
    senior_manager_code      VARCHAR(20) NOT NULL,
    lead_manager_code        VARCHAR(20) NOT NULL,
    company_code             VARCHAR(20) NOT NULL
);

INSERT INTO Company 
VALUES 
    ('C1', 'Monika'),
    ('C2', 'Samantha');

INSERT INTO Lead_Manager 
VALUES 
    ('LM1', 'C1'),
    ('LM2', 'C2');

INSERT INTO Senior_Manager 
VALUES 
    ('SM1', 'LM1', 'C1'),
    ('SM2', 'LM1', 'C1'),
    ('SM3', 'LM2', 'C2');

INSERT INTO Manager 
VALUES 
    ('M1', 'SM1', 'LM1', 'C1'),
    ('M2', 'SM3', 'LM2', 'C2'),
    ('M3', 'SM3', 'LM2', 'C2');

INSERT INTO Employee 
VALUES 
    ('E1', 'M1', 'SM1', 'LM1', 'C1'),
    ('E2', 'M1', 'SM1', 'LM1', 'C1'),
    ('E3', 'M2', 'SM3', 'LM2', 'C2'),
    ('E4', 'M3', 'SM3', 'LM2', 'C2');

-- Faster
SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT e.lead_manager_code),
    COUNT(DISTINCT e.senior_manager_code),
    COUNT(DISTINCT e.manager_code),
    COUNT(DISTINCT e.employee_code)
    
FROM 
    Company AS c 
   
    INNER JOIN Employee AS e 
    ON e.company_code = c.company_code

GROUP BY c.company_code, 
    c.founder

ORDER BY c.company_code ASC;

/*
+--------------+----------+-------------------------------------+---------------------------------------+--------------------------------+---------------------------------+
| company_code | founder  | COUNT(DISTINCT e.lead_manager_code) | COUNT(DISTINCT e.senior_manager_code) | COUNT(DISTINCT e.manager_code) | COUNT(DISTINCT e.employee_code) |
+--------------+----------+-------------------------------------+---------------------------------------+--------------------------------+---------------------------------+
| C1           | Monika   |                                   1 |                                     1 |                              1 |                               2 |
| C2           | Samantha |                                   1 |                                     1 |                              2 |                               2 |
+--------------+----------+-------------------------------------+---------------------------------------+--------------------------------+---------------------------------+
*/

-- Less Optimal
SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
    
FROM 
    Company AS c 

    INNER JOIN Lead_Manager AS lm 
    ON lm.company_code = c.company_code
    
    INNER JOIN Senior_Manager AS sm 
    ON sm.company_code = c.company_code
    AND sm.lead_manager_code = lm.lead_manager_code
    
    INNER JOIN Manager AS m 
    ON m.company_code = c.company_code
    AND m.senior_manager_code = sm.senior_manager_code
    
    INNER JOIN Employee AS e 
    ON e.company_code = c.company_code
    AND m.manager_code = m.manager_code

GROUP BY c.company_code, 
    c.founder, 
    lm.lead_manager_code

ORDER BY c.company_code ASC;

/*
+--------------+----------+--------------------------------------+----------------------------------------+--------------------------------+---------------------------------+
| company_code | founder  | COUNT(DISTINCT lm.lead_manager_code) | COUNT(DISTINCT sm.senior_manager_code) | COUNT(DISTINCT m.manager_code) | COUNT(DISTINCT e.employee_code) |
+--------------+----------+--------------------------------------+----------------------------------------+--------------------------------+---------------------------------+
| C1           | Monika   |                                    1 |                                      1 |                              1 |                               2 |
| C2           | Samantha |                                    1 |                                      1 |                              2 |                               2 |
+--------------+----------+--------------------------------------+----------------------------------------+--------------------------------+---------------------------------+
*/