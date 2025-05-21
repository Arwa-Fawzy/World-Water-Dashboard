import cx_Oracle
import os

from constants import *

from datetime import datetime
import os


class DatabaseUtils:
    def __init__(self):
        self.connection_str = base_connection
        self.log_buffer = []

    def log(self, message, log_type="info"):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        log_entry = f"{timestamp} - {log_type.upper()} - {message}"
        self.log_buffer.append(log_entry)
        print(self.log_buffer)

    def write_logs_to_file(self, base_filename="system_log", log_folder="logs"):
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        filename = os.path.join(log_folder, f"{base_filename}_{timestamp}.txt")

        os.makedirs(log_folder, exist_ok=True)

        with open(filename, "a") as log_file:
            for log_entry in self.log_buffer:
                log_file.write(log_entry + "\n")

        return filename

    def login(self, username, password):
        connection = None
        cursor = None

        try:
            connection = cx_Oracle.connect(self.connection_str)
            cursor = connection.cursor()

            cursor.execute(query_login, (username, password))
            user_id = cursor.fetchone()
            if user_id:
                cursor.execute(query_user_data, {'user_id': user_id[0]})
                user_data = cursor.fetchone()
                self.log(f"User '{username}' (ID: {user_id[0]}) logged in successfully.", log_type="login")
                return user_data

            return None

        except cx_Oracle.IntegrityError as integrity_error:
            violated_constraint = integrity_error.args[0].message
            self.log(f"IntegrityError: {violated_constraint}", log_type="error")
            print(f"IntegrityError: {violated_constraint}")
            return None

        except cx_Oracle.Error as error:
            self.log(f"Error connecting to Oracle database: {error}", log_type="error")
            print("Error connecting to Oracle database:", error)
            return None

        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()

    def register(self, employee_id, password):
        connection = None
        cursor = None

        try:
            connection = cx_Oracle.connect(self.connection_str)
            cursor = connection.cursor()

            cursor.execute(query_check_employee, {'employee_id': employee_id})
            existing_employee = cursor.fetchone()

            if existing_employee:
                try:
                    cursor.execute(query_insert_user, {'username': existing_employee[1], 'password': password, 'user_id': existing_employee[0]})
                    connection.commit()
                    self.log(f"User '{existing_employee[1]}' (ID: {existing_employee[0]}) registered successfully.", log_type="register")
                    return existing_employee[1]

                except cx_Oracle.IntegrityError as integrity_error:
                    violated_constraint = integrity_error.args[0].message
                    self.log(f"IntegrityError: {violated_constraint} using {existing_employee[1]} with id {existing_employee[0]}", log_type="error")
                    return None

            return None

        except cx_Oracle.Error as error:
            self.log(f"Error connecting to Oracle database: {error}", log_type="error")
            print("Error connecting to Oracle database:", error)
            return None

        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()

    def update_user(self, user_id, new_password, new_email):
        connection = None
        cursor = None

        try:
            connection = cx_Oracle.connect(self.connection_str)
            cursor = connection.cursor()

            cursor.execute(query_update_user,
                           {'new_password': new_password, 'new_email': new_email, 'user_id': user_id})
            connection.commit()

            return True

        except cx_Oracle.Error as error:
            self.log(f"Error connecting to Oracle database: {error}", log_type="error")
            print("Error connecting to Oracle database:", error)
            return False

        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()