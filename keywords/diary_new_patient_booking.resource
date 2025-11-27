*** Settings ***
Documentation    This diary new patient booking Resource file has all the keywords for New Patient Booking flows in the Diary.
Resource    ../common/super.resource

*** Keywords ***
# ============================================================================
# High-level composite keywords for New Patient Booking flows
# These are reusable orchestrators that can be called from test cases or
# other suites to perform end-to-end booking actions.
# ============================================================================

Perform Successful New Patient Booking
    [Documentation]    Performs a full successful new patient booking using the provided patient and booking info dictionaries and validates that the booking is created in the diary.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Save New Patient Booking
    Validate New Patient Booking Is Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

Perform New Patient Booking And Close Without Saving
    [Documentation]    Opens the new patient booking screen, captures details, closes without saving, and validates that no booking is created.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Close New Patient Booking Screen Without Saving
    Validate New Patient Booking Is Not Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

Perform New Patient Booking With Missing Required Information
    [Documentation]    Attempts to save a new patient booking with missing required information and validates that validation messages are shown and booking is not created.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Attempt To Save New Patient Booking With Missing Required Information
    Validate Validation Messages For Missing Required Booking Information
    Validate New Patient Booking Is Not Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

Perform New Patient Booking With Invalid Time Range
    [Documentation]    Attempts to save a new patient booking where the end time is earlier than the start time and validates that the booking is not created.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Attempt To Save New Patient Booking With Invalid Time Range
    Validate Validation Messages For Invalid Booking Time Range
    Validate New Patient Booking Is Not Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

Perform New Patient Booking With Invalid Patient Identification
    [Documentation]    Attempts to save a new patient booking with invalid patient identification and validates that validation messages are displayed and booking is not created.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Attempt To Save New Patient Booking With Missing Required Information
    Validate Validation Messages For Invalid Patient Identification
    Validate New Patient Booking Is Not Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

Perform New Patient Booking With Missing Patient Contact Details
    [Documentation]    Attempts to save a new patient booking with missing patient contact details and validates that appropriate validation messages are displayed and booking is not created according to business rules.
    [Arguments]    &{patient_info}    &{booking_info}    ${expected_booking_created}
    Navigate To Diary Screen
    Open New Patient Booking Screen
    Capture New Patient Details For Booking    ${patient_info}
    Capture Booking Details For New Patient    ${booking_info}
    Attempt To Save New Patient Booking With Missing Required Information
    Validate Validation Messages For Missing Required Patient Contact Information
    Validate New Patient Booking Is Not Created In Diary    ${patient_info}    ${booking_info}    ${expected_booking_created}

# ============================================================================
# Additional mid-level reusable keywords for validation and save attempts
# ============================================================================

Attempt To Save New Patient Booking With Invalid Time Range
    [Documentation]    Clicks save on the new patient booking screen when an invalid time range is provided and waits for validation messages.
    Click Save Booking Button
    Wait Until Validation Messages Are Displayed

Validate Validation Messages For Invalid Booking Time Range
    [Documentation]    Validates that an appropriate validation message is displayed when the booking time range is invalid.
    ${validation_text}    Get Text    ${label.booking.validation}
    Should Contain    ${validation_text}    end time must be after start time

Validate Validation Messages For Missing Required Patient Contact Information
    [Documentation]    Validates that validation messages are displayed when required patient contact information is missing.
    ${validation_text}    Get Text    ${label.booking.validation}
    Should Contain    ${validation_text}    Contact details are required

Validate Validation Messages For Invalid Patient Identification
    [Documentation]    Validates that validation messages are displayed when patient identification is invalid.
    ${validation_text}    Get Text    ${label.booking.validation}
    Should Contain    ${validation_text}    Invalid ID number

Validate New Patient Booking Details In Diary Cell
    [Documentation]    Validates that the diary cell text contains both patient last name and booking date for additional assurance.
    [Arguments]    &{patient_info}    &{booking_info}
    ${cell_text}    Get Text    ${cell.diary.booking}
    Should Contain    ${cell_text}    ${patient_info}[input.lastname]
    Should Contain    ${cell_text}    ${booking_info}[input.bookingdate]

Validate No Matching Booking Details In Diary Cell
    [Documentation]    Validates that the diary cell text does not contain the patient last name when booking should not exist.
    [Arguments]    &{patient_info}
    ${cell_text}    Get Text    ${cell.diary.booking}
    ${not_present}    Evaluate Expression    "${patient_info}[input.lastname]" not in "${cell_text}"
    Should Be Equal    ${not_present}    True

# ============================================================================
# Additional low-level helper keywords (atomic operations)
# ============================================================================

Wait Until Diary Booking Cell Is Visible
    [Documentation]    Waits until the diary booking cell element is visible on the diary screen.
    Wait Until Element Is Visible    ${cell.diary.booking}    ${LONG_WAIT}

Wait Until Booking Validation Label Is Visible
    [Documentation]    Waits until the booking validation label is visible on the new patient booking dialog.
    Wait Until Element Is Visible    ${label.booking.validation}    ${LONG_WAIT}

Click Diary Booking Cell
    [Documentation]    Clicks on the diary booking cell element.
    Click    ${cell.diary.booking}

Fill Booking Notes Field
    [Documentation]    Fills the optional booking notes field if present on the new patient booking screen.
    [Arguments]    ${notes}
    Fill Text    ${input.booking.notes}    ${notes}

Select Booking Status From Dropdown
    [Documentation]    Selects a booking status from the booking status dropdown using the provided label.
    [Arguments]    ${status}
    Select Options By    ${select.booking.appointmentstatus}    label    ${status}
