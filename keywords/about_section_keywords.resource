*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and section closure.
Resource    ../common/super.resource
Resource    ../objectrepository/about_section_page.resource
Resource    login_page.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in using a valid username and password.
    Login To Application
    Wait Until Dashboard Is Visible

Navigate To About Section
    [Documentation]    Navigates to the About section from the dashboard.
    Click    ${DASHBOARD_PAGE_LOCATORS.link.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.overview}    timeout=10s

Navigate Through About Tabs
    [Documentation]    Navigates through all tabs in the About section and verifies their visibility.
    Click    ${ABOUT_SECTION_LOCATORS.tab.overview}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.overview}    timeout=5s
    Click    ${ABOUT_SECTION_LOCATORS.tab.details}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.details}    timeout=5s
    Click    ${ABOUT_SECTION_LOCATORS.tab.history}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.history}    timeout=5s
    Click    ${ABOUT_SECTION_LOCATORS.tab.settings}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.settings}    timeout=5s

Close About Section
    [Documentation]    Closes the About section.
    Click    ${ABOUT_SECTION_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS.tab.overview}    timeout=5s

Verify About Section Navigation Flow
    [Documentation]    Performs login, navigates to the About section, navigates through all tabs, and closes the section.
    Login With Valid Credentials
    Navigate To About Section
    Navigate Through About Tabs
    Close About Section
