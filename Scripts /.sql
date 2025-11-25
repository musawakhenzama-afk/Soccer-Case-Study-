SELECT
  *
FROM
  "SALEAGUE"."PUBLIC"."TEAMS"
LIMIT
  10;

---1. View the first 100 rows
SELECT *
FROM "SALEAGUE"."PUBLIC"."TEAMS"
LIMIT 100;

---2. Count total number of players
SELECT COUNT(*) AS total_players
FROM "SALEAGUE"."PUBLIC"."TEAMS";

---3. List all unique teams
SELECT DISTINCT team
FROM "SALEAGUE"."PUBLIC"."TEAMS";

---4. Count how many players are in each team
SELECT team, COUNT(*) AS player_count
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY team
ORDER BY player_count DESC;

---5. Top 10 players with the most goals
SELECT player_name, team, goals
FROM "SALEAGUE"."PUBLIC"."TEAMS"
ORDER BY goals DESC
LIMIT 10;

---6. Average salary per team
SELECT team, AVG(average_salary_zar) AS avg_salary
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY team
ORDER BY avg_salary DESC;

---7. Top 10 highest market value players
SELECT player_name, team, market_value_zar
FROM "SALEAGUE"."PUBLIC"."TEAMS"
ORDER BY market_value_zar DESC
LIMIT 10;

---8. Average passing accuracy per position
SELECT position, AVG(passing_accuracy) AS avg_passing_accuracy
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY position;

---9. Compare goals and shot accuracy
SELECT player_name, goals, shot_accuracy
FROM "SALEAGUE"."PUBLIC"."TEAMS"
ORDER BY shot_accuracy DESC;

---10. Total goals & assists per team
SELECT team,
       SUM(goals) AS total_goals,
       SUM(assists) AS total_assists
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY team
ORDER BY total_goals DESC;

---11. Count players by marital status
SELECT marital_status, COUNT(*) AS count_players
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY marital_status;

---12. Count players by nationality
SELECT nationality, COUNT(*) AS players_per_nationality
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY nationality
ORDER BY players_per_nationality DESC;

---13. Average market value by nationality
SELECT nationality, AVG(market_value_zar) AS avg_market_value
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY nationality
ORDER BY avg_market_value DESC;

---14. Count contracts ending by year
SELECT contract_end_year, COUNT(*) AS players_with_contract_ending
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY contract_end_year
ORDER BY contract_end_year;

---15. Players whose contracts end next year
SELECT player_name, team, contract_end_year
FROM "SALEAGUE"."PUBLIC"."TEAMS"
WHERE contract_end_year = YEAR(CURRENT_DATE) + 1;

---16. Player count by injury status
SELECT injury_status, COUNT(*) AS player_count
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY injury_status;

---17. Goals per match ratio
SELECT player_name,
       goals,
       matches_played,
       CASE 
           WHEN matches_played = 0 THEN 0
           ELSE goals / matches_played
       END AS goals_per_match
FROM "SALEAGUE"."PUBLIC"."TEAMS"
ORDER BY goals_per_match DESC;

---18. Count players per agent
SELECT agent, COUNT(*) AS players_managed
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY agent
ORDER BY players_managed DESC;

---19. Average height & weight by position
SELECT position,
       AVG(height_cm) AS avg_height_cm,
       AVG(weight_kg) AS avg_weight_kg
FROM "SALEAGUE"."PUBLIC"."TEAMS"
GROUP BY position;

---20. Players with highest combined goals + assists
SELECT player_name,
       team,
       (goals + assists) AS total_contribution
FROM "SALEAGUE"."PUBLIC"."TEAMS"
ORDER BY total_contribution DESC;
