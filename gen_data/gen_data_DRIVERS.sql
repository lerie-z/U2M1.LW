--==============================================================
-- GENERATING DATA FOR t_sa_drivers
--==============================================================

INSERT INTO sa_drivers.t_sa_drivers
SELECT 
       ROWNUM                                                                       --driver_id
      ,dbms_random.STRING('U', 20)                                                  --driver_desc
      ,dbms_random.STRING('U', 8)                                                   --license_type
      ,'driver' || to_char(ROWNUM)                                                  --driver_firstname
      ,'name__' || to_char(ROWNUM)                                                  --driver_lastname
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --hire_dt
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --insert_dt
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --update_dt
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --valid_from
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --valid_to
FROM ( 
SELECT 1
FROM dual
CONNECT BY LEVEL <= 1000000 );
