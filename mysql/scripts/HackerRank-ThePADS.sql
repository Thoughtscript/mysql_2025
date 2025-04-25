-- https://www.hackerrank.com/challenges/the-pads
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

SELECT 
    CASE
        WHEN occupation = "Doctor" THEN CONCAT(name,"(D)")
        WHEN occupation = "Professor" THEN CONCAT(name,"(P)")
        WHEN occupation = "Singer" THEN CONCAT(name,"(S)")
        WHEN occupation = "Actor" THEN CONCAT(name,"(A)")
    END
FROM Occupations
ORDER BY name ASC;

SELECT 
    CASE
        WHEN occupation = "Doctor" THEN CONCAT("There are a total of ", COUNT(occupation), " doctors.")
        WHEN occupation = "Singer" THEN CONCAT("There are a total of ", COUNT(occupation), " singers.")
        WHEN occupation = "Professor" THEN CONCAT("There are a total of ", COUNT(occupation), " professors.")
        WHEN occupation = "Actor" THEN CONCAT("There are a total of ", COUNT(occupation), " actors.")
    END
FROM Occupations
GROUP BY occupation
ORDER BY COUNT(occupation) ASC;

/*
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Ashely(P)                                                                                                                                                                                                                                                  |
| Christeen(P)                                                                                                                                                                                                                                               |
| Jane(A)                                                                                                                                                                                                                                                    |
| Jenny(D)                                                                                                                                                                                                                                                   |
| Julia(A)                                                                                                                                                                                                                                                   |
| Ketty(P)                                                                                                                                                                                                                                                   |
| Maria(A)                                                                                                                                                                                                                                                   |
| Meera(S)                                                                                                                                                                                                                                                   |
| Priya(S)                                                                                                                                                                                                                                                   |
| Samantha(D)                                                                                                                                                                                                                                                |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| There are a total of 2 doctors.                                                                                                                                                                                                                                 |
| There are a total of 2 singers.                                                                                                                                                                                                                                 |
| There are a total of 3 actors.                                                                                                                                                                                                                                  |
| There are a total of 3 professors.                                                                                                                                                                                                                              |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
*/