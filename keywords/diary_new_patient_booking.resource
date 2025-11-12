*** Settings ***
Documentation    Keywords for Diary - New Patient Booking (TC00002_Diary_NPB). Handles preconditions, booking actions, and validations.
Resource    ../common/super.resource

*** Keywords ***
User Should Be Logged In On Diary Screen
    [Documentation]    Ensures the user is logged in and on the diary screen (precondition).
    # Reuse existing login keywords if available, else implement navigation
    Run Keyword    Login To Application
    Run Keyword    Go To Diary Screen

Select Diary Booking Slot
    [Documentation]    Selects the desired time slot in the diary for booking.
    Click Element    ${DIARY_BOOKING_SLOT}

Click New Booking Button
    [Documentation]    Clicks the button to start a new booking.
    Click Element    ${DIARY_NEW_BOOKING_BTN}

Enter Patient Name
    [Documentation]    Enters the patient name in the booking form.
    Input Text    ${DIARY_PATIENT_NAME_FIELD}    ${PATIENT_NAME}

Save New Booking
    [Documentation]    Saves the new booking after entering required details.
    Click Button    ${DIARY_SAVE_BTN}

Verify New Booking Is Reflected On Diary
    [Documentation]    Verifies that the new booking appears on the selected diary and time slot, with the Black 'A' icon.
    Element Should Be Visible    ${DIARY_BOOKING_ICON}

Booking Should Be Made If Required Information Filled And Saved
    [Documentation]    Confirms booking is made if all required fields are filled and saved.
    Run Keyword    Verify New Booking Is Reflected On Diary

No Booking Should Be Made If Screen Closed Or Required Fields Missing
    [Documentation]    Ensures no booking is made if not all required fields are filled or if the screen is closed.
    # Implementation depends on application behavior; placeholder for negative scenario
    # Example: Element Should Not Be Visible    ${DIARY_BOOKING_ICON}
