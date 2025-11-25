*** Settings ***
Documentation    Data-driven suite for validating new patient booking creation in the diary module.
...              Covers positive and negative booking scenarios using test data.
Test Template    Validate New Patient Booking Flow
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=NewPatientBooking

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate New Patient Booking Flow

*** Keywords ***
Validate New Patient Booking Flow
    [Documentation]    Executes the new patient booking test flow using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    NewPatientBooking
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[input.time]
    Enter New Patient Booking Form Data    ${row_data}[booking_form_data]
    Run Keyword If    '${row_data}[save]' == 'Y'    Save New Patient Booking
    ...    ELSE    Close New Patient Booking Form
    Run Keyword If    '${row_data}[save]' == 'Y'    Validate Booking Is Created
    ...    ELSE    Validate Booking Is Not Created
