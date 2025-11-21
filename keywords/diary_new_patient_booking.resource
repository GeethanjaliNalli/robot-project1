*** Settings ***
Documentation    Keywords for New Patient Booking workflow in Diary module
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters booking and patient details into the booking form using provided data dictionary.
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
    [Documentation]    Clicks the Save button on the booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Click Close Booking Form
    [Documentation]    Clicks the Close button on the booking form to cancel booking.
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Fills in the booking form and saves a new patient booking.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking

Create New Patient Booking Without Required Fields
    [Documentation]    Attempts to save booking with missing required fields; expects no booking to be made.
    [Arguments]    &{incomplete_info}
    Enter Booking Form Data    &{incomplete_info}
    Click Save Booking

Create New Patient Booking And Close Without Saving
    [Documentation]    Fills in booking form but closes without saving; expects no booking to be made.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Close Booking Form
