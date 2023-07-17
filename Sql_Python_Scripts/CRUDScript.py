from crudlogger import logger
import mysql.connector
from dotenv import load_dotenv
import os

def getConnection():
    try:
        load_dotenv()
        conn = mysql.connector.connect(
            host =os.getenv('DB_HOST'),
            user= os.getenv('DB_USER'),
            password=os.getenv('DB_PASS'),
            # user= 'root',
            # password= 'root',
        )
        logger.info("Connection successfull")
        return conn
    except Exception as e:
        logger.error(f"Connection failed:{str(e)}")

        
class CRUD:
    def __init__(self):
        self.conn = getConnection()
        self.cursor = self.conn.cursor()

    def use_database(self):
        try:
            database_name = input("Enter database name: ")
            self.cursor.execute(f"use {database_name}")
            logger.info("Database found")
            return database_name
        except Exception as e:
            logger.error("Database not found")

    def show_all_tables(self):
        self.cursor.execute("show tables")
        tables = self.cursor.fetchall()
        for table in tables:
            print(table[0])

    def check_table(self, table_name):
        try:
            self.cursor.execute(f"SHOW TABLES LIKE '{table_name}'")
            result = self.cursor.fetchone()
            if result:
                return True
            else:
                print("Table does not exist")
                return False

        except Exception as e:
            logger.error(str(e))

    def insert_data(self, table_name):
        try:
            id = input("Enter id: ")
            ename = input("Enter employee name: ")
            department = input("Enter department name: ")
            address = input("Enter employee address: ")

            self.cursor.execute(
                f"insert into {table_name}(id, ename, department, address) values('{id}', '{ename}', '{department}', '{address}')"
            )
            self.conn.commit()
            logger.info(f"Data successfully inserted into {table_name}")
        except Exception as e:
            logger.error(str(e))

    def read_data(self, table_name):
        try:
            self.cursor.execute(f"select * from {table_name}")
            data = self.cursor.fetchall()
            for row in data:
                print(row)
        except Exception as e:
            logger.error(str(e))

    def update_data(self, table_name):
        try:
            id = input("Enter id of the row to update: ")
            ename = input("Enter new employee name: ")
            department = input("Enter new department name: ")
            address = input("Enter new employee address: ")

            self.cursor.execute(
                f"update {table_name} set ename='{ename}', department='{department}', address='{address}' where id={id}"
            )
            self.conn.commit()
            logger.info("Data successfully updated")
        except Exception as e:
            logger.error(str(e))

    def delete_data(self, table_name):
        try:
            id = input("Enter id of the row to delete: ")
            self.cursor.execute(f"delete from {table_name} where id={id}")
            self.conn.commit()
            logger.info("Data successfully deleted")
        except Exception as e:
            logger.error(str(e))


# Driver code
def main():
    crud = CRUD()
    print("Welcome to CRUD Database Operations--")
    crud.use_database()
    crud.show_all_tables()
    table_name = input("Enter table name: ")
    if crud.check_table(table_name):
        while True:
            print("--CRUD Operations--")
            print("1. Insert Data")
            print("2. Update Data")
            print("3. Delete Data")
            print("4. Read Data")
            print("5. Exit")
            user_choice = int(input("Enter choice: "))
            if user_choice == 1:
                crud.insert_data(table_name)
            elif user_choice == 2:
                crud.update_data(table_name)
            elif user_choice == 3:
                crud.delete_data(table_name)
            elif user_choice == 4:
                crud.read_data(table_name)
            elif user_choice == 5:
                break
            else:
                logger.warning("Please enter a correct choice [1-5]")


if __name__ == "__main__":
    main()
