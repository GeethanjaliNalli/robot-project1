*** Settings ***
Documentation    Test suite for Diary - New Patient Booking (TC00002_Diary_NPB). Validates that a new patient booking can be created and is reflected in the diary with correct icon and behavior.
Resource    ../common/super.resource

*** Test Cases ***
Diary - New Patient Booking Should Be Reflected In Diary
    [Documentation]    Verify that a new patient booking is created and displayed in the diary with the Black 'A' icon when all required information is provided and saved.
    [Tags]    Diary    NewPatientBooking    Smoke
    User Should Be Logged In On Diary Screen
    Select Diary Booking Slot
    Click New Booking Button
    Enter Patient Name
    Save New Booking
    Booking Should Be Made If Required Information Filled And Saved

Diary - No Booking If Required Information Missing Or Screen Closed
    [Documentation]    Verify that no booking is made if required fields are missing or the booking screen is closed without saving.
    [Tags]    Diary    NewPatientBooking    Negative
    User Should Be Logged In On Diary Screen
    Select Diary Booking Slot
    Click New Booking Button
    # Do not enter patient name or close the screen without saving
    No Booking Should Be Made If Screen Closed Or Required Fields Missing
