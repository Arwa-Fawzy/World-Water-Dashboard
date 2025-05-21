# main.py
from kivy.app import App
import pickle
from kivymd.app import MDApp
from kivy.lang import Builder
from kivy.core.window import Window
from kivy.uix.screenmanager import ScreenManager, Screen
from kivymd.uix.screen import MDScreen
from utils.DB_Utils import DatabaseUtils
import os


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

    def generate_report(self):
        pass

    def manage_accounts(self):
        pass

    def generate_system_log(self):
        filename = self.manager.db_utils.write_logs_to_file()
        logs_folder = os.path.join('C:', 'Users', 'krhas', 'Downloads', 'Compressed', 'Archive')
        full_path = os.path.join(logs_folder, filename)
        full_path = full_path.replace(os.sep, '/')

        os.startfile(full_path)

    def assign_tasks(self):
        pass

    def edit_permissions(self):
        pass

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
