*** Settings ***
Documentation    Data-driven suite for validating new patient booking from the diary screen.
...              Ensures booking is created with valid data and not created when required fields are missing or form is closed.
Test Template    Validate User Is Able To Create New Patient Booking Template
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=NewPatientBooking

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate User Is Able To Create New Patient Booking Template

*** Keywords ***
Validate User Is Able To Create New Patient Booking Template
    [Documentation]    Template for validating new patient booking creation and negative scenarios.
    [Arguments]    ${test_case_name}
    ${row_data}=    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    NewPatientBooking
    Open New Patient Booking Form
    Enter New Patient Booking Details    &{row_data}
    Save New Patient Booking
    Validate Booking Is Created
    Close New Patient Booking Form
    Validate Booking Is Not Created
