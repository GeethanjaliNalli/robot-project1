*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Launch Diary Module
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking in the Diary module.
    ...    Ensures that when all required information is filled and saved, the booking is created successfully.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validates that a booking is not created if required fields are missing.
    ...    Ensures that the application prevents booking creation when mandatory information is not provided.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO_MISSING_SURNAME}[input.time]
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Handle Attention Alert    dismiss
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_SURNAME}[input.time]

TC_03 Validate Booking Is Not Created When Booking Form Is Closed
    [Documentation]    Validates that no booking is created if the booking form is closed before saving.
    ...    Ensures that closing the form without saving does not create a booking in the Diary module.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot For Booking    ${BOOKING_INFO}[input.time]
    Cancel New Patient Booking
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
