import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-52-23-45-36.compute-1.amazonaws.com',
            database='dd693ed8lrqth5',
            user='fvujgqqzjiitdm',
            password='0759a9964d0bca7d3cd73fef9088e5c3ff33dd8cf4df92117fd709cc2fcbc81a'
        )

    #No Robot vira uma KW automagicamente => Remove Student     email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self, name):
        
        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
    
    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                 "values('{}','{}',{},{},{},NOW(), NOW());"
                 .format(student['name'], student['email'],student['age'], student['weight'], student['feet_tall']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()    

    def remove_plan(self, title):
        
        query = "delete from plans where title LIKE '%{}%'".format(title)
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_plan(self, plan):

        self.remove_plan(plan['title'])

        query = ("insert into plans (title, duration, price, created_at, updated_at)"
                 "values('{}', {}, {},NOW(), NOW());"
                 .format(plan['title'], plan['duration'], plan['price']))
        info(query)

        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    #exercicio aula 27
    def remove_plan_by_title(self, title):
        
        query = "delete from plan where name LIKE '%{}%'".format(title)
        info(query)
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()