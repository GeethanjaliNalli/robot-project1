*** Settings ***
Documentation    Keywords for Diary - New Patient Booking (TC00002_Diary_NPB). Handles preconditions, booking actions, and result validation.
Resource    ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen (precondition).
    # Reuse existing login keyword if available, else implement login and navigation
    Run Keyword    Login To Application
    Run Keyword    Navigate To Diary Screen

Fill Required New Patient Booking Information
    [Documentation]    Fills in all required fields for new patient booking using Diary NPB locators.
    # Example: Replace with actual field names and values as per real locators
    Input Text    ${DIARY_NPB_LOCATOR_1}    John Doe
    Input Text    ${DIARY_NPB_LOCATOR_2}    01/01/1990
    Input Text    ${DIARY_NPB_LOCATOR_3}    1234567890
    Input Text    ${DIARY_NPB_LOCATOR_4}    john.doe@example.com
    Input Text    ${DIARY_NPB_LOCATOR_5}    General Checkup

Save New Patient Booking
    [Documentation]    Saves the new patient booking after required information is filled in.
    # Example: Click the Save button (replace with actual locator)
    Click Button    ${DIARY_NPB_LOCATOR_4}

Close New Patient Booking Screen
    [Documentation]    Closes the new patient booking screen without saving.
    # Example: Click the Close/Cancel button (replace with actual locator)
    Click Button    ${DIARY_NPB_LOCATOR_5}

Booking Should Be Created If Required Information Filled And Saved
    [Documentation]    Verifies that a booking is created if all required information is filled and saved.
    # Example: Check for booking confirmation or entry in diary (replace with actual check)
    Element Should Be Visible    ${DIARY_NPB_LOCATOR_1}

Booking Should Not Be Created If Screen Closed Or Required Fields Missing
    [Documentation]    Verifies that no booking is created if screen is closed or required fields are missing.
    # Example: Check for absence of booking entry (replace with actual check)
    Element Should Not Be Visible    ${DIARY_NPB_LOCATOR_1}
