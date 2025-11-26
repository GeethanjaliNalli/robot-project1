*** Settings ***
Documentation    This resource file contains keywords for verifying navigation in the About section.
Resource    ../Common/super.resource
Resource    ../objectrepository/about_section_locators.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main navigation.
    Click    ${ABOUT_SECTION_LOCATORS.link.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.app-info}    timeout=${LONG_WAIT}

Select App Info Tab
    [Documentation]    Selects the App Info tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.app-info}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.app-info}    timeout=${LONG_WAIT}

Select Medical Aid Contracts Tab
    [Documentation]    Selects the Medical Aid Contracts tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.medical-aid-contracts}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.medical-aid-contracts}    timeout=${LONG_WAIT}

Select User Manual Tab
    [Documentation]    Selects the User Manual tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.user-manual}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.user-manual}    timeout=${LONG_WAIT}

Select Changelog Tab
    [Documentation]    Selects the Changelog tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.changelog}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.changelog}    timeout=${LONG_WAIT}

Select Services Tab
    [Documentation]    Selects the Services tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.services}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.services}    timeout=${LONG_WAIT}

Close About Section
    [Documentation]    Closes the About section.
    Click    ${ABOUT_SECTION_LOCATORS.button.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS.button.close}    timeout=${LONG_WAIT}

Navigate All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Select App Info Tab
    Select Medical Aid Contracts Tab
    Select User Manual Tab
    Select Changelog Tab
    Select Services Tab
