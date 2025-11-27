*** Settings ***
Documentation    This resource file contains keywords for the Diary page and new patient booking workflows.
Resource    ../common/super.resource

*** Keywords ***
Go To Diary Page
    [Documentation]    Navigates from the dashboard to the Diary page.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_booking}    ${LONG_WAIT}

Start New Patient Booking
    [Documentation]    Initiates a new patient booking from the Diary page.
    Click    ${button.new_booking}
    Wait Until Element Is Visible    ${dialog.booking_form}    ${LONG_WAIT}
    Select Booking Type    New Patient

Fill New Patient Booking Form    [Arguments]    ${booking_data}
    [Documentation]    Fills all fields in the new patient booking form using the provided dictionary.
    Fill Booking Type    ${booking_data['select.type']}
    Fill Booking Status    ${booking_data['select.status']}
    Fill Booking Time    ${booking_data['input.time']}
    Fill Booking Duration    ${booking_data['input.duration']}
    Fill Booking Reason    ${booking_data['input.reason']}
    Fill Patient First Name    ${booking_data['input.patient_first_name']}
    Fill Patient Last Name    ${booking_data['input.patient_last_name']}
    Fill Patient DOB    ${booking_data['input.patient_dob']}
    Fill Patient Phone    ${booking_data['input.patient_phone']}
    Fill Patient Email    ${booking_data['input.patient_email']}

Save Booking
    [Documentation]    Saves the booking by clicking the Save button and waits for confirmation.
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${dialog.booking_form}    ${LONG_WAIT}
    Wait Until Element Is Visible    ${toast.success}    ${LONG_WAIT}

Attempt To Save Booking With Missing Fields
    [Documentation]    Attempts to save the booking form with missing required fields.
    Click    ${button.save_booking}
    Wait Until Element Is Visible    ${label.error}    ${LONG_WAIT}

Close Booking Screen Without Saving
    [Documentation]    Closes the booking form without saving any data.
    Click    ${button.close_booking}
    Wait Until Element Is Invisible    ${dialog.booking_form}    ${LONG_WAIT}

Validate Booking Is Created    [Arguments]    ${booking_data}
    [Documentation]    Validates that a booking has been created with the provided data.
    Search Booking In Diary    ${booking_data['input.patient_first_name']}    ${booking_data['input.patient_last_name']}    ${booking_data['input.time']}
    Should Booking Exist    ${booking_data['input.patient_first_name']}    ${booking_data['input.patient_last_name']}    ${booking_data['input.time']}

Validate Booking Is Not Created    [Arguments]    ${booking_data}
    [Documentation]    Validates that a booking has NOT been created for the provided data.
    Search Booking In Diary    ${booking_data['input.patient_first_name']}    ${booking_data['input.patient_last_name']}    ${booking_data['input.time']}
    Should Booking Not Exist    ${booking_data['input.patient_first_name']}    ${booking_data['input.patient_last_name']}    ${booking_data['input.time']}

# --- Mid-level and low-level keywords ---
Select Booking Type    [Arguments]    ${type}
    [Documentation]    Selects the booking type from the dropdown.
    Wait Until Element Is Visible    ${select.booking_type}    ${LONG_WAIT}
    Select Options By    ${select.booking_type}    label    ${type}

Fill Booking Type    [Arguments]    ${type}
    [Documentation]    Fills the booking type dropdown if value is not empty.
    Run Keyword If    '${type}'    Select Booking Type    ${type}

Fill Booking Status    [Arguments]    ${status}
    [Documentation]    Fills the booking status dropdown if value is not empty.
    Run Keyword If    '${status}'    Select Options By    ${select.booking_status}    label    ${status}

Fill Booking Time    [Arguments]    ${time}
    [Documentation]    Fills the booking time field if value is not empty.
    Run Keyword If    '${time}'    Fill Text    ${input.booking_time}    ${time}

Fill Booking Duration    [Arguments]    ${duration}
    [Documentation]    Fills the booking duration field if value is not empty.
    Run Keyword If    '${duration}'    Fill Text    ${input.booking_duration}    ${duration}

Fill Booking Reason    [Arguments]    ${reason}
    [Documentation]    Fills the booking reason field if value is not empty.
    Run Keyword If    '${reason}'    Fill Text    ${input.booking_reason}    ${reason}

Fill Patient First Name    [Arguments]    ${first_name}
    [Documentation]    Fills the patient first name field if value is not empty.
    Run Keyword If    '${first_name}'    Fill Text    ${input.patient_first_name}    ${first_name}

Fill Patient Last Name    [Arguments]    ${last_name}
    [Documentation]    Fills the patient last name field if value is not empty.
    Run Keyword If    '${last_name}'    Fill Text    ${input.patient_last_name}    ${last_name}

Fill Patient DOB    [Arguments]    ${dob}
    [Documentation]    Fills the patient date of birth field if value is not empty.
    Run Keyword If    '${dob}'    Fill Text    ${input.patient_dob}    ${dob}

Fill Patient Phone    [Arguments]    ${phone}
    [Documentation]    Fills the patient phone number field if value is not empty.
    Run Keyword If    '${phone}'    Fill Text    ${input.patient_phone}    ${phone}

Fill Patient Email    [Arguments]    ${email}
    [Documentation]    Fills the patient email field if value is not empty.
    Run Keyword If    '${email}'    Fill Text    ${input.patient_email}    ${email}

Search Booking In Diary    [Arguments]    ${first_name}    ${last_name}    ${time}
    [Documentation]    Searches for a booking in the diary grid by patient name and time.
    Wait Until Element Is Visible    ${table.diary_grid}    ${LONG_WAIT}
    Fill Text    ${input.diary_search}    ${first_name} ${last_name}
    Wait Until Element Is Visible    //tr[td[contains(text(),'${first_name}') and contains(text(),'${last_name}') and contains(text(),'${time}')]]    ${LONG_WAIT}

Should Booking Exist    [Arguments]    ${first_name}    ${last_name}    ${time}
    [Documentation]    Asserts that a booking row exists for the given patient and time.
    ${row_count}=    Get Element Count    //tr[td[contains(text(),'${first_name}') and contains(text(),'${last_name}') and contains(text(),'${time}')]]
    Should Be True    ${row_count} > 0    Booking for ${first_name} ${last_name} at ${time} should exist.

Should Booking Not Exist    [Arguments]    ${first_name}    ${last_name}    ${time}
    [Documentation]    Asserts that a booking row does NOT exist for the given patient and time.
    ${row_count}=    Get Element Count    //tr[td[contains(text(),'${first_name}') and contains(text(),'${last_name}') and contains(text(),'${time}')]]
    Should Be True    ${row_count} == 0    Booking for ${first_name} ${last_name} at ${time} should NOT exist.
