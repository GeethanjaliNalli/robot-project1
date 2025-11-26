*** Settings ***
Documentation    This resource file contains keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../Common/super.resource
Resource    ../objectrepository/about_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the dashboard.
    Click    xpath=//a[@role="button" and contains(text(), "About")]
    Wait Until Element Is Visible    ${ABOUT_PAGE_LOCATORS.tab.company}    timeout=${MEDIUM_WAIT}

Navigate To About Tab
    [Documentation]    Navigates to the specified tab in the About section.
    [Arguments]    ${tab_name}
    ${tab_locator}=    Get From Dictionary    ${ABOUT_PAGE_LOCATORS}    tab.${tab_name}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=${SHORT_WAIT}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_PAGE_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_PAGE_LOCATORS.button.close}    timeout=${MEDIUM_WAIT}

Verify Navigation In About Section
    [Documentation]    Logs in and navigates to each tab in the About section, then closes it.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    company
    Navigate To About Tab    privacy
    Navigate To About Tab    terms
    Navigate To About Tab    licenses
    Close About Section
    Logout From The Application
