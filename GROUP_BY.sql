------------------------------------------------
--GROUPING EXAMPLES FOR sa_vehicles.t_sa_vehicles
--using adhoc sql queries
------------------------------------------------

--SELECT / GROUP BY

SELECT COUNT(*), 
    vehicle_vin
FROM sa_vehicles.t_sa_vehicles
GROUP BY vehicle_vin;

SELECT COUNT(*), 
    vehicle_mark
FROM sa_vehicles.t_sa_vehicles
GROUP BY vehicle_mark;

SELECT COUNT(*), 
    driver_lastname
FROM sa_drivers.t_sa_drivers
GROUP BY driver_lastname;

--MERGE / GROUP BY

CREATE TABLE sa_vehicles.test_t_vehicles
(
    vehicle_id                   NUMBER(22,0)          NOT NULL
   ,vehicle_code                 NUMBER(22,0)
   ,vehicle_desc                 VARCHAR(256)
   ,vehicle_vin                  VARCHAR(10)
   ,vehicle_mark                 VARCHAR(10)
   ,insert_dt                    DATE
   ,update_dt                    DATE
   ,valid_from                   DATE
   ,valid_to                     DATE
   ,fuel_type                    VARCHAR(4)
);

INSERT INTO sa_vehicles.test_t_vehicles
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
CONNECT BY LEVEL <= 200000 );

MERGE INTO sa_vehicles.test_t_vehicles test_table
USING 
    (SELECT COUNT(*), vehicle_code
        FROM sa_vehicles.t_sa_vehicles
        WHERE vehicle_code >5000
        GROUP BY vehicle_code) orig_table
ON (test_table.vehicle_code = orig_table.vehicle_code)
WHEN MATCHED 
    THEN UPDATE SET vehicle_vin = 0202
WHEN NOT MATCHED 
    THEN INSERT (vehicle_code, vehicle_vin)
        VALUES (0101, 1010);
        
DELETE FROM sa_vehicles.test_t_vehicles;
DROP TABLE sa_vehicles.test_t_vehicles;
