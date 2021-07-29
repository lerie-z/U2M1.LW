--==============================================================
-- GENERATING DATA FOR t_sa_trips
--==============================================================

INSERT INTO sa_trips.t_sa_trips
SELECT 
       ROWNUM                                                                       --trip_id
      ,dbms_random.STRING('U', 20)                                                  --trip_desc
      ,dbms_random.VALUE(100000, 999999)                                            --trip_from - geo coordinates
      ,dbms_random.VALUE(100000, 999999)                                            --trip_to - geo coordinates
      ,dbms_random.VALUE(1, 300)                                                    --trip_duration
      ,dbms_random.VALUE(1, 200.0)                                                   --trip_cost
      ,dbms_random.STRING('U', 30)                                                  --payment_type
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --insert_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2467833,2955197)),'J')                       --update_dt
FROM ( 
SELECT ROWNUM
FROM dual
CONNECT BY LEVEL <= 150000 );
