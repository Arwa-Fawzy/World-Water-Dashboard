
create database link site_link
connect to system identified by hr 
using '(description=
      (address_list=
      (address=(protocol=TCP)
      (host=0.tcp.eu.ngrok.io)
      (port=16936))
      )
      (connect_data=(SID=XE)
      )
      )';
--
-- Table structure for table `data_dictionary`
--

CREATE TABLE data_dictionary (
  table_name VARCHAR2(255) NOT NULL,
  column_name VARCHAR2(255) NOT NULL,
  description CLOB,
  datatype VARCHAR2(50),
  related_to VARCHAR2(255)
);

--
-- inserting data into Table structure for table `data_dictionary`
-- 

INSERT ALL
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'assigned_employee_id', 'Unique ID assigned to each employee', 'NUMBER', 'visits')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'employee_name', 'Name of the employee', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'phone_number', 'Contact number of the employee', 'VARCHAR2(15)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'email', 'Email address of the employee', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'address', 'Residential address of the employee', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'town_name', 'Name of the town where the employee resides', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'province_name', 'Name of the province where the employee resides', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('employee', 'position', 'Position or job title of the employee', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'record_id', 'Unique ID assigned to each visit', 'NUMBER', 'water_quality, water_source')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'location_id', 'ID of the location visited', 'VARCHAR2(255)', 'location')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'source_id', 'ID of the water source visited', 'VARCHAR2(510)', 'well_pollution')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'time_of_record', 'Date and time of the visit', 'TIMESTAMP', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'visit_count', 'Number of visits made to this location', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'time_in_queue', 'Time spent by people waiting for water in a queue at the location', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('visits', 'assigned_employee_id', 'ID of the employee who visited the location', 'NUMBER', 'employee')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_quality', 'record_id', 'Unique ID assigned to each record', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_quality', 'subjective_quality_score', 'Score representing the subjective quality of the water source', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_quality', 'visit_count', 'Number of visits made for data collection', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_source', 'source_id', 'Unique ID assigned to each water source', 'VARCHAR2(510)', 'visits')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_source', 'type_of_water_source', 'Type or category of the water source. Can be: tap_in_home, tap_in_home_broken, well, shared_tap, river', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('water_source', 'number_of_people_served', 'Number of people served by this water source', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'source_id', 'ID of the water source being tested for pollution', 'VARCHAR2(258)', 'visits')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'date', 'Date of the pollution test', 'TIMESTAMP', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'description', 'Description of the pollution test', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'pollutant_ppm', 'Result of the pollution test in parts per million', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'biological', 'Biological contamination level', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('well_pollution', 'results', 'Result of the pollution test. Can be ''dirty'', ''biologically contaminated'', or ''clean''', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('location', 'location_id', 'Unique ID assigned to each location', 'VARCHAR2(255)', 'visits')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('location', 'address', 'Address of the location', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('location', 'province_name', 'Name of the province where the location is situated', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('location', 'town_name', 'Name of the town where the location is situated', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('location', 'location_type', 'Type or category of the location', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'name', 'The country or area name', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'region', 'Geographical region', 'VARCHAR2(255)', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'year', 'Year of the data record', 'NUMBER', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'pop_n', 'The national population size estimate in thousands', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'pop_u', 'The urban population share estimate in percentage points (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_bas_n', 'The estimated national share of people with at least basic service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_lim_n', 'The estimated national share of people with limited service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_unimp_n', 'The estimated national share of people with unimproved service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_sur_n', 'The estimated national share of people with surface service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_bas_r', 'The estimated rural share of people with at least basic service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_lim_r', 'The estimated rural share of people with limited service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_unimp_r', 'The estimated rural share of people with unimproved service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_sur_r', 'The estimated rural share of people with surface service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_bas_u', 'The estimated urban share of people with at least basic service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_lim_u', 'The estimated urban share of people with limited service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_unimp_u', 'The estimated urban share of people with unimproved service (%)', 'FLOAT', '')
INTO data_dictionary (table_name, column_name, description, datatype, related_to) VALUES 
('global_water_access', 'wat_sur_u', 'The estimated urban share of people with surface service (%)', 'FLOAT', '')
SELECT * FROM dual;
--
-- Table structure for table `employee`
--

CREATE TABLE employee (
  assigned_employee_id NUMBER NOT NULL,
  employee_name VARCHAR2(255),
  phone_number VARCHAR2(15),
  email VARCHAR2(255),
  address VARCHAR2(255),
  province_name VARCHAR2(255),
  town_name VARCHAR2(255),
  role_id NUMBER,
  CONSTRAINT employee_pk PRIMARY KEY (assigned_employee_id),
  CONSTRAINT employee_fk FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

--
-- inserting data for table `employee`
--  

INSERT ALL
  INTO employee VALUES (0, 'Amara Jengo', '+99637993287 ', NULL, '36 Pwani Mchangani Road', 'Sokoto', 'Ilanga', 1)
  INTO employee VALUES (1, 'Bello Azibo', '+99643864786 ', NULL, '129 Ziwa La Kioo Road', 'Kilimani', 'Rural', 1)
  INTO employee VALUES (2, 'Bakari Iniko', '+99222599041 ', NULL, '18 Mlima Tazama Avenue', 'Hawassa', 'Rural', 1)
  INTO employee VALUES (3, 'Malachi Mavuso', '+99945849900 ', NULL, '100 Mogadishu Road', 'Akatsi', 'Lusaka', 1)
  INTO employee VALUES (4, 'Cheche Buhle', '+99381679640 ', NULL, '1 Savanna Street', 'Akatsi', 'Rural', 1)
  INTO employee VALUES (5, 'Zuriel Matembo', '+99034075111 ', NULL, '26 Bahari Ya Faraja Road', 'Kilimani', 'Rural', 1)
  INTO employee VALUES (6, 'Deka Osumare', '+99379364631 ', NULL, '104 Kenyatta Street', 'Akatsi', 'Rural', 1)
  INTO employee VALUES (7, 'Lalitha Kaburi', '+99681623240 ', NULL, '145 Sungura Amanpour Road', 'Kilimani', 'Rural', 1)
  INTO employee VALUES (8, 'Enitan Zuri', '+99248509202 ', NULL, '117 Kampala Road', 'Hawassa', 'Zanzibar', 1)
  INTO employee VALUES (10, 'Farai Nia', '+99570082739 ', NULL, '33 Angélique Kidjo Avenue', 'Amanzi', 'Dahabu', 1)
  INTO employee VALUES (12, 'Gamba Shani', '+99438283153 ', NULL, '38 Mlima Tazama Avenue', 'Hawassa', 'Rural', 1)
  INTO employee VALUES (14, 'Harith Nyota', '+99917230124 ', NULL, '42 Malabo Drive', 'Kilimani', 'Rural', 1)
  INTO employee VALUES (16, 'Isoke Amani', '+99313603182 ', NULL, '55 Fennec Way', 'Sokoto', 'Rural', 1)
  INTO employee VALUES (18, 'Jengo Tumaini', '+99820596465 ', NULL, '17 Port Harcourt Boulevard', 'Akatsi', 'Kintampo', 1)
  INTO employee VALUES (20, 'Kunto Asha', '+99176320477 ', NULL, '30 Nyoka Achebe Street', 'Amanzi', 'Dahabu', 1)
  INTO employee VALUES (22, 'Lesedi Kofi', '+99611183730 ', NULL, '52 Moroni Avenue', 'Sokoto', 'Rural', 1)
  INTO employee VALUES (24, 'Makena Thabo', '+99690308755 ', NULL, '81 Rhodes Street', 'Hawassa', 'Rural', 1)
  INTO employee VALUES (26, 'Nia Furaha', '+99522694997 ', NULL, '51 Addis Ababa Road', 'Akatsi', 'Harare', 1)
  INTO employee VALUES (28, 'Ona Sefu', '+99797494944 ', NULL, '67 Wimbi Dira Avenue', 'Akatsi', 'Harare', 1)
  INTO employee VALUES (30, 'Pili Zola', '+99822478933 ', NULL, '46 Stone Town Street', 'Hawassa', 'Zanzibar', 1)
  INTO employee VALUES (32, 'Quibilah Akua', '+99533195846 ', NULL, '77 Kinshasa Boulevard', 'Sokoto', 'Rural', 1)
  INTO employee VALUES (34, 'Rudo Imani', '+99046972648 ', NULL, '15 Lake Malawi Avenue', 'Kilimani', 'Ilanga', 1)
  INTO employee VALUES (36, 'Sanaa Tendaji', '+99477692836 ', NULL, '88 Elephantine Boulevard', 'Amanzi', 'Dahabu', 1)
  INTO employee VALUES (38, 'Thandiwe Kito', '+99895654233 ', NULL, '106 Dakar Road', 'Hawassa', 'Zanzibar', 1)
  INTO employee VALUES (40, 'Usafi Ayo', '+99613194771 ', NULL, '76 Kenyatta Street', 'Sokoto', 'Rural', 1)
  INTO employee VALUES (42, 'Vuyisile Kwame', '+99489752164 ', NULL, '1 Zambezi Way', 'Kilimani', 'Rural', 1)
  INTO employee VALUES (44, 'Wambui Jabali', '+99269319001 ', NULL, '31 Mandela Road', 'Hawassa', 'Rural', 1)
  INTO employee VALUES (46, 'Xola Uzuri', '+99239172440 ', NULL, '50 Enkare Narok Avenue', 'Amanzi', 'Dahabu', 1)
  INTO employee VALUES (48, 'Yewande Ebele', '+99239164858 ', NULL, '119 Moroni Avenue', 'Hawassa', 'Rural', 1)
  INTO employee VALUES (49, 'Nadia Zalika', '+99578401238 ', NULL, '26 Bahari Ya Faraja Road', 'Kilimani', 'Rural', 2)
  INTO employee VALUES (50, 'Ayo Deka', '+99345162378 ', NULL, '18 Mlima Tazama Avenue', 'Hawassa', 'Rural', 3)
  INTO employee VALUES (52, 'Bahira Jamila', '+99239271483 ', NULL, '30 Nyoka Achebe Street', 'Amanzi', 'Dahabu', 4)
  INTO employee VALUES (53, 'Chidi Kunto', '+99738251476 ', NULL, '146 Okapi Road', 'Hawassa', 'Yaounde', 5)
  INTO employee VALUES (54, 'Dalila Lesedi', '+99471523698 ', NULL, '18 Casablanca Road', 'Sokoto', 'Rural', 5)
  INTO employee VALUES (56, 'Eshe Makena', '+99381254763 ', NULL, '45 Umqombothi Avenue', 'Hawassa', 'Serowe', 6)
  INTO employee VALUES (58, 'Faridah Khalida', '+99142537684 ', NULL, '176 Port Said Street', 'Kilimani', 'Harare', 7)
  INTO employee VALUES (62, 'Gavivi Ona', '+99924513876 ', NULL, '51 Addis Ababa Road', 'Akatsi', 'Harare', 8)
  INTO employee VALUES (64, 'Hasani Pili', '+99568247135 ', NULL, '33 Afro Beat Road', 'Hawassa', 'Serowe', 9)
  INTO employee VALUES (68, 'Iniko Quibilah', '+99735681472 ', NULL, '93 Afro Beat Road', 'Hawassa', 'Serowe', 10)
  INTO employee VALUES (71, 'Jengo Rudo', '+99317854629 ', NULL, '33 Angélique Kidjo Avenue', 'Amanzi', 'Dahabu', 11)
  INTO employee VALUES (73, 'Kofi Sanaa', '+99874512369 ', NULL, '42 Malabo Drive', 'Kilimani', 'Rural', 12)
  INTO employee VALUES (75, 'Lulu Thandiwe', '+99127436598 ', NULL, '117 Kampala Road', 'Hawassa', 'Zanzibar', 13)
  INTO employee VALUES (79, 'Makena Usafi', '+99583124796 ', NULL, '55 Fennec Way', 'Sokoto', 'Rural', 14)
  INTO employee VALUES (81, 'Nia Vuyisile', '+99273841596 ', NULL, '52 Moroni Avenue', 'Sokoto', 'Rural', 11)
  INTO employee VALUES (83, 'Ona Wambui', '+99968217435 ', NULL, '81 Rhodes Street', 'Hawassa', 'Rural', 15)
  INTO employee VALUES (87, 'Pili Xola', '+99682314579 ', NULL, '31 Samora Machel Road', 'Kilimani', 'Harare', 11)
  INTO employee VALUES (89, 'Quibilah Yewande', '+99721534698 ', NULL, '110 Nyerere Road', 'Kilimani', 'Rural', 16)
  INTO employee VALUES (93, 'Rudo Zalika', '+99578123469 ', NULL, '7 Dakar Drive', 'Akatsi', 'Lusaka', 22)
  INTO employee VALUES (94, 'Sanaa Ayo', '+99375418692 ', NULL, '172 Fisi Nkrumah Street', 'Akatsi', 'Rural', 17)
  INTO employee VALUES (96, 'Thabo Akida', '+99178325649 ', NULL, '24 Okonjo-Iweala Street', 'Akatsi', 'Lusaka', 18)
  INTO employee VALUES (98, 'Usafi Bahir', '+99234156789 ', NULL, '1 Savanna Street', 'Akatsi', 'Rural', 19)
  INTO employee VALUES (102, 'Vuyisile Ghadir', '+99712584936 ', NULL, '104 Kenyatta Street', 'Akatsi', 'Rural', 20)
  INTO employee VALUES (104, 'Wambui Hadiya', '+99634157892 ', NULL, '145 Sungura Amanpour Road', 'Kilimani', 'Rural', 21)
  INTO employee VALUES (105, 'Xola Inaya', '+99231569847 ', NULL, '100 Mogadishu Road', 'Akatsi', 'Lusaka', 22)
  INTO employee VALUES (108, 'Yewande Jengo', '+99123456978 ', NULL, '25 Selassie Drive', 'Amanzi', 'Rural', 23)
  INTO employee VALUES (110, 'Zuri Kofi', '+99412356789 ', NULL, '36 Pwani Mchangani Road', 'Sokoto', 'Ilanga', 24)
  INTO employee VALUES (111, 'John Public', '+99911112222', 'john.public@example.com', '123 Public Street', 'Akatsi', 'Rural', 25)
  INTO employee VALUES(112, 'Alice Researcher', '+99933334444', 'alice.researcher@example.com', '456 Research Avenue', 'Kilimani', 'Rural', 26)
  INTO employee VALUES (113, 'Bob Admin', '+99955556666', 'bob.admin@example.com', '789 Admin Lane', 'Sokoto', 'Ilanga', 27)

SELECT * FROM dual;


--done 
-- Table structure for table `user_data`
--
CREATE TABLE user_data (
    user_name VARCHAR2(255),
    email VARCHAR2(255),
    password VARCHAR2(255),
    user_id NUMBER NOT NULL,
    CONSTRAINT user_data_pk PRIMARY KEY (user_id),
    CONSTRAINT user_data_fk FOREIGN KEY (user_id) REFERENCES employee (assigned_employee_id)
);
--done 
-- inserting data for table `user_data`
--

INSERT ALL
  INTO user_data VALUES ('Amara Jengo', NULL, 'password1', 0)
  INTO user_data VALUES ('Bello Azibo', NULL, 'password2', 1)
  INTO user_data VALUES ('Bakari Iniko', NULL, 'password3', 2)
  INTO user_data VALUES ('Malachi Mavuso', NULL, 'password4', 3)
  INTO user_data VALUES ('Cheche Buhle', NULL, 'password5', 4)
  INTO user_data VALUES ('Zuriel Matembo', NULL, 'password6', 5)
  INTO user_data VALUES ('Deka Osumare', NULL, 'password7', 6)
  INTO user_data VALUES ('Lalitha Kaburi', NULL, 'password8', 7)
  INTO user_data VALUES ('Enitan Zuri', NULL, 'password9', 8)
  INTO user_data VALUES ('Farai Nia', NULL, 'password10', 10)
  INTO user_data VALUES ('Gamba Shani', NULL, 'password11', 12)
  INTO user_data VALUES ('Harith Nyota', NULL, 'password12', 14)
  INTO user_data VALUES ('Isoke Amani', NULL, 'password13', 16)
  INTO user_data VALUES ('Jengo Tumaini', NULL, 'password14', 18)
  INTO user_data VALUES ('Kunto Asha', NULL, 'password15', 20)
  INTO user_data VALUES ('Lesedi Kofi', NULL, 'password16', 22)
  INTO user_data VALUES ('Makena Thabo', NULL, 'password17', 24)
  INTO user_data VALUES ('Nia Furaha', NULL, 'password18', 26)
  INTO user_data VALUES ('Ona Sefu', NULL, 'password19', 28)
  INTO user_data VALUES ('Pili Zola', NULL, 'password20', 30)

SELECT * FROM dual;

--
-- Table structure for table `roles`
--
CREATE TABLE roles(
    role_id NUMBER,
    role_name VARCHAR2(255),
    CONSTRAINT roles_pk PRIMARY KEY (role_id)
);

--
-- inserting data for table `roles`
--
INSERT ALL
  INTO roles VALUES (1, 'Field Surveyor')
  INTO roles VALUES (2, 'Project Manager')
  INTO roles VALUES (3, 'UI/UX Designer')
  INTO roles VALUES (4, 'Front-end Developer')
  INTO roles VALUES (5, 'Data Analyst')
  INTO roles VALUES (6, 'Human Resources Specialist')
  INTO roles VALUES (7, 'Pioneer')
  INTO roles VALUES (8, 'Financial Analyst')
  INTO roles VALUES (9, 'Deputy Project Manager')
  INTO roles VALUES (10, 'Financial Manager')
  INTO roles VALUES (11, 'Civil Engineer')
  INTO roles VALUES (12, 'Creative Designer')
  INTO roles VALUES (13, 'Team Leader')
  INTO roles VALUES (14, 'Quality Assurance Analyst')
  INTO roles VALUES (15, 'Public Relations Specialist')
  INTO roles VALUES (16, 'Supervisor')
  INTO roles VALUES (17, 'Data Scientist')
  INTO roles VALUES (18, 'Engineering Department Head')
  INTO roles VALUES (19, 'Analytical Chemist')
  INTO roles VALUES (20, 'Micro Biologist')
  INTO roles VALUES (21, 'Compliance Officer')
  INTO roles VALUES (22, 'Field Engineer')
  INTO roles VALUES (23, 'Construction Manager')
  INTO roles VALUES (24, 'Graphic Designer')
  INTO roles VALUES (25, 'Public Viewer')
  INTO roles VALUES (26, 'Field Researcher')
  INTO roles VALUES (27, 'Administrator')
SELECT * FROM dual;
-- done

--
-- Table structure for table `global_water_access`
--

CREATE TABLE global_water_access (
  name VARCHAR2(255),
  region VARCHAR2(255),
  year NUMBER,
  pop_n FLOAT,
  pop_u FLOAT,
  wat_bas_n FLOAT,
  wat_lim_n FLOAT,
  wat_unimp_n FLOAT,
  wat_sur_n FLOAT,
  wat_bas_r FLOAT,
  wat_lim_r FLOAT,
  wat_unimp_r FLOAT,
  wat_sur_r FLOAT,
  wat_bas_u FLOAT,
  wat_lim_u FLOAT,
  wat_unimp_u FLOAT,
  wat_sur_u FLOAT
);

--
-- inserting data for table `global_water_access`
--
INSERT ALL
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Afghanistan', 'South Asia', 2015, 34413.6, 24.803, 61.3398, 3.5112, 22.1688, 12.9802, 52.9885, 3.86114, 26.5533, 16.5971, 86.6589, 2.45027, 8.87604, 2.01475)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Afghanistan', 'South Asia', 2020, 38928.3, 26.026, 75.0914, 1.44754, 14.5603, 8.90078, 66.3279, 1.95682, 19.6829, 12.0323, 100, 0, 0, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Albania', 'Europe and Central Asia', 2015, 2890.52, 57.434, 93.3943, 3.62638, 2.97929, 0, 90.6273, 5.26317, 4.10955, 0, 95.4451, 2.41331, 2.14162, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Albania', 'Europe and Central Asia', 2020, 2877.8, 62.112, 95.068, 1.88466, 3.04731, 0, 94.0914, 2.30526, 3.60338, 0, 95.6638, 1.62809, 2.7081, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Algeria', 'Middle East and North Africa', 2015, 39728, 70.848, 93.4096, 5.15778, 1.27546, 0.157193, 88.3527, 8.68575, 2.58043, 0.381108, 95.4903, 3.70612, 0.73851, 0.0650579)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Algeria', 'Middle East and North Africa', 2020, 43851, 73.733, 94.4373, 4.98588, 0.531837, 0.0449525, 90.0375, 8.79672, 0.994603, 0.171137, 96.0047, 3.62829, 0.366976, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('American Samoa', 'East Asia and Pacific', 2015, 55.806, 87.238, 99.6191, 0, 0.380897, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('American Samoa', 'East Asia and Pacific', 2020, 55.197, 87.153, 99.7738, 0, 0.226228, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Andorra', 'Europe and Central Asia', 2015, 77.993, 88.345, 100, 0, 0.00000244554, 0, 100, 0, 0, 0, 100, 0, 0, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Andorra', 'Europe and Central Asia', 2020, 77.265, 87.916, 100, 0, 0, 0, 100, 0, 0, 0, 100, 0, 0, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Angola', 'Sub-Saharan Africa', 2015, 27884.4, 63.446, 54.3169, 11.3686, 17.3724, 16.9421, 26.7144, 9.93107, 21.7253, 41.6293, 70.22, 12.1969, 14.8644, 2.71875)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Angola', 'Sub-Saharan Africa', 2020, 32866.3, 66.825, 57.1677, 9.28735, 19.4508, 14.0941, 27.8082, 8.74049, 22.9332, 40.5181, 71.7431, 9.55884, 17.722, 0.975979)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Anguilla', 'Latin America and Caribbean', 2015, 14.279, 100, 97.4823, 0, 2.51773, 0, NULL, NULL, NULL, NULL, 97.4823, 0, 2.51773, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Anguilla', 'Latin America and Caribbean', 2017, 14.588, 100, 97.4823, 0, 2.51773, 0, NULL, NULL, NULL, NULL, 97.4823, 0, 2.51773, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Antigua and Barbuda', 'Latin America and Caribbean', 2015, 93.571, 25, 96.7392, 0, 3.16635, 0.0944661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Antigua and Barbuda', 'Latin America and Caribbean', 2017, 95.425, 24.713, 96.7392, 0, 3.16635, 0.0944661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Argentina', 'Latin America and Caribbean', 2015, 43075.4, 91.503, 98.9666, 0, 0.664914, 0.368497, 92.9837, 0, 2.67954, 4.33679, 99.5222, 0, 0.477837, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Argentina', 'Latin America and Caribbean', 2020, 45195.8, 92.111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.7904, 0, 0.209579, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Armenia', 'Europe and Central Asia', 2015, 2925.56, 63.085, 99.5526, 0, 0.0985051, 0.348928, 99.0548, 0, 0, 0.945221, 99.8439, 0, 0.156147, 0)
    
    INTO global_water_access (name, region, year, pop_n, pop_u, wat_bas_n, wat_lim_n, wat_unimp_n, wat_sur_n, wat_bas_r, wat_lim_r, wat_unimp_r, wat_sur_r, wat_bas_u, wat_lim_u, wat_unimp_u, wat_sur_u)
    VALUES ('Armenia', 'Europe and Central Asia', 2020, 2963.23, 63.313, 99.9712, 0, 0.0288193, 0, 100, 0, 0, 0, 99.9545, 0, 0.0455188, 0)
SELECT * FROM dual;
--
-- Table structure for table `location`
--

CREATE TABLE location (
  location_id VARCHAR2(255) NOT NULL,
  address VARCHAR2(255),
  province_name VARCHAR2(255),
  town_name VARCHAR2(255),
  location_type VARCHAR2(255),
  CONSTRAINT location_pk PRIMARY KEY (location_id)
);

--done
-- Dumping data for table `location`
--

INSERT ALL
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00000','2 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00001','10 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00002','9 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00003','139 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00004','17 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00005','125 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00006','98 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00007','21 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00008','11 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00009','6 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00010','28 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00011','32 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00012','52 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00013','81 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00014','142 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00015','22 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00016','55 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00017','60 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00018','120 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00019','150 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00020','16 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00021','57 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00022','132 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00023','147 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00024','116 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00025','76 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00026','82 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00027','144 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00028','72 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00029','29 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00030','121 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00031','88 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00032','75 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00033','49 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00034','95 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00035','31 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00036','54 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00037','19 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00038','37 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00039','137 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00040','63 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00041','25 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00042','86 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00043','104 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00044','138 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00045','107 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00046','140 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00047','141 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00048','102 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00049','96 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00050','45 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00051','46 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00052','48 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00053','83 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00054','5 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00055','108 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00056','110 Addis Ababa Road','Akatsi','Harare','Urban')
INTO location(location_id, address, province_name, town_name, location_type) VALUES ('AkHa00057','53 Addis Ababa Road','Akatsi','Harare','Urban')
SELECT * FROM dual;
-- done
-- Table structure for table `visits`
--


CREATE TABLE visits (
  record_id NUMBER NOT NULL,
  location_id VARCHAR2(255),
  source_id VARCHAR2(510),
  time_of_record DATE,
  visit_count NUMBER,
  time_in_queue NUMBER,
  assigned_employee_id NUMBER,
  CONSTRAINT visits_PK PRIMARY KEY (record_id),
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES location (location_id),
  CONSTRAINT fk_source FOREIGN KEY (source_id) REFERENCES water_source (source_id),
  CONSTRAINT fk_assigned_employee FOREIGN KEY (assigned_employee_id) REFERENCES employee (assigned_employee_id)
);

--done
-- Dumping data for table `visits`
--

INSERT ALL
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (0,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 15, 12)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (1,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 09:17:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 46)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (2,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 09:36:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 62, 40)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (3,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 09:53:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 1)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (4,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 10:11:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 28, 14)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (5,'AkHa00000','AkHa00012224', TO_DATE('2021-01-01 10:17:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 9, 40)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (6,'AkHa00001','AkHa00012224', TO_DATE('2021-01-01 10:18:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 30)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (7,'AkHa00001','AkHa00012224', TO_DATE('2021-01-01 10:28:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 34)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (8,'AkHa00002','AkHa00012224', TO_DATE('2021-01-01 10:37:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 6)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (9,'AkHa00002','AkHa00012224', TO_DATE('2021-01-01 10:58:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 36)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (10,'AkHa00002','AkHa00012224', TO_DATE('2021-01-01 11:04:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 16)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (11,'AkHa00003','AkHa00012224', TO_DATE('2021-01-01 11:04:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 17, 26)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (12,'AkHa00003','AkHa00000224', TO_DATE('2021-01-01 11:04:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 240, 1)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (13,'AkHa00003','AkHa00000224', TO_DATE('2021-01-01 11:14:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 32)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (14,'AkHa00003','AkHa00000224', TO_DATE('2021-01-01 11:16:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 6)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (15,'AkHa00003','AkHa00000224', TO_DATE('2021-01-01 11:29:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 32)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (16,'AkHa00004','AkHa00000224', TO_DATE('2021-01-01 11:33:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 48)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (17,'AkHa00004','AkHa00000224', TO_DATE('2021-01-01 11:42:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 40)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (18,'AkHa00004','AkHa00000224', TO_DATE('2021-01-01 11:51:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 12)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (19,'AkHa00004','AkHa00000224', TO_DATE('2021-01-01 11:52:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 30)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (20,'AkHa00004','AkHa00000224', TO_DATE('2021-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 20, 30)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (21,'AkHa00005','AkHa00000224', TO_DATE('2021-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 171, 46)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (22,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:03:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 8)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (23,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:12:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 7)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (24,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:16:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 3)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (25,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:24:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 48)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (26,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:29:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 16)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (27,'AkHa00005','AkHa00068224', TO_DATE('2021-01-01 12:34:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, 5)
INTO visits (record_id, location_id, source_id, time_of_record, visit_count, time_in_queue, assigned_employee_id) 
VALUES (28,'AkHa00009','AkHa00068224',TO_DATE('2021-01-01 12:42:00', 'YYYY-MM-DD HH24:MI:SS'),1,0,12)

SELECT * FROM dual;

--
-- Table structure for table `water_quality`
--

CREATE TABLE water_quality (
  record_id NUMBER NOT NULL,
  subjective_quality_score NUMBER,
  visit_count NUMBER,
  CONSTRAINT water_quality_pk PRIMARY KEY (record_id),
  CONSTRAINT water_quality_fk FOREIGN KEY (record_id) REFERENCES visits (record_id)
);



--done
-- Dumping data for table `water_quality`
--
INSERT ALL
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (0, 0, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (1, 1, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (2, 5, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (3, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (4, 4, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (5, 0, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (6, 9, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (7, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (8, 2, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (9, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (10, 3, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (11, 7, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (12, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (13, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (14, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (15, 1, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (16, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (17, 2, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (18, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (19, 3, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (20, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (21, 3, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (22, 2, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (23, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (24, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (25, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (26, 2, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (27, 10, 1)
  INTO water_quality (record_id, subjective_quality_score, visit_count) VALUES (28, 9, 1)
  
SELECT * FROM dual;
--
-- Table structure for table `water_source`
--

CREATE TABLE water_source (
  source_id VARCHAR2(510) NOT NULL,
  type_of_water_source VARCHAR2(255),
  number_of_people_served NUMBER,
  CONSTRAINT water_source_pk PRIMARY KEY (source_id)
);

-- done 
-- Dumping data for table `water_source`
--

INSERT ALL
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00000224','tap_in_home',956)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00001224','tap_in_home_broken',930)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00002224','tap_in_home_broken',486)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00003224','well',364)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00004224','tap_in_home_broken',942)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00005224','tap_in_home',736)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00006224','tap_in_home',882)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00007224','tap_in_home',554)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00008224','well',398)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00009224','well',346)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00010224','well',236)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00011224','well',168)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00012224','well',192)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00013224','shared_tap',2212)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00014224','tap_in_home_broken',574)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00015224','tap_in_home',862)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00016224','well',278)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00017224','tap_in_home_broken',414)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00018224','well',390)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00019224','tap_in_home_broken',320)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00020224','well',234)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00021224','tap_in_home_broken',330)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00022224','well',304)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00023224','tap_in_home_broken',954)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00024224','well',292)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00025224','tap_in_home',354)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00026224','well',388)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00027224','well',224)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00028224','well',306)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00029224','tap_in_home_broken',816)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00030224','well',366)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00031224','well',354)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00032224','well',382)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00033224','well',384)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00034224','well',210)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00035224','tap_in_home_broken',920)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00036224','shared_tap',3488)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00037224','well',348)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00038224','well',308)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00039224','well',252)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00040224','tap_in_home_broken',338)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00041224','tap_in_home',672)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00042224','tap_in_home',766)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00043224','tap_in_home_broken',364)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00044224','well',304)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00045224','well',370)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00046224','well',186)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00047224','well',324)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00048224','well',174)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00049224','tap_in_home_broken',892)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00050224','tap_in_home_broken',716)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00051224','tap_in_home',900)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00052224','tap_in_home',374)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00053224','tap_in_home_broken',748)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00054224','well',378)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00055224','tap_in_home',562)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00056224','well',328)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00057224','tap_in_home_broken',876)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00058224','well',290)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00059224','well',316)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00060224','tap_in_home_broken',376)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00061224','tap_in_home',908)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00062224','tap_in_home_broken',576)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00063224','well',306)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00064224','tap_in_home_broken',538)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00065224','tap_in_home_broken',874)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00066224','tap_in_home',722)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00067224','well',302)
INTO water_source (source_id, type_of_water_source, number_of_people_served) VALUES ('AkHa00068224','well',264)
SELECT * FROM dual;

--
-- Table structure for table `well_pollution`
--

CREATE TABLE well_pollution (
  source_id VARCHAR2(258),
  test_date DATE,
  description VARCHAR2(255),
  pollutant_ppm FLOAT,
  biological FLOAT,
  results VARCHAR2(255),
  CONSTRAINT well_pollution_pk PRIMARY KEY (source_id),
  CONSTRAINT well_pollution_fk FOREIGN KEY (source_id) REFERENCES water_source (source_id)
);


--done
-- Dumping data for table `well_pollution`
--
INSERT ALL
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00068224', TO_DATE('2021-01-04 09:17:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bacteria: Giardia Lamblia', 0, 495.898, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00067224', TO_DATE('2021-01-04 09:53:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bacteria: E. coli', 0, 6.09608, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00066224', TO_DATE('2021-01-04 10:37:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Zinc, Zinc, Lead, Cadmium', 2.715, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00065224', TO_DATE('2021-01-04 11:04:00', 'YYYY-MM-DD HH24:MI:SS'), 'Clean', 0.0288593, 0.0000956996, 'Clean')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00057224', TO_DATE('2021-01-04 11:29:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bacteria: E. coli', 0, 22.5009, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00056224', TO_DATE('2021-01-04 11:42:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Cadmium', 5.46739, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00058224', TO_DATE('2021-01-04 11:52:00', 'YYYY-MM-DD HH24:MI:SS'), 'Clean', 0.0140376, 0.0000898989, 'Clean')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00059224', TO_DATE('2021-01-04 12:03:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Chromium, Barium, Chromium, Lead', 6.05137, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00055224', TO_DATE('2021-01-04 12:24:00', 'YYYY-MM-DD HH24:MI:SS'), 'Parasite: Cryptosporidium', 0, 485.162, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00054224', TO_DATE('2021-01-04 12:29:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Selenium, Arsenic', 7.64106, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00053224', TO_DATE('2021-01-04 12:56:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Silver, Zinc, Zinc, Lead', 1.99096, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00052224', TO_DATE('2021-01-04 13:07:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Silver', 5.89926, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00051224', TO_DATE('2021-01-04 13:44:00', 'YYYY-MM-DD HH24:MI:SS'), 'Clean', 0.084344, 0.000062396, 'Clean')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00048224', TO_DATE('2021-01-04 13:46:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bacteria: Vibrio cholerae', 0, 182.88, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00047224', TO_DATE('2021-01-04 13:52:00', 'YYYY-MM-DD HH24:MI:SS'), 'Bacteria: E. coli', 0, 44.2164, 'Contaminated: Biological')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00049224', TO_DATE('2021-01-04 14:19:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Zinc', 1.06885, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00046224', TO_DATE('2021-01-04 14:49:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Chromium, Zinc', 4.15909, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00045224', TO_DATE('2021-01-04 16:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'Clean', 0.0862577, 0.0000422834, 'Clean')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00044224', TO_DATE('2021-01-04 16:28:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Lead, Mercury, Copper', 4.97264, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00043224', TO_DATE('2021-01-04 16:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'Inorganic contaminants: Copper', 1.28796, 0, 'Contaminated: Chemical')
  INTO well_pollution (source_id, test_date, description, pollutant_ppm, biological, results) VALUES ('AkHa00042224', TO_DATE('2021-01-07 09:08:00', 'YYYY-MM-DD HH24:MI:SS'), 'Clean', 0.0599682, 0.0000242289, 'Clean')
SELECT * FROM dual;