/*Create users*/

CREATE USER 'physician'@'localhost' IDENTIFIED BY 'testing123'; 
CREATE USER 'receptionist'@'localhost' IDENTIFIED BY 'testing123'; 

/*Grant Access Rights */
GRANT SELECT ON emr_system.* TO 'physician'@'localhost';
GRANT SELECT ON emr_system.* TO 'receptionist'@'localhost';

GRANT INSERT, UPDATE, DELETE ON emr_system.diagnosis TO 'physician'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.diagnosis_responsibility TO 'physician'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.patient_records TO 'physician'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.provider TO 'physician'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.specialty_assignments TO 'physician'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.active_patients TO 'physician'@'localhost';


GRANT INSERT, UPDATE, DELETE ON emr_system.availability_status TO 'receptionist'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.patient_demographics TO 'receptionist'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.patient_visits TO 'receptionist'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.provider TO 'receptionist'@'localhost';
GRANT INSERT, UPDATE, DELETE ON emr_system.specialty_assignments TO 'receptionist'@'localhost';

GRANT EXECUTE ON PROCEDURE emr_system.update_patient_insurance_info TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.add_visiting_patient TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.available_rooms_count TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.facility_assignments_for_providers TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_for_provider TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_with_diagnosis TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_without_doctor TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_without_prescriptions TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_with_prescriptions TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_specialty_count TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.patients_demographics_count TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.patients_with_insurance TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.patients_without_insurance TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.register_patient TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_active_staffing TO 'receptionist'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_presciption_quantity TO 'receptionist'@'localhost';

GRANT EXECUTE ON PROCEDURE emr_system.add_diagnosis TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.available_rooms_count TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_with_diagnosis TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_without_doctor TO  'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.find_patients_without_prescriptions TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.fire_employee TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.hire_employee TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_admitted_status TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_dismissed_status TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_diagnosis_presciption TO 'physician'@'localhost';
GRANT EXECUTE ON PROCEDURE emr_system.update_presciption_quantity TO 'physician'@'localhost';
