*** Settings ***
Documentation    This file contains keywords for navigating and validating the About section, including login, tab navigation, and closing the About dialog.
Resource    ../common/super.resource
Resource    ../objectrepository/about_section_page.resource
Resource    login_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main dashboard.
    Click    ${button.about}
    Wait Until Element Is Visible    ${tab.company}    timeout=5s

Navigate To Company Tab
    [Documentation]    Navigates to the Company tab in the About section.
    Click    ${tab.company}
    Wait Until Element Is Visible    ${tab.company}    timeout=2s

Navigate To Team Tab
    [Documentation]    Navigates to the Team tab in the About section.
    Click    ${tab.team}
    Wait Until Element Is Visible    ${tab.team}    timeout=2s

Navigate To Careers Tab
    [Documentation]    Navigates to the Careers tab in the About section.
    Click    ${tab.careers}
    Wait Until Element Is Visible    ${tab.careers}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${button.close.about}    timeout=5s

Login And Navigate About Section
    [Documentation]    Logs in and navigates through all tabs in the About section, then closes the section.
    Login With Valid Credentials
    Open About Section
    Navigate To Company Tab
    Navigate To Team Tab
    Navigate To Careers Tab
    Close About Section
