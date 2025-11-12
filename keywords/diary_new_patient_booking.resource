*** Settings ***
Documentation    Keywords for New Patient Booking in Diary module. Handles preconditions, booking actions, and validations for TC00002_Diary_NPB.
Resource         ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen. Uses existing login and navigation keywords if available.
    # Reuse existing login keyword if present, else implement login and navigation
    Run Keyword    Login To Application
    Run Keyword    Navigate To Diary Screen

Click New Booking Button
    [Documentation]    Clicks the 'New Booking' button on the diary page.
    Click Element    ${DIARY_NEW_BOOKING_BUTTON}

Enter Patient Name
    [Documentation]    Enters the patient name in the booking form.
    Input Text    ${DIARY_PATIENT_NAME_INPUT}    ${PATIENT_NAME}

Select Booking Date
    [Documentation]    Selects the booking date in the diary.
    Click Element    ${DIARY_DATE_PICKER}
    # Add date selection logic here

Select Time Slot
    [Documentation]    Selects the desired time slot for the booking.
    Click Element    ${DIARY_TIME_SLOT_SELECT}
    # Add time slot selection logic here

Save Booking
    [Documentation]    Saves the new booking.
    Click Element    ${DIARY_SAVE_BUTTON}

Verify New Booking Is Reflected
    [Documentation]    Verifies that the new booking appears in the selected diary and time slot, with the Black 'A' icon.
    # Add verification logic for booking and icon
    Element Should Be Visible    ${DIARY_NEW_BOOKING_BUTTON}    # Replace with actual booking locator
    # Optionally, verify Black 'A' icon

Booking Should Be Made If Required Information Filled
    [Documentation]    Verifies booking is made if all required information is filled and saved.
    # Add assertion logic for successful booking

No Booking Should Be Made If Screen Closed Or Required Fields Missing
    [Documentation]    Verifies that no booking is made if the screen is closed or required fields are not filled.
    # Add assertion logic for negative scenario
