*** Settings ***
Documentation    This booking page Resource file has all the keywords for New Patient Booking
Resource    ../common/super.resource

*** Keywords ***
Open Diary Module
    [Documentation]    Opens the Diary module from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_booking}    ${LONG_WAIT}

Click Create New Booking Button
    [Documentation]    Clicks the 'Create New Booking' button on the diary page.
    [Arguments]    ${locator}
    Click    ${locator}
    Wait Until Element Is Visible    ${select.booking_type}    ${LONG_WAIT}

Select Booking Type And Status
    [Documentation]    Selects booking type and booking status from dropdowns.
    [Arguments]    ${booking_type_locator}    ${booking_status_locator}    ${booking_type}=New Patient    ${booking_status}=Confirmed
    Select Options By    ${booking_type_locator}    label    ${booking_type}
    Select Options By    ${booking_status_locator}    label    ${booking_status}

Enter Booking Date And Time
    [Documentation]    Enters the booking date and time.
    [Arguments]    ${date_locator}    ${time_locator}    ${date}=2025-12-10    ${time}=09:30
    Fill Text    ${date_locator}    ${date}
    Fill Text    ${time_locator}    ${time}

Enter Booking Duration
    [Documentation]    Enters the duration for the booking.
    [Arguments]    ${duration_locator}    ${duration}=30
    Fill Text    ${duration_locator}    ${duration}

Enter Booking Reason
    [Documentation]    Enters the reason for the booking.
    [Arguments]    ${reason_locator}    ${reason}=General Consultation
    Fill Text    ${reason_locator}    ${reason}

Enter Patient Name And Surname
    [Documentation]    Enters the patient name and surname.
    [Arguments]    ${name_locator}    ${surname_locator}    ${name}=John    ${surname}=Doe
    Fill Text    ${name_locator}    ${name}
    Fill Text    ${surname_locator}    ${surname}

Enter Patient Cellphone
    [Documentation]    Enters the patient cellphone number.
    [Arguments]    ${cellphone_locator}    ${cellphone}=0812345678
    Fill Text    ${cellphone_locator}    ${cellphone}

Enter Patient ID Type And Number
    [Documentation]    Selects the ID type and enters the ID number.
    [Arguments]    ${id_type_locator}    ${id_number_locator}    ${id_type}=ID    ${id_number}=9001015800087
    Select Options By    ${id_type_locator}    label    ${id_type}
    Fill Text    ${id_number_locator}    ${id_number}

Save New Patient Booking
    [Documentation]    Saves the new patient booking form.
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${button.save_booking}    timeout=${LONG_WAIT}

Validate Booking Created Successfully
    [Documentation]    Validates that the booking was created successfully by checking for the patient's name and surname in the diary list.
    ${patient_name}    Set Variable    ${new_patient_booking_valid}[${input.name}]
    ${patient_surname}    Set Variable    ${new_patient_booking_valid}[${input.surname}]
    ${booking_row_locator}    Evaluate Expression    //tr[td[contains(., '${patient_name}')] and td[contains(., '${patient_surname}')]]
    Wait Until Element Is Visible    ${booking_row_locator}    ${LONG_WAIT}
    ${row_text}    Get Text    ${booking_row_locator}
    Should Contain    ${row_text}    ${patient_name}
    Should Contain    ${row_text}    ${patient_surname}

Validate Booking Not Created Due To Missing Fields
    [Documentation]    Validates that the booking was not created due to missing required fields (e.g. surname).
    ${patient_name}    Set Variable    ${new_patient_booking_missing_fields}[${input.name}]
    ${patient_surname}    Set Variable    ${new_patient_booking_missing_fields}[${input.surname}]
    ${booking_row_locator}    Evaluate Expression    //tr[td[contains(., '${patient_name}')] and td[contains(., '${patient_surname}')]]
    Wait Until Element Is Not Visible    ${booking_row_locator}    ${LONG_WAIT}

Enter New Patient Booking Data
    [Documentation]    Enters all fields for new patient booking using a form data dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
    END
