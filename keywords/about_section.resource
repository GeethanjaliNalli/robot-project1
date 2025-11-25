*** Settings ***
Documentation    This resource file contains keywords for verifying navigation in the About section, including login, tab navigation, and closing the About dialog.
Resource    ../Common/super.resource
Resource    ../objectrepository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main application.
    Click    ${ABOUT_SECTION_LOCATORS.button.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.general}    timeout=${MEDIUM_WAIT}

Navigate To General Tab
    [Documentation]    Navigates to the General tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.general}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.general}    timeout=${SHORT_WAIT}

Navigate To License Tab
    [Documentation]    Navigates to the License tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.license}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.license}    timeout=${SHORT_WAIT}

Navigate To Third Party Tab
    [Documentation]    Navigates to the Third Party tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.thirdparty}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.thirdparty}    timeout=${SHORT_WAIT}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_SECTION_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS.button.close}    timeout=${SHORT_WAIT}

Verify Navigation In About Section
    [Documentation]    Logs in, opens the About section, navigates all tabs, and closes the About dialog.
    Launch GoodX Web Application    ${BROWSER_NAME}    ${URL}
    Enter Username And Password    ${USERNAME}    ${PASSWORD}
    Validate Dashboard Is Displayed
    Open About Section
    Navigate To General Tab
    Navigate To License Tab
    Navigate To Third Party Tab
    Close About Section
