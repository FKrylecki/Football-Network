CREATE OR REPLACE FUNCTION calculate_average_salary_by_team (
    p_team_id NUMBER
) RETURN NUMBER AS

    v_total_salary   NUMBER := 0;
    v_member_count   NUMBER := 0;
    v_average_salary NUMBER := 0;
    no_members_exception EXCEPTION;
BEGIN
    FOR member_rec IN (
        SELECT
            salary
        FROM
            members
        WHERE
            team_id = p_team_id
    ) LOOP
        v_total_salary := v_total_salary + member_rec.salary;
        v_member_count := v_member_count + 1;
    END LOOP;

    IF v_member_count > 0 THEN
        v_average_salary := v_total_salary / v_member_count;
    ELSE
        RAISE no_members_exception;
    END IF;

    RETURN v_average_salary;
EXCEPTION
    WHEN no_members_exception THEN
        dbms_output.put_line('Error: ' || sqlerrm);
        RETURN NULL;
END;
/

-- DECLARE
--     v_avg_salary NUMBER;
-- BEGIN
--     v_avg_salary := calculate_average_salary_by_team(1);
--     dbms_output.put_line('Average Salary: ' || v_avg_salary);
-- END;


CREATE OR REPLACE FUNCTION calculate_total_revenue (
    p_match_id NUMBER
) RETURN NUMBER AS
    v_total_revenue NUMBER := 0;
    v_total_salary  NUMBER := 0;
    v_net_revenue   NUMBER := 0;
BEGIN
    SELECT
        SUM(price * quantity)
    INTO v_total_revenue
    FROM
        tickets
    WHERE
        match_id = p_match_id;

    SELECT
        SUM(salary)
    INTO v_total_salary
    FROM
        members
    WHERE
        team_id IN (
            SELECT
                home_team_id
            FROM
                matches
            WHERE
                id = p_match_id
            UNION
            SELECT
                away_team_id
            FROM
                matches
            WHERE
                id = p_match_id
        );

    v_net_revenue := v_total_revenue - v_total_salary;
    RETURN v_net_revenue;
END;
/

-- DECLARE
--     revenue NUMBER;
-- BEGIN
--     revenue := calculate_total_revenue(1);
--     dbms_output.put_line('Revenue: ' || revenue);
-- END;


CREATE OR REPLACE FUNCTION get_top_teams RETURN SYS_REFCURSOR AS
    v_team_cur SYS_REFCURSOR;
BEGIN
    OPEN v_team_cur FOR WITH team_points AS (
                                                SELECT
                                                    t.id,
                                                    t.name,
                                                    SUM(
                                                        CASE
                                                            WHEN m.home_team_id = t.id THEN
                                                                    CASE
                                                                        WHEN m.home_team_score > m.away_team_score THEN
                                                                            3
                                                                        WHEN m.home_team_score = m.away_team_score THEN
                                                                            1
                                                                        ELSE
                                                                            0
                                                                    END
                                                            ELSE
                                                                CASE
                                                                        WHEN m.away_team_score > m.home_team_score THEN
                                                                            3
                                                                        WHEN m.away_team_score = m.home_team_score THEN
                                                                            1
                                                                        ELSE
                                                                            0
                                                                END
                                                        END
                                                    ) AS total_points
                                                FROM
                                                    teams   t
                                                    LEFT JOIN matches m ON m.home_team_id = t.id
                                                                           OR m.away_team_id = t.id
                                                GROUP BY
                                                    t.id,
                                                    t.name
                                            )
                                            SELECT
                                                id,
                                                name,
                                                total_points
                                            FROM
                                                (
                                                    SELECT
                                                        id,
                                                        name,
                                                        total_points,
                                                        ROW_NUMBER()
                                                        OVER(
                                                            ORDER BY
                                                                total_points DESC
                                                        ) AS rn
                                                    FROM
                                                        team_points
                                                )
                        WHERE
                            rn <= 3;

    RETURN v_team_cur;
END;
/

-- DECLARE
--     v_teams        SYS_REFCURSOR;
--     v_team_id      NUMBER;
--     v_team_name    VARCHAR2(255);
--     v_total_points NUMBER;
-- BEGIN
--     v_teams := get_top_teams();
--     LOOP
--         FETCH v_teams INTO
--             v_team_id,
--             v_team_name,
--             v_total_points;
--         EXIT WHEN v_teams%notfound;
--         dbms_output.put_line('Team: '
--                              || v_team_name
--                              || ', Total Points: '
--                              || v_total_points);
--     END LOOP;

--     CLOSE v_teams;
-- END;