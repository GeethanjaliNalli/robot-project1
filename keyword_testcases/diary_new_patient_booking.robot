*** Settings ***
Documentation    Test suite for Diary - New Patient Booking (TC00002_Diary_NPB). Validates that a new patient booking can be created from the diary screen and verifies booking creation and non-creation scenarios as per requirements.
Resource         ../common/super.resource

*** Test Cases ***
New Patient Booking Should Be Created When Required Information Is Filled And Saved
    [Documentation]    Verify that a new patient booking is created when all required information is filled and saved.
    [Tags]    Smoke    Diary    NewPatientBooking    TC00002_Diary_NPB
    User Should Be Logged In On Diary Screen
    Open New Patient Booking Form
    Fill Patient Name    John Doe
    Fill Booking Date    2024-06-10
    Save New Patient Booking
    Booking Should Be Made If Required Information Is Filled And Saved

No Booking Should Be Created If Required Information Is Not Filled
    [Documentation]    Verify that no booking is created if required fields are not filled and save is attempted or form is closed.
    [Tags]    Negative    Diary    NewPatientBooking    TC00002_Diary_NPB
    User Should Be Logged In On Diary Screen
    Open New Patient Booking Form
    # Do not fill required fields
    Save New Patient Booking
    Booking Should Not Be Made If Screen Closed Or Required Fields Not Filled

No Booking Should Be Created If Form Is Closed Without Saving
    [Documentation]    Verify that no booking is created if the new patient booking form is closed without saving.
    [Tags]    Negative    Diary    NewPatientBooking    TC00002_Diary_NPB
    User Should Be Logged In On Diary Screen
    Open New Patient Booking Form
    Close New Patient Booking Form
    Booking Should Not Be Made If Screen Closed Or Required Fields Not Filled
