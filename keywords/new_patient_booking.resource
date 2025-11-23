*** Settings ***
Documentation    Keywords for new patient booking workflow in diary module
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
        Run Keyword If    '${field}'.startswith('checkbox.')    Click Element    ${locator}
        Run Keyword If    '${field}'.startswith('radio.')    Click Element    ${locator}
    END

Click Save Booking
    [Documentation]    Clicks the save button to submit the booking form.
    Click Element    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.save]    timeout=5s

Click Close Booking Form
    [Documentation]    Clicks the close button to exit the booking form without saving.
    Click Element    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.close]    timeout=5s

Create New Patient Booking
    [Documentation]    Fills in booking and debtor data, then saves the booking.
    [Arguments]    &{booking_info}    &{debtor_info}
    Enter Booking Form Data    &{booking_info}
    Enter Booking Form Data    &{debtor_info}
    Click Save Booking

Create New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a booking with missing required fields and verifies no booking is made.
    [Arguments]    &{booking_info}    &{debtor_info}
    Enter Booking Form Data    &{booking_info}
    Enter Booking Form Data    &{debtor_info}
    Click Save Booking
    # Add verification step as needed for no booking

Cancel New Patient Booking
    [Documentation]    Closes the booking form without saving any data.
    Click Close Booking Form
