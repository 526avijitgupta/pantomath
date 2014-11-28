#!/usr/bin/python

import MySQLdb

# Open database connection
db = MySQLdb.connect("localhost","root","im2gud","pantomath" )

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Drop table if it already exist using execute() method.
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE")

# Create table as per requirement
sql = """CREATE TABLE EMPLOYEE (
         FIRST_NAME  CHAR(20) NOT NULL,
         LAST_NAME  CHAR(20),
         AGE INT,  
         SEX CHAR(1),
         INCOME FLOAT )"""

cursor.execute(sql)

Ename = ['emp1','emp2','emp3']
Age = ['1','2','3']

for age in Age:
	age = int(age)

for i in range(len(Ename)):
	# print (Ename['%d'],Age['%d']) % (i,i)
	print Ename[i],Age[i]
	# index = Ename.index(name)
	# sql = "INSERT INTO EMPLOYEE(FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) VALUES (%s, 'Mohan', 20, 'M', 2000)", (name,)
	try:
	  # Execute the SQL command
	  cursor.execute("INSERT INTO EMPLOYEE(FIRST_NAME, AGE, SEX, INCOME) VALUES (%s, %s, 'M', 2000)", (Ename[i],int(Age[i])))
	  # Commit your changes in the database
	  db.commit()
	except:
	  # Rollback in case there is any error
	  db.rollback()

# disconnect from server
db.close()

print 'done'