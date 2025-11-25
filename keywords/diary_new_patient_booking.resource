*** Settings ***
Documentation    Keywords for New Patient Booking in Diary module.
Resource    ../common/super.resource
Resource    ../objectrepository/diary_new_patient_booking_page.resource

*** Keywords ***

Enter New Patient Booking Form Data
    [Documentation]    Enters required data into the New Patient Booking form fields.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Fill Text    ${locator}    ${value}
    END

Save New Patient Booking
    [Documentation]    Saves the New Patient Booking form.
    Click    ${button.save}
    Wait Until Element Is Not Visible    ${button.save}    timeout=10s

Close New Patient Booking Form
    [Documentation]    Closes the New Patient Booking form without saving.
    Click    ${button.close}
    Wait Until Element Is Not Visible    ${button.close}    timeout=5s

Validate Booking Is Created
    [Documentation]    Validates that a booking is created when required information is filled and saved.
    # Implementation to check booking presence goes here (use existing project validation keywords if available)

Validate Booking Is Not Created
    [Documentation]    Validates that no booking is created if form is incomplete or closed without saving.
    # Implementation to check absence of booking goes here (use existing project validation keywords if available)
