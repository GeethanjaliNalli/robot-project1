*** Settings ***
Documentation    Keywords for About section navigation and verification
Resource         ../common/super.resource

*** Keywords ***
Open About Section
    [Documentation]    Clicks the About section button to open the About dialog
    Click Element    ${ABOUT_SECTION_BUTTON}
    Wait Until Element Is Visible    ${ABOUT_DIALOG}    timeout=5s

Verify About Section Is Displayed
    [Documentation]    Verifies that the About dialog is displayed
    Element Should Be Visible    ${ABOUT_DIALOG}
    Element Should Contain    ${ABOUT_HEADER}    About

Close About Section
    [Documentation]    Closes the About dialog
    Click Element    ${ABOUT_CLOSE_BUTTON}
    Wait Until Element Is Not Visible    ${ABOUT_DIALOG}    timeout=5s

Verify About Section Is Closed
    [Documentation]    Verifies that the About dialog is closed
    Element Should Not Be Visible    ${ABOUT_DIALOG}
