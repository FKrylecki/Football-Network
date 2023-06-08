CREATE OR REPLACE PACKAGE football_package IS
    PROCEDURE update_stadium_capacity (
        stadium_id   IN NUMBER,
        new_capacity IN NUMBER
    );

    PROCEDURE generate_match_scores_report (
        match_week IN NUMBER
    );

END football_package;
/

CREATE OR REPLACE PACKAGE BODY football_package IS

    PROCEDURE update_stadium_capacity (
        stadium_id   IN NUMBER,
        new_capacity IN NUMBER
    ) IS
    BEGIN
        UPDATE stadiums
        SET
            capacity = new_capacity
        WHERE
            id = stadium_id;

    END update_stadium_capacity;

    PROCEDURE generate_match_scores_report (
        match_week IN NUMBER
    ) IS

        CURSOR match_scores_cursor IS
        SELECT
            m.id,
            m.match_date,
            m.home_team_score,
            m.away_team_score,
            ht.name AS home_team_name,
            at.name AS away_team_name
        FROM
                 matches m
            INNER JOIN teams ht ON m.home_team_id = ht.id
            INNER JOIN teams at ON m.away_team_id = at.id
        WHERE
            m.match_week = match_week;

    BEGIN
        FOR match_score IN match_scores_cursor LOOP
            dbms_output.put_line('Match ID: ' || match_score.id);
            dbms_output.put_line('Match Date: ' || match_score.match_date);
            dbms_output.put_line('Home Team: ' || match_score.home_team_name);
            dbms_output.put_line('Home Team Score: ' || match_score.home_team_score);
            dbms_output.put_line('Away Team: ' || match_score.away_team_name);
            dbms_output.put_line('Away Team Score: ' || match_score.away_team_score);
            dbms_output.put_line('------------------------');
        END LOOP;
    END generate_match_scores_report;

END football_package;

-- BEGIN
--     football_package.generate_match_scores_report(12);
-- END;

-- BEGIN
--     football_package.update_stadium_capacity(1, 20000);
-- END;