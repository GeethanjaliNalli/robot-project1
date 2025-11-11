*** Settings ***
Documentation    Keywords for verifying navigation in the About section (TC00002). Handles login and navigation through all About tabs.
Resource         ../common/super.resource

*** Keywords ***
Login And Open Diary
    [Documentation]    Logs in with valid credentials and ensures Diary page is open.
    # Reuse login keywords from login_page.resource or common_keywords.resource
    Run Keyword    Login With Valid Credentials
    Wait Until Page Contains Element    ${DIARY_PAGE_INDICATOR}

Open About Section
    [Documentation]    Opens the About section from the Diary/dashboard page.
    Click Element    ${ABOUT_SECTION_BUTTON}
    Wait Until Page Contains Element    ${ABOUT_APP_INFO_TAB}

Verify About Section Tabs Navigation
    [Documentation]    Navigates through all tabs in the About section and verifies navigation.
    Click Element    ${ABOUT_APP_INFO_TAB}
    Wait Until Page Contains    App Info
    Click Element    ${ABOUT_MEDICAL_AID_TAB}
    Wait Until Page Contains    Medical Aid Contracts
    Click Element    ${ABOUT_USER_MANUAL_TAB}
    Wait Until Page Contains    User Manual
    Click Element    ${ABOUT_CHANGELOG_TAB}
    Wait Until Page Contains    Changelog
    Click Element    ${ABOUT_SERVICES_TAB}
    Wait Until Page Contains    Services

Close About Section
    [Documentation]    Closes the About section.
    Click Element    ${ABOUT_SECTION_CLOSE_BUTTON}
    Wait Until Element Does Not Exist    ${ABOUT_SECTION_CLOSE_BUTTON}

Verify Navigation In About Section
    [Documentation]    Complete flow: login, open About, navigate tabs, and close About section.
    Login And Open Diary
    Open About Section
    Verify About Section Tabs Navigation
    Close About Section
