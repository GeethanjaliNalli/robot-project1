*** Settings ***
Documentation     Keywords for Diary - New Patient Booking functionality
Resource          ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen. Reuses existing login and navigation keywords if available.
    Run Keyword    Login To Application
    Wait Until Element Is Visible    ${DIARY_SCREEN}    10s

Book New Patient In Diary
    [Documentation]    Books a new patient in the diary by filling required fields and saving.
    Click Element    ${NEW_BOOKING_BUTTON}
    Input Text       ${PATIENT_NAME_FIELD}    ${PATIENT_NAME}
    Input Text       ${TIME_SLOT_FIELD}       ${TIME_SLOT}
    Click Element    ${SAVE_BOOKING_BUTTON}

Verify New Booking Reflected In Diary
    [Documentation]    Verifies that the new booking is visible in the selected diary and time slot with a black 'A' icon.
    # Replace the following with actual verification logic as per UI
    Element Should Be Visible    xpath=//div[contains(@class,'booking') and .//span[@class='icon-a-black'] and .//span[text()='${PATIENT_NAME}'] and .//span[text()='${TIME_SLOT}']]

Booking Should Be Made If Required Information Is Saved
    [Documentation]    Ensures booking is made only if all required information is filled and saved.
    # This keyword can be called after saving to check booking presence
    Run Keyword    Verify New Booking Reflected In Diary

No Booking Should Be Made If Screen Closed Or Fields Missing
    [Documentation]    Ensures no booking is made if the screen is closed or required fields are not filled.
    # Simulate closing or incomplete input, then check absence
    # Example for closing:
    Click Element    xpath=//button[@id='close-booking']
    Element Should Not Be Visible    xpath=//div[contains(@class,'booking') and .//span[text()='${PATIENT_NAME}']]
    # Example for missing fields:
    Click Element    ${NEW_BOOKING_BUTTON}
    # Do not fill required fields
    Click Element    ${SAVE_BOOKING_BUTTON}
    Element Should Not Be Visible    xpath=//div[contains(@class,'booking') and .//span[text()='${PATIENT_NAME}']]
