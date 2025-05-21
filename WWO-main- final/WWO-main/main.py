# main.py
from kivy.app import App
import pickle
from kivymd.app import MDApp
from kivy.lang import Builder
from kivy.core.window import Window
from kivy.uix.screenmanager import ScreenManager, Screen
from kivymd.uix.screen import MDScreen
from DB_Utils import DatabaseUtils
import os
from kivymd.uix.dialog import MDDialog
from kivymd.uix.button import MDRaisedButton
from kivymd.uix.textfield import MDTextField
from tkinter import simpledialog, Toplevel,Label
import cx_Oracle

con_str = 'hr/hr@localhost:1521/xe'
conn = cx_Oracle.connect(con_str)
cur = conn.cursor()
class WindowManager(ScreenManager):
    user_details = {}
    db_utils = DatabaseUtils()

    def login(self, username, password):
        user_data = self.db_utils.login(username, password)
        
        if user_data:
            self.user_details = {
                'ASSIGNED_EMPLOYEE_ID': user_data[0],
                'EMPLOYEE_NAME': user_data[1],
                'PHONE_NUMBER': user_data[2],
                'EMAIL': user_data[3],
                'ADDRESS': user_data[4],
                'PROVINCE_NAME': user_data[5],
                'TOWN_NAME': user_data[6],
                'ROLE_ID': user_data[7]}
        else:
            self.current_screen.ids.error_label_login.text = "Invalid username or password"
            return

        if self.user_details["ROLE_ID"] == 1:
            self.current = 'role1_screen'
        elif self.user_details["ROLE_ID"] == 2:
            self.current = 'role2_screen'
        elif self.user_details["ROLE_ID"] == 3:
            self.current = 'role3_screen'
        elif self.user_details["ROLE_ID"] == 4:
            self.current = 'role4_screen'


class LoginScreen(MDScreen):
    def login(self):
        username = self.ids.user.text
        password = self.ids.password.text
        error_label = self.ids.error_label_login

        if not username or not password:
            error_label.text = "Invalid username or password"
            return
        self.manager.login(username, password)
        self.reset_page()
        return

    def navigate_to_register(self):
        self.manager.current = 'register_screen'

    def reset_page(self):
        self.ids.user.text = ''
        self.ids.password.text = ''
        self.ids.error_label_login = ''


class RegisterScreen(MDScreen):
    def register(self):
        employee_id = self.ids.employee_id.text
        password = self.ids.password_register.text

        if not employee_id or not password:
            self.ids.error_label_register.text = "Please fill in all fields"
            return

        username = self.manager.db_utils.register(employee_id, password)
        if username:
            self.ids.error_label_register.text = "Registration successful"
            self.manager.login(username, password)
        else:
            self.ids.error_label_register.text = "Invalid employee_id, registration failed"

    def navigate_to_login(self):
        self.manager.current = 'login_screen'


class role1Screen(MDScreen):
    def on_pre_enter(self, *args):
        user_details =  self.manager.user_details.copy()
        if user_details:
            self.ids.label_role1.text = f"Welcome, {user_details['EMPLOYEE_NAME']}!"

    def generate_report(self, *args):
        parent = Toplevel()
        table_name = simpledialog.askstring("Generate Report", "Enter table name:", parent=parent)

        if table_name:
            cur = conn.cursor()
            sqlTxt = "SELECT column_name, data_type FROM all_tab_columns WHERE table_name = :1"
            cur.execute(sqlTxt, (table_name.upper(),))
            result = cur.fetchall()
            cur.close()

            description = "\n".join([f"{row[0]}: {row[1]}" for row in result])

            description_label = Label(text=description)
            description_label.pack()

        else:
            error_label = Label(text="Invalid table name.")
            error_label.pack()


        
    def manage_accounts(self):
        # Create a button to delete data
        delete_button = MDRaisedButton(
            text="Delete Data",
            pos_hint={"center_x": 0.3, "center_y": 0.6},
            on_press=lambda *args: self.delete_data(self)
        )
        self.add_widget(delete_button)

        # Create a button to update data
        update_button = MDRaisedButton(
            text="Update Data",
            pos_hint={"center_x": 0.7, "center_y": 0.6},
            on_press=lambda *args: self.update_data(self)
        )
        self.add_widget(update_button)

    def delete_data(self, *args):
        # Use Toplevel as a temporary parent
        parent = Toplevel()
        table_name = simpledialog.askstring("Delete Data", "Enter table name:", parent=parent)
        condition_column = simpledialog.askstring("Delete Data", "Enter condition column:", parent=parent)
        condition_value = simpledialog.askstring("Delete Data", "Enter condition value:", parent=parent)

        # Debugging print statements
        print(f"Deleting from {table_name} where {condition_column} = {condition_value}")

        # Implement the delete data logic here
        cur = conn.cursor()
        sqlTxt = f"DELETE FROM {table_name} WHERE {condition_column} = :1"
        cur.execute(sqlTxt, (condition_value,))
        conn.commit()
        cur.close()

    def update_data(self, *args):
        # Use Toplevel as a temporary parent
        parent = Toplevel()
        table_name = simpledialog.askstring("Update Data", "Enter table name:", parent=parent)
        condition_column = simpledialog.askstring("Update Data", "Enter condition column:", parent=parent)
        condition_value = simpledialog.askstring("Update Data", "Enter condition value:", parent=parent)
        column_name = simpledialog.askstring("Update Data", "Enter column name:", parent=parent)
        new_value = simpledialog.askstring("Update Data", "Enter new value:", parent=parent)

        # Debugging print statements
        print(f"Updating {table_name} set {column_name} = {new_value} where {condition_column} = {condition_value}")

        # Implement the update data logic here
        cur = conn.cursor()
        sqlTxt = f"UPDATE {table_name} SET {column_name} = :1 WHERE {condition_column} = :2"
        cur.execute(sqlTxt, (new_value, condition_value))
        conn.commit()
        cur.close()
    def generate_system_log(self):
        filename = self.manager.db_utils.write_logs_to_file()
        logs_folder = os.path.join('C:', 'Users', 'mcc', 'Downloads', 'WWO-main', 'WWO-main')
        full_path = os.path.join(logs_folder, filename)
        full_path = full_path.replace(os.sep, '/')

        os.startfile(full_path)

    def assign_tasks(self):
        pass

    
    def edit_permissions(self, *args):
        parent = Toplevel(self)
        employee_name = simpledialog.askstring("Edit Permissions", "Enter employee name:")

        if employee_name:
            new_permissions = simpledialog.askstring("Edit Permissions", "Enter new permissions:")

            if new_permissions:
                cur = conn.cursor()
                sqlTxt = "UPDATE employee SET permissions = :1 WHERE employee_name = :2"
                cur.execute(sqlTxt, (new_permissions, employee_name))
                conn.commit()
                cur.close()

                messagebox.showinfo("Edit Permissions", "Permissions updated successfully.")
            else:
                messagebox.showerror("Edit Permissions", "Invalid permissions.")
        else:
            messagebox.showerror("Edit Permissions", "Invalid employee name.")

    def log_out(self):
        self.manager.user_details = {}
        self.manager.current = 'login_screen'


class role2Screen(MDScreen):
    def on_pre_enter(self, *args):
        user_details = self.manager.user_details.copy()
        if user_details:
            self.ids.welcome_label.text = f"Welcome, {user_details['EMPLOYEE_NAME']}!"


class role3Screen(MDScreen):
    def on_pre_enter(self, *args):
        user_details = self.manager.user_details.copy()
        if user_details:
            self.ids.welcome_label.text = f"Welcome, {user_details['EMPLOYEE_NAME']}!"


class role4Screen(MDScreen):
    def on_pre_enter(self, *args):
        user_details = self.manager.user_details.copy()
        if user_details:
            self.ids.welcome_label.text = f"Welcome, {user_details['EMPLOYEE_NAME']}!"


class MainApp(MDApp):
    def build(self):
        self.theme_cls.theme_style = "Dark"
        self.theme_cls.primary_palette = "BlueGray"

        Builder.load_file('pages/WindowManager.kv')

        sm = WindowManager()
        sm.add_widget(LoginScreen(name='login_screen'))
        sm.add_widget(RegisterScreen(name='register_screen'))
        sm.add_widget(role1Screen(name='role1_screen'))
        sm.add_widget(role2Screen(name='role2_screen'))
        sm.add_widget(role3Screen(name='role3_screen'))
        sm.add_widget(role4Screen(name='role4_screen'))

        return sm

    def on_start(self):
        Window.size = (1365, 1024)
        self.load_db_instance()

    def on_stop(self):
        self.save_db_instance()

    def save_db_instance(self):
        with open("db_utils_state.pkl", "wb") as file:
            pickle.dump(self.root.db_utils, file)

    def load_db_instance(self):
        try:
            with open("db_utils_state.pkl", "rb") as file:
                loaded_instance = pickle.load(file)
                self.root.db_utils = loaded_instance if loaded_instance else DatabaseUtils()
        except FileNotFoundError:
            self.root.db_utils = DatabaseUtils()


if __name__ == "__main__":
    MainApp().run()
