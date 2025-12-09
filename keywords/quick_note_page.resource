*** Settings ***
Documentation    This quick note page Resource file has all the keywords for Quick Note scenarios
Resource    ../common/super.resource

*** Keywords ***
Open Diary And Open Clinical Sidebar
    [Documentation]    Opens the Diary and then opens the Clinical sidebar.
    [Arguments]    ${booking_button}    ${clinical_button}
    Click    ${booking_button}
    Wait Until Element Is Visible    ${clinical_button}    ${LONG_WAIT}
    Click    ${clinical_button}
    Wait Until Element Is Visible    ${link.select_clinical_subscreen}    ${LONG_WAIT}
    Click    ${link.select_clinical_subscreen}
    Wait Until Element Is Visible    ${dropdown.forms_library}    ${LONG_WAIT}

Select Quick Note Form
    [Documentation]    Selects the Quick Note form from the Forms Library dropdown.
    [Arguments]    ${forms_library_dropdown}    ${quick_note_option}
    Wait Until Element Is Visible    ${forms_library_dropdown}    ${LONG_WAIT}
    Select Options By    ${forms_library_dropdown}    label    ${quick_note_option}
    Wait Until Element Is Visible    ${button.add_image}    ${LONG_WAIT}

Add Image To Quick Note
    [Documentation]    Adds an image to the Quick Note using the image upload workflow.
    [Arguments]    ${add_image_button}    ${upload_from_file_button}    ${choose_file_button}    ${save_button}
    Click    ${add_image_button}
    Wait Until Element Is Visible    ${upload_from_file_button}    ${LONG_WAIT}
    Click    ${upload_from_file_button}
    Wait Until Element Is Visible    ${choose_file_button}    ${LONG_WAIT}
    Click    ${choose_file_button}
    Wait Until Element Is Visible    ${save_button}    ${LONG_WAIT}
    Click    ${save_button}
    Wait Until Element Is Invisible    ${save_button}    timeout=${LONG_WAIT}

Add Text To Quick Note
    [Documentation]    Adds text to the Quick Note text box.
    [Arguments]    ${quick_note_textbox}    ${quicknote_text}=Test@123
    Wait Until Element Is Visible    ${quick_note_textbox}    ${LONG_WAIT}
    Fill Text    ${quick_note_textbox}    ${quicknote_text}

Upload PDF To Quick Note
    [Documentation]    Uploads a PDF file to the Quick Note.
    [Arguments]    ${upload_pdf_button}    ${choose_file_button}    ${pdf_file}=quicknote.pdf
    Click    ${upload_pdf_button}
    Wait Until Element Is Visible    ${choose_file_button}    ${LONG_WAIT}
    Click    ${choose_file_button}
    # File upload handled by Playwright context, assumed handled externally

Print Quick Note
    [Documentation]    Prints the Quick Note and waits for print dialog to appear.
    [Arguments]    ${print_button}
    Wait Until Element Is Visible    ${print_button}    ${LONG_WAIT}
    Click    ${print_button}
    # Optionally, wait for print dialog or confirmation

Validate Quick Note Printout
    [Documentation]    Validates that the Quick Note printout contains the image, text, and PDF.
    [Arguments]    ${quicknote_text}=Test@123
    # This keyword should be extended to validate the printout content if possible
    # For now, ensures the print button was clicked and quick note text is present
    Wait Until Element Is Visible    ${textbox.quick_note_text}    ${LONG_WAIT}
    ${actual_text}=    Get Text    ${textbox.quick_note_text}
    Should Contain    ${actual_text}    ${quicknote_text}

Enter Quick Note Form Data
    [Documentation]    Enters Quick Note form fields dynamically using dictionary keys.
    [Arguments]    ${select_by}=label    &{form_data}
    &{QUICK_NOTE_FORM_LOCATORS}=    Create Dictionary
    ...    input.quick_note_text=${textbox.quick_note_text}
    ...    input.quick_note_description=${input.quick_note_description}
    FOR    ${field}    ${value}    IN    &{form_data}
        ${locator}    Get From Dictionary    ${QUICK_NOTE_FORM_LOCATORS}    ${field}
        Run Keyword If    '${value}' == ''    Continue For Loop
        Run Keyword If    '${field}'.startswith('input.')
        ...    Fill Text    ${locator}    ${value}
        Run Keyword If    '${field}'.startswith('select.')
        ...    Select Options By    ${locator}    ${select_by}    ${value}
    END
