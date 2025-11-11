*** Settings ***
Resource    ../common/super.resource
Resource    ../objectrepository/dashboard_page.resource
Resource    ../keywords/common_keywords.resource

*** Keywords ***

Verify Navigation In About Section
    [Documentation]    Logs in and navigates through each tab in the About section, then closes the About dialog.
    Login To Application
    Open About Section
    Navigate About Tabs
    Close About Section

Open About Section
    [Documentation]    Opens the About section from the dashboard.
    Wait Until Element Is Visible    ${About Link}
    Click Element    ${About Link}
    Wait Until Element Is Visible    ${App Info Tab}

Navigate About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Click Element    ${App Info Tab}
    Wait Until Element Is Visible    ${App Info Tab}
    Click Element    ${Medical Aid Contracts Tab}
    Wait Until Element Is Visible    ${Medical Aid Contracts Tab}
    Click Element    ${User Manual Tab}
    Wait Until Element Is Visible    ${User Manual Tab}
    Click Element    ${Changelog Tab}
    Wait Until Element Is Visible    ${Changelog Tab}
    Click Element    ${Services Tab}
    Wait Until Element Is Visible    ${Services Tab}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click Element    ${Close Button}
    Wait Until Element Does Not Exist    ${Close Button}

Login To Application
    [Documentation]    Logs in using valid credentials. Reuses existing login keyword if available.
    # Reuse existing login keyword from login_page.resource or common_keywords.resource
    Run Keyword    Login With Valid Credentials
