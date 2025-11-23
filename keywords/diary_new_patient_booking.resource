*** Settings ***
Documentation    Keywords for Diary - New Patient Booking workflow
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters booking form data using provided dictionary.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${value}' == ''    Continue For Loop
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${field}'.startswith('select.')    Select From Dropdown    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('input.')    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('checkbox.')    Click    ${locator}
        Run Keyword If    '${field}'.startswith('radio.')    Click    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the Save button on the booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Close Booking Form
    [Documentation]    Closes the booking form without saving.
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Creates a new patient booking with provided booking and debtor info.
    [Arguments]    &{booking_info}    &{debtor_info}
    Enter Booking Form Data    &{booking_info}
    Enter Booking Form Data    &{debtor_info}
    Click Save Booking
