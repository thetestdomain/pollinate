# FlaskProject

This a Simple API application to demonstrate POST timestamp.
It reads the DateTime- Stamp at the route 'query-example'
The app browse the timestamp for a format "2022-12-23-13:14:50" - "YYYY-MM-DD-HH-MM-SS"
If the format is in the order it will process the timestamp and upload into a designated table in the code.
It will report an Error - if any issues otherwise. It will alo prompt user for expected timestamp format.

An Example - http://127.0.0.1:5000/query-example?date=2022-12-23-13:14:50

The user can initiate the DB IP-address along with schema and table namein function "AddTimestamp"

To Start Open Terminal and type in same downloaded directory - python testflask.py

I have also uploaded sql queries for Data Puzzles and DOC file for modelling and Azure Ingestion

Munish
23rd Oct 2022
