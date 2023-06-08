DECLARE
    v_table_name VARCHAR2(100) := 'tickets';
BEGIN
    FOR cur IN (
        SELECT
            table_name,
            constraint_name,
            constraint_type
        FROM
            all_constraints
        WHERE
            r_constraint_name IN (
                SELECT
                    constraint_name
                FROM
                    all_constraints
                WHERE
                        table_name = v_table_name
                    AND constraint_type = 'R'
            )
            AND constraint_type != 'R'
    ) LOOP
        IF cur.constraint_type = 'P' THEN
            EXECUTE IMMEDIATE 'ALTER TABLE '
                              || cur.table_name
                              || ' DISABLE CONSTRAINT '
                              || cur.constraint_name;
        ELSIF cur.constraint_type = 'U' THEN
            EXECUTE IMMEDIATE 'ALTER TABLE '
                              || cur.table_name
                              || ' DROP CONSTRAINT '
                              || cur.constraint_name
                              || ' CASCADE';
        END IF;
    END LOOP;

    EXECUTE IMMEDIATE 'DROP TABLE '
                      || v_table_name
                      || ' CASCADE CONSTRAINTS';
    dbms_output.put_line('Table dropped successfully.');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error dropping the table: ' || sqlerrm);
END;