*** Settings ***
Documentation    This file contains test cases related to Diary functionalities, including adding and verifying Sick Notes (Medical Certificates) for patients.
Resource    ../../common/super.resource
Resource    ../../Testdata/sick_note_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC_02 Diary - Add Sick Note For Patient
    [Documentation]    Creates and verifies a Sick Note (Medical Certificate) for a selected patient from Diary.
    Select Patient Booking From Diary    ${SICK_NOTE_INFO}[patient_name]    ${SICK_NOTE_INFO}[booking_id]
    Open Clinical Forms For Patient
    Select Sick Note Form    ${SICK_NOTE_INFO}[note_type]
    Fill Sick Note Details    ${SICK_NOTE_INFO}
    Save Sick Note
    Validate Sick Note Saved In Clinical Record    ${SICK_NOTE_INFO}[note_type]
    Email Sick Note To Patient    ${SICK_NOTE_INFO}[email_to_patient]    ${SICK_NOTE_INFO}[email_subject]    ${SICK_NOTE_INFO}[email_body]
    Print Sick Note Certificate    ${SICK_NOTE_INFO}[print_certificate]    ${SICK_NOTE_INFO}[print_copies]
    Validate Print And Email Logs In Communication History    ${SICK_NOTE_INFO}[patient_id]
    Validate QR Code On Printout    ${SICK_NOTE_INFO}[qr_code]
