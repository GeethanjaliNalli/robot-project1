*** Settings ***
Documentation    Keywords for About section navigation (TC00002: Verify Navigation in the About section)
Resource         ../common/super.resource

*** Keywords ***
Login And Navigate Through About Section
    [Documentation]    Logs in with valid credentials and navigates through each tab in the About section.
    Login With Valid Credentials
    Navigate To About Section
    Navigate Through All About Tabs

Login With Valid Credentials
    [Documentation]    Logs in using valid username and password.
    # Reuse existing login keyword from login_page.resource if available
    Run Keyword    Login With Valid Credentials

Navigate To About Section
    [Documentation]    Navigates to the About section from the dashboard.
    Wait Until Element Is Visible    ${ABOUT_TAB}    10s
    Click Element    ${ABOUT_TAB}
    Wait Until Element Is Visible    ${COMPANY_INFO_TAB}    10s

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section and verifies navigation.
    Click Element    ${COMPANY_INFO_TAB}
    Wait Until Element Is Visible    ${TEAM_TAB}    10s
    Click Element    ${TEAM_TAB}
    Wait Until Element Is Visible    ${CAREERS_TAB}    10s
    Click Element    ${CAREERS_TAB}
    Wait Until Element Is Visible    ${CONTACT_TAB}    10s
    Click Element    ${CONTACT_TAB}
    # Optionally add verification steps for each tab if required
