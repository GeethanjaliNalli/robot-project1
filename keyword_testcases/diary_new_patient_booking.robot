*** Settings ***
Documentation     Test suite for Diary - New Patient Booking. Validates that a new patient can be booked from the diary screen and booking is only created when required information is provided and saved.
Resource          ../common/super.resource

*** Test Cases ***
New Patient Booking - Successful Booking
    [Documentation]    Verify that a new patient booking is created when all required fields are filled and saved.
    [Tags]    TC00002_Diary_NPB    Smoke    Functional
    User Should Be Logged In On Diary Screen
    Open New Patient Booking Form
    Fill New Patient Booking Required Fields
    Save New Patient Booking
    Verify Booking Is Created

New Patient Booking - No Booking On Incomplete Or Closed Form
    [Documentation]    Verify that no booking is created if required fields are missing or form is closed without saving.
    [Tags]    TC00002_Diary_NPB    Negative    Functional
    User Should Be Logged In On Diary Screen
    Open New Patient Booking Form
    # Do not fill all required fields or close the form (simulate by skipping Save)
    Verify No Booking On Incomplete Or Closed Form
