*** Settings ***
Documentation    This file contains all the test cases related to New Patient Booking in the Diary module, including positive and negative scenarios.
Resource    ../../common/super.resource
Resource    ../../Testdata/new_patient_booking_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Book New Patient With All Required Information
    [Documentation]    Verifies that a new patient booking can be created when all required information is provided and saved.
    Open Diary Module
    Initiate New Patient Booking
    Fill New Patient Booking Details    &{NEW_PATIENT_BOOKING_VALID}
    Save Booking
    Validate Booking Is Created    &{NEW_PATIENT_BOOKING_VALID}

TC_02 Do Not Book Patient When Required Fields Are Missing
    [Documentation]    Verifies that booking is not created if required fields are missing (e.g., last name).
    Open Diary Module
    Initiate New Patient Booking
    Fill New Patient Booking Details    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}
    Attempt To Save Booking With Missing Fields
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}

TC_03 Do Not Book Patient When Screen Is Closed Without Saving
    [Documentation]    Verifies that booking is not created if the user closes the booking screen without saving.
    Open Diary Module
    Initiate New Patient Booking
    Fill New Patient Booking Details    &{NEW_PATIENT_BOOKING_SCREEN_CLOSED}
    Close Booking Screen Without Saving
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_SCREEN_CLOSED}
