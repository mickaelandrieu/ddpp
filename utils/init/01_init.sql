CREATE TABLE EMPLOYEES (id SERIAL PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(50), mobile_no BIGINT, date_of_birth DATE);

CREATE FUNCTION get_random_string() RETURNS TEXT LANGUAGE SQL AS $$ 
SELECT STRING_AGG ( SUBSTR ( 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', CEIL (RANDOM() * 52)::integer, 1), '') 
FROM GENERATE_SERIES(1, 10) 
$$;

CREATE FUNCTION insert_record() RETURNS VOID LANGUAGE PLPGSQL AS $$
DECLARE first_name TEXT= INITCAP(get_random_string());
DECLARE last_name TEXT= INITCAP(get_random_string());
DECLARE email TEXT= LOWER(CONCAT(first_name, '.', last_name, '@gmail.com'));
DECLARE mobile_no BIGINT=CAST(1000000000 + FLOOR(RANDOM() * 9000000000) AS BIGINT);
DECLARE date_of_birth DATE= CAST( NOW() - INTERVAL '100 year' * RANDOM() AS DATE);
BEGIN
INSERT INTO EMPLOYEES (first_name, last_name, email, mobile_no, date_of_birth) VALUES (first_name, last_name, email, mobile_no, date_of_birth);
END;
$$;

SELECT insert_record() FROM GENERATE_SERIES(1, 1000000);