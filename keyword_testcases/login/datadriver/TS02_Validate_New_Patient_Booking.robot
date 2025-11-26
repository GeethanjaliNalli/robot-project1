*** Settings ***
Documentation    This suite validates new patient booking scenarios including positive and negative flows.
...              It uses DataDriver to execute multiple booking scenarios using test data from Excel.
Test Template    Validate New Patient Booking Scenario
Resource    ../../../common/super.resource
Library    DataDriver    ${TESTDATA_FOLDER}    sheet_name=new_patient_booking_negative

*** Test Cases ***
# robocop disable line
${test_case_name}
    [Template]    Validate New Patient Booking Scenario

*** Keywords ***
Validate New Patient Booking Scenario
    [Documentation]    Executes new patient booking using provided test data and validates booking creation or rejection as expected.
    [Arguments]    ${test_case_name}
    ${row_data}=    Read TestData From Excel    ${TESTDATA_FOLDER}    ${test_case_name}    new_patient_booking_negative
    Validate Dashboard Is Displayed
    Select Menu In Navigation Wheel    ${DIARY_MODULE}
    Select Timeslot    ${row_data}[Time]
    Create New Patient Booking    ${row_data}    ${row_data}
    Run Keyword If    '${row_data}[Expected_Result]'=='A booking should be made'    Save Booking Form
    ...    ELSE    Close Booking Form
    Run Keyword If    '${row_data}[Expected_Result]'=='A booking should be made'    Validate Booking Timeslot Is Created    ${row_data}[Time]    ${row_data}[Debtor_CellNo]    ${row_data}[Debtor_Title] ${row_data}[Debtor_Surname], ${row_data}[Debtor_Initials], ${row_data}[Debtor_Firstname]
    ...    ELSE    Validate Booking Timeslot Is Not Created    ${row_data}[Time]
