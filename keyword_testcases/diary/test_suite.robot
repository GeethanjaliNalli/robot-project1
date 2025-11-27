*** Settings ***
Documentation    This file contains all the test cases related to the Diary - New Patient Booking, including positive and negative scenarios.
Resource    ../../common/super.resource
Resource    ../../Testdata/new_patient_booking_data.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Book New Patient With All Required Information
    [Documentation]    Verifies that a new patient booking can be made when all required information is provided and saved.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_VALID}
    Save Booking
    Validate Booking Is Created    &{NEW_PATIENT_BOOKING_VALID}

TC_02 Booking Not Made When Required Fields Are Missing
    [Documentation]    Verifies that booking is not made when required fields are missing in the new patient booking form.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}
    Attempt To Save Booking With Missing Fields
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}

TC_03 Booking Not Made When User Cancels The Booking
    [Documentation]    Verifies that booking is not made when the user closes the new patient booking screen without saving.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_CANCELLED}
    Cancel Booking
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_CANCELLED}
