*** Settings ***
Documentation    Keywords for New Patient Booking form operations
Resource         ../common/super.resource

*** Keywords ***
Enter Form Data
    [Documentation]    Enter data into the booking form fields using the provided form data dictionary.
    FOR    ${field}    IN    @{form_data.keys()}
        ${value}=    Set Variable    ${form_data[${field}]}
        ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.${field}
        Input Text    ${locator}    ${value}
    END

Save Booking Form
    [Documentation]    Click the Save button to submit the booking form.
    ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    button.save
    Click Button    ${locator}

Close Booking Form
    [Documentation]    Close the booking form without saving.
    ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    button.close
    Click Button    ${locator}

Create New Patient Booking
    [Documentation]    Create a new patient booking by entering form data and saving the form.
    [Arguments]    &{form_data}
    Enter Form Data    &{form_data}
    Save Booking Form
