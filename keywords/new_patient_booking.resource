*** Settings ***
Documentation    Keywords for New Patient Booking workflow including form entry, save, and validation actions.
Resource    ../common/super.resource
Resource    ../objectrepository/new_patient_booking_form.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters data into the New Patient Booking form fields using provided form data.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
    END

Click Save Booking Form
    [Documentation]    Clicks the Save button on the New Patient Booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking by entering form data and saving the booking.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking Form

Validate Booking Not Created
    [Documentation]    Validates that no booking is created if required fields are missing or the form is closed.
    # Implementation depends on application feedback, placeholder for validation logic.
    Sleep    1s