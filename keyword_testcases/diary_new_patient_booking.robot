*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Launch Diary
Test Teardown    Logout

*** Test Cases ***
TC_01 Validate User Is Able To Create New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking when all required information is filled and saved.
    ...    Ensures booking is created and visible in the diary.
    Select Menu In Navigation Wheel    DIARY
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validates that booking is not created if required information is missing and user attempts to save.
    ...    Ensures no booking is created in the diary for incomplete data.
    Select Menu In Navigation Wheel    DIARY
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Validate Booking Timeslot Is Not Created    ${EXPECTED_DATA}[timeslot]

TC_03 Validate Booking Is Not Created When Booking Form Is Closed
    [Documentation]    Validates that no booking is created if the user closes the booking form without saving.
    ...    Ensures diary remains unchanged when booking is cancelled.
    Select Menu In Navigation Wheel    DIARY
    Cancel New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Not Created    ${EXPECTED_DATA}[timeslot]
