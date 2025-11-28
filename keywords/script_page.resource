*** Settings ***
Documentation    This resource file contains keywords for Script (Prescription) Creation, Completion, Signing, Emailing, and Printing flows.
Resource    ../common/super.resource

*** Keywords ***
Navigate To Diary And Open Patient Booking
    [Documentation]    Navigates to Diary and opens the specified patient booking for script creation.
    [Arguments]    ${patient_name}    ${booking_id}
    Go To Diary Page
    Search Booking In Diary    ${patient_name}    ${booking_id}
    Open Booking By Id    ${booking_id}
    Wait Until Patient Booking Is Loaded    ${patient_name}

Go To Diary Page
    [Documentation]    Navigates to the Diary page from the dashboard.
    Click    ${link.diary}
    Wait Until Element Is Visible    ${tab.prescription}    ${LONG_WAIT}

Search Booking In Diary
    [Documentation]    Searches for the patient booking in the diary using patient name and booking id.
    [Arguments]    ${patient_name}    ${booking_id}
    Fill Text    ${textbox.diary.search}    ${patient_name}
    Press Keys    ${textbox.diary.search}    Enter
    Wait Until Booking Row Is Visible    ${booking_id}

Wait Until Booking Row Is Visible
    [Documentation]    Waits until the booking row with the specified booking id is visible.
    [Arguments]    ${booking_id}
    ${booking_row_locator}=    Evaluate    "//tr[td[contains(., '${booking_id}')]]"
    Wait Until Element Is Visible    ${booking_row_locator}    ${LONG_WAIT}

Open Booking By Id
    [Documentation]    Opens the booking row by booking id.
    [Arguments]    ${booking_id}
    ${booking_row_locator}=    Evaluate    "//tr[td[contains(., '${booking_id}')]]"
    Click    ${booking_row_locator}
    Wait Until Element Is Visible    ${tab.prescription}    ${LONG_WAIT}

Wait Until Patient Booking Is Loaded
    [Documentation]    Waits until the patient booking details are loaded for the given patient name.
    [Arguments]    ${patient_name}
    ${patient_name_locator}=    Evaluate    "//div[contains(@class, 'patient-details')]//*[contains(text(), '${patient_name}') or contains(@value, '${patient_name}') or contains(text(), '${patient_name.split()[0]}')]"
    Wait Until Element Is Visible    ${patient_name_locator}    ${LONG_WAIT}

Start Script Creation For Patient
    [Documentation]    Starts the script creation process for the patient and selects script type.
    [Arguments]    ${script_type}
    Click    ${tab.prescription}
    Wait Until Element Is Visible    ${PRESCRIPTION_DETAILS_LOCATORS}[select.prescription.type]    ${LONG_WAIT}
    Select Options By    ${PRESCRIPTION_DETAILS_LOCATORS}[select.prescription.type]    label    ${script_type}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.save.script]
    Wait Until Element Is Visible    ${tab.medication}    ${LONG_WAIT}

Enter Medication Details In Script
    [Documentation]    Enters the medication details for each medication in the medication list.
    [Arguments]    ${medication_list}
    Click    ${tab.medication}
    FOR    ${medication}    IN    @{medication_list}
        Add Medication To Script    ${medication}
    END
    Wait Until Medication List Is Updated    ${medication_list}

Add Medication To Script
    [Documentation]    Adds a single medication entry to the script using the medication dictionary.
    [Arguments]    ${medication}
    ${form_data}=    Create Medication Form Data    ${medication}
    Enter Medication Form Data    &{form_data}
    Click    ${MEDICATION_DETAILS_LOCATORS}[button.add.medication]
    Wait Until Medication Row Is Visible    ${medication}[name]

Create Medication Form Data
    [Documentation]    Creates a dictionary mapping for medication form fields.
    [Arguments]    ${medication}
    &{form_data}=    Create Dictionary
    ...    input.medication.name=${medication}[name]
    ...    input.medication.strength=${medication}[dose]
    ...    input.medication.dosage=${medication}[dose]
    ...    input.medication.frequency=${medication}[frequency]
    ...    input.medication.duration=${medication}[duration]
    ...    textarea.medication.directions=${medication}[directions]
    RETURN    &{form_data}

Enter Medication Form Data
    [Documentation]    Enters medication form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${MEDICATION_DETAILS_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('textarea.')
        ...    Fill Text    ${locator}    ${value}
    END

Wait Until Medication Row Is Visible
    [Documentation]    Waits until the medication row with the specified medication name is visible in the medication list.
    [Arguments]    ${medication_name}
    ${row_locator}=    Evaluate    "${MEDICATION_DETAILS_LOCATORS}[table.medication.row] + '[td[contains(., \'' + ${medication_name} + '\')]]'"
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}

Wait Until Medication List Is Updated
    [Documentation]    Waits until the medication list table has the expected number of medications.
    [Arguments]    ${medication_list}
    ${expected_count}=    Get Length    ${medication_list}
    Wait Until    Evaluate Expression    len(Get Elements    ${MEDICATION_DETAILS_LOCATORS}[table.medication.row]) == ${expected_count}    ${LONG_WAIT}

Enter Diagnosis And Directions
    [Documentation]    Enters diagnosis and directions in the prescription notes.
    [Arguments]    ${diagnosis}    ${directions}
    Click    ${tab.prescription}
    Fill Text    ${PRESCRIPTION_DETAILS_LOCATORS}[textarea.prescription.notes]    ${diagnosis}\n${directions}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.save.script]
    Wait Until Element Is Visible    ${tab.signature}    ${LONG_WAIT}

Complete And Sign Script
    [Documentation]    Completes and signs the script if required and configured.
    [Arguments]    ${signature_required}    ${signature_configured}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.complete.script]
    Wait Until Element Is Visible    ${SCRIPT_ACTIONS_LOCATORS}[dialog.confirm.complete]    ${LONG_WAIT}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.confirm.complete.yes]
    Wait Until Element Is Invisible    ${SCRIPT_ACTIONS_LOCATORS}[dialog.confirm.complete]    ${LONG_WAIT}
    Run Keyword If    '${signature_required}'=='True' and '${signature_configured}'=='True'    Sign Script

Sign Script
    [Documentation]    Signs the script by adding the practitioner's signature.
    Click    ${tab.signature}
    Wait Until Element Is Visible    ${SIGNATURE_LOCATORS}[button.add.signature]    ${LONG_WAIT}
    Click    ${SIGNATURE_LOCATORS}[button.add.signature]
    Wait Until Element Is Visible    ${SIGNATURE_LOCATORS}[dialog.signature]    ${LONG_WAIT}
    Click    ${SIGNATURE_LOCATORS}[button.signature.save]
    Wait Until Element Is Invisible    ${SIGNATURE_LOCATORS}[dialog.signature]    ${LONG_WAIT}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.sign.script]
    Wait Until Element Is Visible    ${alert.success}    ${LONG_WAIT}

Validate Script Status Is Completed
    [Documentation]    Validates that the script status is marked as Completed.
    [Arguments]    ${expected_status}
    Click    ${tab.prescription}
    Wait Until Element Is Visible    ${PRESCRIPTION_DETAILS_LOCATORS}[label.prescription.status]    ${LONG_WAIT}
    ${actual_status}=    Get Text    ${PRESCRIPTION_DETAILS_LOCATORS}[label.prescription.status]
    Should Be Equal    ${actual_status}    ${expected_status}

Validate Script Output Fields
    [Documentation]    Validates that the expected output fields are present in the script output.
    [Arguments]    ${expected_output_fields}
    FOR    ${field}    IN    @{expected_output_fields}
        Validate Script Output Field Exists    ${field}
    END

Validate Script Output Field Exists
    [Documentation]    Validates that a specific output field is present in the script output.
    [Arguments]    ${field}
    ${output_locator}=    Get Script Output Field Locator    ${field}
    Wait Until Element Is Visible    ${output_locator}    ${LONG_WAIT}

Get Script Output Field Locator
    [Documentation]    Returns the locator for the given output field name.
    [Arguments]    ${field}
    ${locator}=    Set Variable    None
    Run Keyword If    '${field}'=='Medication'    Set Variable    ${MEDICATION_DETAILS_LOCATORS}[table.medication.list]
    ...    ELSE IF    '${field}'=='Directions'    Set Variable    ${MEDICATION_DETAILS_LOCATORS}[textarea.medication.directions]
    ...    ELSE IF    '${field}'=='Signature'    Set Variable    ${SIGNATURE_LOCATORS}[img.signature]
    ...    ELSE IF    '${field}'=='QR Code'    Set Variable    ${SCRIPT_ACTIONS_LOCATORS}[icon.qrcode.output]
    RETURN    ${locator}

Validate QR Code Is Visible On Output
    [Documentation]    Validates that the QR code is visible on the script output if expected.
    [Arguments]    ${output_qr_code_expected}
    Run Keyword If    '${output_qr_code_expected}'=='True'    Wait Until Element Is Visible    ${SCRIPT_ACTIONS_LOCATORS}[icon.qrcode.output]    ${LONG_WAIT}
    ...    ELSE    Wait Until Element Is Not Visible    ${SCRIPT_ACTIONS_LOCATORS}[icon.qrcode.output]    ${LONG_WAIT}

Email Script To Patient
    [Documentation]    Emails the script to the patient if requested.
    [Arguments]    ${email_to_patient}    ${email_address}
    Run Keyword If    '${email_to_patient}'=='True'    Send Script Email    ${email_address}

Send Script Email
    [Documentation]    Sends the script via email to the specified address.
    [Arguments]    ${email_address}
    Click    ${SCRIPT_ACTIONS_LOCATORS}[button.email.script]
    Wait Until Element Is Visible    ${dialog.email}    ${LONG_WAIT}
    Fill Text    ${input.email.to}    ${email_address}
    Click    ${button.email.send}
    Wait Until Element Is Visible    ${alert.success}    ${LONG_WAIT}
    Wait Until Element Is Invisible    ${dialog.email}    ${LONG_WAIT}

Print Script Document
    [Documentation]    Prints the script document if requested, for the specified number of copies.
    [Arguments]    ${print_script}    ${print_copies}
    Run Keyword If    '${print_script}'=='True'    Print Script Copies    ${print_copies}

Print Script Copies
    [Documentation]    Prints the script document the specified number of times.
    [Arguments]    ${print_copies}
    FOR    ${index}    IN RANGE    ${print_copies}
        Click    ${SCRIPT_ACTIONS_LOCATORS}[button.print.script]
        Wait Until Element Is Visible    ${alert.success}    ${LONG_WAIT}
    END
