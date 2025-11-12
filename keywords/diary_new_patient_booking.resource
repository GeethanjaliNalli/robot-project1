*** Settings ***
Documentation    Keywords for Diary - New Patient Booking (TC00002_Diary_NPB)
Resource         ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen. Reuses existing login keywords if available.
    # Reuse existing login keyword if present, else implement login steps
    Run Keyword    Login To Application
    # Navigate to Diary screen if not already there
    Run Keyword    Go To Diary Screen

Open New Patient Booking Form
    [Documentation]    Opens the New Patient Booking form from the diary screen.
    Click Element    ${DIARY_NEW_PATIENT_BUTTON}
    Wait Until Element Is Visible    ${DIARY_PATIENT_NAME_FIELD}

Fill Patient Name
    [Arguments]    ${patient_name}
    [Documentation]    Fills in the patient name in the booking form.
    Input Text    ${DIARY_PATIENT_NAME_FIELD}    ${patient_name}

Fill Booking Date
    [Arguments]    ${booking_date}
    [Documentation]    Fills in the booking date in the booking form.
    Input Text    ${DIARY_BOOKING_DATE_FIELD}    ${booking_date}

Save New Patient Booking
    [Documentation]    Saves the new patient booking.
    Click Button    ${DIARY_SAVE_BUTTON}
    Wait Until Page Contains Element    ${DIARY_NEW_PATIENT_BUTTON}

Close New Patient Booking Form
    [Documentation]    Closes the new patient booking form without saving.
    Click Button    ${DIARY_CLOSE_BUTTON}
    Wait Until Element Is Not Visible    ${DIARY_PATIENT_NAME_FIELD}

Booking Should Be Made If Required Information Is Filled And Saved
    [Documentation]    Verifies that a booking is made if required information is filled and saved.
    # Implement verification logic, e.g., check booking appears in diary
    Run Keyword    Booking Should Exist In Diary

Booking Should Not Be Made If Screen Closed Or Required Fields Not Filled
    [Documentation]    Verifies that no booking is made if the screen is closed or required fields are not filled.
    # Implement verification logic, e.g., check booking does not appear in diary
    Run Keyword    Booking Should Not Exist In Diary
