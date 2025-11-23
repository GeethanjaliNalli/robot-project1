*** Settings ***
Documentation    Test suite for validating new patient booking positive scenario in diary module.
Resource    ../common/super.resource
Test Setup    Login To Application
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validates that a user can successfully create a new patient booking with all required information.
    ...    Ensures that the booking is saved and visible in the diary timeslot.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]
