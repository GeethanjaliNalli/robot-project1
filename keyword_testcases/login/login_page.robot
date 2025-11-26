*** Settings ***
Documentation    This File has all the Test Cases related to the login page
Resource    ../../common/super.resource
Resource    ../../keywords/common_keywords.resource

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

TC_02 Verify Navigation In The About Section
    [Documentation]    Verifies that a user can navigate to each tab in the About section after login.
    ...    Ensures the About dialog opens, all tabs are accessible, and the dialog can be closed successfully.
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    company
    Navigate To About Tab    privacy
    Navigate To About Tab    terms
    Navigate To About Tab    licenses
    Close About Section
