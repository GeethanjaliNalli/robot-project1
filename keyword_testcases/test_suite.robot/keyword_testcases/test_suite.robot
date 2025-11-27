*** Settings ***
Documentation    This file contains all the test cases related to the GoodX Web Application Diary New Patient Booking.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Diary New Patient Booking With All Required Information
    [Documentation]    Verifies that a new patient booking is created when all required patient and booking information is captured and saved.
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${PATIENT_INFO_VALID}
    Capture Booking Details For New Patient    ${BOOKING_INFO_VALID}
    Save New Patient Booking
    Validate New Patient Booking Is Created In Diary    ${PATIENT_INFO_VALID}    ${BOOKING_INFO_VALID}    ${EXPECTED_DATA}[booking_created_when_all_required_filled_and_saved]

TC_02 Diary New Patient Booking Closed Without Saving
    [Documentation]    Verifies that no booking is created when the user closes the new patient booking screen without saving.
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${PATIENT_INFO_VALID}
    Capture Booking Details For New Patient    ${BOOKING_INFO_CLOSE_WITHOUT_SAVE}
    Close New Patient Booking Screen Without Saving
    Validate New Patient Booking Is Not Created In Diary    ${PATIENT_INFO_VALID}    ${BOOKING_INFO_CLOSE_WITHOUT_SAVE}    ${EXPECTED_DATA}[booking_created_when_screen_closed_without_save]

TC_03 Diary New Patient Booking With Missing Required Information
    [Documentation]    Verifies that no booking is created when required patient or booking information is missing and the user attempts to save.
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${PATIENT_INFO_MISSING_REQUIRED}
    Capture Booking Details For New Patient    ${BOOKING_INFO_MISSING_REQUIRED}
    Attempt To Save New Patient Booking With Missing Required Information
    Validate Validation Messages For Missing Required Booking Information
    Validate New Patient Booking Is Not Created In Diary    ${PATIENT_INFO_MISSING_REQUIRED}    ${BOOKING_INFO_MISSING_REQUIRED}    ${EXPECTED_DATA}[booking_created_when_missing_required_fields]
