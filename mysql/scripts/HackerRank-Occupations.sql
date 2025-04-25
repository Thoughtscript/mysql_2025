-- https://www.hackerrank.com/challenges/occupations
-- Medium 30

DROP TABLE IF EXISTS Occupations;

CREATE TABLE Occupations(
    name        VARCHAR(20) NOT NULL,
    occupation  VARCHAR(20) NOT NULL
);

INSERT INTO Occupations 
VALUES 
    ('Samantha', 'Doctor'),
    ('Julia', 'Actor'),
    ('Maria', 'Actor'),
    ('Meera', 'Singer'),
    ('Ashely', 'Professor'),
    ('Ketty', 'Professor'),
    ('Christeen', 'Professor'),
    ('Jane', 'Actor'),
    ('Jenny', 'Doctor'),
    ('Priya', 'Singer');

-- Had to seek outside info on this: https://stackoverflow.com/questions/64452162/pivot-table-in-alphabetical-order
-- First part: pivot table using CASE WHEN THEN
SELECT 
    min(CASE WHEN t.occupation = "Doctor" THEN t.name ELSE NULL END) AS Doctor,
    min(CASE WHEN t.occupation = "Professor" THEN t.name ELSE NULL END) AS Professor,
    min(CASE WHEN t.occupation = "Singer" THEN t.name ELSE NULL END) AS Singer,
    min(CASE WHEN t.occupation = "Actor" THEN t.name ELSE NULL END) AS Actor

-- Second part: requires a window function to sort
FROM (
    SELECT 
        *,
        (ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name ASC)) AS rn
    FROM Occupations
) AS t

-- Third part: requires an aggregate function to support group by and correct sorting
GROUP BY t.rn;

/*
 +----------+-----------+--------+-------+
 | Doctor   | Professor | Singer | Actor |
 +----------+-----------+--------+-------+
 | Jenny    | Ashely    | Meera  | Jane  |
 | Samantha | Christeen | Priya  | Julia |
 | NULL     | Ketty     | NULL   | Maria |
 +----------+-----------+--------+-------+
*/