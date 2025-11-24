*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Launch Application
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can create a new patient booking in the Diary module.
    ...    The booking should be saved when all required fields are filled in and saved.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that a booking is not created when required fields are missing.
    ...    The booking should not be saved if required information is not provided.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO}[input.time]
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_03 Validate Booking Is Not Created When Booking Form Is Closed Without Saving
    [Documentation]    Validate that a booking is not created when the booking form is closed without saving.
    ...    The booking should not be saved if the user closes the form before saving.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO}[input.time]
    Create New Patient Booking And Close Without Saving    &{BOOKING_INFO}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
