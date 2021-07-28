--==============================================================
-- GENERATING DATA FOR t_sa_drivers
--==============================================================

CREATE SEQUENCE driver_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE
    NOMAXVALUE;


INSERT INTO sa_drivers.t_sa_drivers
SELECT 
       driver_seq.NEXTVAL                                                           --driver_id
      ,dbms_random.STRING('U', 20)                                                  --driver_desc
      ,dbms_random.STRING('U', 8)                                                   --license_type
      ,'driver' || dbms_random.STRING('U', 10)                                      --driver_firstname
      ,'name__' || dbms_random.STRING('U', 10)                                      --driver_lastname
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --hire_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2455197)),'J')                       --insert_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2467833,2955197)),'J')                       --update_dt
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2555197)),'J')                       --valid_from
      ,TO_DATE(TRUNC(dbms_random.VALUE(2454833,2755197)),'J')                       --valid_to
FROM ( 
SELECT 1
FROM dual
CONNECT BY LEVEL <= 50000 );