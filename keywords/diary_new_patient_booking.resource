*** Settings ***
Documentation    Keywords for Diary New Patient Booking functionality
Resource    ../common/super.resource

*** Keywords ***

Enter Form Data
    [Documentation]    Enters data into the booking or patient form fields using provided dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('button.')    Click    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the Save button to submit the new booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking by entering all required information and saving the booking.
    [Arguments]    &{booking_info}
    Enter Form Data    &{booking_info}
    Click Save Booking
    Handle Attention Alert
    Sleep    1s
