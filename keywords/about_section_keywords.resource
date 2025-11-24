*** Settings ***
Documentation    Keywords for logging in and navigating through all tabs in the About section.
Resource    ../common/super.resource
Resource    ../objectrepository/about_section_page.resource

*** Keywords ***

Open About Section
    [Documentation]    Opens the About section dialog from the main application interface.
    Click    ${button.about}
    Wait Until Element Is Visible    ${dialog.about}    timeout=5s

Navigate To Overview Tab
    [Documentation]    Navigates to the Overview tab in the About section.
    Click    ${tab.overview}
    Wait Until Element Is Visible    ${tab.overview}    timeout=3s

Navigate To License Tab
    [Documentation]    Navigates to the License tab in the About section.
    Click    ${tab.license}
    Wait Until Element Is Visible    ${tab.license}    timeout=3s

Navigate To Credits Tab
    [Documentation]    Navigates to the Credits tab in the About section.
    Click    ${tab.credits}
    Wait Until Element Is Visible    ${tab.credits}    timeout=3s

Close About Section
    [Documentation]    Closes the About section dialog.
    Click    ${button.close.about}
    Wait Until Element Is Not Visible    ${dialog.about}    timeout=5s
