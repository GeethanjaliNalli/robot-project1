*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Navigate To Diary
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking in the Diary module.
    ...    Ensures all required information is filled and booking is saved successfully.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${PATIENT_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validates that a booking is not created if required information is missing.
    ...    Ensures no booking is made when mandatory fields are not filled and form is closed.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Enter Booking Form Data    &{EMPTY_BOOKING_INFO}
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
