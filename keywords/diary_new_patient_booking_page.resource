*** Settings ***
Documentation    Diary New Patient Booking page keywords for TC00002_Diary_NPB.
Resource    ../common/super.resource
Resource    ../objectrepository/diary_new_patient_booking_locators.resource

*** Keywords ***
Open Diary And Open New Booking Dialog
    [Documentation]    Navigates to the Diary screen and opens the New Booking dialog.
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[button.new_booking]    ${LONG_WAIT}
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[button.new_booking]
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[slot.open_time]    ${LONG_WAIT}
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[slot.open_time]
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.booking_type]    ${LONG_WAIT}

Select Booking Type And Status
    [Documentation]    Selects the booking type and status in the New Booking dialog.
    [Arguments]    ${booking_type}    ${booking_status}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.booking_type]    label    ${booking_type}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.booking_status]    label    ${booking_status}

Enter Booking Date Time And Duration
    [Documentation]    Enters booking date, time, and duration fields.
    [Arguments]    ${booking_date}    ${booking_time}    ${booking_duration}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.booking_date]    ${booking_date}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.booking_time]    ${booking_time}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.booking_duration]    ${booking_duration}

Enter Reason For Appointment
    [Documentation]    Enters the reason for appointment in the booking form.
    [Arguments]    ${reason_for_appointment}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[textarea.reason_for_appointment]    ${reason_for_appointment}

Enter Patient Name And Surname
    [Documentation]    Enters patient name and surname fields.
    [Arguments]    ${patient_name}    ${patient_surname}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.patient_name]    ${patient_name}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.patient_surname]    ${patient_surname}

Enter Patient Cellphone
    [Documentation]    Enters patient cellphone number.
    [Arguments]    ${patient_cellphone}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.patient_cellphone]    ${patient_cellphone}

Select ID Type And Enter ID Number
    [Documentation]    Selects ID type and enters ID number.
    [Arguments]    ${id_type}    ${id_number}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.id_type]    label    ${id_type}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.id_number]    ${id_number}

Select Medical Aid Option And Enter Number
    [Documentation]    Selects medical aid option and enters medical aid number.
    [Arguments]    ${medical_aid_option}    ${medical_aid_number}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.medical_aid_option]    label    ${medical_aid_option}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.medical_aid_number]    ${medical_aid_number}

Select Patient Gender
    [Documentation]    Selects patient gender.
    [Arguments]    ${gender}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.gender]    label    ${gender}

Enter Patient Initials
    [Documentation]    Enters patient initials.
    [Arguments]    ${initials}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[input.initials]    ${initials}

Select Patient Title
    [Documentation]    Selects patient title.
    [Arguments]    ${title}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[select.title]    label    ${title}

Save New Patient Booking
    [Documentation]    Saves the new patient booking.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]
    Wait Until Element Is Invisible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]    timeout=${LONG_WAIT}

Validate Booking Created Successfully
    [Documentation]    Validates that the booking was created successfully by checking for patient in diary list.
    ${expected_name}    Set Variable    ${BOOKING_DATA.input.patient_name}
    ${expected_surname}    Set Variable    ${BOOKING_DATA.input.patient_surname}
    ${expected_date}    Set Variable    ${BOOKING_DATA.input.booking_date}
    ${expected_time}    Set Variable    ${BOOKING_DATA.input.booking_time}
    ${row_locator}    Evaluate Expression    //tr[td[contains(., '${expected_name}')] and td[contains(., '${expected_surname}')] and td[contains(., '${expected_date}')] and td[contains(., '${expected_time}')]]
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}

Enter New Patient Booking Form Data
    [Documentation]    Enters all new patient booking form fields using a dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')
        ...    Fill Text    ${locator}    ${value}
    END

Close New Patient Booking Dialog
    [Documentation]    Closes the New Patient Booking dialog without saving.
    Click    ${button.close}
    Wait Until Element Is Invisible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]    timeout=${LONG_WAIT}

Validate Booking Not Created
    [Documentation]    Validates that the booking was not created (does not exist in diary list).
    ${expected_name}    Set Variable    ${BOOKING_DATA.input.patient_name}
    ${expected_surname}    Set Variable    ${BOOKING_DATA.input.patient_surname}
    ${expected_date}    Set Variable    ${BOOKING_DATA.input.booking_date}
    ${expected_time}    Set Variable    ${BOOKING_DATA.input.booking_time}
    ${row_locator}    Evaluate Expression    //tr[td[contains(., '${expected_name}')] and td[contains(., '${expected_surname}')] and td[contains(., '${expected_date}')] and td[contains(., '${expected_time}')]]
    Wait Until Element Is Not Visible    ${row_locator}    ${LONG_WAIT}
