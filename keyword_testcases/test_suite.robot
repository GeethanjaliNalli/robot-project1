*** Settings ***
Documentation    Test suite for login and diary quick note scenarios.
Resource         ../common/super.resource
Test Setup       Login To Application    ${USERNAME}    ${PASSWORD}
Test Teardown    Logout From The Application

*** Test Cases ***
TC_01 Validate User Is Able To Login The Application With Valid Username And Password
    [Documentation]    Verifies that a user can successfully log in with valid credentials.
    ...  Confirms dashboard access and ensures proper logout with alert handling.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Handle Attention Alert    dismiss
    Validate Dashboard Is Displayed
    Logout From The Application
    Handle Attention Alert    dismiss
    Logout From The Application
    Handle Attention Alert    accept

TC00005_Diary_Add Quicknote - Adding a quicknote
    [Documentation]    Adding a quick note to a booking and verifying all elements (image, text, PDF, print).
    # Step 1-2: Open Diary and open Clinical sidebar
    Open Diary And Open Clinical Sidebar    ${button.booking}    ${button.clinical}
    # Step 3-4: Select Quick Note form from Forms Library
    Select Quick Note Form    ${dropdown.forms_library}    ${option.quick_note}
    # Step 5-9: Add image to Quick Note
    Add Image To Quick Note    ${button.add_image}    ${button.upload_from_file}    ${button.choose_file}    ${button.save}
    # Step 10: Add text to Quick Note
    # TODO: MISSING TESTDATA: quicknote_text for Step 10
    Add Text To Quick Note    ${textbox.quick_note_text}
    # Step 11-12: Upload PDF to Quick Note
    # TODO: MISSING TESTDATA: quicknote_pdf_file for Step 11-12
    Upload PDF To Quick Note    ${button.upload_pdf}    ${button.choose_file}
    # Step 13: Print Quick Note
    Print Quick Note    ${button.print}
