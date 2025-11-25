*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../common/super.resource
Resource    ../objectrepository/about_page.resource
Resource    common_keywords.resource
Resource    login_page.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in using a valid username and password.
    Login With Valid User    # Assumes this exists in login_page.resource

Open About Section
    [Documentation]    Navigates to the About section from the dashboard.
    Click    ${DASHBOARD_PAGE_LOCATORS.link.about}
    Wait Until Element Is Visible    ${ABOUT_PAGE_LOCATORS.tab.company}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specified tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=3s

Navigate Through All About Tabs
    [Documentation]    Navigates through each tab in the About section.
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.company}
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.team}
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.careers}
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.contact}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_PAGE_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_PAGE_LOCATORS.button.close}    timeout=5s

Verify About Section Navigation
    [Documentation]    Performs login, navigates to About section, iterates all tabs, and closes the About dialog.
    Login With Valid Credentials
    Open About Section
    Navigate Through All About Tabs
    Close About Section
