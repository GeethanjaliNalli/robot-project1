*** Settings ***
Documentation    Test suite for New Patient Booking in Diary module (TC00002_Diary_NPB). Verifies that a new patient booking can be created and is reflected in the diary with the correct icon and details. Also checks that no booking is created if required information is missing or not saved.
Resource    ../common/super.resource

*** Test Cases ***
New Patient Booking Is Created And Reflected In Diary
    [Documentation]    Verify that a new patient booking can be created and is reflected in the diary at the selected time slot with the Black "A" icon.
    [Tags]    Diary    NewPatientBooking    Functional    TC00002_Diary_NPB
    User Should Be Logged In On Diary Screen
    Open New Booking Dialog
    Fill Patient Name    John Doe
    Select Booking Time Slot    10:00 AM
    Save New Booking
    Verify New Booking Is Reflected In Diary    John Doe    10:00 AM

No Booking Created If Not Saved Or Required Fields Missing
    [Documentation]    Verify that no booking is created if the user closes the screen or does not fill all required fields.
    [Tags]    Diary    NewPatientBooking    Negative    TC00002_Diary_NPB
    User Should Be Logged In On Diary Screen
    Open New Booking Dialog
    # Do not fill patient name or do not save
    Verify No Booking Created If Not Saved Or Required Fields Missing
