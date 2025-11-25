*** Settings ***
Documentation    This resource file provides keywords to automate navigation and validation in the About section, including tab navigation and closing the dialog.
Resource    ../Common/super.resource
Resource    keywords/about_section_locators.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main dashboard.
    Click    ${ABOUT_SECTION_LOCATORS.button.about}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.general}    timeout=${LONG_WAIT}

Navigate To General Tab
    [Documentation]    Navigates to the General tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.general}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.general}    timeout=${LONG_WAIT}

Navigate To License Tab
    [Documentation]    Navigates to the License tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.license}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.license}    timeout=${LONG_WAIT}

Navigate To Credits Tab
    [Documentation]    Navigates to the Credits tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.credits}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.credits}    timeout=${LONG_WAIT}

Navigate To Version Tab
    [Documentation]    Navigates to the Version tab in the About section.
    Click    ${ABOUT_SECTION_LOCATORS.tab.version}
    Wait Until Element Is Visible    ${ABOUT_SECTION_LOCATORS.tab.version}    timeout=${LONG_WAIT}

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${ABOUT_SECTION_LOCATORS.button.about.close}
    Wait Until Element Is Not Visible    ${ABOUT_SECTION_LOCATORS.button.about.close}    timeout=${LONG_WAIT}

Navigate Through All About Tabs
    [Documentation]    Navigates through all tabs in the About section sequentially.
    Navigate To General Tab
    Navigate To License Tab
    Navigate To Credits Tab
    Navigate To Version Tab
