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