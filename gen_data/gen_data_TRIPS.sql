--==============================================================
-- GENERATING DATA FOR t_sa_trips
--==============================================================

INSERT INTO sa_trips.t_sa_trips
SELECT 
       ROWNUM                                                                       --trip_id
      ,dbms_random.STRING('U', 20)                                                  --trip_desc
      ,dbms_random.VALUE(100000, 555000)                                            --trip_from - geo coordinates
      ,dbms_random.VALUE(555000, 999999)                                            --trip_to - geo coordinates
      ,dbms_random.VALUE(1, 300)                                                    --trip_duration
      ,dbms_random.VALUE(1, 200.0)                                                  --trip_cost
      ,dbms_random.STRING('U', 30)                                                  --payment_type
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --trip_date
      ,dbms_random.VALUE(1, 500000)                                                 --trip_client_id
      ,dbms_random.VALUE(1, 500000)                                                 --trip_driver_id
FROM ( 
SELECT ROWNUM
FROM dual
CONNECT BY LEVEL <= 1500000 );
