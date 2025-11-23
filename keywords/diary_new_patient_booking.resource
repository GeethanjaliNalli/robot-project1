*** Settings ***
Documentation    Keywords for New Patient Booking in Diary module
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters booking form data using the provided dictionary
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Click Element    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the Save button on the booking form
    Click Element    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Click Close Booking Form
    [Documentation]    Clicks the Close button on the booking form
    Click Element    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking with required information
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a new patient booking with missing required fields
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking

Cancel New Patient Booking
    [Documentation]    Cancels the new patient booking by closing the form
    Click Close Booking Form
