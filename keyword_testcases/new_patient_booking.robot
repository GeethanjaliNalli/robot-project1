*** Settings ***
Documentation    This suite contains test cases to validate new patient booking functionality in the diary module.
Resource    ../common/super.resource
Test Setup    Login To Application    ${VALID_USER}    ${VALID_PASSWORD}
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can successfully create a new patient booking when all required fields are filled in and saved.
    ...    The booking should be created and visible in the diary.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}    ${DEBTOR_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that a booking is not created if required fields are missing and the user attempts to save.
    ...    The booking should not be created in the diary.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking With Missing Fields    ${BOOKING_INFO}    ${EMPTY_DEBTOR_INFO}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]

TC_03 Validate Booking Is Not Created When User Closes Booking Form
    [Documentation]    Validate that no booking is created if the user closes the booking form without saving.
    ...    The booking should not be created in the diary.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Cancel New Patient Booking
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
