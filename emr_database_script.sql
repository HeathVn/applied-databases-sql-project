CREATE DATABASE emr_system;

CREATE TABLE patient_demographics(
	 patient_id INT NOT NULL AUTO_INCREMENT,
	 patient_name VARCHAR(50) NOT NULL,
	 date_of_birth DATE NOT NULL,
	 sex VARCHAR(50) NOT NULL,
	 occupation VARCHAR(50) NOT NULL,
	 ethnicity VARCHAR(50) NOT NULL,
	 marriage_status VARCHAR(50) NOT NULL,
	 address VARCHAR(50) NOT NULL,
	 insurance_num INT(9) DEFAULT NULL,
	 insurance_name VARCHAR(50) DEFAULT NULL,
	 PRIMARY KEY (patient_id)
);

CREATE TABLE specialty_assignments (
	 specialty_id INT NOT NULL AUTO_INCREMENT,
	 specialty VARCHAR(50) NOT NULL,
	 facility VARCHAR(50) NOT NULL,
	PRIMARY KEY (specialty_id)
);

CREATE TABLE provider(
	 provider_id INT NOT NULL AUTO_INCREMENT,
	 provider_name VARCHAR(50) NOT NULL,
	 phone_number VARCHAR(50) NOT NULL,
	 specialty_id INT NOT NULL,
	 work_day  VARCHAR(50) NOT NULL,
	PRIMARY KEY (provider_id),
    FOREIGN KEY (specialty_id) REFERENCES specialty_assignments(specialty_id)
);

CREATE TABLE availability_status (
	 `date` DATE NOT NULL,
	 beds INT NOT NULL,
	 staffing INT NOT NULL,
	 critical_rooms INT,
	 urgent_rooms INT,
	 stable_rooms INT,
	 supplies INT,
	PRIMARY KEY (`date`)
);

CREATE TABLE diagnosis (
	 diagnosis_id INT NOT NULL AUTO_INCREMENT,
     diagnosis_name VARCHAR(50) NOT NULL,
     admitted_status  VARCHAR(50) NOT NULL,
	 signs VARCHAR(100) NOT NULL,
	 symptoms VARCHAR(100) NOT NULL,
	 test VARCHAR(50),
	 discharge_diagnosis VARCHAR(50),
	 prescription VARCHAR(50),
	 prescription_quantity INT,
	PRIMARY KEY (diagnosis_id)
);


CREATE TABLE diagnosis_responsibility (
	 responsibility_id INT NOT NULL AUTO_INCREMENT,
     diagnosis_name VARCHAR(50) NOT NULL,
	 specialty_id INT NOT NULL, 
	PRIMARY KEY (responsibility_id),
    FOREIGN KEY (specialty_id) REFERENCES specialty_assignments(specialty_id)
);

CREATE TABLE patient_visits (
	 visit_id INT NOT NULL AUTO_INCREMENT,
	 patient_id INT NOT NULL,
	 `time` TIME NOT NULL,
	 `date` DATE NOT NULL,
	 `day`VARCHAR(50) NOT NULL,
	 diagnosis_id INT,
	PRIMARY KEY (visit_id),
    FOREIGN KEY (patient_id) REFERENCES patient_demographics(patient_id)
    
);


CREATE TABLE active_patients (
	 patient_id  INT NOT NULL,
	 diagnosis_id INT NOT NULL,
	 assigned_doctor VARCHAR(50),
	 time_presented_at_facility TIME,
	 admit_start_date  DATE,
	 admit_current_date DATE,
	 discharged_status VARCHAR(50),
	 discharged_date DATE,
	PRIMARY KEY (patient_id),
    FOREIGN KEY (patient_id) REFERENCES patient_demographics(patient_id),
    FOREIGN KEY (diagnosis_id) REFERENCES diagnosis(diagnosis_id)
);

CREATE TABLE patient_records (
	 diagnosis_id INT NOT NULL,
     patient_id  INT NOT NULL,
	 signs VARCHAR(100) NOT NULL,
	 symptoms VARCHAR(100) NOT NULL,
	 test VARCHAR(50),
	 discharge_diagnosis VARCHAR(50),
	 prescription VARCHAR(50),
	 prescription_quantity INT,
	PRIMARY KEY (diagnosis_id),
    FOREIGN KEY (patient_id) REFERENCES active_patients(patient_id),
    FOREIGN KEY (diagnosis_id) REFERENCES active_patients(diagnosis_id)
);


/*Active Patients Audit */
CREATE TABLE active_patients_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
	 patient_id  INT ,
	 diagnosis_id INT,
	 assigned_doctor VARCHAR(50),
	 time_presented_at_facility TIME,
	 admit_start_date  DATE,
	 admit_current_date DATE,
	 discharged_status VARCHAR(50),
	 discharged_date DATE,
   PRIMARY KEY (audit_id)
);


CREATE TABLE availability_status_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
	 `date` DATE ,
	 beds INT ,
	 staffing INT ,
	 critical_rooms INT,
	 urgent_rooms INT,
	 stable_rooms INT,
	 supplies INT,
   PRIMARY KEY (audit_id)
);

CREATE TABLE diagnosis_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
     diagnosis_id INT,
     diagnosis_name VARCHAR(50),
     admitted_status  VARCHAR(50),
	 signs VARCHAR(100),
	 symptoms VARCHAR(100),
	 test VARCHAR(50),
	 discharge_diagnosis VARCHAR(50),
	 prescription VARCHAR(50),
	 prescription_quantity INT,
	 
     
   PRIMARY KEY (audit_id)
);

CREATE TABLE diagnosis_responsibility_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
     responsibility_id INT ,
     diagnosis_name VARCHAR(50) ,
	 specialty_id INT , 

   PRIMARY KEY (audit_id)
);

CREATE TABLE patient_demographics_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
	 patient_id INT ,
	 patient_name VARCHAR(50),
	 date_of_birth DATE ,
	 sex VARCHAR(50),
	 occupation VARCHAR(50),
	 ethnicity VARCHAR(50),
	 marriage_status VARCHAR(50),
	 address VARCHAR(50),
	 insurance_num INT(9),
	 insurance_name VARCHAR(50),

   PRIMARY KEY (audit_id)
);

CREATE TABLE patient_records_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
	 diagnosis_id INT ,
     patient_id  INT ,
	 signs VARCHAR(100),
	 symptoms VARCHAR(100),
	 test VARCHAR(50),
	 discharge_diagnosis VARCHAR(50),
	 prescription VARCHAR(50),
	 prescription_quantity INT,

   PRIMARY KEY (audit_id)
);

CREATE TABLE patient_visits_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
     visit_id INT ,
	 patient_id INT ,
	 `time2` TIME ,
	 `date` DATE ,
	 `day` VARCHAR(50),

   PRIMARY KEY (audit_id)
);

CREATE TABLE provider_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
     provider_id INT ,
	 provider_name VARCHAR(50) ,
	 phone_number VARCHAR(50) ,
	 specialty_id INT ,
	 work_day  VARCHAR(50),

   PRIMARY KEY (audit_id)
);

CREATE TABLE specialty_assignments_audit(
	 audit_id INT NOT NULL AUTO_INCREMENT,
	 user_name VARCHAR(30) NOT NULL,
	 `time` TIME NOT NULL,
     process_name VARCHAR(50),
     specialty_id INT ,
	 specialty VARCHAR(50) ,
	 facility VARCHAR(50),

   PRIMARY KEY (audit_id)
);


     

DELIMITER // 

CREATE TRIGGER visit_before_admit
  BEFORE INSERT ON active_patients
  FOR EACH ROW 
BEGIN 
  
  

   IF ( SELECT COUNT(*) FROM patient_visits WHERE patient_id = NEW.patient_id) = 0 THEN
     SIGNAL SQLSTATE '13452'
       SET MESSAGE_TEXT= 'Patient must have visited before being admitted';
   END IF;
   
   
   
   
END//


DELIMITER // 

CREATE TRIGGER collect_demographics_before_visit
  BEFORE INSERT ON patient_visits
  FOR EACH ROW 
BEGIN 

  /* Make sure patient demographics info has been collected before visit  */

   IF ( SELECT COUNT(*) FROM patient_demographics WHERE patient_id = NEW.patient_id) = 0 THEN
     SIGNAL SQLSTATE '13452'
       SET MESSAGE_TEXT= 'Patient must submit demographics information before visit';
   
   END IF;
   
  /* Make sure patient can't visit more than once at a time */ 
  IF ( SELECT COUNT(*) FROM patient_visits WHERE patient_id = NEW.patient_id) = 1 THEN
    SIGNAL SQLSTATE '13453'
       SET MESSAGE_TEXT= 'Patient must leave before next visit';
  END IF;
   
   /* Each patient should have unique diagnosis_id */
   IF (SELECT COUNT(*) FROM patient_visits WHERE diagnosis_id = NEW.diagnosis_id) THEN
     SIGNAL SQLSTATE '13453'
       SET MESSAGE_TEXT= 'Each patient must have their own diagnosis';
   
   END IF;
END//


DELIMITER // 

CREATE TRIGGER remove_after_admit
  AFTER INSERT ON active_patients
  FOR EACH ROW 
BEGIN 

  DELETE FROM patient_visits WHERE patient_id = NEW.patient_id;
   
   
END//


DELIMITER // 

CREATE TRIGGER add_admit
  AFTER UPDATE ON diagnosis
  FOR EACH ROW 
BEGIN 
 DECLARE id_holder INT;
 DECLARE diag INT;

 SELECT patient_id 
 INTO id_holder
 FROM patient_visits as pv join diagnosis as d on pv.diagnosis_id = d.diagnosis_id 
 WHERE  d.admitted_status = 'Yes';
 
 SELECT diagnosis_id
 INTO diag
 FROM patient_visits
 WHERE patient_id = id_holder;
 
 IF ( SELECT COUNT(*) FROM patient_visits as pv join diagnosis as d on pv.diagnosis_id = d.diagnosis_id WHERE  d.admitted_status = 'Yes' OR d.admitted_status= "YES" ) = 1 THEN

    INSERT INTO active_patients(patient_id,diagnosis_id,assigned_doctor,time_presented_at_facility, admit_start_date, admit_current_date, discharged_status, discharged_date)
    VALUES (id_holder,diag, '',NOW(),NOW(),NOW(),'NO',NULL);
  
 END IF;
  

  
END//


DELIMITER // 

CREATE TRIGGER save_record
  AFTER UPDATE ON active_patients
  FOR EACH ROW 
BEGIN 
 DECLARE id_holder INT;
 DECLARE diag INT;
 DECLARE dsigns VARCHAR(50);
 DECLARE dsymp VARCHAR(50);
 DECLARE dtest VARCHAR(50);
 DECLARE ddiag VARCHAR(50);
 DECLARE dpre VARCHAR(50);
 DECLARE dpreq INT;

 SELECT patient_id 
 INTO id_holder
 FROM active_patients  
 WHERE  discharged_status = 'Yes';
 
 
 
 SELECT diagnosis_id
 INTO diag
 FROM active_patients 
 WHERE patient_id = id_holder;
 
 SELECT signs
 INTO dsigns
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 SELECT symptoms
 INTO dsymp
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 SELECT test
 INTO dtest
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 
 SELECT discharge_diagnosis
 INTO ddiag
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 SELECT prescription
 INTO dpre
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 SELECT prescription_quantity
 INTO dpreq
 FROM diagnosis
 WHERE diagnosis_id = diag;
 
 IF ( SELECT COUNT(*) FROM active_patients  WHERE  discharged_status = 'Yes') = 1 THEN

    INSERT INTO patient_records(diagnosis_id, patient_id,signs, symptoms, test, discharge_diagnosis, prescription, prescription_quantity)
    VALUES (diag,id_holder,signs,dsymp,dtest,ddiag,dpre,dpreq);
    
    
  
 END IF;
  

  
END//



DELIMITER // 

CREATE TRIGGER manage_availabilities
  AFTER INSERT ON diagnosis
  FOR EACH ROW 
BEGIN 
  
 
  IF(NEW.diagnosis_name = 'Urgent') THEN
  
    UPDATE availability_status
    SET urgent_rooms = urgent_rooms - 1
    WHERE `date` = CAST(NOW() as date);
  
  ELSEIF (NEW.diagnosis_name = 'Critical') THEN
  
    UPDATE availability_status
    SET critical_rooms = critical_rooms - 1
    WHERE `date` = CAST(NOW() as date);
  
  ELSEIF (NEW.diagnosis_name = 'Stable') THEN
    UPDATE availability_status
    SET stable_rooms = critical_rooms - 1
    WHERE `date` = CAST(NOW() as date);
  END IF;
  

END//




DELIMITER // 

CREATE PROCEDURE update_patient_insurance_info 
( 
  p_id INT, 
  p_ins_num INT(9),
  p_ins_name VARCHAR(50)
) 
BEGIN

UPDATE patient_demographics
SET insurance_num = p_ins_num,
    insurance_name = p_ins_name
WHERE patient_id = p_id;

END//



DELIMITER // 

CREATE PROCEDURE register_patient 
( 
  p_name VARCHAR(50),
  p_date_of_birth DATE,
  p_sex VARCHAR(50),
  p_occupation VARCHAR(50),
  p_ethnicity VARCHAR(50),
  p_marriage_status VARCHAR(50),
  p_address VARCHAR(50),
  p_ins_num INT(9),
  p_ins_name VARCHAR(50)
) 
BEGIN

INSERT INTO patient_demographics (patient_name,date_of_birth,sex,occupation,ethnicity,marriage_status,address,insurance_num,insurance_name)
VALUES(p_name,p_date_of_birth,p_sex,p_occupation,p_ethnicity,p_marriage_status, p_address,p_ins_num, p_ins_name );

END//


DELIMITER // 

CREATE PROCEDURE update_active_staffing()
BEGIN
DECLARE count INT;

SELECT COUNT(*)
INTO count
FROM provider;


UPDATE availability_status
SET staffing = count
WHERE `date` = DATE(NOW());

END//




DELIMITER // 

CREATE PROCEDURE hire_employee(

e_name VARCHAR(50),
e_phone_number VARCHAR(50) ,
e_specialty_id INT,
e_work_day  VARCHAR(50)
)
BEGIN
DECLARE wasFound INT;

SELECT COUNT(*)
INTO wasFound
FROM specialty_assignments
WHERE specialty_id = e_specialty_id;


IF(wasFound != 0) THEN
  
   INSERT INTO provider(provider_name, phone_number, specialty_id,work_day)
   VALUES  (e_name,e_phone_number,e_specialty_id,e_work_day);
  
ELSEIF (wasFound = 0) THEN

   SIGNAL SQLSTATE '13453'
	SET MESSAGE_TEXT= "The new employee's specialty_id does not exist. Please add specialty before assigning to new employee";

END IF;
  
END//



DELIMITER // 

CREATE PROCEDURE fire_employee(
e_id INT
)
BEGIN

DELETE FROM provider
WHERE provider_id = e_id;

END//


CALL fire_employee(41);



DELIMITER // 

CREATE PROCEDURE add_visiting_patient(

p_id INT ,
p_time TIME ,
p_date DATE ,
p_day VARCHAR(50) ,
diagnosis_id INT
)
BEGIN

INSERT INTO patient_visits (patient_id, `time`, `date`,`day`,diagnosis_id)
VALUES (p_id,p_time,p_date,p_day,diagnosis_id);

END//



DELIMITER // 

CREATE PROCEDURE add_diagnosis(

     d_name VARCHAR(50) ,
     d_admitted_status  VARCHAR(50) ,
	 d_signs VARCHAR(100) ,
	 d_symptoms VARCHAR(100),
	 d_test VARCHAR(50),
	 d_discharge_diagnosis VARCHAR(50),
	 d_prescription VARCHAR(50),
	 d_prescription_quantity INT
)
BEGIN

INSERT INTO diagnosis (diagnosis_name,admitted_status,signs,symptoms,test, discharge_diagnosis,prescription,prescription_quantity)
VALUES (d_name, d_admitted_status,d_signs, d_symptoms,d_test, d_discharge_diagnosis, d_prescription, d_prescription_quantity);

END//



DELIMITER // 

CREATE PROCEDURE update_diagnosis_presciption(
	 d_id INT,
     updated_prescription VARCHAR(50)
)
BEGIN

UPDATE diagnosis
SET prescription = updated_prescription
WHERE diagnosis_id = d_id;

END//

CALL update_diagnosis_presciption(2, 'tetrahydrozoline');


DELIMITER // 

CREATE PROCEDURE update_presciption_quantity(
	 d_id INT,
     updated_quantity INT
)
BEGIN

UPDATE diagnosis
SET prescription_quantity = updated_quantity
WHERE diagnosis_id = d_id;

END//


DELIMITER // 

CREATE PROCEDURE find_patients_with_prescriptions()
BEGIN

SELECT patient_name, prescription
FROM active_patients as ap  join patient_demographics as pd on ap.patient_id = pd.patient_id
                            join diagnosis as d on ap.diagnosis_id = d.diagnosis_id
WHERE d.prescription IS NOT NULL;

END//


DELIMITER // 

CREATE PROCEDURE find_patients_without_prescriptions()
BEGIN

SELECT patient_name, prescription
FROM active_patients as ap  join patient_demographics as pd on ap.patient_id = pd.patient_id
                            join diagnosis as d on ap.diagnosis_id = d.diagnosis_id
WHERE d.prescription IS NULL;

END//


DELIMITER // 

CREATE PROCEDURE find_specialty_count(
specialty_name VARCHAR(50)
)
BEGIN

SELECT COUNT(*) 
FROM provider as p join specialty_assignments as sa on p.specialty_id = sa.specialty_id
WHERE specialty = specialty_search;

END//



DELIMITER // 

CREATE PROCEDURE find_patients_with_diagnosis(
p_diagnosis_name VARCHAR(50)
)
BEGIN

SELECT patient_name, diagnosis_name
FROM patient_visits as pv join patient_demographics as pd on pv.patient_id = pd.patient_id
                          join diagnosis as d on pv.diagnosis_id = d.diagnosis_id
WHERE d.diagnosis_name = p_diagnosis_name;

END//



DELIMITER // 

CREATE PROCEDURE facility_assignments_for_providers()
BEGIN

SELECT provider_name, facility
FROM provider as p join specialty_assignments as sa on p.specialty_id = sa.specialty_id;

END//

CALL facility_assignments_for_providers();


DELIMITER // 

CREATE PROCEDURE find_patients_for_provider(
provider_name VARCHAR(50)
)
BEGIN

SELECT patient_name
FROM active_patients as ap join patient_demographics as pd on ap.patient_id = pd.patient_id
WHERE assigned_doctor = provider_name;

END//



DELIMITER // 

CREATE PROCEDURE available_rooms_count()
BEGIN

SELECT (critical_rooms + urgent_rooms + stable_rooms) as available_rooms
FROM availability_status
WHERE `date` = DATE(NOW());

END//



DELIMITER // 

CREATE PROCEDURE patients_with_insurance()
BEGIN

SELECT patient_name, insurance_num, insurance_name
FROM patient_demographics
WHERE insurance_num IS NOT NULL and insurance_name IS NOT NULL;

END//

CALL patients_with_insurance()


DELIMITER // 

CREATE PROCEDURE patients_without_insurance()
BEGIN

SELECT patient_name, insurance_num, insurance_name
FROM patient_demographics
WHERE insurance_num IS NULL and insurance_name IS NULL;

END//

CALL patients_without_insurance()



DELIMITER // 

CREATE PROCEDURE patients_demographics_count()
BEGIN

SELECT COUNT(*)
FROM patient_demographics;

END//

CALL patients_demographics_count();
CALL  find_patients_without_doctor();

DELIMITER // 

CREATE PROCEDURE find_patients_without_doctor()
BEGIN

SELECT patient_name
FROM active_patients as ap join patient_demographics as pd on ap.patient_id = pd.patient_id
WHERE ap.assigned_doctor = '' or ap.assigned_doctor IS NULL;


END//


DELIMITER // 

CREATE PROCEDURE update_admitted_status(
  id INT,
  admitted_status VARCHAR(50)  
)
BEGIN

 UPDATE diagnosis
 SET admitted_status = admitted_status
 WHERE diagnosis_id = id;

END//



DELIMITER // 

CREATE PROCEDURE update_dismissed_status(
  id INT,
  dismissed_status VARCHAR(50)  
)
BEGIN

 UPDATE active_patients
 SET discharged_status = dismissed_status
 WHERE patient_id = id;

END//

DELIMITER // 

CREATE PROCEDURE assign_doctor(
  id INT,
  doctor_name VARCHAR(50)  
)
BEGIN

 UPDATE active_patients
 SET assigned_doctor = doctor_name
 WHERE patient_id = id;

END//

DELIMITER // 

CREATE PROCEDURE clear_dismissed_patients()
BEGIN

DELETE FROM active_patients 
WHERE discharged_status = 'Yes' OR discharged_status = 'YES';

END//



/* Implement Audit Trail */



DELIMITER //

CREATE TRIGGER active_patients_audit_insert 
 AFTER INSERT
 ON active_patients
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO active_patients_audit(user_name,`time`,process_name,patient_id, diagnosis_id, assigned_doctor,time_presented_at_facility, admit_start_date, admit_current_date,discharged_status,discharged_date)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER active_patients_audit_update
 AFTER UPDATE
 ON active_patients
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO active_patients_audit(user_name,`time`,process_name,patient_id, diagnosis_id, assigned_doctor,time_presented_at_facility, admit_start_date, admit_current_date,discharged_status,discharged_date)
VALUES(CURRENT_USER,NOW(),'UPDATE',OLD.patient_id,OLD.diagnosis_id,OLD.assigned_doctor,OLD.time_presented_at_facility,OLD.admit_start_date,OLD.admit_current_date,OLD.discharged_status,OLD.discharged_date);
  

END//



DELIMITER //

CREATE TRIGGER active_patients_audit_delete
 AFTER DELETE
 ON active_patients
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO active_patients_audit(user_name,`time`,process_name,patient_id, diagnosis_id, assigned_doctor,time_presented_at_facility, admit_start_date, admit_current_date,discharged_status,discharged_date)
VALUES(CURRENT_USER,NOW(),'DELETE',OLD.patient_id,OLD.diagnosis_id,OLD.assigned_doctor,OLD.time_presented_at_facility,OLD.admit_start_date,OLD.admit_current_date,OLD.discharged_status,OLD.discharged_date);
  

END//

/*Availability Status Audit */




DELIMITER //

CREATE TRIGGER availability_status_audit_insert 
 AFTER INSERT
 ON availability_status
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO availability_status_audit(user_name,`time`,process_name, `date`, beds,staffing, critical_rooms, urgent_rooms, stable_rooms, supplies)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER availability_status_audit_update
 AFTER UPDATE
 ON availability_status
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO availability_status_audit(user_name,`time`,process_name, `date`, beds,staffing, critical_rooms, urgent_rooms, stable_rooms, supplies)
VALUES(CURRENT_USER,NOW(),'UPDATE',OLD.`date`,OLD.beds,OLD.staffing,OLD.critical_rooms,OLD.urgent_rooms,OLD.stable_rooms,OLD.supplies);
  

END//



DELIMITER //

CREATE TRIGGER availability_status_audit_delete
 AFTER DELETE
 ON availability_status
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO availability_status_audit(user_name,`time`,process_name,`date`, beds,staffing, critical_rooms, urgent_rooms, stable_rooms, supplies)
VALUES(CURRENT_USER,NOW(),'DELETE',OLD.`date`,OLD.beds,OLD.staffing,OLD.critical_rooms,OLD.urgent_rooms,OLD.stable_rooms,OLD.supplies);
  

END//

/*Diagnosis Audit  */



DELIMITER //

CREATE TRIGGER diagnosis_audit_insert 
 AFTER INSERT
 ON diagnosis
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_audit(user_name,`time`,process_name, diagnosis_id, diagnosis_name, admitted_status, signs, symptoms,test,discharge_diagnosis, prescription, prescription_quantity)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL,NULL,NULL, NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER diagnosis_audit_update
 AFTER UPDATE
 ON diagnosis
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_audit(user_name,`time`,process_name, diagnosis_id, diagnosis_name, admitted_status, signs, symptoms,test,discharge_diagnosis, prescription, prescription_quantity)
VALUES(CURRENT_USER,NOW(),'UPDATE',OLD.diagnosis_id, OLD.diagnosis_name, OLD.admitted_status, OLD.signs, OLD.symptoms,test,OLD.discharge_diagnosis, OLD.prescription, OLD.prescription_quantity);
  

END//



DELIMITER //

CREATE TRIGGER diagnosis_audit_delete
 AFTER DELETE
 ON diagnosis
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_audit(user_name,`time`,process_name, diagnosis_id, diagnosis_name, admitted_status, signs, symptoms,test,discharge_diagnosis, prescription, prescription_quantity)
VALUES(CURRENT_USER,NOW(),'DELETE',OLD.diagnosis_id, OLD.diagnosis_name, OLD.admitted_status, OLD.signs, OLD.symptoms,test,OLD.discharge_diagnosis, OLD.prescription, OLD.prescription_quantity);
 

END//


/* Diagnosis Responsibility Audit*/



DELIMITER //

CREATE TRIGGER diagnosis_responsibility_audit_insert 
 AFTER INSERT
 ON diagnosis_responsibility
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_responsibility_audit(user_name,`time`,process_name,responsibility_id,diagnosis_name, specialty_id)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER diagnosis_responsibility_audit_update
 AFTER UPDATE
 ON diagnosis_responsibility
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_responsibility_audit(user_name,`time`,process_name,responsibility_id,diagnosis_name, specialty_id)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.responsibility_id,OLD.diagnosis_name,OLD.specialty_id);
  

END//



DELIMITER //

CREATE TRIGGER diagnosis_responsibility_audit_delete
 AFTER DELETE
 ON diagnosis_responsibility
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO diagnosis_responsibility_audit(user_name,`time`,process_name,responsibility_id,diagnosis_name, specialty_id)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.responsibility_id,OLD.diagnosis_name,OLD.specialty_id);

END//

/*Patient Demographics Audit*/



DELIMITER //

CREATE TRIGGER patient_demographics_audit_insert 
 AFTER INSERT
 ON patient_demographics
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO patient_demographics_audit(user_name,`time`,process_name,patient_id,patient_name,date_of_birth,sex,occupation,ethnicity,marriage_status,address,insurance_num,insurance_name)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER patient_demographics_audit_update
 AFTER UPDATE
 ON patient_demographics
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO patient_demographics_audit(user_name,`time`,process_name,patient_id,patient_name,date_of_birth,sex,occupation,ethnicity,marriage_status,address,insurance_num,insurance_name)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.patient_id,OLD.patient_name,OLD.date_of_birth,OLD.sex,OLD.occupation,OLD.ethnicity,OLD.marriage_status,OLD.address,OLD.insurance_num,OLD.insurance_name);
  

END//



DELIMITER //

CREATE TRIGGER patient_demographics_audit_delete
 AFTER DELETE
 ON patient_demographics
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO patient_demographics_audit(user_name,`time`,process_name,patient_id,patient_name,date_of_birth,sex,occupation,ethnicity,marriage_status,address,insurance_num,insurance_name)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.patient_id,OLD.patient_name,OLD.date_of_birth,OLD.sex,OLD.occupation,OLD.ethnicity,OLD.marriage_status,OLD.address,OLD.insurance_num,OLD.insurance_name);
  
END//


/*Patient Records Audit */



DELIMITER //

CREATE TRIGGER patient_records_audit_insert 
 AFTER INSERT
 ON patient_records
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO patient_records_audit(user_name,`time`,process_name,diagnosis_id,patient_id,signs,symptoms,test,discharge_diagnosis,prescription,prescription_quantity)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER patient_records_audit_update
 AFTER UPDATE
 ON patient_records
 FOR EACH ROW 
BEGIN 
  
INSERT INTO patient_records_audit(user_name,`time`,process_name,diagnosis_id,patient_id,signs,symptoms,test,discharge_diagnosis,prescription,prescription_quantity)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.diagnosis_id,OLD.patient_id,OLD.signs,OLD.symptoms,OLD.test,OLD.discharge_diagnosis,OLD.prescription,OLD.prescription_quantity);
  

END//



DELIMITER //

CREATE TRIGGER patient_records_audit_delete
 AFTER DELETE
 ON patient_records
 FOR EACH ROW 
BEGIN 
  
INSERT INTO patient_records_audit(user_name,`time`,process_name,diagnosis_id,patient_id,signs,symptoms,test,discharge_diagnosis,prescription,prescription_quantity)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.diagnosis_id,OLD.patient_id,OLD.signs,OLD.symptoms,OLD.test,OLD.discharge_diagnosis,OLD.prescription,OLD.prescription_quantity);
  
  
END//

/*Patient Visits Audit*/



DELIMITER //

CREATE TRIGGER patient_visits_audit_insert 
 AFTER INSERT
 ON patient_visits
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO patient_visits_audit(user_name,`time`,process_name,visit_id,patient_id,`time2`,`date`,`day`)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER patient_visits_audit_update
 AFTER UPDATE
 ON patient_visits
 FOR EACH ROW 
BEGIN 
  
INSERT INTO patient_visits_audit(user_name,`time`,process_name,visit_id,patient_id,`time2`,`date`,`day`)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.visit_id,OLD.patient_id,OLD.`time`,OLD.`date`,OLD.`day`);
  

END//



DELIMITER //

CREATE TRIGGER patient_visits_audit_delete
 AFTER DELETE
 ON patient_visits
 FOR EACH ROW 
BEGIN 
  
INSERT INTO patient_visits_audit(user_name,`time`,process_name,visit_id,patient_id,`time2`,`date`,`day`)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.visit_id,OLD.patient_id,OLD.`time`,OLD.`date`,OLD.`day`);
  
  
END//

/*Provider Audit */


DELIMITER //

CREATE TRIGGER provider_audit_insert 
 AFTER INSERT
 ON provider
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO provider_audit(user_name,`time`,process_name,provider_id,provider_name,phone_number,specialty_id,work_day)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER provider_audit_update
 AFTER UPDATE
 ON provider
 FOR EACH ROW 
BEGIN 
  
INSERT INTO provider_audit(user_name,`time`,process_name,provider_id,provider_name,phone_number,specialty_id,work_day)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.provider_id,OLD.provider_name,OLD.phone_number,OLD.specialty_id,OLD.work_day);
  

END//



DELIMITER //

CREATE TRIGGER provider_audit_delete
 AFTER DELETE
 ON provider
 FOR EACH ROW 
BEGIN 
  
INSERT INTO provider_audit(user_name,`time`,process_name,provider_id,provider_name,phone_number,specialty_id,work_day)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.provider_id,OLD.provider_name,OLD.phone_number,OLD.specialty_id,OLD.work_day);
  
  
END//

/*Special Assignments Audit */



DELIMITER //

CREATE TRIGGER specialty_assignments_audit_insert 
 AFTER INSERT
 ON specialty_assignments
 FOR EACH ROW 
BEGIN 
  
  
INSERT INTO specialty_assignments_audit(user_name,`time`,process_name,specialty_id,specialty,facility)
VALUES(CURRENT_USER,NOW(),'INSERT',NULL,NULL,NULL);
  
   
END//

DELIMITER //

CREATE TRIGGER specialty_assignments_audit_update
 AFTER UPDATE
 ON specialty_assignments
 FOR EACH ROW 
BEGIN 
  
INSERT INTO specialty_assignments_audit(user_name,`time`,process_name,specialty_id,specialty,facility)
VALUES(CURRENT_USER,NOW(),'UPDATE', OLD.specialty_id,OLD.specialty,OLD.facility);
  

END//



DELIMITER //

CREATE TRIGGER specialty_assignments_audit_delete
 AFTER DELETE
 ON specialty_assignments
 FOR EACH ROW 
BEGIN 
  
INSERT INTO specialty_assignments_audit(user_name,`time`,process_name,specialty_id,specialty,facility)
VALUES(CURRENT_USER,NOW(),'DELETE', OLD.specialty_id,OLD.specialty,OLD.facility);
  
  
END//


CREATE INDEX ap_assigned_doctor
ON active_patients(assigned_doctor);

CREATE INDEX ap_discharged_status
ON active_patients(discharged_status);

CREATE INDEX ap_discharged_date
ON active_patients(discharged_date);

CREATE INDEX ap_discharged_info
ON active_patients(discharged_status, discharged_date);

CREATE INDEX d_admitted_status
ON diagnosis(admitted_status);

CREATE VIEW patient_insurance_info 
AS SELECT patient_name, insurance_name, insurance_num
FROM patient_demographics;

CREATE VIEW provider_facility_assignment 
AS SELECT provider_name, facility
FROM provider as p join specialty_assignments as sa on p.specialty_id = sa.specialty_id;

CREATE VIEW provider_facility_workday 
AS SELECT provider_name, facility, work_day
FROM provider as p join specialty_assignments as sa on p.specialty_id = sa.specialty_id;

CREATE VIEW provider_facility_specialty_workday 
AS SELECT provider_name, facility, sa.specialty, work_day
FROM provider as p join specialty_assignments as sa on p.specialty_id = sa.specialty_id;

CREATE VIEW patient_wait_time_info 
AS SELECT patient_name, DATEDIFF(admit_current_date ,admit_start_date) as wait_time
FROM active_patients as ap join patient_demographics as pd on ap.patient_id = pd.patient_id;
