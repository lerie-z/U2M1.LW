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
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --insert_dt
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --update_dt
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --valid_from
      ,to_date('2010-01-01', 'yyyy-mm-dd')+dbms_random.value(1,10000)               --valid_to
      ,dbms_random.STRING('U', 1)                                                   --fuel_type
FROM ( 
SELECT ROWNUM
FROM dual
CONNECT BY LEVEL <= 2500000 );
