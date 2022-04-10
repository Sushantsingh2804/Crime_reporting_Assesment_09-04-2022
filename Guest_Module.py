from flask import Flask, request, render_template,session
import sqlite3 as sql
from flask_session import Session
from werkzeug.utils import redirect

connection=sql.connect("CrimeReport.db",check_same_thread=False)

listofuser = connection.execute("select name from sqlite_master where type='table' AND name='Guest'").fetchall()

if listofuser!=[]:
    print("Table exist already")
else:
    connection.execute('''create table Guest(
                             ID integer primary key autoincrement,
                             date text,
                             description text,
                             remark text                            
                             )''')
    print("Table Created Successfully")

guest=Flask(__name__)



@guest.route("/",methods=["POST","GET"])
def complaint_report():
    if request.method=="POST":
        getdate = request.form["date"]
        getremark=request.form["remark"]
        getdescription=request.form["description"]
        try:
            connection.execute("insert into Guest(date,remark,description)\
                               values('"+getdate+"','"+getremark+"','"+getdescription+"')")
            connection.commit()
            print("Inserted Successfully")
        except Exception as e:
            print(e)

    return render_template("Guest_complaint.html")


if __name__=="__main__":
    guest.run()
