*** Settings ***
Documentation     Test suite for New Patient Booking in the Diary module. Validates creation of a new booking and verifies booking is reflected with correct icon and behavior.
Resource          ../common/super.resource

*** Test Cases ***
New Patient Booking Should Be Created And Reflected In Diary
    [Documentation]    Verifies that a new patient booking can be created in the Diary and is correctly reflected with the Black 'A' icon. Also checks that booking is only made when all required information is filled and saved.
    [Tags]    Diary    NewPatientBooking    Functional    Medium
    User Should Be Logged In On Diary Screen
    Click New Booking Button
    Enter Patient Name
    Select Booking Date
    Select Time Slot
    Save Booking
    Verify New Booking Is Reflected
    Booking Should Be Made If Required Information Filled
    No Booking Should Be Made If Screen Closed Or Required Fields Missing
