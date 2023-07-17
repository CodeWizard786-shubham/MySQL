from Joinlogger import logger
import pandas as pd
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


class JOINS:
    def __init__(self):
        self.conn = getConnection()
        self.cursor = self.conn.cursor()

    def get_dataframe(self,query):
        self.cursor.execute(query)
        col_name = [column[0] for column in self.cursor.description]
        # Convert SQL to DataFrame
        df = pd.DataFrame(self.cursor.fetchall(),columns=col_name)
        print(df)


    def use_database(self):
        try:
            self.cursor.execute("use employeedb")
            logger.info("Database connected")

        except Exception as e:
            logger.error(str(e))

    def inner_join(self):
        try:
            sql_query= "select emp.emp_name,project.department from emp INNER JOIN project on project.emp_id = emp.emp_id"
            self.get_dataframe(sql_query)
            logger.info("Inner join successfully Performed")
        except Exception as e:
            logger.error(f"Inner join Unsuccessfull:{str(e)}")

    def left_join(self):
        try:
            sql_query="select emp.emp_name,project.department from emp left JOIN project on project.emp_id = emp.emp_id"
            self.get_dataframe(sql_query)
            logger.info("Left join successfully Performed")
        except Exception as e:
            logger.error(f"Left join Unsuccessfull:{str(e)}")

    def right_join(self):
        try:
            sql_query = "select emp.emp_name,project.department from emp right JOIN project on project.emp_id = emp.emp_id"
            self.get_dataframe(sql_query)
            logger.info("Right join successfully Performed")
        except Exception as e:
            logger.error(f"Right join Unsuccessfull:{str(e)}")

    def full_join(self):
        try:
            sql_query = "select * from emp FULL JOIN project"
            self.get_dataframe(sql_query)
            logger.info("Full join successfully Performed")
        except Exception as e:
            logger.error(f"Full join Unsuccessfull:{str(e)}")

    def natural_join(self):
        try:
            sql_query = "select * from emp NATURAL JOIN project"
            self.get_dataframe(sql_query)
            logger.info("Natural join successfully Performed")
        except Exception as e:
            logger.error(f"Natural join Unsuccessfull:{str(e)}")

    def self_join(self):
        try:
            sql_query = "select * from emp a,emp b where a.emp_id = b.emp_id"
            self.get_dataframe(sql_query)
            logger.info("Self join successfully Performed")
        except Exception as e:
            logger.error(f"Self join Unsuccessfull:{str(e)}")

# Driver code
def main():
    joins=JOINS()
    joins.use_database()
    while True:
        print("--Join Operations--")
        print("1.Inner Join")
        print("2.Left Join")
        print("3.Right Join")
        print("4.Full Join")
        print("5.Natural Join")
        print("6.Self Join")
        print("7.Exit")
        user_choice = int(input("Enter choice: "))
        if user_choice == 1:
            joins.inner_join()
        elif user_choice == 2:
            joins.left_join()
        elif user_choice == 3:
            joins.right_join()
        elif user_choice == 4:
            joins.full_join()
        elif user_choice == 5:
            joins.natural_join()
        elif user_choice == 6:
            joins.self_join()
        elif user_choice == 7:
            break
        else:
            logger.warning("Invalid choice")


if __name__ == "__main__":
    main()