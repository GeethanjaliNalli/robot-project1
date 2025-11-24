*** Settings ***
Documentation    Keywords for logging in and navigating all tabs in the About section, including closing the About dialog.
Resource    ../common/super.resource
Resource    ../objectrepository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section from the main page.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Navigate To Overview Tab
    [Documentation]    Navigates to the Overview tab in the About section.
    Click    ${tab.overview}
    Wait Until Element Is Visible    ${tab.overview}    timeout=2s

Navigate To License Tab
    [Documentation]    Navigates to the License tab in the About section.
    Click    ${tab.license}
    Wait Until Element Is Visible    ${tab.license}    timeout=2s

Navigate To Credits Tab
    [Documentation]    Navigates to the Credits tab in the About section.
    Click    ${tab.credits}
    Wait Until Element Is Visible    ${tab.credits}    timeout=2s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s

Navigate All About Tabs
    [Documentation]    Navigates through all tabs in the About section.
    Navigate To Overview Tab
    Navigate To License Tab
    Navigate To Credits Tab
