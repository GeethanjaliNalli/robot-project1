*** Settings ***
Documentation    Test suite for New Patient Booking in Diary module. Verifies that a booking is created when all required fields are filled and saved, and not created when the screen is closed or required fields are missing.
Resource    ../common/super.resource

*** Test Cases ***
New Patient Booking Should Be Created When Required Information Is Filled And Saved
    [Documentation]    Verify that a new patient booking is created when all required information is filled in and saved.
    [Tags]    Smoke    Diary    NewPatientBooking    Positive
    User Should Be Logged In On Diary Screen
    Fill Required New Patient Booking Information
    Save New Patient Booking
    Booking Should Be Created If Required Information Filled And Saved

New Patient Booking Should Not Be Created When Screen Closed Without Saving
    [Documentation]    Verify that no booking is created if the user closes the new patient booking screen without saving.
    [Tags]    Regression    Diary    NewPatientBooking    Negative
    User Should Be Logged In On Diary Screen
    Fill Required New Patient Booking Information
    Close New Patient Booking Screen
    Booking Should Not Be Created If Screen Closed Or Required Fields Missing

New Patient Booking Should Not Be Created When Required Fields Are Missing
    [Documentation]    Verify that no booking is created if required fields are missing and save is attempted.
    [Tags]    Regression    Diary    NewPatientBooking    Negative
    User Should Be Logged In On Diary Screen
    # Intentionally do not fill all required fields
    Save New Patient Booking
    Booking Should Not Be Created If Screen Closed Or Required Fields Missing
