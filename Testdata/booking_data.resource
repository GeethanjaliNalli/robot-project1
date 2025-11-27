*** Settings ***
Documentation    This file contains the dictionaries for new patient booking data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{TC00002_Diary_NPB_Valid_Booking}    test_case_id=TC00002_Diary_NPB    patient_first_name=John    patient_last_name=Doe    dob=1990-05-15    gender=Male    contact_number=1234567890    email=john.doe@example.com    appointment_date=2025-12-01    appointment_time=10:30    appointment_type=New Patient    reason=General Checkup    doctor=Dr. Smith    notes=First time visit    expected_result=Booking should be made

&{TC00002_Diary_NPB_Missing_Required_Field}    test_case_id=TC00002_Diary_NPB    patient_first_name=    patient_last_name=Doe    dob=1990-05-15    gender=Male    contact_number=1234567890    email=john.doe@example.com    appointment_date=2025-12-01    appointment_time=10:30    appointment_type=New Patient    reason=General Checkup    doctor=Dr. Smith    notes=First time visit    expected_result=No booking should be made

&{TC00002_Diary_NPB_Close_Without_Saving}    test_case_id=TC00002_Diary_NPB    patient_first_name=Jane    patient_last_name=Smith    dob=1985-09-22    gender=Female    contact_number=9876543210    email=jane.smith@example.com    appointment_date=2025-12-02    appointment_time=11:00    appointment_type=New Patient    reason=Consultation    doctor=Dr. Lee    notes=User closed screen before saving    expected_result=No booking should be made
