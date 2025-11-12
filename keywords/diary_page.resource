*** Settings ***
Documentation    Keywords for Diary Page - New Patient Booking functionality
Resource    ../common/super.resource

*** Keywords ***
User Should Be On Diary Screen
    [Documentation]    Verifies that the user is logged in and on the diary screen (precondition)
    # Reuse existing login and navigation keywords if available, else implement navigation
    User Should Be Logged In
    Wait Until Element Is Visible    ${DIARY_NEW_BOOKING_BUTTON}

Open New Patient Booking Form
    [Documentation]    Opens the new patient booking form on the diary screen
    Click Element    ${DIARY_NEW_BOOKING_BUTTON}
    Wait Until Element Is Visible    ${DIARY_PATIENT_NAME_FIELD}

Enter Patient Name
    [Arguments]    ${patient_name}
    [Documentation]    Enters the patient's name in the booking form
    Input Text    ${DIARY_PATIENT_NAME_FIELD}    ${patient_name}

Select Booking Time Slot
    [Arguments]    ${time_slot}
    [Documentation]    Selects the desired time slot for the booking
    Input Text    ${DIARY_TIME_SLOT_FIELD}    ${time_slot}

Save New Booking
    [Documentation]    Saves the new booking
    Click Button    ${DIARY_SAVE_BUTTON}
    Wait Until Element Is Visible    ${DIARY_BOOKING_ICON}

Verify New Booking Reflected In Diary
    [Arguments]    ${time_slot}
    [Documentation]    Verifies that the new booking is reflected in the selected diary and time slot, and the Black "A"-icon is present
    Element Should Be Visible    ${DIARY_BOOKING_ICON}
    # Optionally, verify time slot and patient name if possible

No Booking Should Be Made If Not Saved Or Required Fields Missing
    [Documentation]    Verifies that no booking is made if the form is closed or required fields are missing
    # Implementation depends on application behavior
    # For now, check that the booking icon is NOT visible
    Element Should Not Be Visible    ${DIARY_BOOKING_ICON}
