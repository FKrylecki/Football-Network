SET SERVEROUTPUT ON;

-- update_salary
CREATE OR REPLACE PROCEDURE update_salary (
    p_team_id             NUMBER,
    p_percentage_increase NUMBER
) IS
    CURSOR member_cur IS
    SELECT
        id,
        salary
    FROM
        members
    WHERE
        team_id = p_team_id;

    v_member_id  NUMBER;
    v_new_salary NUMBER;
BEGIN
    OPEN member_cur;
    LOOP
        FETCH member_cur INTO
            v_member_id,
            v_new_salary;
        EXIT WHEN member_cur%notfound;
        v_new_salary := v_new_salary + ( v_new_salary * p_percentage_increase / 100 );
        UPDATE members
        SET
            salary = v_new_salary
        WHERE
            id = v_member_id;

    END LOOP;

    CLOSE member_cur;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error while increasing salary!');
END;

-- BEGIN
--     update_salary(1, 10);
-- END;


--Retrieving data
CREATE OR REPLACE PROCEDURE display_member_team IS

    v_name    members.name%TYPE;
    v_surname members.surname%TYPE;
    v_team    teams.name%TYPE;
    CURSOR member_cursor IS
    SELECT
        m.name,
        m.surname,
        t.name
    FROM
        members m
        LEFT JOIN teams   t ON m.team_id = t.id;

BEGIN
    OPEN member_cursor;
    LOOP
        FETCH member_cursor INTO
            v_name,
            v_surname,
            v_team;
        EXIT WHEN member_cursor%notfound;
        dbms_output.put_line(v_name
                             || ' '
                             || v_surname
                             || ' plays for '
                             || v_team);

    END LOOP;

    CLOSE member_cursor;
END;

-- BEGIN
--     display_member_team;
-- END;


CREATE OR REPLACE PROCEDURE get_teams_and_stadiums_by_city (
    p_city VARCHAR2
) IS
    v_team_name    VARCHAR2(255);
    v_stadium_name VARCHAR2(255);
BEGIN
    SELECT
        t.name,
        s.name
    INTO
        v_team_name,
        v_stadium_name
    FROM
             teams t
        JOIN stadiums s ON t.stadium_id = s.id
    WHERE
        s.city = p_city;

    dbms_output.put_line('Team: '
                         || v_team_name
                         || ', Stadium: '
                         || v_stadium_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No teams found for the specified city.');
    WHEN OTHERS THEN
        dbms_output.put_line('Error while fetching data: ' || sqlerrm);
END;

-- DECLARE
--     v_team_name    VARCHAR2(255);
--     v_stadium_name VARCHAR2(255);
-- BEGIN
--     get_teams_and_stadiums_by_city('Pamplona');
-- END;
