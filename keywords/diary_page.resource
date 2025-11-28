*** Settings ***
Documentation    This Diary page Resource file contains all keywords for booking creation, quicknote addition, and validations for the Diary module.
Resource    ../common/super.resource

*** Keywords ***
Create New Booking For New Patient
    [Documentation]    Creates a new booking for a new patient (not in debtor list) using booking data dictionary.
    Click    ${DIARY_NAVIGATION_LOCATORS}[tab.diary]
    Wait Until Element Is Visible    ${DIARY_NAVIGATION_LOCATORS}[button.new_booking]    ${LONG_WAIT}
    Click    ${DIARY_NAVIGATION_LOCATORS}[button.new_booking]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[booking.container]    ${LONG_WAIT}
    Enter Booking Form Data    &{QUICKNOTE_BOOKING}
    Save Booking Form
    Wait Until Booking Is Created    &{QUICKNOTE_BOOKING}

Enter Booking Form Data
    [Documentation]    Enters booking form fields dynamically using dictionary keys.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        Run Keyword If    '${field}'.startswith('booking.')    Set Booking Field    ${field}    ${value}
        Run Keyword If    '${field}'.startswith('patient.')    Set Patient Field    ${field}    ${value}
    END

Set Booking Field
    [Documentation]    Sets a booking field using the booking form locators.
    [Arguments]    ${field}    ${value}
    ${field_name}=    Evaluate    '${field}'.replace('booking.', '')
    ${locator}=    Get From Dictionary    ${BOOKING_FORM_LOCATORS}    input.${field_name}
    Run Keyword If    '${field_name}'.startswith('type')    Select Options By    ${BOOKING_FORM_LOCATORS}[select.event_class]    label    ${value}
    Run Keyword If    '${field_name}'.startswith('status')    No Operation
    Run Keyword If    '${field_name}'.startswith('time')    No Operation
    Run Keyword If    '${field_name}'.startswith('duration')    No Operation
    Run Keyword If    '${field_name}'.startswith('reason')    Fill Text    ${BOOKING_FORM_LOCATORS}[input.patient_name]    ${value}

Set Patient Field
    [Documentation]    Sets a patient field using the booking form locators.
    [Arguments]    ${field}    ${value}
    ${field_name}=    Evaluate    '${field}'.replace('patient.', '')
    Run Keyword If    '${field_name}' == 'type'    No Operation
    Run Keyword If    '${field_name}' == 'in_debtor_list'    No Operation

Save Booking Form
    [Documentation]    Saves the Add/Edit Booking form.
    Click    ${button.save}
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[booking.container]    timeout=${LONG_WAIT}

Wait Until Booking Is Created
    [Documentation]    Waits until the booking appears in the diary grid for the given patient name and time.
    [Arguments]    &{form_data}
    ${patient_name}=    Set Variable    ${form_data}[input.patient_name]
    ${booking_time}=    Set Variable    ${form_data}[booking.time]
    Wait Until Booking Exists In Diary    ${patient_name}    ${booking_time}

Wait Until Booking Exists In Diary
    [Documentation]    Waits until a booking row with the given patient name and time is visible in the diary grid.
    [Arguments]    ${patient_name}    ${booking_time}
    ${row_locator}=    Evaluate    "//table[contains(@class,'table-striped')]//tr[td[contains(., '${booking_time}')] and td[contains(., '${patient_name}')]]"
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}

Open Booking Quicknote Section
    [Documentation]    Opens the Quick Note section for the booking.
    [Arguments]    &{form_data}
    ${patient_name}=    Set Variable    ${form_data}[input.patient_name]
    ${booking_time}=    Set Variable    ${form_data}[booking.time]
    ${row_locator}=    Evaluate    "//table[contains(@class,'table-striped')]//tr[td[contains(., '${booking_time}')] and td[contains(., '${patient_name}')]]"
    Wait Until Element Is Visible    ${row_locator}    ${LONG_WAIT}
    Click    ${row_locator}
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.view_notebook]    ${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.view_notebook]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[header.quicknote]    ${LONG_WAIT}

Add Quicknote With Image
    [Documentation]    Adds a quicknote with text and uploads an image.
    [Arguments]    ${quicknote_text}    ${image_path}
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[textarea.quicknote]    ${LONG_WAIT}
    Fill Text    ${QUICKNOTE_LOCATORS}[textarea.quicknote]    ${quicknote_text}
    Click    ${QUICKNOTE_LOCATORS}[button.add_image]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.upload_multiple_files]    ${LONG_WAIT}
    Upload Quicknote Image    ${image_path}
    Click    ${QUICKNOTE_LOCATORS}[button.complete]
    Wait Until Element Is Invisible    ${dialog.quicknote}    timeout=${LONG_WAIT}

Upload Quicknote Image
    [Documentation]    Uploads an image file to the quicknote.
    [Arguments]    ${image_path}
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[button.upload_multiple_files]    ${LONG_WAIT}
    Click    ${BOOKING_FORM_LOCATORS}[button.upload_multiple_files]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[input.set_pdf_file]    ${LONG_WAIT}
    Choose File    ${BOOKING_FORM_LOCATORS}[input.set_pdf_file]    ${image_path}
    Wait Until Quicknote Image Is Uploaded

Wait Until Quicknote Image Is Uploaded
    [Documentation]    Waits until the quicknote image is uploaded and visible.
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[img.quicknote_image]    ${LONG_WAIT}

Validate Quicknote Image Is Displayed
    [Documentation]    Validates that the uploaded image is displayed in the Quick Note section.
    [Arguments]    ${expected_image_path}
    Click    ${BOOKING_FORM_LOCATORS}[button.view_notebook]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[img.quicknote_image]    ${LONG_WAIT}
    ${image_src}=    Get Element Attribute    ${QUICKNOTE_LOCATORS}[img.quicknote_image]    src
    Should Contain    ${image_src}    ${expected_image_path}

