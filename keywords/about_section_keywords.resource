*** Settings ***
Documentation    Keywords to login and navigate through all tabs in the About section, then close it.
Resource    ../common/super.resource

*** Keywords ***

Login With Valid Credentials
    [Documentation]    Logs in with a valid username and password.
    # Assumes existing login keywords are available in login_page.resource
    Run Keyword    Login To Application    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    ${DASHBOARD_PAGE_LOCATORS.link.logout}    timeout=10s

Open About Section
    [Documentation]    Opens the About section from the dashboard.
    Click    ${DASHBOARD_PAGE_LOCATORS.link.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_PAGE_LOCATORS.tab.overview}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specific tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=3s

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Navigate To About Tab    ${ABOUT_SECTION_PAGE_LOCATORS.tab.overview}
    Navigate To About Tab    ${ABOUT_SECTION_PAGE_LOCATORS.tab.details}
    Navigate To About Tab    ${ABOUT_SECTION_PAGE_LOCATORS.tab.licenses}
    Navigate To About Tab    ${ABOUT_SECTION_PAGE_LOCATORS.tab.privacy}

Close About Section
    [Documentation]    Closes the About section.
    Click    ${ABOUT_SECTION_PAGE_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_PAGE_LOCATORS.tab.overview}    timeout=5s

Verify Navigation In About Section
    [Documentation]    Logs in and navigates through all tabs in the About section, then closes it.
    Login With Valid Credentials
    Open About Section
    Navigate Through All About Tabs
    Close About Section
