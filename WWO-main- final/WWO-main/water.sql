create user wwo identified by hr;

grant connect to wwo;

grant create session to wwo;

grant create table to wwo;

grant unlimited tablespace to wwo;

Grant resource to wwo; 

Grant select, insert, update, delete on employee to wwo;
Grant select, insert, update, delete on user_data to wwo;

Grant select on roles to wwo;
Grant select on global_water_access to wwo;
Grant select on location to wwo;
Grant select on visits to wwo;
Grant select on water_quality to wwo;
Grant select on water_source to wwo;
Grant select on well_pollution to wwo;






