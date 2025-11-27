*** Settings ***
Documentation    This file contains the dictionaries for new patient booking data used in the test cases.
Resource    ../common/super.resource

*** Variables ***
&{NEW_PATIENT_BOOKING_VALID}    \
    test_case_id=TC00002_Diary_NPB    \
    patient_first_name=John    \
    patient_last_name=Doe    \
    date_of_birth=1990-05-15    \
    gender=Male    \
    contact_number=5551234567    \
    email=john.doe@example.com    \
    appointment_date=2025-12-01    \
    appointment_time=10:30    \
    appointment_type=New Patient    \
    reason_for_visit=General Checkup    \
    insurance_provider=HealthCare Inc    \
    insurance_number=HC123456789    \
    expected_result=Booking should be made

&{NEW_PATIENT_BOOKING_MISSING_REQUIRED}    \
    test_case_id=TC00002_Diary_NPB    \
    patient_first_name=    \
    patient_last_name=Smith    \
    date_of_birth=    \
    gender=Female    \
    contact_number=5559876543    \
    email=    \
    appointment_date=2025-12-01    \
    appointment_time=11:00    \
    appointment_type=New Patient    \
    reason_for_visit=Consultation    \
    insurance_provider=    \
    insurance_number=    \
    expected_result=No booking should be made

&{NEW_PATIENT_BOOKING_CANCELLED}    \
    test_case_id=TC00002_Diary_NPB    \
    patient_first_name=Emily    \
    patient_last_name=Clark    \
    date_of_birth=1985-09-20    \
    gender=Female    \
    contact_number=5552223333    \
    email=emily.clark@example.com    \
    appointment_date=2025-12-02    \
    appointment_time=09:00    \
    appointment_type=New Patient    \
    reason_for_visit=Follow-up    \
    insurance_provider=MedPlus    \
    insurance_number=MP987654321    \
    expected_result=No booking should be made
