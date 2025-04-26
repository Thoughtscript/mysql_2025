-- https://www.hackerrank.com/challenges/weather-observation-station-19
-- Medium 30

DROP TABLE IF EXISTS Station;

CREATE TABLE Station(
    ID          INTEGER       NOT NULL,
    CITY        VARCHAR(20)   NOT NULL,
    STATE       VARCHAR(20)   NOT NULL,
    LAT_N       INTEGER       NOT NULL,
    LONG_W      INTEGER       NOT NULL
);

INSERT INTO Station 
VALUES 
  (794, 'Kissee Mills', 'MO', 139.65036520, 73.41609884),
  (824, 'Loma Mar', 'CA', 48.69788572, 130.53935410),
  (603, 'Sandy Hook', 'CT', 72.33748014, 148.24007690),
  (478, 'Tipton', 'IN', 33.54792701, 97.94286036),
  (619, 'Arlington', 'CO', 75.17993079, 92.94615894),
  (711, 'Turner', 'AR', 50.24380534, 101.45801630),
  (839, 'Slidell', 'LA', 85.32270304, 151.87432760),
  (411, 'Negreet', 'LA', 98.97071940, 105.33761150),
  (588, 'Glencoe', 'KY', 46.38739244, 136.04270270),
  (665, 'Chelsea', 'IA', 98.72210937, 59.68913002),
  (342, 'Chignik Lagoon', 'AK', 103.19952640, 153.00842730),
  (733, 'Pelahatchie', 'MS', 38.58161595, 28.11950703),
  (441, 'Hanna City', 'IL', 50.98932987, 136.78110100),
  (811, 'Dorrance', 'KS', 102.08883160, 121.56143720),
  (698, 'Albany', 'CA', 49.75112765, 80.21211317),
  (325, 'Monument', 'KS', 70.52300953, 141.76804130),
  (414, 'Manchester', 'MD', 73.51580724, 37.14602869),
  (113, 'Prescott', 'IA', 39.93234421, 65.79327823);

SELECT 
    ROUND(POW(POW(a.LAT_N - c.LAT_N, 2) + POW(b.LONG_W - d.LONG_W, 2), .5), 4)
    
FROM 
    (SELECT LAT_N FROM Station ORDER BY LAT_N ASC LIMIT 1) AS a,
    (SELECT LONG_W FROM Station ORDER BY LONG_W ASC LIMIT 1) AS b,
    (SELECT LAT_N FROM Station ORDER BY LAT_N DESC LIMIT 1) AS c,
    (SELECT LONG_W FROM Station ORDER BY LONG_W DESC LIMIT 1) AS d;

/*
+----------------------------------------------------------------------------+
| ROUND(POW(POW(a.LAT_N - c.LAT_N, 2) + POW(b.LONG_W - d.LONG_W, 2), .5), 4) |
+----------------------------------------------------------------------------+
|                                                                   163.8933 |
+----------------------------------------------------------------------------+
1 row in set (0.00 sec)
*/

SELECT 
    ROUND(POW(POW(x.a - x.c, 2) + POW(x.b - x.d, 2), .5), 4)
    
FROM 
    (SELECT 
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
     FROM Station) as x;

/*
+----------------------------------------------------------+
| ROUND(POW(POW(x.a - x.c, 2) + POW(x.b - x.d, 2), .5), 4) |
+----------------------------------------------------------+
|                                                 163.8933 |
+----------------------------------------------------------+
1 row in set (0.00 sec)
*/

