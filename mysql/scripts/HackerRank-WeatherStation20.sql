-- https://www.hackerrank.com/challenges/weather-observation-station-20
-- Medium 40

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
    ROUND(AVG(x.LAT_N), 4) AS MEDIAN
    
FROM
    (SELECT 
        ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS rn, 
        LAT_N 
    FROM Station) AS x,
    
    -- This probably not a very good way of doing this
    -- But it is original...
    (SELECT 
        (CASE
            WHEN COUNT(LAT_N) % 2 = 0 
            THEN FLOOR(COUNT(LAT_N) / 2) 
            ELSE CEIL(COUNT(LAT_N)/ 2)
        END) AS low,
        
        CEIL(COUNT(LAT_N)/ 2) AS hi
     
    FROM Station) AS y

WHERE x.rn IN (y.low, y.hi);

/*
+---------+
| MEDIAN  |
+---------+
| 71.0000 |
+---------+
*/