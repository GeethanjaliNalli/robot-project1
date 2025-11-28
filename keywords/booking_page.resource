*** Settings ***
Documentation    This booking page Resource file has all the keywords for New Patient Booking flows in the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Open Diary Screen
    [Documentation]    Navigates to the Diary screen and waits for it to be ready.
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.new-booking]    timeout=${LONG_WAIT}

Start New Patient Booking
    [Documentation]    Initiates a new patient booking by clicking the New Booking button and waiting for the Add/Edit Booking dialog.
    Click    ${BOOKING_FORM_LOCATORS}[button.new-booking]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[dialog.add-edit-booking]    timeout=${LONG_WAIT}

Fill New Patient Booking Form
    [Documentation]    Fills the New Patient Booking form using provided data dictionary.
    [Arguments]    &{form_data}
    Enter Booking Form Data    &{form_data}

Save Booking
    [Documentation]    Saves the booking by clicking the Save button and waits for the dialog to close.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[dialog.add-edit-booking]    timeout=${LONG_WAIT}

Cancel Booking
    [Documentation]    Cancels the booking by clicking the Close button and waits for the dialog to close.
    Click    ${BOOKING_FORM_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[dialog.add-edit-booking]    timeout=${LONG_WAIT}

Validate Booking Is Created
    [Documentation]    Validates that a booking is created with the provided details.
    [Arguments]    &{expected_data}
    # Implement booking existence check using expected_data fields (e.g., patient name, time, etc.)
    # This is a placeholder for actual validation logic, which should use available locators and data.
    Validate Booking Exists In Diary    &{expected_data}

Validate Booking Is Not Created
    [Documentation]    Validates that a booking is NOT created with the provided details.
    [Arguments]    &{expected_data}
    # Implement booking non-existence check using expected_data fields (e.g., patient name, time, etc.)
    # This is a placeholder for actual validation logic, which should use available locators and data.
    Validate Booking Does Not Exist In Diary    &{expected_data}

Enter Booking Form Data
    [Documentation]    Enters booking form fields dynamically using dictionary keys and BOOKING_FORM_LOCATORS.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')
        ...    Fill Text    ${locator}    ${value}
    END

Validate Booking Exists In Diary
    [Documentation]    Checks that a booking with the specified details exists in the diary list/grid.
    [Arguments]    &{expected_data}
    # Placeholder: Implement logic to search diary grid/list for booking (e.g., by patient name, time, etc.)
    # Should Contain or Get Text can be used with appropriate locators.
    # Example:
    # ${booking_text}    Get Text    ${BOOKING_FORM_LOCATORS}[some_booking_list_locator]
    # Should Contain    ${booking_text}    ${expected_data}[input.first_name]
    # Should Contain    ${booking_text}    ${expected_data}[input.last_name]
    # Should Contain    ${booking_text}    ${expected_data}[input.time]
    # (Actual implementation depends on available diary list locators)
    Log    Booking validation placeholder for: ${expected_data}

Validate Booking Does Not Exist In Diary
    [Documentation]    Checks that a booking with the specified details does NOT exist in the diary list/grid.
    [Arguments]    &{expected_data}
    # Placeholder: Implement logic to assert booking does not exist (e.g., by patient name, time, etc.)
    # Example:
    # ${booking_text}    Get Text    ${BOOKING_FORM_LOCATORS}[some_booking_list_locator]
    # Should Not Contain    ${booking_text}    ${expected_data}[input.first_name]
    # Should Not Contain    ${booking_text}    ${expected_data}[input.last_name]
    # Should Not Contain    ${booking_text}    ${expected_data}[input.time]
    # (Actual implementation depends on available diary list locators)
    Log    Booking non-existence validation placeholder for: ${expected_data}
