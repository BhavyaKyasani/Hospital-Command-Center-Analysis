show databases;
CREATE DATABASE Hospital_Command_Center;
USE Hospital_Command_Center;

CREATE TABLE patient_journey(
patient_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(20),
blood_type VARCHAR(10),
medical_condition VARCHAR(100),
admission_date DATE,
doctor VARCHAR(100),
hospital VARCHAR(100),
insurance_provider VARCHAR(100),
billing_amount DECIMAL(12,2),
room_number INT,
admission_type VARCHAR(50),
discharge_date DATE,
medication VARCHAR(100),
test_results VARCHAR(100)
);

CREATE TABLE insurance_claims(
claim_id VARCHAR(30) PRIMARY KEY,
patient_id VARCHAR(30),
provider_id VARCHAR(30),
claim_amount DECIMAL(12,2),
claim_date DATE,
diagnosis_code VARCHAR(20),
procedure_code VARCHAR(20),
patient_age INT,
patient_gender VARCHAR(20),
provider_specialty VARCHAR(100),
claim_status VARCHAR(50),
patient_income DECIMAL(12,2),
patient_marital_status VARCHAR(50),
patient_employment_status VARCHAR(50),
provider_location VARCHAR(100),
claim_type VARCHAR(100),
claim_submission_method VARCHAR(100)
);

CREATE TABLE insurance_claims(
claim_id VARCHAR(30) PRIMARY KEY,
patient_id VARCHAR(30),
provider_id VARCHAR(30),
claim_amount DECIMAL(12,2),
claim_date DATE,
diagnosis_code VARCHAR(20),
procedure_code VARCHAR(20),
patient_age INT,
patient_gender VARCHAR(20),
provider_specialty VARCHAR(100),
claim_status VARCHAR(50),
patient_income DECIMAL(12,2),
patient_marital_status VARCHAR(50),
patient_employment_status VARCHAR(50),
provider_location VARCHAR(100),
claim_type VARCHAR(100),
claim_submission_method VARCHAR(100)
);

CREATE TABLE emergency_room(
patient_id VARCHAR(30),
admission_date DATE,
patient_first_initial VARCHAR(5),
patient_last_name VARCHAR(100),
gender VARCHAR(20),
age INT,
race VARCHAR(50),
department_referral VARCHAR(100),
admission_flag VARCHAR(20),
satisfaction_score INT,
wait_time INT,
patient_cm INT
);

CREATE TABLE operation_theatre(
surgery_id VARCHAR(30),
surgery_type VARCHAR(100),
scheduled_time DATETIME,
actual_start_time DATETIME,
delay_time INT,
surgeon VARCHAR(100),
ot_room VARCHAR(30),
equipment_used VARCHAR(100)
);

CREATE TABLE bed_occupancy(
date_time DATETIME,
total_beds INT,
occupied_beds INT,
available_beds INT,
icu_beds INT,
icu_occupied INT,
ward VARCHAR(100),
department VARCHAR(100),
ventilator_usage INT,
emergency_load INT
);

CREATE TABLE staff(
staff_id VARCHAR(30),
department VARCHAR(100),
shift_duration DECIMAL(5,2),
patient_load INT,
workdays_per_month INT,
satisfaction_score DECIMAL(5,2),
overtime_hours DECIMAL(5,2),
years_experience INT,
previous_satisfaction DECIMAL(5,2),
absenteeism_days INT
);

CREATE VIEW patient_summary AS
SELECT
medical_condition,
COUNT(*) total_patients,
AVG(billing_amount) avg_bill,
SUM(billing_amount) revenue
FROM patient_journey
GROUP BY medical_condition;

CREATE VIEW revenue_summary AS
SELECT
hospital,
SUM(billing_amount) revenue
FROM patient_journey
GROUP BY hospital;

CREATE VIEW claim_summary AS
SELECT
claim_status,
COUNT(*) total_claims,
SUM(claim_amount) total_amount
FROM insurance_claims
GROUP BY claim_status;

CREATE VIEW bed_summary AS
SELECT
department,
AVG(occupied_beds) occupied,
AVG(available_beds) available
FROM bed_occupancy
GROUP BY department;

CREATE VIEW staff_summary AS
SELECT
department,
AVG(patient_load) patient_load,
AVG(overtime_hours) overtime,
AVG(satisfaction_score) satisfaction
FROM staff
GROUP BY department;

SELECT SUM(billing_amount) AS total_revenue FROM patient_journey;
SELECT AVG(DATEDIFF(discharge_date,admission_date)) AS average_length_of_stay FROM patient_journey;
SELECT SUM(billing_amount)/COUNT(*) AS revenue_per_patient FROM patient_journey;
SELECT ROUND(SUM(occupied_beds)/SUM(total_beds)*100,2) AS bed_occupancy_rate FROM bed_occupancy;
SELECT ROUND(SUM(icu_occupied)/SUM(icu_beds)*100,2) AS icu_occupancy FROM bed_occupancy;
SELECT AVG(wait_time) AS avg_wait_time FROM emergency_room;
SELECT ROUND(SUM(CASE WHEN claim_status='Approved'THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS approval_rate FROM insurance_claims;
SELECT
AVG(claim_amount)
FROM insurance_claims;

SELECT
department,
AVG(patient_load/shift_duration)
AS staff_utilization
FROM staff
GROUP BY department;

SELECT
AVG(delay_time)
FROM operation_theatre;

SELECT
medical_condition,
SUM(billing_amount) revenue
FROM patient_journey
GROUP BY medical_condition;

SELECT
MONTH(admission_date) month,
SUM(billing_amount) revenue
FROM patient_journey
GROUP BY MONTH(admission_date)
ORDER BY MONTH(admission_date);

SELECT
MONTH(admission_date),
COUNT(*)
FROM patient_journey
GROUP BY MONTH(admission_date);

SELECT
doctor,
COUNT(*) patients
FROM patient_journey
GROUP BY doctor
ORDER BY patients DESC;

SELECT
ward,
AVG(occupied_beds) occupied
FROM bed_occupancy
GROUP BY ward;

SELECT
department,
AVG(icu_occupied) icu
FROM bed_occupancy
GROUP BY department;

SELECT
department_referral,
AVG(satisfaction_score)
FROM emergency_room
GROUP BY department_referral;

SELECT
surgeon,
COUNT(*) surgeries
FROM operation_theatre
GROUP BY surgeon
ORDER BY surgeries DESC;

SELECT
claim_status,
COUNT(*) claims
FROM insurance_claims
GROUP BY claim_status;

SELECT
department,
AVG(patient_load),
AVG(overtime_hours),
AVG(satisfaction_score)
FROM staff
GROUP BY department;