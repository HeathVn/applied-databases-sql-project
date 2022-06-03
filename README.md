# applied-databases-sql-project
Graduate Project for Applied Databases Course


Project Overview

This project was developed based on an Emergency Department and procedures which are typically carried out in an Emergency Department. The goal of this project is to build a functional efficient medical database by which patient visits, diagnosis, doctor assignments, equipment accessibility can be appropriately managed. 

In this database, patients should not be admitted without first making a visit to the emergency department. Before patients can visit, they must have demographics information entered in the database. This demographics information allows for referencing information like name, age and marital status of any given patient.


Database Setup

1)	Create database: Run emr_database_script.sql
2)	Load data: Run emr_database_data_load.sql
3)	Create user accounts and grant accesses:  Run create_users_grant_access.sql
4)	Run tests (instructions in script file): Run emr_database_tests.sql

Scope

There are multiple functions that play a role in having a database that functions like an Emergency Department:

1)	Patient must first enter their demographics information in the patient demographics table
2)	Patient must be entered into the patient visits table. Note: if patients demographics information has not been entered, an error with be thrown stating to first add demographics information in patient demographics table.
3)	If a patient is entered in patient visits table and their admission status is updated to YES, they must then be added to the active patient’s table. This means patients have been admitted.
4)	Based on a patients’ diagnosis, there must be a decrease in room availability in the availability status table
5)	If patient’s discharged status is update to ‘Yes’ their diagnosis records must be submitted to the records table and the patient must be removed from active patients table
6)	Every database transaction is monitored by audit trail. There exists an audit table that captures user, time, transaction type and previous record information.


Database Design

Table count: 18
Triggers: 33
Procedures: 18

