*** Settings ***
Documentation    Keywords for creating a new patient booking from the Diary screen.
Resource    ../common/super.resource
Resource    ./diary_new_patient_booking_locators.resource

*** Keywords ***

Open New Patient Booking Form
    [Documentation]    Opens the new patient booking form from the Diary screen.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.save}
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient.name}    timeout=5s

Enter New Patient Details
    [Documentation]    Enters required patient details in the new booking form.
    [Arguments]    &{patient_data}
    FOR    ${field}    ${value}    IN    &{patient_data}
        ${locator}=    Get From Dictionary    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Fill Text    ${locator}    ${value}
    END

Save New Patient Booking
    [Documentation]    Saves the new patient booking form.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.save}
    Wait Until Element Is Not Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient.name}    timeout=10s

Close New Patient Booking Form
    [Documentation]    Closes the new patient booking form without saving.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient.name}    timeout=5s

Validate Booking Is Created
    [Documentation]    Validates that a booking is created when required information is filled and saved.
    # Implementation should check booking presence in Diary (add actual validation as per application)
    # Example: Wait Until Page Contains Element    ${some_booking_locator}

Validate Booking Is Not Created
    [Documentation]    Validates that no booking is created if required fields are missing or form is closed.
    # Implementation should check booking absence in Diary (add actual validation as per application)
    # Example: Wait Until Page Does Not Contain Element    ${some_booking_locator}
