*** Settings ***
Documentation    Keywords for New Patient Booking functionality (TC00002_Diary_NPB)
Resource    ../common/super.resource

*** Keywords ***
Book New Patient Appointment With Valid Data
    [Documentation]    High-level: Books a new patient appointment with all required valid data and verifies booking is successful.
    Go To Diary Screen
    Open New Booking Dialog
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_VALID}
    Save Booking
    Verify Booking Was Created    &{NEW_PATIENT_BOOKING_VALID}

Attempt Booking With Missing Required Fields
    [Documentation]    High-level: Attempts to book a new patient appointment with missing required fields and verifies booking is NOT made.
    Go To Diary Screen
    Open New Booking Dialog
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}
    Save Booking
    Verify Booking Was Not Created    &{NEW_PATIENT_BOOKING_MISSING_REQUIRED}

Cancel New Patient Booking
    [Documentation]    High-level: Opens new booking dialog, fills valid data, cancels, and verifies booking is NOT made.
    Go To Diary Screen
    Open New Booking Dialog
    Fill New Patient Booking Form    &{NEW_PATIENT_BOOKING_CANCELLED}
    Cancel Booking
    Verify Booking Was Not Created    &{NEW_PATIENT_BOOKING_CANCELLED}

Go To Diary Screen
    [Documentation]    Navigates to the Diary screen from the dashboard.
    Wait Until Element Is Visible    ${link.diary}    ${LONG_WAIT}
    Click    ${link.diary}
    Wait Until Element Is Visible    ${button.new_booking}    ${LONG_WAIT}

Open New Booking Dialog
    [Documentation]    Opens the dialog for creating a new patient booking.
    Click    ${button.new_booking}
    Wait Until Element Is Visible    ${dialog.booking}    ${LONG_WAIT}

Fill New Patient Booking Form
    [Documentation]    Fills the new patient booking form with provided patient data.
    [Arguments]    ${patient_data}
    Fill Text    ${textbox.patient_first_name}    ${patient_data['patient_first_name']}
    Fill Text    ${textbox.patient_last_name}    ${patient_data['patient_last_name']}
    Fill Text    ${textbox.date_of_birth}    ${patient_data['date_of_birth']}
    Select Options By    ${dropdown.gender}    label=${patient_data['gender']}
    Fill Text    ${textbox.contact_number}    ${patient_data['contact_number']}
    Fill Text    ${textbox.email}    ${patient_data['email']}
    Fill Text    ${textbox.appointment_date}    ${patient_data['appointment_date']}
    Fill Text    ${textbox.appointment_time}    ${patient_data['appointment_time']}
    Select Options By    ${dropdown.appointment_type}    label=${patient_data['appointment_type']}
    Fill Text    ${textbox.reason_for_visit}    ${patient_data['reason_for_visit']}
    Fill Text    ${textbox.insurance_provider}    ${patient_data['insurance_provider']}
    Fill Text    ${textbox.insurance_number}    ${patient_data['insurance_number']}

Save Booking
    [Documentation]    Saves the booking by clicking the Save button and waits for dialog to close.
    Click    ${button.save_booking}
    Wait Until Element Is Invisible    ${dialog.booking}    ${LONG_WAIT}

Cancel Booking
    [Documentation]    Cancels the booking by clicking the Cancel button and waits for dialog to close.
    Click    ${button.cancel_booking}
    Wait Until Element Is Invisible    ${dialog.booking}    ${LONG_WAIT}

Verify Booking Was Created
    [Documentation]    Verifies that the booking was created by checking for the patient in the diary list.
    [Arguments]    ${patient_data}
    Wait Until Element Is Visible    ${table.diary_list}    ${LONG_WAIT}
    ${full_name}=    Set Variable    ${patient_data['patient_first_name']} ${patient_data['patient_last_name']}
    Table Should Contain Patient    ${table.diary_list}    ${full_name}    ${patient_data['appointment_date']}    ${patient_data['appointment_time']}

Verify Booking Was Not Created
    [Documentation]    Verifies that the booking was NOT created (patient not found in diary list).
    [Arguments]    ${patient_data}
    Wait Until Element Is Visible    ${table.diary_list}    ${LONG_WAIT}
    ${full_name}=    Set Variable    ${patient_data['patient_first_name']} ${patient_data['patient_last_name']}
    Table Should Not Contain Patient    ${table.diary_list}    ${full_name}    ${patient_data['appointment_date']}    ${patient_data['appointment_time']}

Table Should Contain Patient
    [Documentation]    Checks that the diary table contains a row with the specified patient and appointment details.
    [Arguments]    ${table_locator}    ${full_name}    ${date}    ${time}
    ${rows}=    Get Elements    ${table_locator} >> tr
    ${found}=    Set Variable    False
    FOR    ${row}    IN    @{rows}
        ${row_text}=    Get Text    ${row}
        IF    '${full_name}' in '${row_text}' and '${date}' in '${row_text}' and '${time}' in '${row_text}'
            ${found}=    Set Variable    True
            Exit For Loop
        END
    END
    Should Be True    ${found}    Patient ${full_name} with appointment on ${date} at ${time} not found in diary.

Table Should Not Contain Patient
    [Documentation]    Checks that the diary table does NOT contain a row with the specified patient and appointment details.
    [Arguments]    ${table_locator}    ${full_name}    ${date}    ${time}
    ${rows}=    Get Elements    ${table_locator} >> tr
    ${found}=    Set Variable    False
    FOR    ${row}    IN    @{rows}
        ${row_text}=    Get Text    ${row}
        IF    '${full_name}' in '${row_text}' and '${date}' in '${row_text}' and '${time}' in '${row_text}'
            ${found}=    Set Variable    True
            Exit For Loop
        END
    END
    Should Be False    ${found}    Patient ${full_name} with appointment on ${date} at ${time} was found in diary, but should NOT be.
