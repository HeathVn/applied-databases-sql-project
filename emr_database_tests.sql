/* Each query must be run individually */


/* First add visiting patient to patient_visits table and check patient_visits table*/
CALL add_visiting_patient(4,NOW(),NOW(),'Sunday',1); 

/*Check patient_visits table */
SELECT * FROM emr_system.patient_visits;

/* Set admitted status for patient with diagnosis id 1 to 'Yes' */
CALL update_admitted_status(1, 'Yes');

/*Check patient_visits table again and see that patient has been admitted */
SELECT * FROM emr_system.patient_visits;

/*Check active_patients table to see admitted patient */
SELECT * FROM emr_system.active_patients;

/* Assign doctor to admitted patient */
CALL assign_doctor(4,'Mercedes Wilson');

/* Discharge patient by setting discharged in active_patients table to 'Yes' */
CALL update_dismissed_status(4, 'Yes');

/* Check patient_records table to see discharged patient's information has been stored in records */
SELECT * FROM emr_system.patient_records;

/* Register and delete new patient*/
CALL register_patient("Quon Evans Jr","1988-11-24","male","Singer","African American","Single","Benjamin E. Street",2721,"State Farm");
DELETE FROM patient_demographics WHERE patient_id = 16;

/* Check  patient_demographics_audit table */
SELECT * FROM emr_system.patient_demographics_audit;

/* Update a patient's insurance info */
CALL update_patient_insurance_info(7,4586, 'State Farm');

/* Check  patient_demographics_audit table */
SELECT * FROM emr_system.patient_demographics_audit;


/* Find patients managed by a specific provider */
CALL  find_patients_for_provider('Mercedes Wilson');

/* Test adding the same patient to the patient_visits table twice. You should get an error message */
CALL add_visiting_patient(5,NOW(),NOW(),'Sunday',3); 
CALL add_visiting_patient(5,NOW(),NOW(),'Sunday',3); 

/* Test adding two patients with the same diagnosis id to the patient_visits table. You should get an error message */
CALL add_visiting_patient(6,NOW(),NOW(),'Tuesday',4); 
CALL add_visiting_patient(7,NOW(),NOW(),'Sunday',4); 

/* Test adding patient to patient_visits table without adding their information to the patient_demographics table.
   You should get an error. */
   
   CALL add_visiting_patient(17,NOW(),NOW(),'Sunday',3);
   
   /* Find patient with Urgent diagnosis */
   CALL find_patients_with_diagnosis('Urgent');
   
   /* Find patient with Critical diagnosis */
   CALL find_patients_with_diagnosis('Critical');
   
   /*Find patients without insurance */
   CALL patients_without_insurance;
   
   /* Find patients with insurance */
   CALL patients_with_insurance()