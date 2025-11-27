*** Settings ***
Documentation    This resource file contains all Diary module keywords for New Patient Booking scenarios.
Resource    ../common/super.resource

*** Keywords ***
Open Diary Module
    [Documentation]    Navigates to the Diary module from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}

Initiate New Patient Booking
    [Documentation]    Initiates the process to book a new patient by clicking the New Patient Booking button.
    Wait Until Element Is Visible    ${button.new_patient_booking}    ${LONG_WAIT}
    Click    ${button.new_patient_booking}
    Wait Until Element Is Visible    ${dialog.new_patient_booking}    ${LONG_WAIT}

Fill New Patient Booking Details
    [Documentation]    Fills in the new patient booking form with provided data.
    [Arguments]    &{booking_data}
    Fill Patient First Name    ${booking_data.input.patient_first_name}
    Fill Patient Last Name    ${booking_data.input.patient_last_name}
    Fill Patient Date Of Birth    ${booking_data.input.date_of_birth}
    Fill Patient Gender    ${booking_data.input.gender}
    Fill Patient Contact Number    ${booking_data.input.contact_number}
    Select Booking Type    ${booking_data.select.booking_type}
    Select Booking Status    ${booking_data.select.status}
    Fill Booking Time    ${booking_data.input.time}
    Fill Booking Duration    ${booking_data.input.duration}
    Fill Booking Reason    ${booking_data.input.reason}

Save Booking
    [Documentation]    Saves the new patient booking.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${dialog.new_patient_booking}    ${LONG_WAIT}

Attempt To Save Booking With Missing Fields
    [Documentation]    Attempts to save the booking with missing required fields and handles validation.
    Wait Until Element Is Visible    ${button.save_booking}    ${LONG_WAIT}
    Click    ${button.save_booking}
    Wait Until Element Is Visible    ${label.error}    ${LONG_WAIT}

Close Booking Screen Without Saving
    [Documentation]    Closes the new patient booking dialog without saving.
    Wait Until Element Is Visible    ${button.close_booking_dialog}    ${LONG_WAIT}
    Click    ${button.close_booking_dialog}
    Wait Until Element Is Invisible    ${dialog.new_patient_booking}    ${LONG_WAIT}

Validate Booking Is Created
    [Documentation]    Validates that the booking is created and visible in the diary with expected details.
    [Arguments]    &{booking_data}
    Search Booking In Diary    &{booking_data}
    Should See Booking Details In Diary    &{booking_data}

Validate Booking Is Not Created
    [Documentation]    Validates that the booking is NOT created in the diary.
    [Arguments]    &{booking_data}
    Search Booking In Diary    &{booking_data}
    Should Not See Booking Details In Diary    &{booking_data}

# --- MID-LEVEL & LOW-LEVEL KEYWORDS ---

Fill Patient First Name
    [Documentation]    Fills in the patient first name field.
    [Arguments]    ${first_name}
    Wait Until Element Is Visible    ${input.patient_first_name}    ${LONG_WAIT}
    Fill Text    ${input.patient_first_name}    ${first_name}

Fill Patient Last Name
    [Documentation]    Fills in the patient last name field.
    [Arguments]    ${last_name}
    Wait Until Element Is Visible    ${input.patient_last_name}    ${LONG_WAIT}
    Fill Text    ${input.patient_last_name}    ${last_name}

Fill Patient Date Of Birth
    [Documentation]    Fills in the patient date of birth field.
    [Arguments]    ${dob}
    Wait Until Element Is Visible    ${input.date_of_birth}    ${LONG_WAIT}
    Fill Text    ${input.date_of_birth}    ${dob}

Fill Patient Gender
    [Documentation]    Selects the patient gender from dropdown.
    [Arguments]    ${gender}
    Wait Until Element Is Visible    ${select.gender}    ${LONG_WAIT}
    Select Options By    ${select.gender}    label    ${gender}

Fill Patient Contact Number
    [Documentation]    Fills in the patient contact number field.
    [Arguments]    ${contact_number}
    Wait Until Element Is Visible    ${input.contact_number}    ${LONG_WAIT}
    Fill Text    ${input.contact_number}    ${contact_number}

Select Booking Type
    [Documentation]    Selects the booking type from dropdown.
    [Arguments]    ${booking_type}
    Wait Until Element Is Visible    ${select.booking_type}    ${LONG_WAIT}
    Select Options By    ${select.booking_type}    label    ${booking_type}

Select Booking Status
    [Documentation]    Selects the booking status from dropdown.
    [Arguments]    ${status}
    Wait Until Element Is Visible    ${select.status}    ${LONG_WAIT}
    Select Options By    ${select.status}    label    ${status}

Fill Booking Time
    [Documentation]    Fills in the booking time field.
    [Arguments]    ${time}
    Wait Until Element Is Visible    ${input.time}    ${LONG_WAIT}
    Fill Text    ${input.time}    ${time}

Fill Booking Duration
    [Documentation]    Fills in the booking duration field.
    [Arguments]    ${duration}
    Wait Until Element Is Visible    ${input.duration}    ${LONG_WAIT}
    Fill Text    ${input.duration}    ${duration}

Fill Booking Reason
    [Documentation]    Fills in the booking reason field.
    [Arguments]    ${reason}
    Wait Until Element Is Visible    ${input.reason}    ${LONG_WAIT}
    Fill Text    ${input.reason}    ${reason}

Search Booking In Diary
    [Documentation]    Searches for a booking in the diary using patient name and time.
    [Arguments]    &{booking_data}
    Wait Until Element Is Visible    ${input.diary_search}    ${LONG_WAIT}
    Fill Text    ${input.diary_search}    ${booking_data.input.patient_first_name}
    Press Keys    ${input.diary_search}    Enter
    Wait Until Element Is Visible    ${table.diary_results}    ${LONG_WAIT}

Should See Booking Details In Diary
    [Documentation]    Asserts that booking details are present in the diary results table.
    [Arguments]    &{booking_data}
    ${booking_row_locator}=    Set Variable    //tr[td[contains(text(), '${booking_data.input.patient_first_name}')] and td[contains(text(), '${booking_data.input.patient_last_name}')]]
    Wait Until Element Is Visible    ${booking_row_locator}    ${LONG_WAIT}
    ${actual_time}=    Get Text    xpath=${booking_row_locator}/td[@class='time']
    Should Be Equal    ${actual_time}    ${booking_data.input.time}

Should Not See Booking Details In Diary
    [Documentation]    Asserts that booking details are NOT present in the diary results table.
    [Arguments]    &{booking_data}
    ${booking_row_locator}=    Set Variable    //tr[td[contains(text(), '${booking_data.input.patient_first_name}')] and td[contains(text(), '${booking_data.input.patient_last_name}')]]
    Wait Until Element Is Not Visible    ${booking_row_locator}    ${LONG_WAIT}
