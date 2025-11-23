*** Settings ***
Documentation    This suite validates the Diary - New Patient Booking workflow including positive and negative scenarios.
Resource    ../common/super.resource
Test Setup    Login To Application    ${VALID_USER}    ${VALID_PASSWORD}
Test Teardown    Logout From Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can create a new patient booking by filling all required fields and saving the form.
    ...    Booking should be created and visible in the diary timeslot.
    Select Menu In Navigation Wheel    DIARY
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.date]    ${BOOKING_INFO}[input.time]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that a booking is not created if required fields are missing (e.g., surname is empty).
    ...    System should not allow booking creation and should display an attention alert.
    Select Menu In Navigation Wheel    DIARY
    Create New Patient Booking With Missing Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_SURNAME}[input.date]    ${BOOKING_INFO_MISSING_SURNAME}[input.time]

TC_03 Validate Booking Is Not Created When User Closes The Booking Form
    [Documentation]    Validate that closing the booking form without saving does not create a booking.
    ...    No booking should be present for the attempted timeslot.
    Select Menu In Navigation Wheel    DIARY
    Cancel New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.date]    ${BOOKING_INFO}[input.time]
