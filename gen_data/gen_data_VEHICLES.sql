--==============================================================
-- GENERATING DATA FOR t_sa_vehicles
--==============================================================

INSERT INTO sa_vehicles.t_sa_vehicles
SELECT 
       ROWNUM                                                                       --vehicle_id
      ,dbms_random.VALUE(1000, 9999)                                                --vehicle_code
      ,dbms_random.STRING('U', 20)                                                  --vehicle_desc
      ,dbms_random.STRING('x', 10)                                                  --vehicle_vin
      ,'mark_' || dbms_random.STRING('U', 5)                                        --vehicle_mark
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --insert_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2467833,2955197)),'J')                       --update_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2555197)),'J')                       --valid_from
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2755197)),'J')                       --valid_to
      ,dbms_random.STRING('U', 4)                                                   --fuel_type
FROM ( 
SELECT 1
FROM dual
CONNECT BY LEVEL <= 250000 );
