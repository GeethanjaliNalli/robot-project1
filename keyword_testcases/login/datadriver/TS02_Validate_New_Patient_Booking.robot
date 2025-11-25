*** Settings ***
Documentation    Data-driven suite for validating new patient booking scenarios.
...              Covers positive and negative flows for booking creation in Diary module.
Test Template    Validate New Patient Booking Scenario
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=new_patient_booking

*** Test Cases ***
# robocop disable
${test_case_name}
    [Template]    Validate New Patient Booking Scenario

*** Keywords ***
Validate New Patient Booking Scenario
    [Documentation]    Executes patient booking creation and validation using provided test data.
    [Arguments]    ${test_case_name}
    ${row_data}=    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    new_patient_booking
    Validate Dashboard Is Displayed
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Open New Patient Booking Form
    Enter New Patient Details    ${row_data}[PATIENT_DATA]
    Run Keyword If    '${row_data}[ACTION]' == 'SAVE'    Save New Patient Booking
    ...    ELSE IF    '${row_data}[ACTION]' == 'CLOSE'    Close New Patient Booking Form
    Run Keyword If    '${row_data}[EXPECTED_RESULT]' == 'CREATED'    Validate Booking Is Created
    ...    ELSE    Validate Booking Is Not Created
