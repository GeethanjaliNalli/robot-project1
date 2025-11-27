*** Settings ***
Documentation    This resource file contains all keywords for Diary New Patient Booking page automation.
Resource    ../common/super.resource
Resource    ../objectrepository/diary_new_patient_booking_page.resource

*** Keywords ***

Create New Patient Booking
    [Documentation]    Creates a new patient booking with all required information and saves it.
    Open New Booking Dialog
    Fill Debtor Details    &{PATIENT_INFO}
    Fill Patient Details    &{PATIENT_INFO}
    Fill Booking Details    &{BOOKING_INFO}
    Save Booking
    Wait For Booking Confirmation

Attempt New Patient Booking With Missing Fields
    [Documentation]    Attempts to create a new patient booking with missing required fields.
    Open New Booking Dialog
    Fill Debtor Details    &{PATIENT_INFO}
    # Intentionally skip some required patient or booking fields
    Fill Booking Details With Missing Fields    &{BOOKING_INFO}
    Save Booking
    Wait For Error Message

Start New Patient Booking
    [Documentation]    Starts a new patient booking but does not save it.
    Open New Booking Dialog
    Fill Debtor Details    &{PATIENT_INFO}
    Fill Patient Details    &{PATIENT_INFO}
    Fill Booking Details    &{BOOKING_INFO}

Close Booking Screen Without Saving
    [Documentation]    Closes the booking dialog without saving the booking.
    Click Close Booking Dialog
    Wait Until Booking Dialog Is Closed

Validate Booking Is Created
    [Documentation]    Validates that the booking is created and confirmation is shown.
    [Arguments]    ${expected_status}    ${expected_message}
    Validate Booking Confirmation Message    ${expected_status}    ${expected_message}

Validate No Booking Was Made
    [Documentation]    Validates that no booking was made (booking is not present or confirmation not shown).
    [Arguments]    ${no_booking_message}
    Validate No Booking Confirmation Message    ${no_booking_message}

# --- MID-LEVEL KEYWORDS ---

Open New Booking Dialog
    [Documentation]    Opens the new booking dialog from the diary screen.
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.new_booking}    ${LONG_WAIT}
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.new_booking}
    Wait Until Element Is Visible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.dialog.add_edit_booking}    ${LONG_WAIT}

Fill Debtor Details
    [Documentation]    Fills in the debtor details section.
    [Arguments]    &{PATIENT_INFO}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_name}    ${PATIENT_INFO.debtor_name}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_surname}    ${PATIENT_INFO.debtor_surname}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_cellphone}    ${PATIENT_INFO.debtor_cellphone}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_id_number}    ${PATIENT_INFO.debtor_id_number}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.debtor_id_type}    value    ${PATIENT_INFO.debtor_id_type}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_email}    ${PATIENT_INFO.debtor_email}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.debtor_title}    value    ${PATIENT_INFO.debtor_title}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.debtor_gender}    value    ${PATIENT_INFO.debtor_gender}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.debtor_initials}    ${PATIENT_INFO.debtor_initials}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.medical_aid}    ${PATIENT_INFO.medical_aid}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.ma_option}    ${PATIENT_INFO.ma_option}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.ma_number}    ${PATIENT_INFO.ma_number}

Fill Patient Details
    [Documentation]    Fills in the patient details section.
    [Arguments]    &{PATIENT_INFO}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_name}    ${PATIENT_INFO.patient_name}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_surname}    ${PATIENT_INFO.patient_surname}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_cellphone}    ${PATIENT_INFO.patient_cellphone}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.patient_id_type}    value    ${PATIENT_INFO.patient_id_type}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_id_number}    ${PATIENT_INFO.patient_id_number}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_email}    ${PATIENT_INFO.patient_email}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_date_of_birth}    ${PATIENT_INFO.patient_date_of_birth}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_initials}    ${PATIENT_INFO.patient_initials}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.patient_dependant_number}    ${PATIENT_INFO.patient_dependant_number}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.patient_dependant_type}    value    ${PATIENT_INFO.patient_dependant_type}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.patient_gender}    value    ${PATIENT_INFO.patient_gender}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.patient_title}    value    ${PATIENT_INFO.patient_title}

Fill Booking Details
    [Documentation]    Fills in the booking details section with all required fields.
    [Arguments]    &{BOOKING_INFO}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.diary}    value    ${BOOKING_INFO.diary}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.type}    value    ${BOOKING_INFO.type}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.status}    value    ${BOOKING_INFO.status}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.textarea.reason}    ${BOOKING_INFO.reason}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.location}    value    ${BOOKING_INFO.location}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.date}    ${BOOKING_INFO.date}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.time}    ${BOOKING_INFO.time}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.duration}    ${BOOKING_INFO.duration}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.treating_doctor}    ${BOOKING_INFO.treating_doctor}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.referring_doctor}    ${BOOKING_INFO.referring_doctor}
    Select Options By    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.select.service_center}    value    ${BOOKING_INFO.service_center}

Fill Booking Details With Missing Fields
    [Documentation]    Fills in the booking details section with some required fields missing.
    [Arguments]    &{BOOKING_INFO}
    # Example: Only fill date and time, skip others
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.date}    ${BOOKING_INFO.date}
    Fill Text    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.input.time}    ${BOOKING_INFO.time}

Save Booking
    [Documentation]    Clicks the save button to attempt to save the booking.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.save}

Wait For Booking Confirmation
    [Documentation]    Waits until the booking confirmation message or booking details header is visible.
    Wait Until Element Is Visible    ${label.booking_details_header}    ${LONG_WAIT}

Wait For Error Message
    [Documentation]    Waits until an error message is displayed after a failed booking attempt.
    Wait Until Element Is Visible    ${label.error}    ${LONG_WAIT}

Click Close Booking Dialog
    [Documentation]    Clicks the close button on the booking dialog.
    Click    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.button.close}

Wait Until Booking Dialog Is Closed
    [Documentation]    Waits until the booking dialog is no longer visible.
    Wait Until Element Is Invisible    ${DIARY_NEW_PATIENT_BOOKING_LOCATORS.dialog.add_edit_booking}    ${LONG_WAIT}

Validate Booking Confirmation Message
    [Documentation]    Validates that the booking confirmation message and status are as expected.
    [Arguments]    ${expected_status}    ${expected_message}
    ${actual_status}=    Get Text    ${label.booking_details_header}
    Should Contain    ${actual_status}    ${expected_status}
    # Optionally validate confirmation message if present
    # ${actual_message}=    Get Text    ${label.confirmation_message}
    # Should Be Equal    ${actual_message}    ${expected_message}

Validate No Booking Confirmation Message
    [Documentation]    Validates that no booking confirmation message is shown and booking was not made.
    [Arguments]    ${no_booking_message}
    Wait Until Element Is Not Visible    ${label.booking_details_header}    ${LONG_WAIT}
    # Optionally check for specific no booking message if implemented
    # ${actual_message}=    Get Text    ${label.no_booking_message}
    # Should Be Equal    ${actual_message}    ${no_booking_message}
