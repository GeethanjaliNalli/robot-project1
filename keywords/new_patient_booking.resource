*** Settings ***
Documentation    Keywords for New Patient Booking workflow in Diary module
Resource    ../common/super.resource

*** Keywords ***

Enter Form Data
    [Documentation]    Fills form fields using provided form data dictionary
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Set Checkbox    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('radio.')    Select Radio Button    ${locator}    ${value}
    END

Click Save Booking
    [Documentation]    Clicks the Save button on the booking form
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Click Close Booking Form
    [Documentation]    Closes the booking form without saving
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking by filling required fields and saving
    [Arguments]    &{booking_info}
    Enter Form Data    &{booking_info}
    Click Save Booking

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a new patient booking with missing required fields
    [Arguments]    &{booking_info}
    Enter Form Data    &{booking_info}
    Click Save Booking
    # Verification of error handling should be done in test case

Cancel New Patient Booking
    [Documentation]    Cancels the new patient booking process
    Click Close Booking Form
