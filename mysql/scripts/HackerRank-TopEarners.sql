-- https://www.hackerrank.com/challenges/earnings-of-employees
-- Easy 20

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee(
    employee_id     INTEGER         NOT NULL,
    name            VARCHAR(20)     NOT NULL,
    months          INTEGER         NOT NULL,
    salary          INTEGER         NOT NULL
);

INSERT INTO Employee 
VALUES 
    (12228, 'Rose',     15,   1968),
    (33645, 'Angela',   1,    3443),
    (45692, 'Frank',    17,   1608),
    (56118, 'Patrick',  15,   1345),
    (59725, 'Lisa',     11,   2330),
    (74197, 'Kimberly', 16,   4372),
    (78454, 'Bonnie',   8,    1771),
    (83565, 'Michael',  6,    2017),
    (98607, 'Todd',     5,    3396),
    (99989, 'Joe',      9,    3573);

-- This syntax is prohibited in HackerRank since it uses MySQL <8.0
WITH t AS (
  SELECT months*salary AS earnings, employee_id
  FROM Employee
)
SELECT earnings, Count(employee_id)
FROM t
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;

/*
SELECT earnings, Count(employee_id)
FROM (SELECT months*salary AS earnings, employee_id FROM Employee) AS t
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;
*/

/*
 +----------+--------------------+ 
 | earnings | Count(employee_id) |
 +----------+--------------------+
 |    69952 |                  1 |
 +----------+--------------------+
*/