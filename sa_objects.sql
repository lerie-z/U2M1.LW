--==============================================================
-- DATA WAREHOUSE STORAGE LEVEL: CREATION OF SOURCE TABLES
--==============================================================

--==============================================================
-- Table: sa_clients.t_sa_clients                                     
--==============================================================
CREATE TABLE sa_clients.t_sa_clients 
(
    client_id                   NUMBER(22,0)          NOT NULL
   ,client_desc                 VARCHAR(256)
   ,client_bitrhdate            NUMBER(22,0)
   ,client_firstname            VARCHAR(20)
   ,client_lastname             VARCHAR(20)
   ,registration_dt             DATE
   ,insert_dt                   DATE
   ,update_dt                   DATE
   ,valid_from                  DATE
   ,valid_to                    DATE
);

--==============================================================
-- Table: sa_drivers.t_sa_drivers
--==============================================================
CREATE TABLE sa_drivers.t_sa_drivers
(
    driver_id                   NUMBER(22,0)          NOT NULL
   ,driver_desc                 VARCHAR(256)
   ,license_type                VARCHAR(8)
   ,driver_firstname            VARCHAR(20)
   ,driver_lastname             VARCHAR(20)
   ,hire_dt                     DATE
   ,insert_dt                   DATE
   ,update_dt                   DATE
   ,valid_from                  DATE
   ,valid_to                    DATE
);

--==============================================================
-- Table: sa_vehicles.t_sa_vehicles
--==============================================================
CREATE TABLE sa_vehicles.t_sa_vehicles
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

--==============================================================
-- Table: sa_trips.t_sa_trips
--==============================================================
CREATE TABLE sa_trips.t_sa_trips
(
    trip_id                   NUMBER(22,0)          NOT NULL
   ,trip_desc                 VARCHAR(256)
   ,trip_from                 NUMBER(22,0)
   ,trip_to                   NUMBER(22,0)
   ,trip_duration             NUMBER(4,0)
   ,trip_cost                 NUMBER(4,0)
   ,payment_type              VARCHAR(30)
   ,insert_dt                 DATE
   ,update_dt                 DATE
);
