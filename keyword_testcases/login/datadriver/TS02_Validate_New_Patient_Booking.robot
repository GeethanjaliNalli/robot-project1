*** Settings ***
Documentation    Data-driven suite for validating new patient booking from the Diary page.
...              Ensures booking is created when all required information is filled and saved.
Test Template    Validate New Patient Booking
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=new_patient_booking

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate New Patient Booking

*** Keywords ***
Validate New Patient Booking
    [Documentation]    Executes the new patient booking flow using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    new_patient_booking
    Open New Patient Booking Form
    Enter New Patient Details    &{row_data}
    Save New Patient Booking
    Validate Booking Success Message
