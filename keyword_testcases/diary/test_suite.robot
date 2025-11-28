*** Settings ***
Documentation    This file contains all the test cases related to the New Patient Booking functionality in the Diary module.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 New Patient Booking With All Required Information
    [Documentation]    Verifies that a new patient booking can be made when all required information is filled in and saved.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_VALID}
    Save Booking
    Validate Booking Is Created    &{NEW_PATIENT_BOOKING_VALID}

TC_02 New Patient Booking With Missing Required Fields
    [Documentation]    Verifies that booking is not created if required fields are missing in the new patient booking form.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_MISSING_FIELDS}
    Save Booking
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_MISSING_FIELDS}

TC_03 New Patient Booking Cancelled By User
    [Documentation]    Verifies that no booking is made if the user cancels the new patient booking process before saving.
    Open Diary Screen
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_CANCELLED}
    Cancel Booking
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_CANCELLED}
