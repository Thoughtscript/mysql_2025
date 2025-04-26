# mysql_2025

[![](https://img.shields.io/badge/MySQL-8.4.5-blue.svg)](https://dev.mysql.com/doc/refman/8.4/en/preface.html)

> *Just some fun. (And going for [SQL Gold](https://www.hackerrank.com/profile/KardashevScale) on Hacker Rank.)*

## Setup and Use

Docker Compose:
```bash
docker compose up
```

Connection settings:
```
Host:       localhost:3306
User:       example
Password:   example
Database:   example
```

### Scripts

Execute SQL through the Docker Shell:

```bash
# Exec in and login
mysql --user=example --password=example lab

# Execute command
mysql> SELECT * FROM jsonexample;

mysql> exit
```

Execute supplied scripts:
```bash
mysql --user=example --password=example lab

mysql> source ./scripts/restart.sql
```

```bash
mysql> source ./scripts/HackerRank-Occupations.sql
mysql> source ./scripts/HackerRank-TypeOfTriangle.sql
mysql> source ./scripts/HackerRank-TopEarners.sql
mysql> source ./scripts/HackerRank-ThePADS.sql
mysql> source ./scripts/HackerRank-NewCompanies.sql
mysql> source ./scripts/HackerRank-WeatherStation8.sql
mysql> source ./scripts/HackerRank-WeatherStation18.sql
mysql> source ./scripts/HackerRank-WeatherStation19.sql
mysql> source ./scripts/HackerRank-WeatherStation20.sql
mysql> source ./scripts/HackerRank-Interviews.sql
mysql> source ./scripts/HackerRank-DrawTheTriangle1.sql
mysql> source ./scripts/HackerRank-DrawTheTriangle2.sql
mysql> source ./scripts/HackerRank-SymmetricPairs.sql
```

## Gotcha's and Review Topics

1. [MySQL 8.0](https://www.w3schools.com/mysql/mysql_datatypes.asp) requires passing number of chars in the `VARCHAR` type.
2. [MySQL 8.0](https://dev.mysql.com/doc/refman/8.0/en/begin-end.html) `BEGIN` and `END` requires `DELIMITERS`.
3. `mysql> source` requires `./` for file paths.
4. Uses `LIMIT` prepended not `TOP` (per MSSQL).
5. `WITH` cannot be used with [MySQL prior to](https://www.tutorialspoint.com/mysql/mysql-common-table-expression.htm) `8.0` (sadly, HackerRank uses MySQL versions `<8.0` and `WITH` queries will error out on the platform).

## Resources and Links

1. https://dev.mysql.com/doc/refman/8.4/en/char.html
2. https://stackoverflow.com/questions/8940230/how-to-run-sql-script-in-mysql