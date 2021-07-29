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
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --hire_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --insert_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2467833,2955197)),'J')                       --update_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2555197)),'J')                       --valid_from
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2755197)),'J')                       --valid_to
FROM ( 
SELECT 1
FROM dual
CONNECT BY LEVEL <= 80000 );
