*** Settings ***
Documentation    This resource file provides keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../Common/super.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main menu.
    Click    ${ABOUT_SECTION_LOCATORS.button.menu.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.overview}    timeout=${LONG_WAIT}

Navigate To About Tab
    [Documentation]    Navigates to a specified tab in the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=${LONG_WAIT}

Validate About Tab Is Displayed
    [Documentation]    Validates that the specified About tab content is displayed.
    [Arguments]    ${tab_locator}
    Element Should Be Visible    ${tab_locator}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_SECTION_LOCATORS.button.about.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS.button.about.close}    timeout=${LONG_WAIT}

Verify Navigation In About Section
    [Documentation]    Logs in and verifies navigation through all tabs in the About section, then closes it.
    [Arguments]    ${username}    ${password}
    Launch GoodX Web Application    ${BROWSER}    ${URL}
    Enter Username And Password    ${username}    ${password}
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.overview}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.overview}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.license}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.license}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.privacy}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.privacy}
    Navigate To About Tab    ${ABOUT_SECTION_LOCATORS.tab.terms}
    Validate About Tab Is Displayed    ${ABOUT_SECTION_LOCATORS.tab.terms}
    Close About Section
