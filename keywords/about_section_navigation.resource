*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login and tab navigation.
Resource    ../common/super.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in using a valid username and password.
    Run Keyword    Login With Valid User
    Wait Until Page Contains Element    ${about_section.tab.overview}    timeout=10s

Navigate To About Section
    [Documentation]    Navigates to the About section from the main application dashboard.
    Click    ${dashboard.menu.about}
    Wait Until Element Is Visible    ${about_section.tab.overview}    timeout=5s

Navigate Through About Tabs
    [Documentation]    Navigates through each tab in the About section and validates their visibility.
    Click    ${about_section.tab.overview}
    Wait Until Element Is Visible    ${about_section.content.overview}    timeout=3s
    Click    ${about_section.tab.details}
    Wait Until Element Is Visible    ${about_section.content.details}    timeout=3s
    Click    ${about_section.tab.licenses}
    Wait Until Element Is Visible    ${about_section.content.licenses}    timeout=3s
    Click    ${about_section.tab.acknowledgements}
    Wait Until Element Is Visible    ${about_section.content.acknowledgements}    timeout=3s
    Click    ${about_section.tab.close}
    Wait Until Element Is Not Visible    ${about_section.dialog}    timeout=5s

Validate About Section Closed
    [Documentation]    Validates that the About section dialog is closed successfully.
    Wait Until Element Is Not Visible    ${about_section.dialog}    timeout=5s
