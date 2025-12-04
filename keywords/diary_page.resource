*** Settings ***
Documentation    This diary page Resource file has all the keywords for Diary New Patient Booking (TC00002_Diary_NPB)
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Start New Booking
    [Documentation]    Navigates to the Diary screen and opens the New Booking dialog.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.newbooking}    ${LONG_WAIT}
    Click    ${button.newbooking}
    Wait Until Element Is Visible    ${label.addeditbooking}    ${LONG_WAIT}

Fill Patient Details For Booking
    [Documentation]    Fills patient details in the booking form using provided arguments.
    [Arguments]    ${patientFirstName}    ${patientLastName}    ${patientDOB}    ${patientGender}    ${patientEmail}    ${patientPhone}    ${patientAddress}
    &{form_data}=    Create Dictionary
    ...    input.patientFirstName=${patientFirstName}
    ...    input.patientLastName=${patientLastName}
    ...    input.patientDOB=${patientDOB}
    ...    input.patientGender=${patientGender}
    ...    input.patientEmail=${patientEmail}
    ...    input.patientPhone=${patientPhone}
    ...    input.patientAddress=${patientAddress}
    Enter Booking Form Data    &{form_data}

Select Booking Date And Time
    [Documentation]    Selects booking date and time in the booking form.
    [Arguments]    ${bookingDate}    ${bookingTime}
    &{form_data}=    Create Dictionary
    ...    input.bookingDate=${bookingDate}
    ...    input.bookingTime=${bookingTime}
    Enter Booking Form Data    &{form_data}

Select Booking Type
    [Documentation]    Selects the booking type in the booking form.
    [Arguments]    ${bookingType}
    &{form_data}=    Create Dictionary
    ...    select.bookingType=${bookingType}
    Enter Booking Form Data    &{form_data}

Select Doctor For Booking
    [Documentation]    Selects the doctor for the booking.
    [Arguments]    ${doctor}
    &{form_data}=    Create Dictionary
    ...    select.doctor=${doctor}
    Enter Booking Form Data    &{form_data}

Select Appointment Reason
    [Documentation]    Selects the appointment reason for the booking.
    [Arguments]    ${appointmentReason}
    &{form_data}=    Create Dictionary
    ...    select.appointmentReason=${appointmentReason}
    Enter Booking Form Data    &{form_data}

Fill Insurance Details For Booking
    [Documentation]    Fills insurance details in the booking form.
    [Arguments]    ${insuranceNumber}    ${insuranceProvider}
    &{form_data}=    Create Dictionary
    ...    input.insuranceNumber=${insuranceNumber}
    ...    select.insuranceProvider=${insuranceProvider}
    Enter Booking Form Data    &{form_data}

Add Booking Notes
    [Documentation]    Adds notes to the booking form.
    [Arguments]    ${notes}
    ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    textarea.notes
    Fill Text    ${locator}    ${notes}

Save New Patient Booking
    [Documentation]    Saves the new patient booking form.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${label.addeditbooking}    timeout=${LONG_WAIT}

Validate New Patient Booking Created
    [Documentation]    Validates that the new patient booking is created and visible in the diary.
    ${firstName}    Set Variable    ${BOOKING_DATA.input.patientFirstName}
    ${lastName}    Set Variable    ${BOOKING_DATA.input.patientLastName}
    ${bookingDate}    Set Variable    ${BOOKING_DATA.input.bookingDate}
    ${bookingTime}    Set Variable    ${BOOKING_DATA.input.bookingTime}
    ${row_locator}    Evaluate    f"//tr[td[contains(., '{firstName}')] and td[contains(., '{lastName}')] and td[contains(., '{bookingDate}')] and td[contains(., '{bookingTime}')]]"
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}
    ${row_text}    Get Text    ${row_locator}
    Should Contain    ${row_text}    ${firstName}
    Should Contain    ${row_text}    ${lastName}
    Should Contain    ${row_text}    ${bookingDate}
    Should Contain    ${row_text}    ${bookingTime}

Enter Booking Form Data
    [Documentation]    Enters booking form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END
