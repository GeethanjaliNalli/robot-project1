*** Settings ***
Documentation    Keywords for New Patient Booking - Positive Scenario
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters all required booking and patient information into the booking form fields.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Click Element    ${locator}
        Run Keyword If    '${field}'.startswith('radio.')    Click Element    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the Save button to submit the booking form.
    Click Element    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Create New Patient Booking
    [Documentation]    Fills in booking and patient information and submits the form to create a new booking.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking
    Handle Attention Alert
    Sleep    2s
