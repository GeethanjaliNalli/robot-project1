*** Settings ***
Documentation    Test cases to validate new patient booking functionality including positive and negative scenarios.
Resource    ../common/super.resource
Test Setup    Launch Application And Login
Test Teardown    Logout And Close Application

*** Test Cases ***
TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validates that a user can create a new patient booking by filling all required fields and saving the form.
    ...    Ensures booking is created when all mandatory information is provided.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Create New Patient Booking    ${BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${BOOKING_INFO}[input.time]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validates that a booking is not created if required fields are missing in the new patient booking form.
    ...    Ensures system prevents incomplete bookings.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO_MISSING_REQUIRED}[input.time]
    Create New Patient Booking    ${BOOKING_INFO_MISSING_REQUIRED}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_REQUIRED}[input.time]

TC_03 Validate Booking Is Not Created When Form Is Closed Without Saving
    [Documentation]    Validates that no booking is created if the user closes the booking form without saving.
    ...    Ensures closing the form does not create a booking.
    Select Menu In Navigation Wheel    DIARY
    Select Timeslot    ${BOOKING_INFO}[input.time]
    Close Booking Form
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
