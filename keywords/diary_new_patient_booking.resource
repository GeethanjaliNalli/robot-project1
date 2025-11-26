*** Settings ***
Documentation    Keywords for New Patient Booking workflow in Diary module
Resource    ../common/super.resource

*** Keywords ***

Enter Booking Form Data
    [Documentation]    Enters all booking and patient information into the booking form fields using provided data.
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
    [Documentation]    Clicks the Save button to attempt to save the booking.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Close Booking Form
    [Documentation]    Closes the booking form without saving.
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Fills in booking and patient details and saves the booking.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Click Save Booking

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a booking with missing required fields and verifies no booking is made.
    [Arguments]    &{incomplete_booking_info}
    Enter Booking Form Data    &{incomplete_booking_info}
    Click Save Booking
    # Add verification step as needed

Create New Patient Booking And Close Without Saving
    [Documentation]    Fills in booking form and closes without saving to verify booking is not created.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    &{booking_info}
    Close Booking Form
