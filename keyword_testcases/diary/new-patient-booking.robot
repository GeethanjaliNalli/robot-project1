*** Settings ***
Documentation    Test suite for Diary - New Patient Booking. Verifies that a user can create a new patient booking and it is reflected on the diary with the correct icon.
Resource    ../../common/super.resource

*** Test Cases ***
TC00002_Diary_NPB New Patient Booking
    [Documentation]    Validate that a new patient booking can be created and is reflected on the diary with the Black "A"-icon when all required information is filled and saved. No booking should be made if required fields are missing or booking is not saved.
    [Tags]    Diary    Booking    Smoke
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    User Should Be On Diary Screen
    Click New Booking Button
    Enter Patient Name    John Doe
    Select Time Slot    10:00 AM
    Save New Booking
    Verify New Booking Is Reflected On Diary    John Doe    10:00 AM
    # Negative scenario: Do not save booking and verify it is not created
    Click New Booking Button
    Enter Patient Name    Jane Smith
    Select Time Slot    11:00 AM
    # Do not save
    Booking Should Not Be Created If Not Saved Or Required Fields Missing    Jane Smith    11:00 AM
    # Negative scenario: Required field missing
    Click New Booking Button
    # Do not enter patient name
    Select Time Slot    12:00 PM
    # Do not save
    Booking Should Not Be Created If Not Saved Or Required Fields Missing    ${EMPTY}    12:00 PM
