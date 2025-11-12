*** Settings ***
Documentation    Keywords for About section navigation: login, navigate each tab, and close.
Resource         ../common/super.resource

*** Keywords ***
Login And Navigate Through About Section
    [Documentation]    Logs in and navigates through each tab in the About section, then closes the section.
    Login To Application
    Open About Section
    Navigate Through All About Tabs
    Close About Section

Open About Section
    [Documentation]    Clicks the About section button to open the About module.
    Click Element    ${ABOUT_SECTION_BUTTON}
    Wait Until Element Is Visible    ${ABOUT_TAB_1}    timeout=5s

Navigate Through All About Tabs
    [Documentation]    Navigates through each tab in the About section.
    Click Element    ${ABOUT_TAB_1}
    Wait Until Element Is Visible    ${ABOUT_TAB_2}    timeout=2s
    Click Element    ${ABOUT_TAB_2}
    Wait Until Element Is Visible    ${ABOUT_TAB_3}    timeout=2s
    Click Element    ${ABOUT_TAB_3}
    # Add additional tab navigation steps here if more tabs exist

Close About Section
    [Documentation]    Closes the About section.
    Click Element    ${ABOUT_CLOSE_BUTTON}
    Wait Until Element Does Not Exist    ${ABOUT_TAB_1}    timeout=5s

Login To Application
    [Documentation]    Logs in to the application using valid credentials. Assumes credentials are set in global config or test setup.
    # Reuse existing login keywords if available in common_keywords.resource or login_page.resource
    Run Keyword    Login With Valid Credentials
