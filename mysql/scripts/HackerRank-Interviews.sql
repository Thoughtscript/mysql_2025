-- https://www.hackerrank.com/challenges/interviews

-- Probably the most difficult SQL problem on HackerRank as of 4.25.2025

-- Hard: 50

DROP TABLE IF EXISTS Contests;

CREATE TABLE Contests(
    contest_id       INTEGER        NOT NULL,
    hacker_id        INTEGER        NOT NULL,
    name             VARCHAR(20)    NOT NULL
);

DROP TABLE IF EXISTS Colleges;

CREATE TABLE Colleges(
    college_id       INTEGER       NOT NULL,
    contest_id       INTEGER       NOT NULL
);

DROP TABLE IF EXISTS Challenges;

CREATE TABLE Challenges(
    challenge_id     INTEGER       NOT NULL,
    college_id       INTEGER       NOT NULL
);

DROP TABLE IF EXISTS View_Stats;

CREATE TABLE View_Stats(
    challenge_id            INTEGER       NOT NULL,
    total_views             INTEGER       NOT NULL,
    total_unique_views      INTEGER       NOT NULL
);

DROP TABLE IF EXISTS Submission_Stats;

CREATE TABLE Submission_Stats(
    challenge_id                    INTEGER       NOT NULL,
    total_submissions               INTEGER       NOT NULL,
    total_accepted_submissions      INTEGER       NOT NULL
);

INSERT INTO Contests 
VALUES 
  (66406, 17973, 'Rose'),
  (66556, 79153, 'Angela'),
  (94828, 80275, 'Frank');

INSERT INTO Colleges 
VALUES 
  (11219, 66406),
  (32473, 66556),
  (56685, 94828);

INSERT INTO Challenges 
VALUES 
  (18765, 11219),
  (47127, 11219),
  (60292, 32473),
  (72974, 56685);

INSERT INTO View_Stats 
VALUES 
  (47127, 26, 19),
  (47127, 15, 14),
  (18765, 43, 10),
  (18765, 72, 13),
  (75516, 35, 17),
  (60292, 11, 10),
  (72974, 41, 15),
  (75516, 75, 11);

INSERT INTO Submission_Stats 
VALUES 
  (75516, 34, 12),
  (47127, 27, 10),
  (47127, 56, 18),
  (75516, 74, 12),
  (75516, 83, 8),
  (72974, 68, 24),
  (72974, 82, 14),
  (47127, 28, 11);

SELECT 
    c.contest_id,
    c.hacker_id,
    c.name,
    y.totalSubmissions,
    y.totalAcceptedSubmissions,
    x.totalViews,
    x.totalUniqueViews
    
FROM 
    Contests AS c

    INNER JOIN (SELECT 
        c.contest_id,
        c.hacker_id,
        c.name,
        IFNULL(SUM(v.total_views), 0) AS totalViews,
        IFNULL(SUM(v.total_unique_views), 0) AS totalUniqueViews

        FROM (Contests AS c

            LEFT JOIN Colleges AS cc
            ON c.contest_id = cc.contest_id
    
            LEFT JOIN Challenges AS ccc
            ON cc.college_id = ccc.college_id
    
            LEFT JOIN View_Stats AS v
            ON ccc.challenge_id = v.challenge_id)

        GROUP BY c.contest_id,
            c.hacker_id,
            c.name) AS x

    ON x.contest_id = c.contest_id

    INNER JOIN (SELECT
        c.contest_id,
        c.hacker_id,
        c.name,
        IFNULL(SUM(s.total_submissions), 0) AS totalSubmissions,
        IFNULL(SUM(s.total_accepted_submissions), 0) AS totalAcceptedSubmissions

        FROM (Contests AS c
            
            LEFT JOIN Colleges AS cc
            ON c.contest_id = cc.contest_id
    
            LEFT JOIN Challenges AS ccc
            ON cc.college_id = ccc.college_id
    
            LEFT JOIN Submission_Stats AS s
            ON ccc.challenge_id = s.challenge_id)

        GROUP BY c.contest_id,
            c.hacker_id,
            c.name) AS y

    ON y.contest_id = c.contest_id

WHERE 
    y.totalSubmissions > 0
    OR y.totalAcceptedSubmissions > 0
    OR x.totalViews > 0
    OR x.totalUniqueViews > 0
    
ORDER BY c.contest_id ASC;

/*
+------------+-----------+--------+------------------+--------------------------+------------+------------------+
| contest_id | hacker_id | name   | totalSubmissions | totalAcceptedSubmissions | totalViews | totalUniqueViews |
+------------+-----------+--------+------------------+--------------------------+------------+------------------+
|      66406 |     17973 | Rose   |              111 |                       39 |        156 |               56 |
|      66556 |     79153 | Angela |                0 |                        0 |         11 |               10 |
|      94828 |     80275 | Frank  |              150 |                       38 |         41 |               15 |
+------------+-----------+--------+------------------+--------------------------+------------+------------------+
*/