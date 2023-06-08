-- Simple view to show members' stats
CREATE VIEW member_stats_view AS
    SELECT
        m.id,
        m.name,
        m.surname,
        m.dob,
        m.salary,
        m.nationality,
        t.name                           AS team_name,
        COUNT(DISTINCT ma.id)            AS matches_played,
        COUNT(DISTINCT ma.id) * m.salary AS total_earnings,
        SUM(
            CASE
                WHEN ma.home_team_id = m.team_id THEN
                    ma.home_team_score
                ELSE
                    ma.away_team_score
            END
        )                                AS goals_scored
    FROM
             members m
        JOIN teams   t ON m.team_id = t.id
        LEFT JOIN matches ma ON m.team_id = ma.home_team_id
                                OR m.team_id = ma.away_team_id
    GROUP BY
        m.id,
        m.name,
        m.surname,
        m.dob,
        m.salary,
        m.nationality,
        t.name;

-- SELECT
--     *
-- FROM
--     member_stats_view;


-- XML 

DECLARE
    xml_data XMLTYPE;
BEGIN
    xml_data := xmltype('<stadiums>
                        <stadium>
                          <id>11</id>
                          <name>ttt</name>
                          <city>test</city>
                          <capacity>12374</capacity>
                        </stadium>
                        <stadium>
                          <id>12</id>
                          <name>Sds</name>
                          <city>Ssdf</city>
                          <capacity>32774</capacity>
                        </stadium>
                      </stadiums>');

    FOR s IN (
        SELECT
            extractvalue(value(st),
                         '/stadium/id')       AS id,
            extractvalue(value(st),
                         '/stadium/name')     AS name,
            extractvalue(value(st),
                         '/stadium/city')     AS city,
            extractvalue(value(st),
                         '/stadium/capacity') AS capacity
        FROM
            TABLE ( xmlsequence(xml_data.extract('/stadiums/stadium')) ) st
    ) LOOP
        INSERT INTO stadiums (
            id,
            name,
            city,
            capacity
        ) VALUES (
            s.id,
            s.name,
            s.city,
            s.capacity
        );

    END LOOP;

    COMMIT;
END;

-- SELECT
--     *
-- FROM
--     stadiums;


-- Pipelined function
CREATE OR REPLACE TYPE ticket_profit_type AS OBJECT (
    match_id NUMBER,
    profit   NUMBER
);
/

CREATE OR REPLACE TYPE ticket_profit_table_type AS
    TABLE OF ticket_profit_type;
/

CREATE OR REPLACE FUNCTION calculate_ticket_profit RETURN ticket_profit_table_type
    PIPELINED
AS
    v_profit NUMBER;
BEGIN
    FOR rec IN (
        SELECT
            t.match_id,
            ( t.price * t.quantity ) AS profit
        FROM
            tickets t
    ) LOOP
        v_profit := rec.profit;
        PIPE ROW ( ticket_profit_type(rec.match_id, v_profit) );
    END LOOP;

    RETURN;
END;

SELECT
    match_id,
    profit
FROM
    TABLE ( calculate_ticket_profit );

