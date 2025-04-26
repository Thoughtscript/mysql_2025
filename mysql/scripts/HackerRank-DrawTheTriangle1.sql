-- https://www.hackerrank.com/challenges/draw-the-triangle-1
-- Easy: 25

/*
SELECT '* * * * * * * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * * *';
SELECT '* * * * * * * * * * * *';
SELECT '* * * * * * * * * * *';
SELECT '* * * * * * * * * *';
SELECT '* * * * * * * * *';
SELECT '* * * * * * * *';
SELECT '* * * * * * *';
SELECT '* * * * * *';
SELECT '* * * * *';
SELECT '* * * *';
SELECT '* * *';
SELECT '* *';
SELECT '*';
*/

/*
SELECT REPEAT("* ", 20);
SELECT REPEAT("* ", 19);
SELECT REPEAT("* ", 18);
SELECT REPEAT("* ", 17);
SELECT REPEAT("* ", 16);
SELECT REPEAT("* ", 15);
SELECT REPEAT("* ", 14);
SELECT REPEAT("* ", 13);
SELECT REPEAT("* ", 12);
SELECT REPEAT("* ", 11);
SELECT REPEAT("* ", 10);
SELECT REPEAT("* ", 9);
SELECT REPEAT("* ", 8);
SELECT REPEAT("* ", 7);
SELECT REPEAT("* ", 6);
SELECT REPEAT("* ", 5);
SELECT REPEAT("* ", 4);
SELECT REPEAT("* ", 3);
SELECT REPEAT("* ", 2);
SELECT REPEAT("*", 1);
*/

-- Learned about this (as a way of simplifying the above)

-- Modification of example: https://dev.mysql.com/doc/refman/8.4/en/with.html
WITH RECURSIVE p_tri (n) AS
(
  SELECT 20 
  UNION ALL 
  SELECT n - 1 FROM p_tri WHERE n > 1
)

SELECT REPEAT("* ", n) FROM p_tri;

/*
+------------------------------------------+
| REPEAT("* ", n)                          |
+------------------------------------------+
| * * * * * * * * * * * * * * * * * * * *  |
| * * * * * * * * * * * * * * * * * * *    |
| * * * * * * * * * * * * * * * * * *      |
| * * * * * * * * * * * * * * * * *        |
| * * * * * * * * * * * * * * * *          |
| * * * * * * * * * * * * * * *            |
| * * * * * * * * * * * * * *              |
| * * * * * * * * * * * * *                |
| * * * * * * * * * * * *                  |
| * * * * * * * * * * *                    |
| * * * * * * * * * *                      |
| * * * * * * * * *                        |
| * * * * * * * *                          |
| * * * * * * *                            |
| * * * * * *                              |
| * * * * *                                |
| * * * *                                  |
| * * *                                    |
| * *                                      |
| *                                        |
+------------------------------------------+
20 rows in set (0.00 sec)
*/