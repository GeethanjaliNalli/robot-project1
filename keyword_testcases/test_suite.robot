*** Settings ***
Documentation    This file contains all the test cases related to the Diary_ New patient booking.
Resource    ../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Create New Patient Booking With All Required Information
    [Documentation]    Verifies that a new patient booking can be created when all required information is filled in and saved.
    Create New Patient Booking    &{PATIENT_INFO}    &{BOOKING_INFO}
    Validate Booking Is Created    ${EXPECTED_DATA.booking_status}    ${EXPECTED_DATA.confirmation_message}

TC_02 Do Not Create Booking When Required Fields Are Missing
    [Documentation]    Verifies that no booking is created if required fields are missing.
    Attempt New Patient Booking With Missing Fields    &{PATIENT_INFO}    &{BOOKING_INFO}
    Validate Error Message Is Displayed    ${EXPECTED_DATA.error_message}
    Validate No Booking Was Made    ${EXPECTED_DATA.no_booking_message}

TC_03 Do Not Create Booking When Screen Is Closed Without Saving
    [Documentation]    Verifies that no booking is created if the user closes the booking screen without saving.
    Start New Patient Booking    &{PATIENT_INFO}    &{BOOKING_INFO}
    Close Booking Screen Without Saving
    Validate No Booking Was Made    ${EXPECTED_DATA.no_booking_message}
