-- https://www.hackerrank.com/challenges/what-type-of-triangle
-- Easy 20

DROP TABLE IF EXISTS Triangles;

CREATE TABLE Triangles(
    A  INTEGER NOT NULL,
    B  INTEGER NOT NULL,
    C  INTEGER NOT NULL
);

INSERT INTO Triangles 
VALUES 
    (20, 20, 23),
    (20, 20, 20),
    (20, 21, 22),
    (13, 14, 30);

SELECT
    CASE
        WHEN A = B AND B = C THEN "Equilateral"
        WHEN A + B < C + 1 THEN "Not A Triangle"
        WHEN A + C < B + 1 THEN "Not A Triangle"
        WHEN B + C < A +1 THEN "Not A Triangle"
        WHEN A = B THEN "Isosceles"
        WHEN B = C THEN "Isosceles"
        WHEN C = A THEN "Isosceles"
        ELSE "Scalene"
    END
FROM Triangles;

/*
 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
 | Isosceles                                                                                                                                                                                                                                                       |
 | Equilateral                                                                                                                                                                                                                                                     |
 | Scalene                                                                                                                                                                                                                                                         |
 | Not A Triangle                                                                                                                                                                                                                                                  |
 +-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
*/