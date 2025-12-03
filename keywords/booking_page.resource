*** Settings ***
Documentation    Booking page keywords for New Patient Booking (TC00002_Diary_NPB).
Resource    ../common/super.resource
Resource    ../objectrepository/booking_new_patient_booking_locators.resource

*** Keywords ***
Navigate To Diary Page
    [Documentation]    Navigates to the Diary page from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.new_booking]    ${LONG_WAIT}

Click Add New Booking
    [Documentation]    Clicks the Add New Booking button on the Diary page.
    Wait Until Element Is Visible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.new_booking]    ${LONG_WAIT}
    Click    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.new_booking]
    Wait Until Element Is Visible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[input.booking_type]    ${LONG_WAIT}

Fill New Patient Booking Details
    [Documentation]    Fills all required and optional fields in the New Patient Booking form using provided data.
    [Arguments]    &{form_data}
    Enter New Patient Booking Form Data    &{form_data}

Fill New Patient Booking Details With Missing Fields
    [Documentation]    Fills the New Patient Booking form with missing required fields for negative testing.
    [Arguments]    &{form_data}
    Enter New Patient Booking Form Data With Missing Fields    &{form_data}

Save Booking
    [Documentation]    Saves the New Patient Booking form.
    Click    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]
    Wait Until Element Is Invisible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]    timeout=${LONG_WAIT}

Attempt To Save Booking With Missing Fields
    [Documentation]    Attempts to save the booking form when required fields are missing.
    Click    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]
    Wait Until Element Is Visible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.save_booking]    ${LONG_WAIT}

Close Booking Screen Without Saving
    [Documentation]    Closes the New Patient Booking form without saving.
    Click    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.close_booking]
    Wait Until Element Is Invisible    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}[button.close_booking]    timeout=${LONG_WAIT}

Validate Booking Is Created
    [Documentation]    Validates that a booking with the provided details is created and visible in the diary.
    [Arguments]    &{expected_data}
    ${row_locator}=    Get Booking Row Locator    &{expected_data}
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}
    ${row_text}=    Get Text    ${row_locator}
    Should Contain    ${row_text}    ${expected_data}[complete_name]
    Should Contain    ${row_text}    ${expected_data}[complete_surname]

Validate Booking Is Not Created
    [Documentation]    Validates that a booking with the provided details does not exist in the diary.
    [Arguments]    &{expected_data}
    ${row_locator}=    Get Booking Row Locator    &{expected_data}
    Wait Until Element Is Not Visible    ${row_locator}    ${LONG_WAIT}

Validate Required Field Error Messages Are Displayed
    [Documentation]    Validates that required field error messages are displayed when saving with missing fields.
    Wait Until Element Is Visible    ${label.error}    ${LONG_WAIT}
    ${error_text}=    Get Text    ${label.error}
    Should Contain    ${error_text}    Required

Enter New Patient Booking Form Data
    [Documentation]    Enters all fields for the New Patient Booking form using a data dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}=    Get Booking Form Locator    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select_')    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('add_reason_for_appointment')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('complete_')    Fill Text    ${locator}    ${value}
    END

Enter New Patient Booking Form Data With Missing Fields
    [Documentation]    Enters form data with missing required fields for negative scenarios.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}=    Get Booking Form Locator    ${field}
        Run Keyword If    '${field}' == 'complete_name'    Continue For Loop
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select_')    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('add_reason_for_appointment')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('complete_')    Fill Text    ${locator}    ${value}
    END

Get Booking Form Locator
    [Documentation]    Returns the locator for a booking form field based on the test data field name.
    [Arguments]    ${field}
    ${mapping}=    Create Dictionary    select_booking_type=input.booking_type    select_booking_status=input.booking_status    select_date=input.booking_date    select_time=input.booking_time    select_duration=input.duration    add_reason_for_appointment=textarea.reason    complete_name=input.patient_name    complete_surname=input.patient_surname    complete_cellphone=input.cellphone    select_id_type=select.id_type    complete_id_number=input.id_number    complete_medical_aid_option=input.medical_aid_option    complete_ma_number=input.medical_aid_number    select_gender=select.gender    complete_initials=input.initials    select_title=select.title
    ${form_field}=    Get From Dictionary    ${mapping}    ${field}
    ${locator}=    Get From Dictionary    ${BOOKING_NEW_PATIENT_BOOKING_LOCATORS}    ${form_field}
    [Return]    ${locator}

Get Booking Row Locator
    [Documentation]    Builds a dynamic locator for a booking row in the diary table based on patient name and surname.
    [Arguments]    &{expected_data}
    ${row_locator}=    Set Variable    //tr[td[contains(., '${expected_data}[complete_name]')] and td[contains(., '${expected_data}[complete_surname]')]]
    [Return]    ${row_locator}
