*** Settings ***
Documentation    This about page Resource file has all the About section keywords for navigation and validation.
Resource    ../common/super.resource

*** Keywords ***
Open About Section
    [Documentation]    Opens the About section by clicking the About button in the top right.
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS}[button.about.topright]    ${LONG_WAIT}
    Click    ${ABOUT_SECTION_LOCATORS}[button.about.topright]
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS}[tab.manual]    ${LONG_WAIT}

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section and validates each tab is accessible.
    Navigate To About Tab    tab.manual
    Validate About Tab Is Displayed    tab.manual
    Navigate To About Tab    tab.medicalaid
    Validate About Tab Is Displayed    tab.medicalaid
    Navigate To About Tab    tab.changelog
    Validate About Tab Is Displayed    tab.changelog
    Navigate To About Tab    tab.services
    Validate About Tab Is Displayed    tab.services

Navigate To About Tab
    [Documentation]    Navigates to the specified tab in the About section.
    [Arguments]    ${tab_key}
    ${tab_locator}    Get From Dictionary    ${ABOUT_SECTION_LOCATORS}    ${tab_key}
    Wait Until Element Is Visible    ${tab_locator}    ${LONG_WAIT}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    ${LONG_WAIT}

Validate About Tab Is Displayed
    [Documentation]    Validates that the specified About tab is displayed by checking its active state.
    [Arguments]    ${tab_key}
    ${tab_locator}    Get From Dictionary    ${ABOUT_SECTION_LOCATORS}    ${tab_key}
    Wait Until Element Is Visible    ${tab_locator}    ${LONG_WAIT}
    Get Element States    ${tab_locator}    contains    visible

Close About Section
    [Documentation]    Closes the About section using the close button.
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS}[button.close]    ${LONG_WAIT}
    Click    ${ABOUT_SECTION_LOCATORS}[button.close]
    Wait Until Element Is Invisible    ${ABOUT_SECTION_LOCATORS}[button.close]    ${LONG_WAIT}

Close About Dialog If Present
    [Documentation]    Closes the About dialog if it is present.
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS}[button.close.dialog]    3s
    Run Keyword And Ignore Error    Click    ${ABOUT_SECTION_LOCATORS}[button.close.dialog]
    Run Keyword And Ignore Error    Wait Until Element Is Invisible    ${ABOUT_SECTION_LOCATORS}[button.close.dialog]    3s

Validate All About Tabs Are Accessible
    [Documentation]    Validates that all About tabs are accessible by navigating to each and checking visibility.
    @{about_tabs}=    Create List    tab.manual    tab.medicalaid    tab.changelog    tab.services
    FOR    ${tab_key}    IN    @{about_tabs}
        Navigate To About Tab    ${tab_key}
        Validate About Tab Is Displayed    ${tab_key}
    END

Wait Until About Section Is Closed
    [Documentation]    Waits until the About section is closed and not visible.
    Wait Until Element Is Invisible    ${ABOUT_SECTION_LOCATORS}[button.close]    ${LONG_WAIT}
