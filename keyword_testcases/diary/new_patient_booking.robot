*** Settings ***
Documentation    Test suite for validating new patient booking functionality from the diary screen.
Resource    ../../common/super.resource

*** Test Cases ***
TC_00002_Diary_New_Patient_Booking
    [Documentation]    Verify that a new patient booking can be created from the diary screen and is reflected correctly with the Black "A"-icon. Also verify that no booking is made if required fields are missing or booking is not saved.
    [Tags]    Diary    Booking    Smoke    Functional
    User Should Be On Diary Screen
    Open New Patient Booking Form
    Enter Patient Name    John Doe
    Select Booking Time Slot    09:00 AM
    Save New Booking
    Verify New Booking Reflected In Diary    09:00 AM
    # Negative scenario: Try closing form or omitting required fields and verify no booking is made
    Open New Patient Booking Form
    # Do not enter patient name or time slot, directly close or attempt to save
    No Booking Should Be Made If Not Saved Or Required Fields Missing
