-- 1) Trigger for the "stadiums" table to enforce a minimum capacity:
CREATE OR REPLACE TRIGGER check_if_stadium_capacity_is_big_enough BEFORE
    INSERT OR UPDATE ON stadiums
    FOR EACH ROW
DECLARE
    capacity_too_small EXCEPTION;
BEGIN
    IF :new.capacity < 1000 THEN
        RAISE capacity_too_small;
    END IF;
EXCEPTION
    WHEN capacity_too_small THEN
        raise_application_error(-20001, 'Stadium capacity must be at least 1000.');
END;

-- INSERT INTO stadiums VALUES (1111,'El Sadar','Pamplona',100);


-- 2) Trigger for the "matches" table to validate scores:
CREATE OR REPLACE TRIGGER check_if_match_score_is_correct BEFORE
    INSERT OR UPDATE ON matches
    FOR EACH ROW
BEGIN
    IF :new.home_team_score < 0 OR :new.away_team_score < 0 THEN
        raise_application_error(-20002, 'Invalid match scores.');
    END IF;
END;

-- INSERT INTO matches VALUES (1111, TO_DATE('2023-08-05', 'YYYY-MM-DD'), -3, 2, 'Antonio Mateu Lahoz', 1, 1, 2, 1);


-- 3) Trigger for the "matches" table to validate match date:
CREATE OR REPLACE TRIGGER check_if_match_date_is_valid BEFORE
    INSERT OR UPDATE ON matches
    FOR EACH ROW
BEGIN
    IF :new.match_date < sysdate THEN
        raise_application_error(-20003, 'Match date cannot be in the past.');
    END IF;
END;

-- INSERT INTO matches VALUES (11111, TO_DATE('2021-08-05', 'YYYY-MM-DD'), 3, 2, 'Antonio Mateu Lahoz', 1, 1, 2, 1);


-- 4) Trigger for the "matches" table to validate match week:
CREATE OR REPLACE TRIGGER check_if_match_week_is_valid BEFORE
    INSERT OR UPDATE ON matches
    FOR EACH ROW
BEGIN
    IF :new.match_week < 1 OR :new.match_week > 48 THEN
        raise_application_error(-20004, 'Match week must be between 1 and 38.');
    END IF;
END;

-- INSERT INTO matches VALUES (23228, TO_DATE('2025-03-29', 'YYYY-MM-DD'), 1, 1, 'Aliyar Aghayev', 410, 5, 2, 5);


-- 5) Trigger for the "matches" table to validate home and away teams:
CREATE OR REPLACE TRIGGER check_if_home_and_away_teams_are_different BEFORE
    INSERT OR UPDATE ON matches
    FOR EACH ROW
BEGIN
    IF :new.home_team_id = :new.away_team_id THEN
        raise_application_error(-20005, 'Home and away teams must be different.');
    END IF;
END;

-- INSERT INTO matches VALUES (238, TO_DATE('2025-03-29', 'YYYY-MM-DD'), 1, 1, 'Aliyar Aghayev', 40, 2, 2, 5);


-- 6) Trigger to enforce a constraint on the manager's name length in the teams table:
CREATE OR REPLACE TRIGGER check_manager_name_length
BEFORE INSERT OR UPDATE ON teams
FOR EACH ROW
BEGIN
    IF LENGTH(:new.manager_name) > 80 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Manager name cannot exceed 80 characters.');
    END IF;
END;

-- INSERT INTO teams VALUES (2132,'Barcelona',TO_DATE('1899-11-29', 'YYYY-MM-DD'),1,
-- 'Xavierdddddddddsdfsdfsddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd Hernandez Creus');
