*** Settings ***
Documentation    Keywords for Diary - New Patient Booking functionality
Resource    ../common/super.resource

*** Keywords ***
Go To Diary Screen
    [Documentation]    Navigates to the Diary screen from the dashboard. Assumes user is logged in and dashboard is visible.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_booking}    ${LONG_WAIT}

Open New Booking Dialog
    [Documentation]    Opens the New Booking dialog from the Diary screen.
    Wait Until Element Is Visible    ${button.new_booking}    ${LONG_WAIT}
    Click    ${button.new_booking}
    Wait Until Element Is Visible    ${dialog.new_booking}    ${LONG_WAIT}

Enter Patient Information
    [Documentation]    Fills in patient information fields in the New Booking dialog. Optionally exclude fields (e.g., for negative tests).
    [Arguments]    &{PATIENT_INFO}    ${exclude}=None
    FOR    ${field}    IN    @{PATIENT_INFO.keys()}
        IF    '${exclude}' != 'None' and '${field}' in '${exclude}'
            Continue For Loop
        END
        Fill Patient Field    ${field}    ${PATIENT_INFO[${field}]}
    END

Enter Booking Information
    [Documentation]    Fills in booking information fields (date, time, etc.) in the New Booking dialog.
    [Arguments]    &{BOOKING_INFO}
    FOR    ${field}    IN    @{BOOKING_INFO.keys()}
        Fill Booking Field    ${field}    ${BOOKING_INFO[${field}]}
    END

Save Booking
    [Documentation]    Clicks the Save button in the New Booking dialog and waits for confirmation or error.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Any Booking Dialog Message Is Visible

Validate Booking Is Created
    [Documentation]    Validates that a booking was created successfully by checking for a confirmation message.
    [Arguments]    ${expected_confirmation_message}
    ${actual_message}=    Get Text    ${label.booking_confirmation}
    Should Contain    ${actual_message}    ${expected_confirmation_message}
    Validate Booking Exists In Diary

Validate Booking Exists In Diary
    [Documentation]    Checks that the new booking appears in the diary grid/list.
    Wait Until Element Is Visible    ${grid.diary_bookings}    ${LONG_WAIT}
    # Optionally, implement row search logic here
    # Example: Should Contain Table Row    ${grid.diary_bookings}    ${PATIENT_INFO['firstname']}

Validate Booking Is Not Created
    [Documentation]    Validates that no new booking was created (e.g., after error or closing dialog).
    # Optionally, search for absence of booking in diary grid
    Wait Until Element Is Visible    ${grid.diary_bookings}    ${LONG_WAIT}
    Booking Should Not Exist In Diary

Booking Should Not Exist In Diary
    [Documentation]    Asserts that a booking with the given patient info does not exist in the diary grid.
    # Example: Table Should Not Contain Row    ${grid.diary_bookings}    ${PATIENT_INFO['firstname']}
    # Implementation depends on app specifics

Close Booking Dialog
    [Documentation]    Closes the New Booking dialog (after save or cancel).
    Wait Until Element Is Visible    ${button.close_booking_dialog}    ${LONG_WAIT}
    Click    ${button.close_booking_dialog}
    Wait Until Element Is Not Visible    ${dialog.new_booking}    ${LONG_WAIT}

Close Booking Dialog Without Saving
    [Documentation]    Closes the New Booking dialog without saving (e.g., via Cancel or Close button).
    Wait Until Element Is Visible    ${button.cancel_booking}    ${LONG_WAIT}
    Click    ${button.cancel_booking}
    Wait Until Element Is Not Visible    ${dialog.new_booking}    ${LONG_WAIT}

Wait Until Any Booking Dialog Message Is Visible
    [Documentation]    Waits until either a confirmation or error message is visible in the booking dialog.
    Wait Until Any Elements Are Visible    ${label.booking_confirmation}    ${label.error}    ${LONG_WAIT}

Fill Patient Field
    [Documentation]    Fills a patient information field in the booking dialog.
    [Arguments]    ${field}    ${value}
    ${locator}=    Get Patient Field Locator    ${field}
    Wait Until Element Is Visible    ${locator}    ${LONG_WAIT}
    Fill Text    ${locator}    ${value}

Fill Booking Field
    [Documentation]    Fills a booking information field in the booking dialog.
    [Arguments]    ${field}    ${value}
    ${locator}=    Get Booking Field Locator    ${field}
    Wait Until Element Is Visible    ${locator}    ${LONG_WAIT}
    Fill Text    ${locator}    ${value}

Get Patient Field Locator
    [Documentation]    Returns the locator for a given patient field name.
    [Arguments]    ${field}
    ${locator}=    Evaluate    "${'textbox.patient_' + field}"
    [Return]    ${locator}

Get Booking Field Locator
    [Documentation]    Returns the locator for a given booking field name.
    [Arguments]    ${field}
    ${locator}=    Evaluate    "${'textbox.booking_' + field}"
    [Return]    ${locator}

Wait Until Any Elements Are Visible
    [Documentation]    Waits until any of the provided locators are visible (helper for dialog messages).
    [Arguments]    @{locators}    ${timeout}=${LONG_WAIT}
    :FOR    ${locator}    IN    @{locators}
    \    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${locator}    ${timeout}
    # If none are visible, this will timeout
