*** Settings ***
Documentation    Keywords for Diary New Patient Booking functionality
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters all required booking form fields using provided data dictionary.
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

Close Booking Form
    [Documentation]    Closes the booking form without saving.
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Fills booking form and saves to create a new patient booking.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking
    Handle Attention Alert
    Sleep    1s

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a booking with missing required fields; expects no booking to be made.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking
    Handle Attention Alert
    Sleep    1s

Cancel New Patient Booking
    [Documentation]    Cancels the booking process and ensures no booking is made.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Close Booking Form
    Sleep    1s
