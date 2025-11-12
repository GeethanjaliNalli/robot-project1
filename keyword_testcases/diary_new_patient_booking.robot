*** Settings ***
Documentation    Test suite for Diary - New Patient Booking. Validates that a new patient booking can be created from the diary screen and is reflected correctly.
Resource         ../common/super.resource

*** Test Cases ***
TC00002_Diary_New_Patient_Booking
    [Documentation]    Validate that a new patient booking can be created from the diary screen and is reflected with the correct icon. Also verifies that booking is not created if required information is missing or the screen is closed.
    [Tags]    Diary    NewPatientBooking    Smoke
    User Should Be Logged In On Diary Screen
    Select Diary Time Slot For New Booking
    Fill New Patient Booking Details
    Save New Patient Booking
    Verify New Booking Is Reflected On Diary
    Booking Should Be Made If Required Information Is Filled And Saved
    No Booking Should Be Made If Screen Closed Or Required Fields Not Filled
