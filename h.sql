Q1) 
  
1,2-
DECLARE
    TODAY DATE := SYSDATE;
    TOMORROW TODAY%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
    TOMORROW := TODAY + 1;
    DBMS_OUTPUT.PUT_LINE('Today is: ' || TO_CHAR(TODAY, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Tomorrow is: ' || TO_CHAR(TOMORROW, 'DD-MON-YYYY'));
END;

3-
DECLARE
    my_date DATE := SYSDATE;
    v_last_day DATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Formatted Date: ' || TO_CHAR(my_date, 'Month DD, YYYY'));
    v_last_day := LAST_DAY(my_date);
    DBMS_OUTPUT.PUT_LINE('Last day of this month: ' ||
                         TO_CHAR(v_last_day, 'DD-MON-YYYY'));
END;


4-
DECLARE
    my_date DATE := SYSDATE;
    new_date DATE;
    months_diff NUMBER;
BEGIN
    new_date := my_date + 45;
    months_diff := MONTHS_BETWEEN(new_date, my_date);

    DBMS_OUTPUT.PUT_LINE('New date after 45 days: ' ||
                         TO_CHAR(new_date, 'DD-MON-YYYY'));

    DBMS_OUTPUT.PUT_LINE('Months between dates: ' || months_diff);
END;

Q2)
1-CREATE TABLE countries (
    country_name VARCHAR2(50),
    median_age   NUMBER(6,2)
);
2-INSERT INTO countries VALUES ('palestine', 48.4);
INSERT INTO countries VALUES ('Jordan', 23.8);
INSERT INTO countries VALUES ('japan', 38.5);
COMMIT;

3-DECLARE
    v_country_name countries.country_name%TYPE;
    v_median_age   countries.median_age%TYPE;

    CURSOR c_country IS
        SELECT country_name, median_age
        FROM countries
        WHERE country_name = 'Japan';

BEGIN
    OPEN c_country;
    FETCH c_country INTO v_country_name, v_median_age;

    DBMS_OUTPUT.PUT_LINE(
        'The median age in ' || v_country_name ||
        ' is ' || v_median_age || '.'
    );
    CLOSE c_country;
END;





