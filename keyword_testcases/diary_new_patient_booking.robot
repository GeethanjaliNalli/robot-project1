*** Settings ***
Documentation    Test cases to validate new patient booking functionality in the Diary module.
Resource    ../common/super.resource
Test Setup    Login And Launch Diary Module
Test Teardown    Logout

*** Test Cases ***

TC_01 Validate User Is Able To Perform New Patient Booking
    [Documentation]    Validate that a user can successfully create a new patient booking...
    ...    when all required information is provided and saved.
    Select Timeslot For Booking    ${BOOKING_INFO}
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created    ${EXPECTED_DATA}[timeslot]

TC_02 Validate Booking Is Not Created When Required Fields Are Missing
    [Documentation]    Validate that booking is not created when required fields are missing...
    ...    and an attempt is made to save the booking form.
    Select Timeslot For Booking    ${BOOKING_INFO_MISSING_SURNAME}
    Create New Patient Booking Without Required Fields    &{BOOKING_INFO_MISSING_SURNAME}
    Handle Attention Alert    dismiss
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO_MISSING_SURNAME}[input.time]

TC_03 Validate Booking Is Not Created When Booking Form Is Closed Without Saving
    [Documentation]    Validate that booking is not created when the booking form is closed...
    ...    without saving after entering booking details.
    Select Timeslot For Booking    ${BOOKING_INFO}
    Create New Patient Booking And Close Without Saving    &{BOOKING_INFO}
    Validate Booking Timeslot Is Not Created    ${BOOKING_INFO}[input.time]
