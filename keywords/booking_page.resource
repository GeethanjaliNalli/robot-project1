*** Settings ***
Documentation    This booking page Resource file has all the booking workflow keywords for creating a new booking for an existing patient.
Resource    ../common/super.resource

*** Keywords ***
Open Practitioner Diary
    [Documentation]    Opens the practitioner's diary for the specified practitioner, diary, and date.
    [Arguments]    ${practitioner_id}    ${diary}    ${date}
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[label.booking_details]    timeout=${LONG_WAIT}
    Select Options By    ${BOOKING_DETAILS_LOCATORS}[select.diary]    label    ${diary}
    Fill Text    ${BOOKING_DETAILS_LOCATORS}[input.date]    ${date}
    Wait Until Element Is Visible    ${DIARY_GRID_LOCATORS}[grid.diary]    timeout=${LONG_WAIT}

Select Available Time Slot
    [Documentation]    Selects an available time slot in the diary grid for the specified time.
    [Arguments]    ${time}
    ${all_slots}=    Get Elements    ${DIARY_GRID_LOCATORS}[grid.diary_row]
    FOR    ${slot}    IN    @{all_slots}
        ${slot_time}=    Get Text    locator=${slot} >> ${DIARY_GRID_LOCATORS}[grid.diary_row_time]
        Run Keyword If    '${slot_time}' == '${time}'    Click    ${slot}
        Run Keyword If    '${slot_time}' == '${time}'    Exit For Loop
    END
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[dialog.add_edit_booking]    timeout=${LONG_WAIT}

Initiate New Booking
    [Documentation]    Initiates the new booking process by clicking the New Booking button.
    Click    ${BOOKING_FORM_LOCATORS}[button.new_booking]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[dialog.add_edit_booking]    timeout=${LONG_WAIT}

Search And Select Existing Patient
    [Documentation]    Searches for and selects an existing patient using the patient ID.
    [Arguments]    ${patient_id}
    Click    ${BOOKING_FORM_LOCATORS}[button.debtor_patient_search]
    Wait Until Element Is Visible    ${input.patient_idnumber}    timeout=${LONG_WAIT}
    Fill Text    ${input.patient_idnumber}    ${patient_id}
    Press Keys    ${input.patient_idnumber}    Enter
    Wait Until Element Is Visible    ${input.patient_name}    timeout=${LONG_WAIT}
    Click    ${button.close}
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[dialog.add_edit_booking]    timeout=0.5s
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[dialog.add_edit_booking]    timeout=${LONG_WAIT}

Enter Booking Details
    [Documentation]    Enters booking details into the Add/Edit Booking form using the provided dictionary.
    [Arguments]    &{booking_info}
    Enter Booking Form Data    label    &{booking_info}

Save Booking
    [Documentation]    Saves the Add/Edit Booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[dialog.add_edit_booking]    timeout=${LONG_WAIT}

Validate Booking In Diary
    [Documentation]    Validates that the new booking appears in the diary at the selected time slot for the specified patient and diary.
    [Arguments]    ${time}    ${patient_id}    ${diary}    ${date}
    ${all_bookings}=    Get Elements    ${DIARY_GRID_LOCATORS}[grid.booking]
    ${booking_found}=    Set Variable    False
    FOR    ${booking}    IN    @{all_bookings}
        ${booking_time}=    Get Text    locator=${booking} >> ${DIARY_GRID_LOCATORS}[grid.booking_time]
        ${booking_patient}=    Get Text    locator=${booking} >> ${DIARY_GRID_LOCATORS}[grid.booking_patient_name]
        Run Keyword If    '${booking_time}' == '${time}' and '${booking_patient}' == '${patient_id}'    Set Variable    ${booking_found}    True
        Run Keyword If    '${booking_time}' == '${time}' and '${booking_patient}' == '${patient_id}'    Exit For Loop
    END
    Should Be Equal    ${booking_found}    True

Enter Booking Form Data
    [Documentation]    Enters form fields for the Add/Edit Booking form dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END
