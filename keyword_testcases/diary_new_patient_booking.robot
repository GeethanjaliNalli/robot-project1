*** Settings ***
Documentation    Test cases to validate New Patient Booking functionality in Diary module
Resource    ../common/super.resource
Test Setup    Login And Launch Diary Module
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can create a new patient booking in the diary module.
    ...    Booking should be created if all required information is filled and saved.
    ...    Booking details should be visible in the diary after saving.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[timeslot]
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Ensure that booking is not created when required fields are missing.
    ...    Attempt to save booking with missing surname and verify booking is not created.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO_MISSING_SURNAME}[timeslot]
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Handle Attention Alert    dismiss
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_SURNAME}[timeslot]

TC_03 Validate Booking Is Not Created When User Closes Booking Form Without Saving
    [Documentation]    Ensure that booking is not created when the user closes the booking form without saving.
    ...    Booking should not be present in the diary if form is closed without saving.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[timeslot]
    Cancel New Patient Booking
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[timeslot]
