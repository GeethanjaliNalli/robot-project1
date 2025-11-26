*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Navigate To Diary
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validate that a user can successfully create a new patient booking when all required information is provided.
    ...    Booking should be saved and visible in the diary timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Available Timeslot For Booking
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that a booking is not created when required information is missing.
    ...    No booking should be made if mandatory fields are not filled.
    Select Menu In Navigation Wheel    DIARY
    Select Available Timeslot For Booking
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_SURNAME}[input.debtor.surname]

TC_03 Validate Booking Is Not Created When Booking Form Is Closed
    [Documentation]    Validate that closing the booking form without saving does not create a booking.
    ...    No booking should be made if the user cancels the process.
    Select Menu In Navigation Wheel    DIARY
    Select Available Timeslot For Booking
    Cancel New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.debtor.surname]
