*** Settings ***
Documentation    This diary page Resource file contains all keywords for diary booking and quicknote flows, including adding quicknotes, attachments, and validations.
Resource    ../common/super.resource

*** Keywords ***
Create New Booking For New Patient
    [Documentation]    Creates a new booking for a new patient (not in debtor list) using provided booking data.
    [Arguments]    &{booking_data}
    Click    ${DIARY_GRID_LOCATORS}[button.diary.add]
    Wait Until Element Is Visible    ${BOOKING_FORM_LOCATORS}[input.patient.name]    ${LONG_WAIT}
    Enter New Patient Booking Data    &{booking_data}
    Save Booking Form
    Wait Until Booking Appears In Diary    &{booking_data}

Enter New Patient Booking Data
    [Documentation]    Enters booking and new patient data into the booking form using a data dictionary.
    [Arguments]    &{form_data}
    Fill Booking Form Fields    &{form_data}

Fill Booking Form Fields
    [Documentation]    Fills booking form fields dynamically using dictionary keys and booking form locators.
    [Arguments]    &{form_data}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Evaluate    ${BOOKING_FORM_LOCATORS}.get('input.patient.name') if '${field}'=='patient.first_name' else
        ...    ${BOOKING_FORM_LOCATORS}.get('input.patient.surname') if '${field}'=='patient.last_name' else
        ...    ${BOOKING_FORM_LOCATORS}.get('input.patient.dob') if '${field}'=='patient.dob' else
        ...    ${BOOKING_FORM_LOCATORS}.get('select.patient.gender') if '${field}'=='patient.gender' else
        ...    ${BOOKING_FORM_LOCATORS}.get('select.booking.type') if '${field}'=='booking.type' else
        ...    ${BOOKING_FORM_LOCATORS}.get('input.booking.time') if '${field}'=='booking.time' else
        ...    None
        Run Keyword If    '${locator}'==None    Continue For Loop
        Run Keyword If    '${field}'.startswith('select.') or '${field}'=='patient.gender' or '${field}'=='booking.type'
        ...    Select Options By    ${locator}    label    ${value}
        Run Keyword If    '${field}'.startswith('input.') or '${field}' in ['patient.first_name','patient.last_name','patient.dob','booking.time']
        ...    Fill Text    ${locator}    ${value}
    END

Save Booking Form
    [Documentation]    Saves the Add/Edit Booking form.
    Click    ${BOOKING_FORM_LOCATORS}[button.booking.save]
    Wait Until Element Is Invisible    ${BOOKING_FORM_LOCATORS}[button.booking.save]    timeout=${LONG_WAIT}

Wait Until Booking Appears In Diary
    [Documentation]    Waits until the booking for the new patient appears in the diary grid.
    [Arguments]    &{booking_data}
    ${patient_name}    Set Variable    ${booking_data}[patient.first_name] ${booking_data}[patient.last_name]
    Wait Until Keyword Succeeds    10x    2s    Booking Row Should Exist In Diary    ${patient_name}

Booking Row Should Exist In Diary
    [Documentation]    Checks that a booking row exists in the diary for the given patient name.
    [Arguments]    ${patient_name}
    ${rows}    Get Elements    ${DIARY_GRID_LOCATORS}[table.diary.row]
    ${found}    Set Variable    False
    FOR    ${row}    IN    @{rows}
        ${patient_cell}    Get Element    ${row} >> ${DIARY_GRID_LOCATORS}[table.diary.row.patient]
        ${cell_text}    Get Text    ${patient_cell}
        Run Keyword If    '${patient_name}' in '${cell_text}'    Set Variable    ${found}    True
    END
    Should Be True    ${found}

Open Booking Quicknote Section
    [Documentation]    Opens the Quick Note section for the selected booking in the diary.
    Click    ${DIARY_GRID_LOCATORS}[table.diary.row.action]
    Click    ${QUICKNOTE_LOCATORS}[button.booking.display]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[button.clinical.sidebar]    ${LONG_WAIT}
    Click    ${QUICKNOTE_LOCATORS}[button.clinical.sidebar]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[button.forms.library.dropdown]    ${LONG_WAIT}
    Click    ${QUICKNOTE_LOCATORS}[button.forms.library.dropdown]
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[select.forms.library]    ${LONG_WAIT}
    Select Options By    ${QUICKNOTE_LOCATORS}[select.forms.library]    label    QUICK NOTE
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Add Quicknote With Attachments
    [Documentation]    Adds a quicknote with text, image, and PDF attachments using provided quicknote data.
    [Arguments]    &{quicknote_data}
    Enter Quicknote Text    ${quicknote_data}[quicknote.text]
    Attach Quicknote Image    ${quicknote_data}[quicknote.image_path]
    Attach Quicknote PDF    ${quicknote_data}[quicknote.pdf_path]
    Save Quicknote
    Wait Until Quicknote Saved

Enter Quicknote Text
    [Documentation]    Enters the quicknote text in the quicknote dialog.
    [Arguments]    ${text}
    Fill Text    ${QUICKNOTE_LOCATORS}[input.quicknote.text]    ${text}
    Wait Until Quicknote Suggestion Appears    ${text}
    Select Quicknote Suggestion    ${text}

Wait Until Quicknote Suggestion Appears
    [Documentation]    Waits until the quicknote autocomplete suggestion appears for the given text.
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[list.quicknote.suggestions]    ${LONG_WAIT}
    ${suggestions}    Get Elements    ${QUICKNOTE_LOCATORS}[button.quicknote.suggestion.item]
    ${found}    Set Variable    False
    FOR    ${suggestion}    IN    @{suggestions}
        ${suggestion_text}    Get Text    ${suggestion}
        Run Keyword If    '${text}' in '${suggestion_text}'    Set Variable    ${found}    True
    END
    Should Be True    ${found}

Select Quicknote Suggestion
    [Documentation]    Selects the quicknote suggestion matching the given text.
    [Arguments]    ${text}
    ${suggestions}    Get Elements    ${QUICKNOTE_LOCATORS}[button.quicknote.suggestion.item]
    FOR    ${suggestion}    IN    @{suggestions}
        ${suggestion_text}    Get Text    ${suggestion}
        Run Keyword If    '${text}' in '${suggestion_text}'    Click    ${suggestion}
    END

Attach Quicknote Image
    [Documentation]    Attaches an image to the quicknote using the provided image path.
    [Arguments]    ${image_path}
    Click    ${QUICKNOTE_LOCATORS}[button.add.image]
    Wait Until Element Is Visible    ${dialog.upload.image}    ${LONG_WAIT}
    Upload File    ${QUICKNOTE_LOCATORS}[button.upload.file]    ${image_path}
    Click    ${button.close.dialog}
    Wait Until Element Is Invisible    ${dialog.upload.image}    ${LONG_WAIT}

Attach Quicknote PDF
    [Documentation]    Attaches a PDF to the quicknote using the provided PDF path.
    [Arguments]    ${pdf_path}
    Click    ${QUICKNOTE_LOCATORS}[button.upload.pdf]
    Wait Until Element Is Visible    ${dialog.upload.pdf}    ${LONG_WAIT}
    Upload File    ${QUICKNOTE_LOCATORS}[button.upload.pdf]    ${pdf_path}
    Click    ${button.close.dialog}
    Wait Until Element Is Invisible    ${dialog.upload.pdf}    ${LONG_WAIT}

Save Quicknote
    [Documentation]    Saves the quicknote in the dialog.
    Click    ${QUICKNOTE_LOCATORS}[button.save.quicknote]

Wait Until Quicknote Saved
    [Documentation]    Waits until the quicknote dialog is closed, indicating save is complete.
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Validate Quicknote Auto Completed
    [Documentation]    Validates that the quicknote is auto completed with the expected text.
    [Arguments]    &{quicknote_data}
    Open Booking Quicknote Section
    ${actual_text}    Get Value    ${QUICKNOTE_LOCATORS}[input.quicknote.text]
    Should Be Equal    ${actual_text}    ${quicknote_data}[quicknote.text]
    Click    ${button.close.dialog}
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Validate Quicknote Printout Rendered
    [Documentation]    Validates that the quicknote printout renders with the image, text, and PDF as expected.
    [Arguments]    &{quicknote_data}
    Open Booking Quicknote Section
    Click    ${QUICKNOTE_LOCATORS}[button.print.quicknote]
    Wait Until Quicknote Printout Is Rendered    ${quicknote_data}[quicknote.text]    ${quicknote_data}[quicknote.image_path]    ${quicknote_data}[quicknote.pdf_path]
    Click    ${button.close.dialog}
    Wait Until Element Is Invisible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}

Wait Until Quicknote Printout Is Rendered
    [Documentation]    Waits until the quicknote printout is rendered and validates presence of text, image, and PDF.
    [Arguments]    ${text}    ${image_path}    ${pdf_path}
    Wait Until Element Is Visible    ${QUICKNOTE_LOCATORS}[dialog.quicknote]    ${LONG_WAIT}
    ${text_present}    Evaluate    '${text}' in Get Text(${QUICKNOTE_LOCATORS}[dialog.quicknote])
    Should Be True    ${text_present}
    ${image_name}    Evaluate    '${image_path}'.split('/')[-1]
    ${pdf_name}    Evaluate    '${pdf_path}'.split('/')[-1]
    ${image_present}    Evaluate    '${image_name}' in Get Text(${QUICKNOTE_LOCATORS}[dialog.quicknote])
    Should Be True    ${image_present}
    ${pdf_present}    Evaluate    '${pdf_name}' in Get Text(${QUICKNOTE_LOCATORS}[dialog.quicknote])
    Should Be True    ${pdf_present}
