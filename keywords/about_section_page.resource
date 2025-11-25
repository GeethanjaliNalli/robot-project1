*** Settings ***
Documentation    This resource file contains keywords for verifying navigation in the About section, including login, tab navigation, and closing the section.
Resource    ../Common/super.resource
Resource    ../objectrepository/about_section_page.resource
Resource    ./login_page.resource
Resource    ./dashboard_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the dashboard.
    Click    ${ABOUT_SECTION_LOCATORS['button.about']}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS['tab.overview']}    timeout=${LONG_WAIT}

Navigate To Overview Tab
    [Documentation]    Navigates to the Overview tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS['tab.overview']}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS['tab.overview']}    timeout=${LONG_WAIT}

Navigate To Details Tab
    [Documentation]    Navigates to the Details tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS['tab.details']}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS['tab.details']}    timeout=${LONG_WAIT}

Navigate To History Tab
    [Documentation]    Navigates to the History tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS['tab.history']}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS['tab.history']}    timeout=${LONG_WAIT}

Close About Section
    [Documentation]    Closes the About section.
    Click    ${ABOUT_SECTION_LOCATORS['button.close']}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS['button.close']}    timeout=${LONG_WAIT}

Verify Navigation In About Section
    [Documentation]    Logs in and verifies navigation through all tabs in the About section, then closes the section.
    [Arguments]    ${username}    ${password}
    Launch GoodX Web Application    ${BROWSER}    ${URL}
    Enter Username And Password    ${username}    ${password}
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To Overview Tab
    Navigate To Details Tab
    Navigate To History Tab
    Close About Section
    Logout From The Application
