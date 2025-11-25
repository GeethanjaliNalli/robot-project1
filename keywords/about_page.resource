*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../common/super.resource
Resource    ../objectrepository/about_page.resource
Resource    common_keywords.resource
Resource    login_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the application dashboard.
    Click    ${ABOUT_PAGE_LOCATORS.button.about}
    Wait Until Element Is Visible    ${ABOUT_PAGE_LOCATORS.tab.overview}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specified tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=3s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_PAGE_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_PAGE_LOCATORS.button.close}    timeout=5s

Verify About Section Navigation
    [Documentation]    Logs in and navigates through all tabs in the About section, then closes it.
    Login With Valid Credentials
    Open About Section
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.overview}
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.license}
    Navigate To About Tab    ${ABOUT_PAGE_LOCATORS.tab.credits}
    Close About Section
