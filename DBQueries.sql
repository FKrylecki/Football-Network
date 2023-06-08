-- Basic queries for our database
SELECT
    *
FROM
    stadiums;

SELECT
    *
FROM
    teams;

SELECT
    *
FROM
    matches;

SELECT
    *
FROM
    tickets;

SELECT
    *
FROM
    members;

-- 1) Retrieve the stadium details for a specific team:
SELECT
    stadiums.*
FROM
         stadiums
    JOIN teams ON stadiums.id = teams.stadium_id
WHERE
    teams.name = 'Barcelona';

-- 2) Retrieve the matches scheduled in a specific stadium:
SELECT
    *
FROM
    matches
WHERE
    stadium_id = 1;

-- 3) Retrieve the teams playing in a specific match:
SELECT
    home_teams.name AS home_team,
    away_teams.name AS away_team
FROM
         matches
    JOIN teams home_teams ON home_teams.id = matches.home_team_id
    JOIN teams away_teams ON away_teams.id = matches.away_team_id
WHERE
    matches.id = 11;

-- 4) Retrieve all tickets for a specific match:
SELECT
    *
FROM
    tickets
WHERE
    match_id = 1;

-- 5) Retrieve the members of a specific team:
SELECT
    *
FROM
    members
WHERE
    team_id = 5;

-- 6) Retrieve the average ticket price for each match:
SELECT
    matches.id,
    AVG(tickets.price) AS average_ticket_price
FROM
         matches
    JOIN tickets ON matches.id = tickets.match_id
GROUP BY
    matches.id;

-- 7) Retrieve the team with the highest average score in home matches:
SELECT
    teams.name,
    AVG(matches.home_team_score) AS average_home_score
FROM
         teams
    JOIN matches ON teams.id = matches.home_team_id
GROUP BY
    teams.name
ORDER BY
    average_home_score DESC
FETCH FIRST ROW ONLY;

-- 8) Retrieve the matches where the home team scored more than the away team:
SELECT
    matches.*
FROM
    matches
WHERE
    home_team_score > away_team_score;

-- 9) Retrieve the top 5 stadiums with the highest average of score 
SELECT
    stadiums.name,
    AVG(matches.home_team_score + matches.away_team_score) AS average_score
FROM
         stadiums
    JOIN matches ON stadiums.id = matches.stadium_id
GROUP BY
    stadiums.name
ORDER BY
    average_score DESC
FETCH FIRST 5 ROWS ONLY;

-- 10) Retrieve the matches where the ticket quantity sold is greater 
-- than the average ticket quantity sold for all matches:
SELECT
    matches.*
FROM
         matches
    JOIN tickets ON matches.id = tickets.match_id
WHERE
    tickets.quantity > (
        SELECT
            AVG(quantity)
        FROM
            tickets
    );

-- 11) Retrieve the teams with the highest number of members:
SELECT
    teams.name,
    COUNT(members.id) AS members_count
FROM
         teams
    JOIN members ON teams.id = members.team_id
GROUP BY
    teams.name
ORDER BY
    members_count DESC;

-- 12) Retrieve the team with the highest average member salary:
SELECT
    teams.name,
    AVG(members.salary) AS average_salary
FROM
         teams
    JOIN members ON teams.id = members.team_id
GROUP BY
    teams.name
ORDER BY
    average_salary DESC
FETCH FIRST ROW ONLY;

-- 13) Retrieve the matches where both home and away teams scored more than the average score in all matches:
SELECT
    matches.*
FROM
    matches
WHERE
        home_team_score > (
            SELECT
                AVG(home_team_score)
            FROM
                matches
        )
    AND away_team_score > (
        SELECT
            AVG(away_team_score)
        FROM
            matches
    );


-- 14) Retrieve the members who have a salary higher than the average salary of all members:
SELECT
    *
FROM
    members
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            members
    );

-- 15) Retrieve the stadiums that have hosted matches with a match week greater than 10:
SELECT UNIQUE
    stadiums.*
FROM
         stadiums
    JOIN matches ON stadiums.id = matches.stadium_id
WHERE
    matches.match_week > 10;

-- 16) Retrieve the teams and their total ticket sales (quantity * price) for a specific match:
SELECT
    teams.name                            AS team_name,
    SUM(tickets.quantity * tickets.price) AS total_sales
FROM
         teams
    JOIN matches ON teams.id = matches.home_team_id
                    OR teams.id = matches.away_team_id
    JOIN tickets ON matches.id = tickets.match_id
WHERE
    matches.id = 2
GROUP BY
    teams.name;
