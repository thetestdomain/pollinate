"""
Author - Munish Mehta 
Date  - 23rd Oct 2022
This Is just a test demo API of reading a TimeStamp and Inserting to Database
"""

# import main Flask class and request object
from flask import Flask, request
import psycopg2,pdb
import pandas as pd
import numpy as np
from datetime import datetime

app = Flask(__name__)
def AddTimestamp(webdatetime):
    """
    Call DataBase and Add to Table
    """
    try:
        db = {
        'host': 'xx',
        'port': 5432,
        'username': 'xx',
        'password': 'xx',
        'dbname': 'xx'}
        
        conn = psycopg2.connect(host=db['host'], port=db['port'], database=db['dbname'], user=db['username'], password=db['password'])
        curr = conn.cursor()
        
        now = datetime.now()
        dt_string = now.strftime("%Y-%m-%d-%H:%M:%S")
        tokenpass = webdatetime.strftime("%Y-%m-%d-%H:%M:%S")
        
        insert_query = "insert into testtable values(TO_TIMESTAMP('%s', 'YYYY-MM-DD-HH24:MI:SS'),TO_TIMESTAMP('%s', 'YYYY-MM-DD-HH24:MI:SS'))"%(dt_string,tokenpass)
        curr.execute(insert_query)
        conn.commit()
        return 1
                                 
    except Exception as error:   
        conn.rollback() # Roll Back the Insert
        return 0

@app.route('/query-example')
def query_example():
    #return 'Query String Example'
    mystamp = request.args.get('date')
    
    try:
        #http://127.0.0.1:5000/query-example?date=2022-12-23-13:14:50
        datetime_object = datetime.strptime(mystamp, '%Y-%m-%d-%H:%M:%S')
        mytoken = str(datetime_object)
        DResponse = AddTimestamp(datetime_object)
        if DResponse == 1:
            Response = "TimeStamp Added - OK"
        else:
            Response = "Issue with Insertion of TimeStamp in DB"
        testtoken = "Got -%s  - Response -%s"%(mytoken, Response)
        return '''<h1>Thanks Recorded Datetime is: {}</h1>'''.format(testtoken)

    except:
        TheIssue = "DateTime Format is %Y-%m-%d-%H:%M:%S "
        return '''<h1>Issue: {}</h1>'''.format(TheIssue)

if __name__ == '__main__':
    # run app in debug mode on port 5000
    app.run(debug=True, port=5000)