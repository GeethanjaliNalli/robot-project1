*** Settings ***
Documentation    Keywords for verifying navigation in the About section, including login, tab navigation, and closing the section.
Resource    ../common/super.resource
Resource    ../objectrepository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main page.
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.company}    timeout=5s

Navigate To About Tab
    [Documentation]    Navigates to a specified tab within the About section.
    [Arguments]    ${tab_locator}
    Click    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    timeout=3s

Close About Section
    [Documentation]    Closes the About section.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${button.close.about}    timeout=5s

Verify About Section Navigation
    [Documentation]    Logs in and verifies navigation to each tab in the About section, then closes the section.
    Open About Section
    Navigate To About Tab    ${tab.company}
    Navigate To About Tab    ${tab.team}
    Navigate To About Tab    ${tab.careers}
    Close About Section
