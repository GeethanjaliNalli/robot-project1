*** Settings ***
Documentation    Test suite for verifying new patient booking functionality in the diary module.
Resource         ../common/super.resource
Suite Setup      Login To Application    ${USERNAME}    ${PASSWORD}
Suite Teardown   Logout From The Application

*** Test Cases ***
TC_01 New Patient Booking
    [Documentation]    Verify that a new patient booking can be created when all required information is filled and saved.
    Create New Patient Booking    &{BOOKING_INFO}
    Validate Booking Timeslot Is Created
