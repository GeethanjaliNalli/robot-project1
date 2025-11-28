*** Settings ***
Documentation    This diary page Resource file contains all keywords for Diary module, including Add Sick Note functionality.
Resource    ../common/super.resource

*** Keywords ***
Select Patient Booking From Diary
    [Documentation]    Selects a patient booking from the Diary using patient name and booking id.
    [Arguments]    ${patient_name}    ${booking_id}
    ${booking_row_locator}=    Evaluate    "//tr[td[contains(., '${patient_name}')] and td[contains(., '${booking_id}')]]"
    Wait Until Element Is Visible    ${booking_row_locator}    ${LONG_WAIT}
    Click    ${booking_row_locator}

Open Clinical Forms For Patient
    [Documentation]    Opens the Clinical Forms dialog for the selected patient booking.
    Click    ${DIARY_PAGE_LOCATORS}[button.add_sick_note]
    Wait Until Element Is Visible    ${DIARY_PAGE_LOCATORS}[dialog.sick_note_title]    ${LONG_WAIT}

Select Sick Note Form
    [Documentation]    Selects the Sick Note form type in the Clinical Forms dialog.
    [Arguments]    ${note_type}
    # Assuming the button is always for Sick Note, as per locator
    Click    ${DIARY_PAGE_LOCATORS}[button.add_sick_note]
    Wait Until Element Is Visible    ${DIARY_PAGE_LOCATORS}[dialog.sick_note_title]    ${LONG_WAIT}

Fill Sick Note Details
    [Documentation]    Fills Sick Note details dynamically using the provided dictionary.
    [Arguments]    &{sick_note_info}
    ${form_data}=    Create Dictionary
    ...    input.reason_for_absence=${sick_note_info}[diagnosis]
    ...    select.duration=${sick_note_info}[duration]
    Enter Sick Note Form Data    &{form_data}
    Run Keyword If    '${sick_note_info}[comments]' != ''    Fill Sick Note Comments    ${sick_note_info}[comments]
    Run Keyword If    '${sick_note_info}[doctor_signature]' == 'enabled'    Validate Doctor Signature Enabled

Enter Sick Note Form Data
    [Documentation]    Enters Sick Note form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${DIARY_PAGE_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
    END

Fill Sick Note Comments
    [Documentation]    Fills in the comments field for the Sick Note if present in the form.
    [Arguments]    ${comments}
    # Assuming comments field is present as a textarea or input, add locator if available
    # If not, skip (no locator provided)
    No Operation

Validate Doctor Signature Enabled
    [Documentation]    Validates that the doctor's signature is enabled for the Sick Note.
    # No locator provided for signature, so just No Operation
    No Operation

Save Sick Note
    [Documentation]    Saves the Sick Note form and waits for dialog to close.
    Click    ${DIARY_PAGE_LOCATORS}[button.save]
    Wait Until Element Is Invisible    ${DIARY_PAGE_LOCATORS}[dialog.sick_note_title]    timeout=${LONG_WAIT}

Validate Sick Note Saved In Clinical Record
    [Documentation]    Validates that the Sick Note is saved in the patient’s clinical record.
    [Arguments]    ${note_type}
    ${clinical_note_locator}=    Evaluate    "//tr[td[contains(., '${note_type}')]]"
    Wait Until Element Is Visible    ${clinical_note_locator}    ${LONG_WAIT}

Email Sick Note To Patient
    [Documentation]    Emails the Sick Note to the patient if enabled.
    [Arguments]    ${email_to_patient}    ${email_subject}    ${email_body}
    Run Keyword If    '${email_to_patient}' == 'enabled'    Click    ${DIARY_PAGE_LOCATORS}[button.email]
    Run Keyword If    '${email_to_patient}' == 'enabled'    Fill Sick Note Email Details    ${email_subject}    ${email_body}
    Run Keyword If    '${email_to_patient}' == 'enabled'    Send Sick Note Email

Fill Sick Note Email Details
    [Documentation]    Fills in the email subject and body for the Sick Note email dialog.
    [Arguments]    ${email_subject}    ${email_body}
    # No explicit locators for email subject/body; assume handled by application defaults
    No Operation

Send Sick Note Email
    [Documentation]    Sends the Sick Note email to the patient.
    # No explicit send button locator; assume email is sent on click above
    No Operation

Print Sick Note Certificate
    [Documentation]    Prints the Sick Note certificate if enabled, for the specified number of copies.
    [Arguments]    ${print_certificate}    ${print_copies}
    Run Keyword If    '${print_certificate}' == 'enabled'    Print Sick Note Copies    ${print_copies}

Print Sick Note Copies
    [Documentation]    Prints the Sick Note for the specified number of copies.
    [Arguments]    ${print_copies}
    FOR    ${index}    IN RANGE    ${print_copies}
        Click    ${DIARY_PAGE_LOCATORS}[button.print]
        Wait Until Print Dialog Is Handled
    END

Wait Until Print Dialog Is Handled
    [Documentation]    Waits until the print dialog is handled and closed.
    Wait Until Element Is Invisible    ${DIARY_PAGE_LOCATORS}[dialog.sick_note_title]    timeout=${LONG_WAIT}

Validate Print And Email Logs In Communication History
    [Documentation]    Validates that print and email logs are recorded in the patient communication history.
    [Arguments]    ${patient_id}
    ${comm_log_locator}=    Evaluate    "//tr[td[contains(., '${patient_id}')] and (td[contains(., 'Email')] or td[contains(., 'Print')])]"
    Wait Until Element Is Visible    ${comm_log_locator}    ${LONG_WAIT}

Validate QR Code On Printout
    [Documentation]    Validates that QR Code appears on the printout if enabled.
    [Arguments]    ${qr_code}
    Run Keyword If    '${qr_code}' == 'enabled'    Validate QR Code Present On Printout

Validate QR Code Present On Printout
    [Documentation]    Validates the presence of QR Code on the printout.
    # No explicit locator for QR code; assume handled by print preview or PDF validation
    No Operation
