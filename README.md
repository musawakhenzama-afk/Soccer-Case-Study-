# Soccer Dataset SQL README

This README provides a collection of SQL queries and explanations for exploring and analyzing a Soccer Player Dataset. Each item corresponds to a specific analytical requirement.

---

## **1. View the first 100 rows of the dataset**

```sql
SELECT *
FROM soccer_dataset
LIMIT 100;
```

## **2. Count the total number of players**

```sql
SELECT COUNT(*) AS total_players
FROM soccer_dataset;
```

## **3. List all unique teams**

```sql
SELECT DISTINCT team
FROM soccer_dataset;
```

## **4. Count how many players are in each team**

```sql
SELECT team, COUNT(*) AS players_per_team
FROM soccer_dataset
GROUP BY team;
```

## **5. Top 10 players with the most goals**

```sql
SELECT player_name, goals
FROM soccer_dataset
ORDER BY goals DESC
LIMIT 10;
```

## **6. Average salary for players in each team**

```sql
SELECT team, AVG(salary) AS avg_salary
FROM soccer_dataset
GROUP BY team;
```

## **7. Top 10 players with the highest market value**

```sql
SELECT player_name, market_value
FROM soccer_dataset
ORDER BY market_value DESC
LIMIT 10;
```

## **8. Average passing accuracy for each position**

```sql
SELECT position, AVG(passing_accuracy) AS avg_passing_accuracy
FROM soccer_dataset
GROUP BY position;
```

## **9. Compare shot accuracy with goals**

```sql
SELECT player_name, shot_accuracy, goals
FROM soccer_dataset;
```

## **10. Total goals and assists for each team**

```sql
SELECT team,
       SUM(goals) AS total_goals,
       SUM(assists) AS total_assists
FROM soccer_dataset
GROUP BY team;
```

## **11. Count players by marital status**

```sql
SELECT marital_status, COUNT(*) AS count_players
FROM soccer_dataset
GROUP BY marital_status;
```

## **12. Count players by nationality**

```sql
SELECT nationality, COUNT(*) AS players_per_country
FROM soccer_dataset
GROUP BY nationality;
```

## **13. Average market value grouped by nationality**

```sql
SELECT nationality, AVG(market_value) AS avg_market_value
FROM soccer_dataset
GROUP BY nationality;
```

## **14. Count player contracts ending in each year**

```sql
SELECT EXTRACT(YEAR FROM contract_end_date) AS contract_end_year,
       COUNT(*) AS players
FROM soccer_dataset
GROUP BY EXTRACT(YEAR FROM contract_end_date)
ORDER BY contract_end_year;
```

## **15. Players whose contracts end next year**

```sql
SELECT player_name, contract_end_date
FROM soccer_dataset
WHERE EXTRACT(YEAR FROM contract_end_date) = EXTRACT(YEAR FROM CURRENT_DATE) + 1;
```

## **16. Number of players by injury status**

```sql
SELECT injury_status, COUNT(*) AS player_count
FROM soccer_dataset
GROUP BY injury_status;
```

## **17. Goals per match ratio for each player**

```sql
SELECT player_name,
       goals,
       matches_played,
       (goals / NULLIF(matches_played, 0)) AS goals_per_match
FROM soccer_dataset;
```

## **18. Count players managed by each agent**

```sql
SELECT agent_name, COUNT(*) AS players_managed
FROM soccer_dataset
GROUP BY agent_name;
```

## **19. Average height and weight by player position**

```sql
SELECT position,
       AVG(height_cm) AS avg_height_cm,
       AVG(weight_kg) AS avg_weight_kg
FROM soccer_dataset
GROUP BY position;
```

## **20. Players with the highest combined goals + assists**

```sql
SELECT player_name,
       (goals + assists) AS goal_contribution
FROM soccer_dataset
ORDER BY goal_contribution DESC;
```

---

### **End of README**
