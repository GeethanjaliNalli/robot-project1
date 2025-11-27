*** Settings ***
Documentation    This file contains all the test cases related to the New Patient Booking functionality in the Diary module, including positive and negative booking scenarios.
Resource    ../../common/super.resource
Test Setup    Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Book New Patient With All Required Information
    [Documentation]    Verifies that a new patient booking can be made when all required information is filled in and saved.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_VALID}
    Save Booking
    Validate Booking Is Created    &{NEW_PATIENT_BOOKING_VALID}

TC_02 Booking Not Created When Required Fields Are Missing
    [Documentation]    Verifies that a booking is not made if required fields are missing in the new patient booking form.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_MISSING_FIELDS}
    Attempt To Save Booking With Missing Fields
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_MISSING_FIELDS}

TC_03 Booking Not Created When Booking Screen Is Closed Without Saving
    [Documentation]    Verifies that no booking is made if the user closes the booking screen without saving.
    Go To Diary Page
    Start New Patient Booking
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_CANCELLED}
    Close Booking Screen Without Saving
    Validate Booking Is Not Created    &{NEW_PATIENT_BOOKING_CANCELLED}
