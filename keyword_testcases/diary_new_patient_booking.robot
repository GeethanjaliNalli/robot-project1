*** Settings ***
Documentation    This suite validates new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login To Application
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validates that a user can successfully create a new patient booking in the Diary module.
    ...    Ensures all required fields are filled and booking is saved correctly.
    Select Menu In Navigation Wheel    DIARY
    Create New Patient Booking    ${BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]
