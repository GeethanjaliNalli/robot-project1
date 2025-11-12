*** Settings ***
Documentation    Keywords for Diary - New Patient Booking
Resource         ../common/super.resource

*** Keywords ***
Open Diary Screen
    [Documentation]    Ensure the user is on the Diary screen. Assumes user is already logged in.
    # Implementation depends on navigation; placeholder for navigation if needed.
    # Example: Go To Diary Page

Click New Booking Button
    [Documentation]    Clicks the button to start a new patient booking.
    Click Element    ${DIARY_NEW_BOOKING_BUTTON}

Fill Patient Booking Details
    [Arguments]    ${patient_name}    ${booking_date}
    [Documentation]    Fills in required patient booking details.
    Input Text    ${DIARY_PATIENT_NAME_FIELD}    ${patient_name}
    Input Text    ${DIARY_BOOKING_DATE_FIELD}    ${booking_date}

Save Booking
    [Documentation]    Saves the new patient booking.
    Click Element    ${DIARY_SAVE_BUTTON}

Close Booking Screen
    [Documentation]    Closes the booking screen without saving.
    Click Element    ${DIARY_CLOSE_BUTTON}

Booking Should Be Created
    [Documentation]    Verifies that a booking was created when required information was filled and saved.
    # Implement verification logic, e.g., check for booking confirmation or presence in booking list.
    # Example: Element Should Be Visible    ${DIARY_BOOKING_CONFIRMATION}

Booking Should Not Be Created
    [Documentation]    Verifies that no booking was created if required fields are missing or the screen is closed.
    # Implement verification logic, e.g., check absence in booking list.
    # Example: Element Should Not Be Visible    ${DIARY_BOOKING_CONFIRMATION}
