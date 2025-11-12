*** Settings ***
Documentation    Keywords for New Patient Booking in Diary module (TC00002_Diary_NPB)
Resource    ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen (precondition)
    # Reuse existing login keyword if available, else implement navigation to diary screen
    Run Keyword    Login To Application
    Wait Until Element Is Visible    ${DIARY_SCREEN}    10s

Open New Booking Dialog
    [Documentation]    Opens the new booking dialog from the diary screen
    Click Element    ${NEW_BOOKING_BUTTON}
    Wait Until Element Is Visible    ${PATIENT_NAME_FIELD}    5s

Fill Patient Name
    [Arguments]    ${patient_name}
    [Documentation]    Fills the patient name in the booking form
    Input Text    ${PATIENT_NAME_FIELD}    ${patient_name}

Select Booking Time Slot
    [Arguments]    ${time_slot}
    [Documentation]    Selects the desired time slot for the booking
    Click Element    ${BOOKING_TIME_SLOT}
    # Optionally select the correct slot if multiple slots are available

Save New Booking
    [Documentation]    Saves the new patient booking
    Click Button    ${SAVE_BOOKING_BUTTON}
    Wait Until Element Is Not Visible    ${SAVE_BOOKING_BUTTON}    10s

Verify New Booking Is Reflected In Diary
    [Arguments]    ${patient_name}    ${time_slot}
    [Documentation]    Verifies that the new booking appears in the diary at the selected time slot with the Black "A" icon
    # TODO: Implement actual verification using a locator for the booking entry
    Element Should Be Visible    locator('<PLACEHOLDER_booking_entry>')    # TODO: Replace with actual locator for booking entry

Verify No Booking Created If Not Saved Or Required Fields Missing
    [Documentation]    Verifies that no booking is created if user closes the screen or required fields are not filled
    # TODO: Implement actual verification logic
    Element Should Not Be Visible    locator('<PLACEHOLDER_booking_entry>')    # TODO: Replace with actual locator for booking entry
