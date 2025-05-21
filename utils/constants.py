base_connection = 'hr/hr@localhost:1521/xe'


######################## DML Selection ###########################

query_login = "SELECT user_id FROM user_data WHERE user_name = :1 AND password = :2"

query_user_data = "SELECT * FROM EMPLOYEE WHERE ASSIGNED_EMPLOYEE_ID = :user_id"
query_check_employee = "SELECT * FROM EMPLOYEE WHERE ASSIGNED_EMPLOYEE_ID = :employee_id"

######################## DML Insertion ###########################

query_insert_user = "INSERT INTO user_data (user_name, password, user_id) VALUES (:username, :password, :user_id)"

######################## DML Update ###########################

query_update_user = "UPDATE USERS SET password = :new_password, email = :new_email WHERE user_id = :user_id"

