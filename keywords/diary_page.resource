*** Settings ***
Documentation    Keywords for Diary Page - New Patient Booking (TC00002_Diary_NPB)
Resource         ../common/super.resource

*** Keywords ***
New Patient Booking Should Be Created
    [Documentation]    Create a new patient booking in the diary and verify booking is reflected with Black "A" icon.
    [Arguments]    ${patient_name}    ${time}
    # Assumes user is already logged in and on the diary screen (precondition)
    Click New Booking Button
    Input Patient Name    ${patient_name}
    Select Diary Time Slot    ${time}
    Click Save Booking Button
    Booking Should Be Displayed On Diary    ${patient_name}    ${time}

Click New Booking Button
    [Documentation]    Clicks the 'New Booking' button on the diary page.
    Click Element    ${DIARY_NEW_BOOKING_BUTTON}

Input Patient Name
    [Documentation]    Inputs the patient name in the booking form.
    [Arguments]    ${patient_name}
    Input Text    ${DIARY_PATIENT_NAME_FIELD}    ${patient_name}

Select Diary Time Slot
    [Documentation]    Selects the specified time slot in the diary.
    [Arguments]    ${time}
    ${slot_locator}=    Replace String    ${DIARY_TIME_SLOT}    ${TIME}    ${time}
    Click Element    ${slot_locator}

Click Save Booking Button
    [Documentation]    Clicks the 'Save' button to save the booking.
    Click Element    ${DIARY_SAVE_BUTTON}

Booking Should Be Displayed On Diary
    [Documentation]    Verifies the new booking is displayed on the diary at the selected time slot with the Black "A" icon.
    [Arguments]    ${patient_name}    ${time}
    ${slot_locator}=    Replace String    ${DIARY_TIME_SLOT}    ${TIME}    ${time}
    Element Should Contain    ${slot_locator}    ${patient_name}
    Element Should Be Visible    ${DIARY_BOOKING_ICON}
