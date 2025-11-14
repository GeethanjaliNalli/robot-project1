*** Settings ***
Documentation    Keywords for Diary Page - New Patient Booking functionality
Resource    ../common/super.resource

*** Keywords ***
User Should Be On Diary Screen
    [Documentation]    Verifies that the user is logged in and on the diary screen (precondition)
    Wait Until Element Is Visible    ${DIARY_SCREEN}    timeout=10s

Click New Booking Button
    [Documentation]    Clicks the button to start a new booking
    Click Element    ${NEW_BOOKING_BUTTON}

Enter Patient Name
    [Arguments]    ${patient_name}
    [Documentation]    Enters the patient name in the booking form
    Input Text    ${PATIENT_NAME_FIELD}    ${patient_name}

Select Time Slot
    [Arguments]    ${time_slot}
    [Documentation]    Selects the desired time slot for the booking
    Input Text    ${TIME_SLOT_FIELD}    ${time_slot}

Save New Booking
    [Documentation]    Saves the new booking
    Click Element    ${SAVE_BOOKING_BUTTON}

Verify New Booking Is Reflected On Diary
    [Arguments]    ${patient_name}    ${time_slot}
    [Documentation]    Verifies that the new booking is displayed on the selected diary and time slot, with the Black "A"-icon
    # Example: Wait for booking to appear (customize as needed)
    Wait Until Page Contains Element    //div[contains(text(), '${patient_name}') and contains(text(), '${time_slot}')]    timeout=10s
    # Verify Black "A"-icon is present (customize locator as needed)
    Page Should Contain Element    //div[contains(@class, 'black-a-icon') and contains(text(), '${patient_name}')]

Booking Should Not Be Created If Not Saved Or Required Fields Missing
    [Arguments]    ${patient_name}    ${time_slot}
    [Documentation]    Ensures that if booking is not saved or required fields are missing, no booking is created
    # Check that booking does not exist
    Page Should Not Contain Element    //div[contains(text(), '${patient_name}') and contains(text(), '${time_slot}')]
