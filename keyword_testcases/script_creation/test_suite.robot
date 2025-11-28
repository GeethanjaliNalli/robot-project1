*** Settings ***
Documentation    This file contains the test cases for Script Creation (Prescription) including creation, completion, signing, emailing, and printing of a patient prescription (Script) using the Basic Script Features.
Resource    ../../common/super.resource
Resource    ../../Testdata/script_creation_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate Practitioner Can Create And Complete Prescription Script
    [Documentation]    Validates that a practitioner can create, complete, sign, email, and print a patient prescription (Script) using the Basic Script Features.
    Navigate To Diary And Open Patient Booking    ${PRESCRIPTION_DATA}[patient_name]    ${PRESCRIPTION_DATA}[booking_id]
    Start Script Creation For Patient    ${PRESCRIPTION_DATA}[script_type]
    Enter Medication Details In Script    ${PRESCRIPTION_DATA}[medication_list]
    Enter Diagnosis And Directions    ${PRESCRIPTION_DATA}[diagnosis]    ${PRESCRIPTION_DATA}[directions]
    Complete And Sign Script    ${PRESCRIPTION_DATA}[signature_required]    ${PRESCRIPTION_DATA}[signature_configured]
    Validate Script Status Is Completed    ${PRESCRIPTION_DATA}[status]
    Validate Script Output Fields    ${PRESCRIPTION_DATA}[expected_output_fields]
    Validate QR Code Is Visible On Output    ${PRESCRIPTION_DATA}[output_qr_code_expected]
    Email Script To Patient    ${PRESCRIPTION_DATA}[email_to_patient]    ${PRESCRIPTION_DATA}[email_address]
    Print Script Document    ${PRESCRIPTION_DATA}[print_script]    ${PRESCRIPTION_DATA}[print_copies]
